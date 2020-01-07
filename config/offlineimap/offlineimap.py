#! /usr/bin/env python3

import commands

def get_pass(server=None):
    params = {
        'command': 'show',
        'server': server
    }

    command = "pass %(command)s Email/%(server)s" % params
    return commands.getoutput(command)

