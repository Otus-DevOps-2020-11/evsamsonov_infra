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

### Дополнительное задание
```
yc compute instance create \
  --name reddit-app2 \
  --hostname reddit-app2 \
  --zone ru-central1-a \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=metadata.yaml
```

## Сборка образов VM при помощи Packer

### Что сделано?

- Перенесены скрипты из предыдущего задания в каталог config-scripts
- Установлен packer
- Создан сервисный аккаунт и делегированы права
- Создан файл шаблон ubuntu16.json
- Созданы скрипты для provisioners install_mongodb.sh и install_ruby.sh
- Создан образ ВМ с помощью packer
- Создана ВМ
- На ВМ установлено приложение reddit-app
- Параметроризирован шаблон
- Создан файл пример с параметрами variables.json.examples
- Создана конфигурация для bake-образа с reddit-app

### Запуск packer c variables.json

```
$ packer build -var-file=variables.json ./ubuntu16.json
```

### Создание bake-образа

Bake-образ построен на основе основного образа. Требуется в variables.json задать source_image_id образа. При попытке указания family образа с помощью ключа source_image_family=reddit-base была ошибка, что образ не найден, хотя образ с таким семейство был в списке

## Terraform 1

### Что сделано?

- Установлен terraform требуемой версии
- Описан provider yandex cloud для terraform
- Описана виртуальная машина reddit-app
- Описан блок output
- Описаны provisioners с деплоем и запуском приложения
- Определены input переменные и параметризированны конфигурационные файлы terraform
- Отформатированы terraform файлы с помощью команды terraform fmt
- Добавлен файл с примерами переменных terraform.tfvars.example
- Описан load balancer
- Параметроризированно число инстансов приложения

## Terraform 2

### Что сделано?

- Удалены результаты выполнения предыдущего ДЗ со звездочкой
- База данных и приложения вынесены на отдельные инстансы
- Конфигурация разделена по файлам
- Добавлены отдельные модули для DB и приложения
- Созданы окружения для stage и prod

## Ansible 1

### Что сделано?

```PLAY RECAP *****************************************************************************************************************************************************************
appserver                  : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
```
