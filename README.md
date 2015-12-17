# adite/utmail
---
## twisted-mail for docker
![tescom](https://en.gravatar.com/userimage/96759029/aa4308f795041de37cc2fedf0d1071ca?size=128)
---
ubuntu + perl + SMTP/POP3
 
## IMAGE FROM
ytnobody/base

## DEFAULT ENVIRONMENT
* MAIL_NAME     : mydomain.com
* MAIL_PATH     : /tmp/utmail
* MAIL_USER     : admin    
* MAIL_PASS     : admin        

## USAGE
---
### docker-compose.yaml
```shell
tmail:
  image: adite/utmail
  ports:
    - "25:25"
    - "110:110"
  volumes:
    - mail:/var/mail
  environment:
    - MAIL_NAME = mydomain.com
    - MAIL_PATH = /tmp/utmail
    - MAIL_USER = admin    
    - MAIL_PASS = admin        
  restart: always
```
### You can pass additional arguments via environment variable MAIL_OPTS : 
```shell
  MAIL_OPTS = --user = USER_NAME = USER_PASSWORD
```

### Server
```shell
$ sudo docker-compose up -d
```
---
### Client
* POP3 : Mail_Domain:110
* USER : User_Name@Mail_Domain
* PASS : User_Password

---

## TEST
### test mail script
```script
$ cat hello_mail.py

 #!/usr/bin/env python  
 # -*- coding:utf-8 -*-
  
 import smtplib
  
 server = smtplib.SMTP('localhost', 25)
 server.set_debuglevel(1)
 server.sendmail('admin@localhost', 'admin@mydomain.com', 'Hi~! admin!?')
 server.quit()  
 ```  
```script
$ python ./hello_mail.py
```
  
### read mail and delete script
```script
$ cat read_mail.py

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
```
```script
$ python ./hello.py
```
  
* ref https://hub.docker.com/r/vimagick/tmail/
