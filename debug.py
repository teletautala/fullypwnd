#!/usr/bin/python

import inspect

class Debug():
    level = 0 
    def msg(self, message = ""):
	print "Debug.level:", self.level
        filename, lineno, function, code_context, index = inspect.getframeinfo(inspect.currentframe().f_back)
	print "  function:", function
	print "  line:", lineno, ":", message

