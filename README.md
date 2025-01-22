## local
install ansible

    sudo apt update
    sudo apt install ansible

Allow ssh connection to vps without password

    ssh-keygen -t rsa
    ssh-copy-id user@vps_ip

Try connection

    ansible -i ansible/inventory/hosts servers -m ping


