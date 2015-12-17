#!/usr/bin/env python
# -*- coding:utf-8 -*-

import poplib

client = poplib.POP3('localhost', 110)
client.user('admin@mydomain.com')
client.pass_('admin')
num_messages = len(client.list()[1])

for i in range(num_messages):
  for j in client.retr(i+1)[1]:
     print(j)

for i in range(num_messages):
  client.dele(i)
