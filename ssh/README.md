## Generate .ssh/config and PAC-file

> For inspiration only - Without warrant and support.

Script to generate ~/.ssh/config and browser proxy pac-file.
Input: `hosts.yaml`
Output: `~/.ssh/config` and `PAC_FILE` (examples in `/output`)

Change personal variables in hosts.yml, generate_ssh_config.py and connect.sh:


```
hosts.yml:

User: <OP AD-USER>
ControlPath: ~/.ssh/sockets/<OP AD-USER>@%h:%p
IdentityFile: <SSH_IDENTITY_FILE>
```

```
connect.sh:

CONFIG=~/.ssh/config
SSH_KEYFILE="~/.ssh/<SSH_IDENTITY_FILE>"
```

```
generate_ssh_config:

T_ID = "<t_id>"
HOSTS_FILE = "/home/<user>/.ssh/hosts.yml"
CONFIG_FILE = "/home/<user>/.ssh/config"
PAC_FILE = f"/mnt/c/Users/{ T_ID }/proxy.pac"
```

> **CAUTION!** This will replace current ~/.ssh/config. Backup before running.

```
cd ~/.ssh
python3 generate_ssh_config.py
```

This will generate `~/.ssh/config` and pac-file (examples in `/output`).
Connect with `connect.sh`.
