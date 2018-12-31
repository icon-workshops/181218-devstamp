#/bin/bash

echo "input SCORE address :"
read SCOREaddr

echo "input hx address : "
read HX

echo "Keystore File path : "
read path

echo "Method name : "
read Method

echo '{
"jsonrpc":"2.0",
"method":"icx_sendTransaction",
"params":{
"version":"0x3",
"from":"'$HX'",
"to":"'$SCOREaddr'",
"stepLimit":"0x3000000",
"value":"0x12",
"nid":"0x3",
"dataType":"call",
"timestamp":"'$(python3 -c "import datetime;print(hex(int(datetime.datetime.now().strftime(\"%s%f\"))))")'",
"data":{
"method":"'$Method'"
}
},"id":1234
}' > ./sendtx.json

tbears sendtx ./sendtx.json -k $path -c ./02_tbears_cli_config.json
