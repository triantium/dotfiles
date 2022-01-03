#!/bin/bash

# Kleines Skript um sich mit dem openvpn Client in das Fath Netzwerk einzuwählen.
# Voraussetzungen
#   - pass
#   - openvpn
#   - config Datei wurde aus dem Passwordsstore unter "$XDG_CONFIG_HOME/openvpn/GeekInBusiness@Fath" abgelegt

# pass <(echo $user && echo $password)

PASSWORD_STORE_DIR=${HOME}/.geek-password-store

vpnsecret='customers/fath/vpn'

function init () {
  pass ${vpnsecret}/GeekInBusiness@217.6.214.250.conf >  "$XDG_CONFIG_HOME/openvpn/GeekInBusiness@Fath"
  pass ${vpnsecret}/GeekInBusiness@217.6.214.250-ca.pem > "${HOME}/.cert/nm-openvpn/GeekInBusiness@217.6.214.250-ca.pem"
  pass ${vpnsecret}/GeekInBusiness@217.6.214.250-cert.pem > "${HOME}/.cert/nm-openvpn/GeekInBusiness@217.6.214.250-cert.pem"
  pass ${vpnsecret}/GeekInBusiness@217.6.214.250-key.pem > "${HOME}/.cert/nm-openvpn/GeekInBusiness@217.6.214.250-key.pem"
}


password=$(pass "${vpnsecret}/password" | head -n 1 | tr -d '\n')
user=$(pass "${vpnsecret}/password" | grep 'user: ' | sed 's/user: //g' | tr -d '\n')
password="${password}$(pass otp ${vpnsecret}/password)"


auth=$(mktemp)

trap 'echo deleting $auth && rm -f $auth' EXIT


echo "${user}" > "${auth}"
echo "${password}" >> "${auth}"


if [ -z "${XDG_CONFIG_HOME}" ] ; then
  echo "Setting Config Home"
  XDG_CONFIG_HOME="${HOME}/.config"
fi

doas openvpn --config "${XDG_CONFIG_HOME}/openvpn/GeekInBusiness@Fath.conf" \
  --auth-user-pass "${auth}"

