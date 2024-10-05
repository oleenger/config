import yaml
import pprint as pprint

START_PORT = 1200

def generate(content):
  dynamic_forward = START_PORT
  
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
        DynamicForward { str(dynamic_forward) }
      """
      
      dynamic_forward = dynamic_forward+1

      if not "NoProxyJump" in item.keys():
        item_str += f"\tProxyJump { content['ProxyJumpDefault'] }\n"

      if item['hosts'][hostname] != None and "Port" in item['hosts'][hostname].keys():
          item_str += f"\tPort { item['hosts'][hostname]['Port'] }\n"
        
      if item['hosts'][hostname] != None and "User" in item['hosts'][hostname].keys():
          item_str += f"\tUser { item['hosts'][hostname]['User'] }\n"
      else:
        item_str += f"\tUser { content['User'] }\n"

      output += item_str

  return output

def generate_config():
  with open("hosts.yml") as stream:
    content = yaml.safe_load(stream)
    config  = generate(content)
    f = open("config", "w")
    f.write(config)
    f.close()

def generate_pac():
  hosts = list()
  with open("config") as file:
    for line in file:
      if "Host" in line:
        obj = dict()
      if "HostName" in line:
        hostname = line.split("HostName ")[1].strip()
        obj['hostname'] = hostname
        print(hostname)
      if "DynamicForward" in line:
        dynamic_forward = line.split("DynamicForward")[1].strip()
        print(dynamic_forward)
        obj['dynamic_forward'] = dynamic_forward
        hosts.append(obj)

    pac = """
    function FindProxyForURL(url, requestedHost) {
        "use strict";
        alert("Trying url = " + url + " *** host = " + host + " *** Resolved IP = " + dnsResolve(host));
        var hosts =
        {
    """

    for host in hosts:
      pac += f"'{ host['hostname'] }': { str(host['dynamic_forward']) },\n"

    #SITES
    with open("hosts.yml") as stream:
      content = yaml.safe_load(stream)

      for url in content["sites"]:
        if content['sites'][url] != None and "Proxy" in content['sites'][url].keys():
          proxy = content["sites"][url]["Proxy"]
          idx = next((i for i,d in enumerate(content["hostnames"]["bandak.nsc.no"]["hosts"]) if proxy in d), None)
          port = START_PORT + idx + 1 
        else:
          port = START_PORT
        pac += f"'{ url }': { port },\n"

    pac += """
       };
      for (var host in hosts) {
        var port = hosts[host];
        if (requestedHost == host || shExpMatch(requestedHost, host)) {
          return 'SOCKS5 localhost:' + port;
        }
      }
      return 'DIRECT';
    }
    """

    print(pac)

    f = open("/mnt/c/Users/t927604/proxy.pac", "w")
    f.write(pac)
    f.close()


generate_config()
generate_pac()
