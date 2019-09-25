sftp root@remote_ip << EOT
lcd /home/local
cd /home/remote
get config.yaml
mget *.php
bye
quit
EOT

# copy file
hostname="server"
username="user"
password="pass"


