#!/usr/bin/python

from sqlalchemy import create_engine, Column, Integer, String, DateTime, Table, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import deferred, relationship, backref, Session
import datetime
from debug import Debug
import data_config

Base = declarative_base()
debug = Debug()

if debug.level > 0:
  echo = True
else:
  echo = False
  
engine = create_engine('postgresql://postgres:AdministratorforFAbacktrack@localhost/postgres', pool_size = 0, echo = echo)
session = Session(bind = engine)

class Host(Base):
    __tablename__ = 'host'

    id = Column(Integer, primary_key = True, autoincrement = True)
    ip = Column(String(25))
    state = deferred(Column(String(25), default = None))
    reason = deferred(Column(String(25), default = None))
    hostname = deferred(Column(String(100), default = None))
    os_type = deferred(Column(String(100), default = None))
    os_vendor = deferred(Column(String(100), default = None))
    os_family = deferred(Column(String(100), default = None))
    os_gen = deferred(Column(String(100), default = None))
    osclass_accuracy = deferred(Column(Integer, default = None))
    uptime = deferred(Column(Integer, default = None))
    lastboot = deferred(Column(String(50), default = None))
    finished = deferred(Column(String(50), default = None))
    elapsed = deferred(Column(String(25), default = None))
    fingerprint = deferred(Column(String(1000), default = None))
    osmatch_name = deferred(Column(String(50), default = None))
    osmatch_accuracy = deferred(Column(String(25), default = None))
    date_modified = deferred(Column(DateTime, default = datetime.datetime.now()))

    host_service = relationship("Host_service", cascade = "all, delete, delete-orphan", backref = "Host")
    host_service_extended = relationship("Host_service_extended",
            primaryjoin = "Host.ip == Host_service_extended.ip",
            cascade = "all, delete, delete-orphan",
            backref = "Host")
    service_script = relationship("Service_script", cascade = "all, delete, delete-orphan")

## Host Service class
class Host_service(Base):
    __tablename__ = 'host_service'
  
    id = Column(Integer, primary_key = True, autoincrement = True)
    ip = Column(String(20), ForeignKey("host.ip"))
    port_id = Column(Integer)
    protocol = deferred(Column(String(25), default = None))
    state = deferred(Column(String(15), default = None))
    reason = deferred(Column(String(50), default = None))
    reason_ttl = deferred(Column(Integer, default = None))
    service_name = deferred(Column(String(100)))
    product = deferred(Column(String(50), default = None))
    version = deferred(Column(String(50), default = None))
    extrainfo = deferred(Column(String(50), default = None))
    ostype = deferred(Column(String(50), default = None))
    method = deferred(Column(String(50), default = None))
    conf = deferred(Column(Integer, default = None))
    date_modified = deferred(Column(DateTime, default = datetime.datetime.now()))
  
    service_script = relationship("Service_script", 
            primaryjoin = "and_(Host_service.port_id == Service_script.port_id, \
                Host_service.service_name == Service_script.service_name)",
            cascade = "all, delete, delete-orphan",
            backref = "Host_service")
    service_exploit = relationship("Service_exploit")
    extension = relationship("Host_service_extended",
            primaryjoin = "Host_service.port_id == Host_service_extended.port_id",
            cascade = "all, delete, delete-orphan",
            backref = "Host_serivce")

## Host Service Extended View
class Host_service_extended(Base):
    __tablename__ = 'host_service_extended'

    ip = Column(String(25, convert_unicode = False), ForeignKey("host.ip"), primary_key = True)
    os_family = deferred(Column(String(100), ForeignKey("host.os_family")))
    os_vendor = deferred(Column(String(100), ForeignKey("host.os_vendor")))
    os_gen = deferred(Column(String(100), ForeignKey("host.os_gen")))
    osmatch_name = deferred(Column(String(50), ForeignKey("host.osmatch_name")))
    osmatch_accuracy = deferred(Column(String(25), ForeignKey("host.osmatch_accuracy")))
    port_id = Column(Integer, ForeignKey("host_service.port_id"), primary_key = True)
    service_name = deferred(Column(String(100), ForeignKey("host_service.service_name")))
    product = deferred(Column(String(100), ForeignKey("host_service.product")))
    version = deferred(Column(String(100), ForeignKey("host_service.version")))
    extrainfo = deferred(Column(String(100), ForeignKey("host_service.extrainfo")))
    
## Service script
class Service_script(Base):
    __tablename__ = 'service_script'
  
    id = Column(Integer, primary_key = True, autoincrement = True)
    ip = Column(String(15), ForeignKey("host.ip"))
    port_id = Column(Integer, ForeignKey("host_service.port_id"))
    protocol = Column(String(15))
    service_name = Column(String(25), ForeignKey("host_service.service_name"))
    script_id = deferred(Column(String(50), default = None))
    script_output = deferred(Column(String, default = None))
    date_modified = deferred(Column(DateTime, default = datetime.datetime.now()))
      
class Exploit(Base):
    __tablename__ = 'exploit'
  
    exploit_sha1 = Column(String(41), primary_key = True)
    exploit_githash = deferred(Column(String(41), default = None))
    source_file = deferred(Column(String(100)))
    preliminary_function = deferred(Column(String(25)))

    service_exploit = relationship("Service_exploit", cascade = "all, delete, delete-orphan",
            backref = "Exploit")
    exploit_parameter = relationship("Exploit_parameter", cascade = "all, delete, delete-orphan",
            backref = "Exploit")

class Exploit_parameter(Base):
    __tablename__ = 'exploit_parameter'

    exploit_sha1 = Column(String(41), ForeignKey("exploit.exploit_sha1"), primary_key = True)
    parameter = Column(String(15), primary_key = True)
    function = Column(String(25), primary_key = True)

class Service_exploit(Base):
    __tablename__ = 'service_exploit'
  
    id = Column(Integer, primary_key = True, autoincrement = True)
    exploit_sha1 = Column(Integer, ForeignKey("exploit.exploit_sha1"))
    service_name = Column(String(100), ForeignKey("host_service.service_name"))
    exploit_source = deferred(Column(String(50), default = None))
    exploit_path = deferred(Column(String(1000), default = None))
    preliminary_function = deferred(Column(String(100), default = None))
    os_vendor = deferred(Column(String(100), default = None))
    os_type = deferred(Column(String(100), default = None))
    os_family = deferred(Column(String(100), default = None))
    os_gen = deferred(Column(String(100), default = None))
    product = deferred(Column(String(50), default = None))
    version = deferred(Column(String(50), default = None))
    #attempts = deferred(Column(Integer, default = None))
    #successes = deferred(Column(Integer, default = None))
    #exploit_log = deferred(Column(String(), default = None))
    date_modified = deferred(Column(DateTime, default = datetime.datetime.now()))

class Nmap_service_alias(Base):
    __tablename__ = 'nmap_service_alias'

    id = Column(Integer, primary_key = True, autoincrement = True)
    nmap_service = Column(String(100))
    service_alias = Column(String(100))
    date_modified = Column(DateTime, default = datetime.datetime.now())

