FROM phusion/baseimage:latest

ENV HOME /root

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties g++ make git curl swaks
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
	DEBIAN_FRONTEND=noninteractive apt-get -y install nodejs && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Haraka
RUN npm install -g Haraka
RUN mkdir -p /haraka /etc/service/haraka

WORKDIR /haraka

EXPOSE 25
EXPOSE 465
EXPOSE 587

RUN echo "#!/bin/sh" > /etc/service/haraka/run && \
		echo "cd /haraka" >> /etc/service/haraka/run && \
		echo "test ! -e /haraka/config && exec haraka -i /haraka" >> /etc/service/haraka/run && \
		echo "test ! -e /haraka/node_modules && exec npm install" >> /etc/service/haraka/run && \
		echo "exec haraka -c /haraka" >> /etc/service/haraka/run && \
		chmod +x /etc/service/haraka/run

CMD ["/sbin/my_init"]
