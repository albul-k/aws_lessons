# login
C:\Users\konst>ssh -i aws_test.pem ubuntu@18.220.204.101
The authenticity of host '18.220.204.101 (18.220.204.101)' can't be established.
ECDSA key fingerprint is SHA256:PAYz1FMRw6TxJUarjShZve+vZ1WCWaM2iZqCOyij190.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '18.220.204.101' (ECDSA) to the list of known hosts.
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.comWelcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Sun Jun  7 20:22:10 UTC 2020

  System load:  0.48              Processes:           92
  Usage of /:   20.1% of 7.69GB   Users logged in:     0
  Memory usage: 17%               IP address for eth0: 172.31.39.37
  Swap usage:   0%

 * MicroK8s gets a native Windows installer and command-line integration.

     https://ubuntu.com/blog/microk8s-installers-windows-and-macos

33 packages can be updated.
0 updates are security updates.


*** System restart required ***
Last login: Wed Jun  3 20:54:57 2020 from 193.233.154.128

# step 1-1: add some files *.py
ubuntu@ip-172-31-39-37:~$ touch aaa.py bbb.py ccc.py taa.py tbb.py ttt.py

# step 1-2: find all *.py
ubuntu@ip-172-31-39-37:~$ ls | grep '.py'
aaa.py
bbb.py
ccc.py
taa.py
tbb.py
ttt.py

# step 1-3: find all t*.py 
ubuntu@ip-172-31-39-37:~$ ls | grep 't.*\.\p\y'
taa.py
tbb.py
ttt.py

# step 2-1: add print() to some files
ubuntu@ip-172-31-39-37:~$ echo 'print("aaa")' > aaa.py
ubuntu@ip-172-31-39-37:~$ echo 'print("ccc")' > ccc.py
ubuntu@ip-172-31-39-37:~$ cat aaa.py
print("aaa")

# step 2-2: show files containig 'print' string
ubuntu@ip-172-31-39-37:~$ grep -rl 'print' /home/ubuntu
/home/ubuntu/aaa.py
/home/ubuntu/ccc.py

# step 3-1: show full uptime
ubuntu@ip-172-31-39-37:~$ uptime
 21:49:10 up  1:30,  1 user,  load average: 0.00, 0.00, 0.00

# step 3-2: show data between 'up\s*' and ',.*user'
ubuntu@ip-172-31-39-37:~$ uptime | sed -r 's/^.*up\s*(.*)\,.*user.*$/\1/'
1:36

# step 3-3: show only number of days (could't check due to short uptime...)
ubuntu@ip-172-31-39-37:~$ uptime | sed -r 's/^.*up\s*(.*)\sdays\,.*user.*$/\1/'