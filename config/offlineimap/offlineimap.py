#! /usr/bin/env python3

import commands

def get_pass(account=None, server=None):
    command = "pass show Email/mailbox.org"
    return commands.getoutput(command)

