#!/bin/bash
cn=*
server=192.168.2.200 #Put your server IP
basedn=ou=usuarios,dc=servus2,dc=inf #Put your basedn
port=389
binddn=cn=admin,dc=servus2,dc=inf

listausuarios=$(ldapsearch -x -h $server -p $port -b $basedn -s sub "(!(objectclass=informacion))" cn | grep "cn:" | cut -f2 -d" ")

for i in $listausuarios ;do
        sed -i '1i dn: uid='$i',ou=usuarios,dc=servus2,dc=inf' modificar.ldif
        ldapadd -x -D $binddn -W -H ldapi:/// -f modificar.ldif
        sed -i "1d" modificar.ldif
done

