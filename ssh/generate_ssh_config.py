import yaml
import pprint as pprint

def generate(content):
  output = f"""
    ServerAliveInterval { content['ServerAliveInterval'] }
    ServerAliveCountMax { content['ServerAliveCountMax'] }
    ControlMaster { content['ControlMaster'] }
    ControlPath { content['ControlPath'] }
  """

  for host in content['hostnames']:
    item = content['hostnames'][host]

    for hostname in content['hostnames'][host]['hosts']:
      item_str = f"""
        Host { hostname }
        HostName { hostname }.{ host }
        IdentityFile { content['IdentityFile'] }
      """
      
      if not "NoProxyJump" in item.keys():
        item_str += f"\tProxyJump { content['ProxyJumpDefault'] }\n"

      if "DynamicForward" in item.keys():
        item_str += f"\tDynamicForward { item['DynamicForward'] }\n"
     
      # if hostname in content['hostnames'][host].keys()

      if item['hosts'][hostname] != None and "Port" in item['hosts'][hostname].keys():
          item_str += f"\tPort { item['hosts'][hostname]['Port'] }\n"
        
      if item['hosts'][hostname] != None and "User" in item['hosts'][hostname].keys():
          item_str += f"\tUser { item['hosts'][hostname]['User'] }\n"
      else:
        item_str += f"\tUser { content['User'] }\n"


      output += item_str

  print(output)

with open("hosts.yml") as stream:
  try:
    content = yaml.safe_load(stream)
    #pprint.pprint(content)
    generate(content)
  except yaml.YAMLError as exc:
    print(exc)
