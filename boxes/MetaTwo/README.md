# MetaTwo

## enum

    - nmap: web, ftp
    - wp
        - user: admin
        - plugin:
            - sqli
            - XXE


## exp

    - XXE: 
        - get /etc/passwd 
            - jnelson
                - get .ssh/id_rsa: fail
                - get /home/jnelson/user.txt: fail
        - get wp-config.php
            - get FTP cred.

    - FTP
        - get send_email.php contains email of jnelson & its pwd.
        - try to use email passwd for ssh -> Success
            => pwn user.


## priv esc

    - in /home/jnelson list all (ls -la)
        - folder `.passpie` contains pgp key, message

    - key
        - the pr-key contains a paraphase. we need to crack it with john
                
            gpg2john priKey > hashpr
            john hashpr

    - after crack paraphase, import key and decrypt message to get root password.