# evsamsonov infra

## Знакомство с облачной инфраструктурой и облачными сервисами

1. Способ подключения к someinternalhost в одну команду

Добавить в .ssh/config
```
Host bastion
        Hostname 178.154.227.246
        User evgeny

Host someinternalhost
        ProxyCommand ssh -q bastion nc 10.130.0.26 22
```
Как подключиться:
```
$ ssh evgeny@someinternalhost
```

Или без указания логина:
```
$ ssh someinternalhost
```

2. Установка сертификата

Ошибка, что превышен лимит для домена xip.io

```
evgeny@bastion:~$ sudo certbot certonly --webroot
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator webroot, Installer None
Please enter in your domain name(s) (comma and/or space separated)  (Enter 'c'
to cancel): 178.154.227.246.xip.io.
Requesting a certificate for 178.154.227.246.xip.io
An unexpected error occurred:
There were too many requests of a given type :: Error creating new order :: too many certificates already issued for: xip.io: see https://letsencrypt.org/docs/rate-limits/
```

3. Данные для подключения
bastion_IP = 178.154.227.246

someinternalhost_IP = 10.156.0.3

## Деплой тестового приложения

testapp_IP = 178.154.230.232

testapp_port = 9292
