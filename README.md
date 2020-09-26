# Overview

Helper scripts to manage back up and restore with [duplicity](https://linux.die.net/man/1/duplicity)

## Steps

```bash
apt install python3-boto duplicity
gpg --import myprivatekeys.asc
./.vault/backup.sh
sudo crontab -u n0mn0m -e
* 2 * * * bash ./.vault/backup.sh
```
