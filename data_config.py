#!/usr/bin/python
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine

Base = declarative_base()
engine = create_engine('postgresql://postgres2:AdministratorforFAbacktrack@localhost/postgres', pool_size=0)
