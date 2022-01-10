# Use Java 11 JDK Oracle Linux
FROM openjdk:11-jdk-oracle
MAINTAINER Dragos
# Set the JMeter version you want to use
ARG JMETER_VERSION="5.4"

# Set JMeter related environment variables
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN ${JMETER_HOME}/bin
ENV JMETER_DOWNLOAD_URL https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# Set default values for allocation of system resources (memory) which will be used by JMeter
ENV Xms 256m
ENV Xmx 512m
ENV MaxMetaspaceSize 1024m

# Change timezone to local time
ENV TZ="Europe/Bucharest"
RUN export TZ=$TZ

# Install jmeter
RUN yum -y install curl \
&& mkdir -p /tmp/dependencies \
&& curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz \
&& mkdir -p /opt \
&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt \
&& rm -rf /tmp/dependencies

# Set JMeter home
ENV PATH $PATH:$JMETER_BIN

# copy our entrypoint
ENV ENTRYPOINT_DOWNLOAD_URL https://raw.githubusercontent.com/aklakl/docker-hub/jmeter/Jmeter/Entrypoint.sh

#download entrypoint.sh
RUN curl -L  ${ENTRYPOINT_DOWNLOAD_URL} >  /tmp/entrypoint.sh

#test current path
RUN echo "************test path start********"
RUN ls 
RUN pwd
RUN echo "***********************************"
RUN ls /tmp
RUN echo "************test path end**********"


#RUN chmod +x ./entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh 

# Run command to allocate the default system resources to JMeter at 'docker run'
ENTRYPOINT ["/tmp/entrypoint.sh"]