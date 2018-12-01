#! /usr/bin/env python3
#
# This works on MacOS at the moment.

import commands


def get_pass(account=None, server=None):
    params = {
        'keyring': 'keyring',
        'command': 'get',
        'account': account,
        'server':  server
    }

    command = "%(keyring)s %(command)s %(server)s %(account)s" % params
    return commands.getoutput(command)
