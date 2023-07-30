FROM amazonlinux

# Do necessary steps
RUN yum install -y openssh-server 
RUN mkdir /var/run/sshd

# Allow to connect via password 
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo 'ChallengeResponseAuthentication yes' >> /etc/ssh/sshd_config

# Generate keys (required for SSH to work)
RUN ssh-keygen -A

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
