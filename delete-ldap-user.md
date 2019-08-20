### You should use the -D with the admin dn, plus a -W or -w (followed by the password) and then the entry you want to delete:

```
ldapdelete -x -D "cn=ldapadm,dc=mycluster,dc=icp" -W uid=auser03,ou=people,dc=mycluster,dc=icp
```

```bash
#!/bin/bash

if [ ! -f ./script-delete.sh ]; then
   for var in {1..20}
   do
      ## print out var
      echo $var;
      name="auser0" ## CANNOT HAVE SPACE AFTER THE "=" OPERATOR

      ldapdelete -x -D "cn=ldapadm,dc=mycluster,dc=icp" -W uid=$name$var,ou=people,dc=mycluster,dc=icp
      echo -e "\nDeleting a namespace successful";

      echo -e "\nDeleting namespace to a policy";
      # bind it to anyuid namespace
      # kubectl -n $name$var create rolebinding ibm-anyuid-clusterrole-rolebinding --clusterrole=ibm-anyuid-clusterrole --group=system:serviceaccounts:$name$var

   done

fi
```
