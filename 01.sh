#
#!/bin/bash
#Script cipta akaun percubaan SSH/VPN
#Doctype | Malaysian Phreaker Knowledge
#
IP=`dig +short myip.opendns.com @resolver1.opendns.com`

User=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
Day="1"
Pass=Pass `</dev/urandom tr -dc A-C0-9 | head -c9`

useradd -e `date -d "$Day days" +"%Y-%m-%d"` -s /bin/false -M $User
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
echo "==============================================="
echo -e "Trial | Cipta Akaun Percubaan (1 Hari)"
echo "-----------------------------------------------"
echo -e "IP Address: \033[1;31m$IP\033[0m"
echo -e "Port OpenSSH: \033[1;31m22\033[0m"
echo -e "Port Dropbear: \033[1;31m443\033[0m"
echo -e "Squid: \033[1;31m8080\033[0m"
echo -e "Config OpenVPN: \033[1;31mhttp://$IP/client.ovpn\033[0m"
echo -e "Username: \033[1;31m$User\033[0m"
echo -e "Password: \033[1;31m$Pass\033[0m"
echo "-----------------------------------------------"
echo "Doctype | Malaysian Phreaker Knowledge | FrogyX"
echo "==============================================="
echo ""
