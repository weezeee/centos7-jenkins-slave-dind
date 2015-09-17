# centos7-jenkins-slave-dind
CentOS container image ready to be used for Jenkins DinD (actually DooD)

The /var/run/docker.sock is the key to making this work
1) In HOST must be writeable by other (because when Jenkins runs it doesn't use root and default permission will not allow jenkins users to access the socket)
2) When creating the container the volume /var/run/docker.sock must be mounted
