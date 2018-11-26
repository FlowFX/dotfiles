#! /usr/bin/env python2
#
# This works on MacOS only at the moment.

import commands
import re


def get_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command':  'find-generic-password',
        'account':  account,
        'server':   server
    }

    command = "%(security)s %(command)s -g -a %(account)s -s %(server)s" % params
    outtext = commands.getoutput(command)
    return re.match(r'password: "(.*)"', outtext).group(1)
