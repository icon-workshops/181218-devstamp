#/bin/bash

echo "Keystore File path : "
read path

tbears deploy -u https://bicon.net.solidwallet.io/api/v3 -k $path ./project -c ./02_tbears_cli_config.json
