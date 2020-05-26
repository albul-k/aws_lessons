# login
C:\Users\konst>ssh -i aws_test.pem ubuntu@3.23.113.142
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue May 26 20:25:12 UTC 2020

  System load:  0.0               Processes:           86
  Usage of /:   13.7% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.23.100
  Swap usage:   0%

0 packages can be updated.
0 updates are security updates.



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

# step 1-1: add new user
ubuntu@ip-172-31-23-100:~$ sudo useradd -m -s /bin/bash user_new

# step 1-2: add password for new user
ubuntu@ip-172-31-23-100:~$ sudo passwd user_new
Enter new UNIX password:
Retype new UNIX password:
passwd: password updated successfully

# step 1-3: create hello.py
ubuntu@ip-172-31-23-100:~$ echo 'print("Hello, World!")' >> hello.py
ubuntu@ip-172-31-23-100:~$ ls
hello.py

# step 1-4: move it to "user_new" home catalog
ubuntu@ip-172-31-23-100:~$ sudo mv hello.py ../user_new/
ubuntu@ip-172-31-23-100:~$ cd ..
ubuntu@ip-172-31-23-100:/home$ cd user_new/
ubuntu@ip-172-31-23-100:/home/user_new$ ls -la
total 24
drwxr-xr-x 2 user_new user_new 4096 May 26 20:43 .
drwxr-xr-x 4 root     root     4096 May 26 20:26 ..
-rw-r--r-- 1 user_new user_new  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 user_new user_new 3771 Apr  4  2018 .bashrc
-rw-r--r-- 1 user_new user_new  807 Apr  4  2018 .profile
-rw-rw-r-- 1 ubuntu   ubuntu     23 May 26 20:42 hello.py

# step 1-5: add write permission for "others"
ubuntu@ip-172-31-23-100:/home/user_new$ chmod o+w hello.py
ubuntu@ip-172-31-23-100:/home/user_new$ ls -la
total 24
drwxr-xr-x 2 user_new user_new 4096 May 26 20:43 .
drwxr-xr-x 4 root     root     4096 May 26 20:26 ..
-rw-r--r-- 1 user_new user_new  220 Apr  4  2018 .bash_logout
-rw-r--r-- 1 user_new user_new 3771 Apr  4  2018 .bashrc
-rw-r--r-- 1 user_new user_new  807 Apr  4  2018 .profile
-rw-rw-rw- 1 ubuntu   ubuntu     23 May 26 20:42 hello.py

# step 2-1: login as "user_new"
ubuntu@ip-172-31-23-100:/home/user_new$ su user_new
Password:

# step 2-1: change hello.py
user_new@ip-172-31-23-100:~$ vim hello.py

# step 2-2: the result
user_new@ip-172-31-23-100:~$ cat hello.py
print("Hello, New World!")

# step 3-1: create new py program
user_new@ip-172-31-23-100:~$ vim new_prog.py

# step 3-2: the result
user_new@ip-172-31-23-100:~$ cat new_prog.py
from time import sleep

for i in range(1,11):
    print(i)
    sleep(1)

# step 3-3: the result of execution new_prog.py
user_new@ip-172-31-23-100:~$ python3 new_prog.py
1
2
3
4
5
6
7
8
9
10
user_new@ip-172-31-23-100:~$     