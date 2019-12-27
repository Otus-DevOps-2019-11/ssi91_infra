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
