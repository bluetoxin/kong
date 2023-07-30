FROM alpine

# Install dependancies
RUN apk add openssh python3

# Allow to connect via password 
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo 'ChallengeResponseAuthentication yes' >> /etc/ssh/sshd_config

# Generate host keys
RUN ssh-keygen -A

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
