#!/usr/bin/env python
#
#   nmapxmlparser.py -- an Nmap XML parser for Python
#   Copyright (C) 2009  Marcin Wielgoszewski (tssci-security.com)
#   
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

try:
    from lxml import etree
except ImportError:
    try:
        import xml.etree.cElementTree as etree
    except ImportError:
        try:
            import xml.etree.ElementTree as etree
        except ImportError:
            print "Error: Cannot find the ElementTree in your python packages"

import csv
import os
import sys


__author__  = "Marcin Wielgoszewski"
__version__ = "0.5"


usage = """Usage: ./nmapxmlparser.py <scan.xml> <output.csv>
./nmapxmlparser.py *.xml scan_results.csv
"""

""" List of attributes """
address_attribs = ["addr", "addrtype"]
service_attribs = ["product", "version", "extrainfo", "tunnel", "proto", "rpcnum", "lowver", 
                   "highver", "hostname", "ostype", "devicetype", "servicefp"]
osclass_attribs = ["vendor", "osfamily", "osgen", "type"]
uptime_attribs  = ["seconds", "lastboot"]


def xml_fh(file):
    """Returns an lxml.etree._ElementTree object."""
    
    try:
        xml = etree.parse(open(file))
        return xml
    except IOError, e:
        print(e)
    except SyntaxError, e:
        print("Encountered a fatal error while parsing XML:")
        print(e)
        #print(e.error_log) # Uncomment to enable detailed error messages
        sys.exit(1)


def write_csv(file, data):
    """Writes a dictionary object (data) to a CSV file (file)."""

    fieldnames = ["hostname", 
                  "addr", 
                  "status", 
                  "portid", 
                  "protocol", 
                  "state", 
                  "service",
                  "servicedesc",
                  "reason",
                  "method",
                  "osclass",
                  "osmatch",
                  "lastboot",
                  "hops",
                  "rtt", ]
    
    if data:
        if os.path.exists(file):
            print("Appending data to %s..." % (file))
            f = open(file, "a")
            
            try:
                writer = csv.DictWriter(f, fieldnames, restval="", extrasaction="ignore")
                writer.writerows(data)
            finally:
                f.close()
        else:
            print("Writing data to %s..." % (file))         
            headers = {}
            for field in fieldnames:
                headers[field] = field
            f = open(file, "wb")
            try:
                writer = csv.DictWriter(f, fieldnames, restval="", extrasaction="ignore")
                writer.writerow(headers)
                writer.writerows(data)
            finally:
                f.close()


def get_attrib_values(element, attributes, store, append=False):
    """A helper method to cycle through a list of attributes for an element and 
    either append to a  list (store) or set a dictionary (store) key's value to
    the respective attribute's value.

    """
    
    if append is True:
        for attribute in attributes:
            if element.attrib.has_key(attribute):
                store.append(element.get(attribute))
    else:
        for attribute in attributes:
            if element.attrib.has_key(attribute):
                store[attribute] = element.get(attribute)


