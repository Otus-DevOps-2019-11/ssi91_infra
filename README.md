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
