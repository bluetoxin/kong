FROM alpine

# Install openssh server
RUN apk add openssh

# Generate host keys
RUN ssh-keygen -A

# Allow to connect via password 
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