def parse_xml(tree):
    """ Takes an ElementTree object representation of Nmap XML output as 
    input and parses the results.  Returns two dictionary objects.

    """
    
    scan_info = {"scanargs": tree.getroot().get("args"),
                 "scandate": tree.getroot().get("start"),
                 "finished": tree.find("runstats/finished").get("time"),
                 "hosts_up": tree.find("runstats/hosts").get("up"),
                 "hosts_total": tree.find("runstats/hosts").get("total"),
                 "version": tree.getroot().get("version"),
                 "verbosity": tree.find("verbose").get("level"),
                 }
    
    host_table = [] # contains our host information obtained during scan
    port_table = [] # contains our host's port/service information 
    csv_output = [] # de-normalized output used for input to write_csv().
    
    for host in tree.getiterator(tag='host'):
        hostdata  = {"starttime": "", 
        "endtime": "",
        "status": "",
        "addr": "",
        "addrtype": "",
        "hostname": "",
        "osmatch": "",
        "osclass": "",
        "fingerprint": "",
        "seconds_up": "",
        "lastboot": "",
        "tcpsequence_index": "",
        "tcpsequence_difficulty": "",
        "tcpsequence_values": "",
        "ipidsequence_class": "",
        "ipidsequence_values": "",
        "tcptssequence_class": "",
        "tcptssequence_values": "",
        "hops": "",
        "rtt": "",
        }
        
        openports = []  # this will be a list of dictionaries
        
        
        if host.attrib.has_key("starttime"):
            hostdata["starttime"] = host.get("starttime")
        if host.attrib.has_key("endtime"):
            hostdata["endtime"] = host.get("endtime")
        
        for element in host.getchildren():
            
            if element.tag == "status":
                if element.attrib.has_key("state"):
                    hostdata["status"] = element.get("state")
            
            elif element.tag == "address":
                get_attrib_values(element, address_attribs, hostdata)
            
            elif element.tag == "hostnames":
                hostname = []
                for elm in element.getchildren():
                    if elm.tag == "hostname":
                        if elm.attrib.has_key("name"):
                            hostname.append(elm.get("name"))
                hostdata["hostname"] = ', '.join(sorted(list(hostname)))
            
            elif element.tag == "ports":
                for port in element.getchildren():
                    portdata = {"protocol": "",
                                "portid": "",
                                "state": "",
                                "reason": "",
                                "name": "",
                                "method": "",
                                "servicedesc": ""}
                    
                    get_attrib_values(port, ["protocol", "portid"], portdata)
                    
                    for elm in port.getchildren():
                        if elm.tag == "state":
                            get_attrib_values(elm, ["state", "reason", "method"], portdata)
                        elif elm.tag == "service":
                            service = []
                            if elm.attrib.has_key("name"):
                                portdata["name"] = elm.get("name")
                            get_attrib_values(elm, service_attribs, service, append=True)
                            portdata["servicedesc"] = ' '.join(service)
                    openports.append(portdata)
            
            elif element.tag == "os":
                class_accuracy = 0
                match_accuracy = 0
                
                for elm in element.getchildren():
                    if elm.tag == "osclass":
                        if elm.attrib.has_key("accuracy"):
                            if class_accuracy < elm.get("accuracy"):
                                class_accuracy = elm.get("accuracy")
                                
                                osclass = []                                
                                get_attrib_values(elm, osclass_attribs, osclass, append=True)                               
                                hostdata["osclass"] = ' '.join(osclass)
                    
                    elif elm.tag == "osmatch":
                        if elm.attrib.has_key("accuracy"):
                            if match_accuracy < elm.get("accuracy"):
                                match_accuracy = elm.get("accuracy")
                                if elm.attrib.has_key("name"):
                                    hostdata["osmatch"] = elm.get("name")
                                
                        elif elm.attrib.has_key("name"):
                            hostdata["osmatch"] = elm.get("name")
                    
                    elif elm.tag == "osfingerprint":
                        if elm.attrib.has_key("fingerprint"):
                            hostdata["fingerprint"] = elm.get("fingerprint")
            
            elif element.tag == "uptime":
                get_attrib_values(element, uptime_attribs, hostdata)
            
            elif element.tag == "tcpsequence":
                if element.attrib.has_key("index"):
                    hostdata["tcpsequence_index"] = element.get("index")
                if element.attrib.has_key("difficulty"):
                    hostdata["tcpsequence_difficulty"] = element.get("difficulty")
                if element.attrib.has_key("values"):
                    hostdata["tcpsequence_values"] = element.get("values")
            
            elif element.tag == "ipidsequence":
                if element.attrib.has_key("class"):
                    hostdata["ipidsequence_class"] = element.get("class")
                if element.attrib.has_key("values"):
                    hostdata["ipidsequence_values"] = element.get("values")
            
            elif element.tag == "tcptssequence":
                if element.attrib.has_key("class"):
                    hostdata["tcptssequence_class"] = element.get("class")
                if element.attrib.has_key("values"):
                    hostdata["tcptssequence_values"] = element.get("values")
            
            elif element.tag == "trace":
                for elm in element.getchildren():
                    if elm.tag == "hop" and elm.attrib.has_key("ttl"):
                        if elm.attrib.has_key("ipaddr") or elm.attrib.has_key("host"):
                            if elm.get("ipaddr") == hostdata["addr"] or \
                                elm.get("host") == hostdata["hostname"]:
                                    hostdata["hops"] = elm.get("ttl")
                                    if elm.attrib.has_key("rtt"):
                                        hostdata["rtt"] = elm.get("rtt")
        
        for port in openports:
            h = dict(hostdata)
            h["protocol"] = port["protocol"]
            h["portid"] = port["portid"]
            h["state"] = port["state"]
            h["reason"] = port["reason"]
            h["service"] = port["name"]
            h["servicedesc"] = port["servicedesc"]
            csv_output.append(dict(h))
        
        for port in openports:
            port["ip_addr"] = hostdata["addr"]
            port["hostname"] = hostdata["hostname"]
            port_table.append(port)
        
        
        hostdata["scanargs"] = scan_info["scanargs"]
        hostdata["scandate"] = scan_info["scandate"]
        host_table.append(hostdata)
    
    return scan_info, host_table, port_table, csv_output


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(usage)
        sys.exit(1)
    else:
        outfile = None
        for arg in sys.argv[1:]:
            if arg[-4:] == ".csv":
                if outfile:
                    print("Please specifiy only ONE output file!")
                    sys.exit(1)
                else:
                    outfile = arg
        
        if not outfile:
            print("A CSV output file must be specified!")
            sys.exit(1)
        else:
            scanfile = None
            for arg in sys.argv[1:]:
                if arg[-4:] == ".xml":
                    scanfile = arg
                    nmap_xml = xml_fh(scanfile)
                    #scan_info, host_table, port_table, nmap_csv = parse_xml(nmap_xml)
                    write_csv(outfile, nmap_csv)
            if not scanfile:
                print("At least one Nmap XML file must be specified!")
                sys.exit(1)
