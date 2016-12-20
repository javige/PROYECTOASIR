#!/bin/bash
cn=*
server=192.168.2.200
basedn=ou=usuarios,dc=servus2,dc=inf
port=389

conectado=$(whoami)
fecha=$(ldapsearch -x -h  $server -p $port -b $basedn -s sub "(&(objectclass=informacion)(cn="$conectado")(fnac=*))" fnac | grep "fnac:" | cut -c 11-14)

DIA=`date +%d`
MES=`date +%m`

if [[ $fecha != "" ]] ;then

	if [ $MES$DIA -eq $fecha  ] ;then

		echo  "Felicidades" $conectado
	fi
fi
