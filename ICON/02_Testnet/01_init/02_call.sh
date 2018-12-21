#/bin/bash

echo "input SCORE addres : "
read SCOREaddr

echo "Method name : "
read method

echo '{
"jsonrpc":"2.0",
"method":"icx_call",
"params":{
"to":"'$SCOREaddr'",
"dataType":"call",
"data":{
"method":"'$method'"
}
},"id":1234
}' > ./call.json

RES=`tbears call ./call.json -u https://bicon.net.solidwallet.io/api/v3`

echo $RES
