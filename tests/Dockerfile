FROM ubuntu:20.04

# Do necessary steps
RUN apt update && apt install -y openssh-server
RUN mkdir /var/run/sshd

# Allow to connect via password 
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
