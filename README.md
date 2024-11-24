Uses `ansible` to quickly create a GCP VM, with 

- ubuntu 22
- configure it for ssh and http firewall with ufw
- blocks root access via ssh
- installs ssh keys for a username
- installs a simple nginx webpage on port 80 with a timer/clock display

## Usage 

### Credentials
First create an application credential for Google Cloud : 
```sh
gcloud auth application-default login
```
It will be stored in `$HOME/.config/gcloud/application_default_credentials.json` and this is where the google module for ansible will be looking for the credentials.

### Create 
Next run it with `make create` or `make destroy` .  It will pick a random host name. 

You can choose the hostname if you set VM_NAME first 
```sh
make VM_NAME=app1-web create
```

You will have to use the same hostname for the destory call too 
```sh
make VM_NAME=app1-web destroy
```
