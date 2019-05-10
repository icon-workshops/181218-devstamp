#!/bin/bash

service rabbitmq-server start &&\
cd /tbears &&\
tbears genconf &&\
tbears start &&\

exec /bin/bash