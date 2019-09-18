# SSH
# Version 0.0.1
# debian SSH



# IMAGES
FROM debian:latest

# MAINTAINER
MAINTAINER mingli <mingli19850915@gmail.com>

# Install packages
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:Anonymous' | chpasswd
#RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed '1 PermitRootLogin yes' -i /etc/ssh/sshd_config 


# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

#ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

#Install git
RUN apt-get install -y git 
RUN apt-get update -y

# EXPOSE
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
