## local

### install ansible

    sudo apt update
    sudo apt install ansible

#### Allow ssh connection to vps without password

    ssh-keygen -t rsa
    ssh-copy-id user@vps_ip

### Verify availability
ansible -i ansible/inventory/hosts servers -m ping

### Get vps info
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/info.yml

### Install Docker
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/setup_docker.yml

### Deploy Inception
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/deploy_inception.yml

### Total Deploy
ansible-playbook -i ansible/inventory/hosts ansible/playbooks/total_deploy.yml