#!/usr/bin/env python
# -*- coding:utf-8 -*-

import smtplib

server = smtplib.SMTP('localhost', 25)
server.set_debuglevel(1)
server.sendmail('admin@localhost', 'admin@mydomain.com', 'Hi~! admin!?')
server.quit()
