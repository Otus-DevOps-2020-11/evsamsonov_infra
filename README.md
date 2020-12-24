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

Или без указания логина (решение дополнительного задания):
```
$ ssh someinternalhost
```

