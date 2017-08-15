# Copyright (c) 2012-2017, Andreas Heumaier<andreas.heumaier@microsoft.com>
# All rights reserved.
#
# See LICENSE file for full license.
#
# Packer build runnner
#  
import subprocess

TEMPLATE = 'ubuntuServer.json'

def validate(template=TEMPLATE):
    print("execuet validate")
    subprocess.call('start /wait packer validate '+str(template), shell=True)

def run(template=TEMPLATE):
    print('execute runner')
    subprocess.call("start /wait packer build "+str(template), shell=True)

if __name__ == "__main__":
    try:
        validate()
    except:
        print("ERROR: Validate Failed")
        exit(1)
    else:
        run()
else:
    print("runPacker.py is being imported into another module")
