#!/usr/bin/python

import os
import subprocess
from ansible.module_utils.basic import *

def main():
    fields = {
        "plugin": {"required": True, "type": "str"},
        "plugins_dir": {"required": True, "type": "str"},
        "source": {"required": False, "type": "str", "default": "https://github.com"}
    }

    module = AnsibleModule(argument_spec=fields)
    changed = False
    pluginUrlPath = module.params["plugin"]
    pluginLocalPath = os.path.join(module.params["plugins_dir"], pluginUrlPath.split("/")[1])

    if not os.path.isdir(pluginLocalPath):
        pluginUrl = module.params["source"] + "/" + pluginUrlPath
        retCode = subprocess.call(["git", "clone", pluginUrl, pluginLocalPath])
        if retCode is not 0:
            module.fail_json({"msg": "unable to clone " + pluginUrl})
            return

        changed = True


    module.exit_json(changed=changed)

if __name__ == "__main__":
    main()
