#/bin/bash

service rabbitmq-server start &&\
mkdir -p /other/tbears &&\
cd /other/tbears &&\
tbears genconf &&\
tbears start &&\
cd /home &&\
exec /bin/bash
