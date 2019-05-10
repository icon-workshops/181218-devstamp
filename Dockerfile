FROM	iconloop/tbears:1.1.0.1

RUN	apt update &&\
    	apt -y -qq install tree vim &&\
			mkdir /other &&\
			mkdir /home/Devstamp

EXPOSE 9000 

WORKDIR /tbears

COPY 	./run.sh	/other/

COPY	./ICON		/home/Devstamp/
COPY	./appendix_links.md /home/Devstamp/
RUN		["git", "clone", "https://github.com/nanaones/GoodsEvent", "/home/Devstamp/GoodsEvent" ]
RUN		["git", "clone", "https://github.com/icon-workshops/Dive-into-ICON-1-Tools", "/home/DiveintoICON1Tools" ]
RUN		["git", "clone", "https://github.com/icon-workshops/Dive-into-ICON-2-SCORE", "/home/DiveintoICON2SCORE" ]
RUN		["git", "clone", "https://github.com/icon-workshops/Dive-into-ICON-3-DApp", "/home/DiveintoICON3DApp" ]

CMD 	./other/run.sh