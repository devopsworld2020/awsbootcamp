#!/bin/sh
# Remove java 7
yum remove -y java
# Download and install java 8
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz"
tar -xzvf jdk-8u131-linux-x64.tar.gz
rm -rf jdk-8u131-linux-x64.tar.gz
# Configure JAVA_HOME
mkdir /usr/lib/java
mv jdk1.8.0_131 /usr/lib/java/jdk1.8.0_131

JAVA_HOME=/usr/lib/java/jdk1.8.0_131
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export PATH

update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/java/jdk1.8.0_131/bin/javac" 1
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/java/jdk1.8.0_131/bin/java" 1
update-alternatives --set java /usr/lib/java/jdk1.8.0_131/bin/java
update-alternatives --set javac /usr/lib/java/jdk1.8.0_131/bin/javac

# check java version
java -version
javac -version
# Installing Docker on Amazon Linux 2
yum update -y
# Amazon Linux 2
#amazon-linux-extras install docker
# Amazon Linux
yum install -y docker
service docker start
usermod -a -G docker ec2-user
docker version
docker info
# Install Jenkins
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install -y jenkins
service jenkins start
chkconfig --add jenkins