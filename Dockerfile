# This Dockerfile is used to build a centos image for Docker-beside-Docker and stuff Jenkins slave need to be set up as a dynamic docker build slave

# To run Docker-beside-Docker the /var/run/docker.sock volume must be mounted from host to this container

FROM centos
MAINTAINER Wai Tsoi <wai@tsoifamily.net>

# Make sure the package repo is up to date
RUN yum update -y

# Install a basic SSH server
RUN yum install -y openssh-server
RUN sed -i 's|session required pam_loginuid.so|session option pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd
RUN /usr/sbin/sshd-keygen

# Install Java 8
RUN yum install -y java-1.8.0-openjdk.x86_64

# Install Docker
RUN yum install -y docker

# Add jenkins (same password)
RUN adduser jenkins
RUN echo "jenkins:jenkins" | chpasswd


# Open port for SSH incoming connection
EXPOSE 22

# Default Startup command is sshd
CMD ["/usr/sbin/sshd", "-D"]
