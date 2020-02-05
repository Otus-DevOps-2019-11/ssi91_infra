# ssi91_infra
ssi91 Infra repository

# HW #3

* зайти на VM одной строкой:
```bash
ssh -i ~/.ssh/appuser -A -t appuser@34.89.203.55 ssh 10.156.0.3
```

* Другой вариант - написать конфиг для хоста в `~/.ssh/config`:
```
Host someinternalhost
  HostName someinternalhost
  ForwardAgent yes
  ProxyJump appuser@34.89.203.55
  User appuser
  IdentityFile ~/.ssh/appuser
```

теперь приватная VM доступна по команде
```bash
ssh someinternalhost
```

```
bastion_IP = 34.89.203.55
someinternalhost_IP = 10.156.0.3
```

# HW #4

```
testapp_IP = 35.204.147.77
testapp_port = 9292
```

### Дополнительное задание 1:
```bash
gcloud compute instances create reddit-app-start-up \
--boot-disk-size=10GB \
--image-family ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--machine-type=g1-small \
--tags puma-server \
--restart-on-failure \
--metadata-from-file=startup-script=start-up.sh
```

### Дополнительное задание 2:
```bash
gcloud compute firewall-rules create default-puma-server \
--target-tags=puma-server \
--allow=tcp:9292 \
--source-ranges=0.0.0.0/0
```

# HW #5

* Создан АDC утилитой gcloud
* Создан базовый шаблон ВМ ubuntu16.json с преустановленной mongodb и ruby
* В шаблон добавленна секция `variables` c обязательными парамертрами и параметрами по-умолчанию
* Создан variables.json файл с определением этих параметров
* variables.json добавлен в .gitignore, а также создан variables.json.example
* В ubuntu16.json, в секцию `builders` добавлены некоторые опции (`image_description`, `network`, `disk_size`, `disk_type`, `tags`)
* Создан ещё один шаблон ВМ (immutable.json), в котором в качестве базового образа использовался созданный ранее по шаблону ubuntu16.json. Так же, в новом шаблоне было установленно приложение и создан systemd unit puma-сервера.
* Добавлен скрипт(из одной команды, лол) create-reddit-vm.sh, создающий ВМ из нового полного образа
