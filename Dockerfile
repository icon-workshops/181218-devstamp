FROM	ubuntu:18.04

RUN	apt update &&\
	apt -y -qq upgrade &&\
        apt -y -qq install tree git locales lsof vim libleveldb1v5 libleveldb-dev \
		 autoconf automake libtool pkg-config \
		 libsecp256k1-dev rabbitmq-server python3 python3-pip &&\
	pip3 install tbears &&\ 
	mkdir /other

EXPOSE 9000 

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


WORKDIR /home

RUN	git clone https://github.com/nanaones/GoodsEvent
COPY 	./run.sh	/other/
COPY	./ICON		/home/
COPY	./appendix_links.md /home/
CMD 	/other/run.sh
