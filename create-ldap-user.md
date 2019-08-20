# Create ldap user in bash script

### [Example](./example/create-ldap-user.ldif)

### Form below script with script.sh

`vi script.sh`

```bash
#!/bin/bash

if [ ! -f base1.ldif ]; then
   for var in {21..40}
   do
    # Generate the file

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
   done

 for var in {1..40}
   do
    # Generate the file

      ## print out var
      echo $var;
      echo $name="auser" ## CANNOT HAVE SPACE AFTER THE "=" OPERATOR

      ## Print out the ldap user
  cat >> ./base.ldif <<EOL

uniquemember: uid=auser${var},ou=people,dc=mycluster,dc=icp
EOL

echo -e "\nGenerating uniquemember"$var+=" successful";
   done


fi
```
