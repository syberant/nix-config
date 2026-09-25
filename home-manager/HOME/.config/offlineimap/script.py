#!/usr/bin/env python
from subprocess import check_output

def from_password_store(account):
    return check_output("pass show " + account, shell=True).splitlines()[0]
