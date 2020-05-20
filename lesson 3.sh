# login
C:\Users\konst>ssh -i aws_test.pem ubuntu@13.59.84.70
Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)Welcome to Ubuntu 18.04.4 LTS (GNU/Linux 4.15.0-1065-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed May 20 21:15:42 UTC 2020

  System load:  0.0               Processes:           87
  Usage of /:   13.9% of 7.69GB   Users logged in:     0
  Memory usage: 15%               IP address for eth0: 172.31.24.243
  Swap usage:   0%


0 packages can be updated.
0 updates are security updates.


Last login: Wed May 20 21:09:21 2020 from 193.233.154.128
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

# step 1: create my_prog.py by vim
ubuntu@ip-172-31-24-243:~$ vim my_prog.py

# step 1: the result
ubuntu@ip-172-31-24-243:~$ cat my_prog.py
print('Hello, World!')

# step 2: the number of lines in my_prog.py
ubuntu@ip-172-31-24-243:~$ wc -l my_prog.py
1 my_prog.py

# step 3: create my_prog_1.py by nano
ubuntu@ip-172-31-24-243:~$ nano my_prog_1.py

# step 3: the result
ubuntu@ip-172-31-24-243:~$ cat my_prog_1.py
print('Linear regression')

# step 4: concatenation of my_prog.py and my_prog_1.py
ubuntu@ip-172-31-24-243:~$ cat my_prog.py my_prog_1.py
print('Hello, World!')
print('Linear regression')

# step 5-1: concatenation of all *.py files
ubuntu@ip-172-31-24-243:~$ cat *.py
print('Hello, World!')
print('Linear regression')

# step 5-2: the number of lines in all *.py files
ubuntu@ip-172-31-24-243:~$ cat *.py | wc -l
2

# step 5-3: concatenation of my_prog.py and my_prog_1.py and write the result in my_prog_2.py
ubuntu@ip-172-31-24-243:~$ cat *.py > my_prog_2.py

# step 5-3: the result
ubuntu@ip-172-31-24-243:~$ cat my_prog_2.py
print('Hello, World!')
print('Linear regression')