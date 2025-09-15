{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (python3.withPackages (
      ps: with ps; [
        requests
        gitpython
        tldextract
        dns
        httpx
        h2
        websocket-client
        cryptography
        pymongo
        chess
        networkx
        pydot
        zstandard
        urllib3
        numpy
        chardet
        cryptography
        distro
        filelock
        google-api-python-client
        google-auth
        google-auth-oauthlib
        httplib2
        lxml
        passlib
        pathvalidate
        python-dateutil
        setuptools
      ]
    ))
  ];
}
