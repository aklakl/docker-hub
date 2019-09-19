# SSH
# Version 0.0.1
# debian SSH and git 
# unverify


# IMAGES
FROM debian:latest

# MAINTAINER
MAINTAINER mingli <mingli19850915@gmail.com>


RUN apt-get install -y git sudo
RUN git clone https://github.com/aklakl/testCircleCI-tor.git repo
RUN bash repo/script/sh/installBaseTools.sh



# EXPOSE
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

RUN bash repo/script/sh/recirculate.sh
