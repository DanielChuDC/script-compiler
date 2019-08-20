#!/bin/bash

if [ ! -f base.ldif ]; then
   for var in {1..40}
   do
    # Generate the file

      ## Do only once
      if [[ "$var" = "1" ]] ; then
      cat >> ./base.ldif <<EOL
dn: dc=mycluster,dc=icp
dc: mycluster
objectClass: top
objectClass: domain

dn: ou=people,dc=mycluster,dc=icp
objectClass: organizationalUnit
description: All people in organization
ou: people

dn: ou=groups,dc=mycluster,dc=icp
objectClass: organizationalUnit
objectClass: top
ou: groups


EOL

      fi

      ## print out var
      echo $var;
      echo $name="auser" ## CANNOT HAVE SPACE AFTER THE "=" OPERATOR

      ## Print out the ldap user
      cat >> ./base.ldif <<EOL

dn: uid=auser${var},ou=people,dc=mycluster,dc=icp
objectClass:inetOrgPerson
objectClass: organizationalPerson
objectClass: person
objectClass: top
cn: auser${var}
sn: auser${var}
userPassword: auser${var}add

EOL

echo -e "\nGenerating auser"$var+=" successful";

      if [[ "$var" = "1" ]] ; then
            cat >> ./base.ldif <<EOL

dn: cn=clusteradmin,ou=groups,dc=mycluster,dc=icp
objectClass: groupOfUniqueNames
objectClass: top
cn: clusteradmin

EOL

      fi

            cat >> ./base.ldif <<EOL
            
uniquemember: uid=auser${var},ou=people,dc=mycluster,dc=icp
EOL



   done

fi
