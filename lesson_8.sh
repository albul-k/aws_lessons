C:\Users\konst>ssh -i aws_test.pem ubuntu@18.216.216.107
The authenticity of host '18.216.216.107 (18.216.216.107)' can't be established.
ECDSA key fingerprint is SHA256:PAYz1FMRw6TxJUarjShZve+vZ1WCWaM2iZqCOyij190.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '18.216.216.107' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 5.3.0-1019-aws x86_64)Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 5.3.0-1019-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Jun 10 07:15:51 UTC 2020

  System load:  0.0               Processes:           94
  Usage of /:   23.0% of 7.69GB   Users logged in:     0
  Memory usage: 21%               IP address for eth0: 172.31.39.37
  Swap usage:   0%

 * MicroK8s gets a native Windows installer and command-line integration.

     https://ubuntu.com/blog/microk8s-installers-windows-and-macos

33 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Mon Jun  8 07:53:39 2020 from 193.233.154.128

# step 1
ubuntu@ip-172-31-39-37:~$ for i in {1..3}
>   do
>     echo whoami
>   done
whoami
whoami
whoami

# step 2
ubuntu@ip-172-31-39-37:~$ y=0
ubuntu@ip-172-31-39-37:~$ while [ $y -le 100 ]
>   do
>    if [[ $y > 0 ]] && [[ $(( $y % 2 )) == 0 ]];
>      then
>        echo $y
>      fi
>    y=$(( $y + 1 ))
>   done
2
4
6
8
10
12
14
16
18
20
22
24
26
28
30
32
34
36
38
40
42
44
46
48
50
52
54
56
58
60
62
64
66
68
70
72
74
76
78
80
82
84
86
88
90
92
94
96
98
100

# step 3-1: create test.txt
ubuntu@ip-172-31-39-37:~$ nano test.txt
ubuntu@ip-172-31-39-37:~$ cat test.txt
Hello, World!

# step 3-2: create backup script
ubuntu@ip-172-31-39-37:~$ nano script_test_bck.sh
ubuntu@ip-172-31-39-37:~$ cat script_test_bck.sh
#!/bin/bash
cp ~/test.txt ~/test.txt.bak
ubuntu@ip-172-31-39-37:~$ chmod +x script_test_bck.sh

# step 3-3: add task to crontab
ubuntu@ip-172-31-39-37:~$ crontab -e
no crontab for ubuntu - using an empty one

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny
                                                                                                                                                                                                                                                                                                                                                                        crontab: installing new crontab
ubuntu@ip-172-31-39-37:~$ crontab -l
# Edit this file to introduce tasks to be run by cron.
#
# Each task to run has to be defined through a single line
# indicating with different fields when the task will be run
# and what command to run for the task
#
# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').#
# Notice that tasks will be started based on the cron's system
# daemon's notion of time and timezones.
#
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
#
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h  dom mon dow   command

*/10 * * * * /home/ubuntu/script_test_bck.sh

# step 3-4: add task to crontab
ubuntu@ip-172-31-39-37:~$ ls
script_test_bck.sh  step_1.sh  test.txt  test.txt.bak
ubuntu@ip-172-31-39-37:~$ cat test.txt.bak
Hello, World!

# step 3-5: check syslog
ubuntu@ip-172-31-39-37:~$ tail -f /var/log/syslog | grep -i cron
Jun 10 08:06:44 ip-172-31-39-37 crontab[7856]: (ubuntu) LIST (ubuntu)
Jun 10 08:09:08 ip-172-31-39-37 crontab[7858]: (ubuntu) BEGIN EDIT (ubuntu)
Jun 10 08:09:59 ip-172-31-39-37 crontab[7858]: (ubuntu) REPLACE (ubuntu)
Jun 10 08:09:59 ip-172-31-39-37 crontab[7858]: (ubuntu) END EDIT (ubuntu)
Jun 10 08:10:01 ip-172-31-39-37 CRON[7890]: (ubuntu) CMD (/home/ubuntu/script_test_bck.sh)
Jun 10 08:10:04 ip-172-31-39-37 crontab[7895]: (ubuntu) LIST (ubuntu)
Jun 10 08:17:01 ip-172-31-39-37 CRON[7910]: (root) CMD (   cd / && run-parts --report /etc/cron.hourly)
Jun 10 08:20:01 ip-172-31-39-37 CRON[7919]: (ubuntu) CMD (/home/ubuntu/script_test_bck.sh)