# Web Servers

1.  What are some of the key design philosophies of the Linux operating system?

Linux is an open source operating system based on Unix.  Its design philosophies are similar to those of Unix.  For example:

* Each program should to one thing well
* Portability is more important than efficiency
* Data should be stored in flat text files
* Code should be comprehensible by other developers

2.  In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?

A VPS is an emulated operating system run on an Internet hosting service.  It's similar to renting a remote computer, except that the "computer" is one of many running on the same hardware.  The main advantage is that a virtual server is much cheaper than a separate physical server.

3.  Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?

The root user has access to all of the files and directories on the system.  That means that the root user could inadvertently damage the system by, for example, deleting key files.  It's also not very secure, because a malicious program run by the root user has access to the entire system.