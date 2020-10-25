# Overview

Helper scripts to manage back up and restore with [duplicity](https://linux.die.net/man/1/duplicity)

## Steps

Migrate Key

```bash
gpg --export-secret-key duplicity > ~/duplicity.asc
gpg --import duplicity.asc
# For alpine
#gpg --pinentry-mode loopback --import duplicity.asc
```

Trust Key

https://stackoverflow.com/questions/33361068/gnupg-there-is-no-assurance-this-key-belongs-to-the-named-user

```bash
gpg --edit-key <KEY_ID>
gpg> trust
gpg> q
```


Install duplicity and run backup

```bash
apk add duplicity
./.vault/backup.sh
sudo crontab -u n0mn0m -e
0 22 * * * bash ./.vault/backup.sh
```
