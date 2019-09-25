# FTP

```bash
ftp -n $hostname <<EOF
quote USER $user
quote PASS $pass
binary
lcd /home/pages
cd /www/pages
mput *.html
quit
EOF
```