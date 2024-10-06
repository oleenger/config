
    function FindProxyForURL(url, requestedHost) {
        "use strict";
        alert("Trying url = " + url + " *** host = " + host + " *** Resolved IP = " + dnsResolve(host));
        var hosts =
        {
    'ssh.ult.telenor.net': 1200,
'mapr01.bandak.nsc.no': 1201,
'mapr02.bandak.nsc.no': 1202,
'mapr03.bandak.nsc.no': 1203,
'mapr04.bandak.nsc.no': 1204,
'mapr05.bandak.nsc.no': 1205,
'mapr06.bandak.nsc.no': 1206,
'mapr07.bandak.nsc.no': 1207,
'mapr08.bandak.nsc.no': 1208,
'edge-usr01.bandak.nsc.no': 1209,
'edge-eng01.bandak.nsc.no': 1210,
'edge-eng02.bandak.nsc.no': 1211,
's-mapr01.bandak.nsc.no': 1212,
's-mapr02.bandak.nsc.no': 1213,
's-mapr03.bandak.nsc.no': 1214,
's-mapr04.bandak.nsc.no': 1215,
's-mapr05.bandak.nsc.no': 1216,
's-edge-usr01.bandak.nsc.no': 1217,
's-edge-eng01.bandak.nsc.no': 1218,
's-edge-eng02.bandak.nsc.no': 1219,
's-edge-eng03.bandak.nsc.no': 1220,
'bandak-ansible01.bandak.nsc.no': 1221,
'nest-git01.nsc.no': 1222,
'superset.bandak.nsc.no': 1200,
's-superset.bandak.nsc.no': 1200,
'trino.bandak.nsc.no': 1200,
'zeppelin.bandak.nsc.no': 1200,
's-zeppelin.bandak.nsc.no': 1200,
's-airflow.bandak.nsc.no': 1200,
'airflow.bandak.nsc.no': 1200,
'db-browser.bandak.nsc.no': 1200,
'vault.bandak.nsc.no': 1200,
'yarn-applications.bandak.nsc.no': 1200,
'spark-history.bandak.nsc.no': 1200,
'nexus.bandak.nsc.no': 1200,
'kubeflow.bandak.nsc.no': 1211,
'harbor.nest.nsc.no': 1200,
'nest-git01.nsc.no': 1200,

       };
      for (var host in hosts) {
        var port = hosts[host];
        if (requestedHost == host || shExpMatch(requestedHost, host)) {
          return 'SOCKS5 localhost:' + port;
        }
      }
      return 'DIRECT';
    }
    