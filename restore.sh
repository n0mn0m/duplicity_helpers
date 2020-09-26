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

# The path where we want to restore
_restore='$HOME/restore'

# The path to where we want to store the backup
_target='s3://s3.us-east-2.amazonaws.com/<bucket>/<dir>'

# The full path to the duplicity program
_duplicity='/usr/local/bin/duplicity'

####################

## Restoring Backup ##
mkdir -p ${_restore}
PASSPHRASE=${_pass} AWS_ACCESS_KEY_ID=${_access} AWS_SECRET_ACCESS_KEY=${_secret} $_duplicity restore --verbosity i ${_target} ${_restore}

