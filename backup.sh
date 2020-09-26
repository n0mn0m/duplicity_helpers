#!/bin/bash
# A simple backup script wrapper for duplicity.
# Author - nixCraft <www.cyberciti.biz> under GPL v2+
# Edited by n0mn0m
# -----------------------------------------------------

## Define VARS ##
_gpg_key=''

## AWS ##

_access=''
_secret=''

## PASSPHRASE

_pass=''

# The path to where the files that we want to backup are
_src='$HOME/backup'

# The path to where we want to store the backup
_target='s3://s3.us-east-2.amazonaws.com/<bucket>/<dir>'

# The full path to the duplicity program
_duplicity='/usr/local/bin/duplicity'

# Specify how far back we want to be able to restore to
# e.g. how long a backup lives before it is removed.
_backup_lifetime=60

# Specify how many days of iterative backups are allowed to
# be taken before a full backup has to be taken
_days_between_full_backups=14

####################

# systemctl stop docker

## Cleanup ##
echo "cleaning up..."
PASSPHRASE=${_pass} AWS_ACCESS_KEY_ID=${_access} AWS_SECRET_ACCESS_KEY=${_secret} $_duplicity cleanup --force --encrypt-key="${_gpg_key}" ${_target}

## Removing old backups##
echo "Removing old backups..."
PASSPHRASE=${_pass} AWS_ACCESS_KEY_ID=${_access} AWS_SECRET_ACCESS_KEY=${_secret} $_duplicity remove-older-than ${_backup_lifetime}D --encrypt-key="${_gpg_key}" ${_target}

## Backup our files ##
echo "Backing up files..."
PASSPHRASE=${_pass} AWS_ACCESS_KEY_ID=${_access} AWS_SECRET_ACCESS_KEY=${_secret} $_duplicity --verbosity i --full-if-older-than 14D --encrypt-key="${_gpg_key}" --asynchronous-upload --exclude **.DS_Store ${_src} ${_target}

# systemctl start docker
