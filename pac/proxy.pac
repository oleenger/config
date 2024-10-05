function FindProxyForURL(url, requestedHost) {
    "use strict";
    alert("Trying url = " + url + " *** host = " + host + " *** Resolved IP = " + dnsResolve(host));
    var hosts =
    {
        '*.ehub.nsc.no':1080,
        'nest-git01.nsc.no': 1080,
        '*.nest.nsc.no': 1080,
        '*mapr*.bandak.nsc.no': 1200,

        'superset.bandak.nsc.no': 1080,
        'db-browser.bandak.nsc.no': 1080,

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
