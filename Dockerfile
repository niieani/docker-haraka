FROM ubuntu:latest

ENV HOME /root

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties g++ make git curl
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Haraka
RUN npm install -g Haraka
RUN mkdir /haraka
WORKDIR /haraka

EXPOSE 25
ENTRYPOINT [ "/usr/bin/haraka" ]
