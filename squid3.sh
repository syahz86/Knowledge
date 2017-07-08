# NETWORK OPTIONS.
http_port 8080 transparent

# Minimum Configuration.
acl manager proto cache_object
acl localhost src 127.0.0.1/32 ::1
acl to_localhost dst 127.0.0.0/8 0.0.0.0/32 ::1
acl localnet src 10.0.0.0/8       # RFC1918 possible internal network
acl localnet src 172.16.0.0/12    # RFC1918 possible internal network
acl localnet src 192.168.0.0/16   # RFC1918 possible internal network
acl localnet src fc00::/7         # RFC 4193 local private network range
acl localnet src fe80::/10        # RFC 4291 link-local (directly plugged) machines

# local Networks.
acl SSL_ports port 443          # 
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT
acl Only_hosts dst xxxxxxxxx/32

# Minimum configuration.
http_access allow Only_hosts
http_access allow manager localhost
http_access deny manager
http_access allow localhost
http_access allow localnet
http_access deny all

# Add refresh_pattern.
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern . 0 20% 4320
visible_hostname doctmpk.tk
