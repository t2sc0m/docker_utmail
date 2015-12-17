# adite/utmail
---
## twisted-mail for docker
![tescom](https://en.gravatar.com/userimage/96759029/aa4308f795041de37cc2fedf0d1071ca?size=128)
---
ubuntu + perl + SMTP/POP3
 
## IMAGE FROM
ytnobody/base

## ENVIRONMENT
* MAIL_NAME     : Mail_Domain
* MAIL_PATH     : /var/mail
* MAIL_USER     : User_Name
* MAIL_PASS     : User_Password

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
    - MAIL_NAME = Mail_Domain
    - MAIL_PATH = /var/mail
    - MAIL_USER = User_Name
    - MAIL_PASS = User_Password
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

* ref https://hub.docker.com/r/vimagick/tmail/
