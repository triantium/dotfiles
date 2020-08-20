#!/bin/bash
PAYARA_DIR=~/payara5
PAYARA_DOMAIN=domain1
PAYARA_STORE=$PAYARA_DIR/glassfish/domains/$PAYARA_DOMAIN/config/keystore.jks
PAYARA_CA_STORE=$PAYARA_DIR/glassfish/domains/$PAYARA_DOMAIN/config/cacerts.jks

CERT_ALIAS=geekletsencrypt
CERT_FILE=/home/geekadmin/ssl.combined
KEY_FILE=/home/geekadmin/ssl.key
PK12_FILE=/home/geekadmin/ssl.p12

LETSENCRYPT_ROOT=https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem.txt

curl $LETSENCRYPT_ROOT -o /tmp/isrgrootx1.pem
openssl x509 -outform der -in /tmp/isrgrootx1.pem -out /tmp/isrgrootx1.der
keytool -delete -alias ISRG_ROOT_X3 -keystore $PAYARA_CA_STORE -storepass changeit
keytool -import -alias ISRG_ROOT_X3 -keystore $PAYARA_CA_STORE -file /tmp/isrgrootx1.der -storepass changeit -noprompt

#
#/usr/bin/keytool -delete -alias $CERT_ALIAS -keystore $PAYARA_STORE -storepass changeit

##/usr/local/ssl/bin/openssl pkcs12 -export -in $CERT_FILE -inkey $KEY_FILE -out $PK12_FILE -name $CERT_ALIAS -passout pass:changeit
#/usr/local/ssl/bin/openssl pkcs12 -export -in $CERT_FILE -inkey $KEY_FILE -out $PK12_FILE -name $CERT_ALIAS -passout pass:pkPasswd

#/usr/bin/keytool -importkeystore -destkeystore $PAYARA_STORE -storepass changeit -srcstorepass pkPasswd -srckeystore $PK12_FILE -srcstoretype PKCS12 -alias $CERT_ALIAS

#$PAYARA_DIR/bin/asadmin set configs.config.server-config.network-config.protocols.protocol.http-listener-2.ssl.cert-nickname=$CERT_ALIAS
$PAYARA_DIR/bin/asadmin restart-domain $PAYARA_DOMAIN

