# How to deploy IBM Cloud Automate Manager?

## Prerequisite

- Cloud Automate Manager must install with namespace `services`
- The default storage class are able to attach storage.

### [Create a docker secret](https://www.ibm.com/support/knowledgecenter/en/SS2L37_3.1.2.1/cam_docker_secret.html)

```yml
kubectl create secret docker-registry <secretname> --docker-username=<userid> --docker-password=<password> --docker-email=<email> -n services
```

 Where

    <secretname> - It is your desired secret name.
    <userid> - It is your Docker Store user name.
    <password> - It is your Docker Store password.

### [Installing IBM Cloud Automate Manager Community Version](https://www.ibm.com/support/knowledgecenter/en/SS2L37_3.1.2.1/cam_installing_CE_main.html)

Steps to install Cloud Automation Manager Community Edition online. You can install directly from IBM Cloud Private catalog without any prior download.
Before you begin

    Go through the prerequisites in Prerequisites for installing Cloud Automation Manager.
    Create Docker Store secret. For instructions, see Creating a Docker Store secret.

    Generate a deployment ServiceID API Key:

    export serviceIDName='service-deploy'
    export serviceApiKeyName='service-deploy-api-key'
    cloudctl login -a https://mycluster.icp:8443 --skip-ssl-validation -u <icp_admin_id> -p <icp_admin_password> -n services
    cloudctl iam service-id-create ${serviceIDName} -d 'Service ID for service-deploy'
    cloudctl iam service-policy-create ${serviceIDName} -r Administrator,ClusterAdministrator --service-name 'idmgmt'
    cloudctl iam service-policy-create ${serviceIDName} -r Administrator,ClusterAdministrator --service-name 'identity'
    cloudctl iam service-api-key-create ${serviceApiKeyName} ${serviceIDName} -d 'Api key for service-deploy'

    Use the API Key that you receive from the service-api-key-create command in deployApiKey value of Helm Chart install.

    Notes:
        Create a new ServiceID that includes a service policy to grant Cluster Administrator/Administrator role to Cloud Automation Manager and Helm API.
        Generate an API Key for Cloud Automation Manager ServiceID. This key is used to onboard Cloud Automation Manager into the Platform Identity and Access Management(IAM). IAM is used for authorization checks in Cloud Automation Manager.



### Open "Catalog" on IBM Cloud private and search for "cam"

- Fill in your application name
- Fill in the docker secret name you created above
- Fill in the deployment ServiceID API Key you created above
- Checked the check box for all dynamic provision service.
- Click submit

- You have done the deployment of IBM Cloud Automation Manager

- Wait patiently for start-up time need 10-20 mins.