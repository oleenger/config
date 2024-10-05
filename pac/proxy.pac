function FindProxyForURL(url, requestedHost) {
    "use strict";
    alert("Trying url = " + url + " *** host = " + host + " *** Resolved IP = " + dnsResolve(host));
    var hosts =
    {

'git01.ehub.nsc.no': 1080,
'registry01.ehub.nsc.no': 1080,
'*hub.nsc.no':1080,
        // NESt Gitlab Proxy
        'nest-git01.nsc.no': 1080,
        '*pages.nest.nsc.no': 1080,

        // NESt Stage
        'nest-s-cc01.nsc.no': 1198,
        'nest-s-ksqldb01.nsc.no': 1210,

        // NESt Prod
        'nest-cc01.nsc.no': 1150,
        'nest-ksqldb01.nsc.no': 1195,
        'nest-ksqldb02.nsc.no': 1196,
        'nest-ksqldb03.nsc.no': 1197,
        'portainer.nest.nsc.no': 1080,
        'harbor.nest.nsc.no': 1080,
        'portainer-s.nest.nsc.no': 1080, 
        '*.smp.nsc.no': 1080,


        // Bandak Stage
        's-edge-usr01.bandak.nsc.no': 1220,

        's-edge-eng01.bandak.nsc.no': 4448,
        's-edge-eng02.bandak.nsc.no': 4448,
        's-edge-eng03.bandak.nsc.no': 1223,

        's-edge-adm01.bandak.nsc.no': 1224,

        's-mapr01.bandak.nsc.no': 1225,
        's-mapr02.bandak.nsc.no': 1226,
        's-mapr03.bandak.nsc.no': 1227,
        's-mapr04.bandak.nsc.no': 1228,
        's-mapr05.bandak.nsc.no': 1229,

        // Bandak Prod
        'edge-adm01.bandak.nsc.no': 1260,

        'edge-eng01.bandak.nsc.no': 1261,
        'edge-eng02.bandak.nsc.no': 1262,
        'kubeflow.bandak.nsc.no': 1262,

        'edge-usr01.bandak.nsc.no': 5003,




        'bandak-ansible01.bandak.nsc.no': 1200,


        'mapr01.bandak.nsc.no': 1250,
        'mapr02.bandak.nsc.no': 1251,
        'mapr03.bandak.nsc.no': 1252,
        'mapr04.bandak.nsc.no': 1253,
        'mapr05.bandak.nsc.no': 1254,
        'mapr06.bandak.nsc.no': 1255,
        'mapr07.bandak.nsc.no': 1256,
        'mapr08.bandak.nsc.no': 1257,

's-airflow.bandak.nsc.no': 1080,
's-spark-history.bandak.nsc.no': 1080,
'spark-history.bandak.nsc.no': 1080,
'zeppelin.bandak.nsc.no': 1080,
's-zeppelin.bandak.nsc.no': 1080,
's-superset.bandak.nsc.no': 1080,
'superset.bandak.nsc.no': 1080,
'airflow.bandak.nsc.no': 1080,
'db-browser.bandak.nsc.no': 1080,
'vault.bandak.nsc.no': 1080,
'trino.bandak.nsc.no': 1080,
'yarn-applications.bandak.nsc.no': 1080,
'nexus.bandak.nsc.no': 1080


    };

    // Set up Hosts
    for (var host in hosts) {
        var port = hosts[host];
        if (requestedHost == host || shExpMatch(requestedHost, host)) {
//            alert("url = " + url + " *** host = " + host + " *** Resolved IP = " + dnsResolve(host));
            return 'SOCKS5 localhost:' + port;
        }

    }

    return 'DIRECT';
}