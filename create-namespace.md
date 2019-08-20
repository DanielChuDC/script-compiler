### Example automate script 
- Execute it after you have initialized kubectl
1) Create namespace 

```bash
#!/bin/bash

if [ ! -f namespace.yml ]; then
   for var in {1..30}
   do
      ## print out var
      echo $var;
      name="auser" ## CANNOT HAVE SPACE AFTER THE "=" OPERATOR
     
      kubectl create namespace $name$var
      echo -e "\nGenerating a namespace successful";

      echo -e "\nBinding namespace to a policy";
      # bind it to anyuid namespace
      kubectl -n $name$var create rolebinding ibm-anyuid-clusterrole-rolebinding --clusterrole=ibm-anyuid-clusterrole --group=system:serviceaccounts:$name$var

   done
 
fi
```

1.1) Delete namespace 

```bash
#!/bin/bash

if [ ! -f namespace.yml ]; then
   for var in {1..30}
   do
      ## print out var
      echo $var;
      name="auser0" ## CANNOT HAVE SPACE AFTER THE "=" OPERATOR
     
      kubectl delete namespace $name$var
      echo -e "\nDeleting a namespace successful";

      echo -e "\nDeleting namespace to a policy";
      # bind it to anyuid namespace
      # kubectl -n $name$var create rolebinding ibm-anyuid-clusterrole-rolebinding --clusterrole=ibm-anyuid-clusterrole --group=system:serviceaccounts:$name$var

   done
 
fi
```

2) Create secret.yaml


- Example bash script to create a secret yaml file
```bash
#!/bin/bash

if [ ! -f ./config/secrets.yml ]; then
  echo -e "\nGenerating a secrets.yml file"

  # Random Keys
  KEY_DEV=$(bin/rake secret)
  KEY_TEST=$(bin/rake secret)

  # Generate the file
  cat > ./config/secrets.yml <<EOL
development:
  secret_key_base: ${KEY_DEV}

test:
  secret_key_ba se: ${KEY_TEST}

production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
EOL
fi
```