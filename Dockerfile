FROM node 
MAINTAINER franck@besnard.mobi

RUN npm install -g @angular/cli @angular-devkit/build-angular @angular/compiler-cli typescript @angular/compiler @angular/core rxjs 

COPY demo-master.zip /tmp/ 
COPY startup.sh /

RUN mkdir /data && \
	mkdir /conf && \
	cd /data && \
	unzip /tmp/demo-master.zip && \
	rm -f /tmp/demo-master.zip && \
	cd /data/demo-master && \
	npm link && \
	chmod +x /startup.sh

WORKDIR /data/demo-master

EXPOSE 4200

ENTRYPOINT ["/startup.sh"]
