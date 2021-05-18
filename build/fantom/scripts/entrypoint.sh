#!/bin/sh

# exit script on any error
set -e

# Set Bor Home Directory
FANTOM_HOME=/datadir

if [ ! -f "$FANTOM_HOME/mainnet.g" ];
then
    cd $FANTOM_HOME
    echo "downloading launch genesis file"
    wget https://opera.fantom.network/mainnet.g
fi

opera \
    --genesis=/datadir/mainnet.g
    --port=30303 \
    --maxpeers=200 \
    --datadir=/datadir \
    --http \
    --http.addr=0.0.0.0 \
    --http.port=8545 \
    --http.api=ftm,eth,debug,admin,web3,personal,net,txpool,sfc \
    --http.corsdomain="*" \
    --http.vhosts="*" \
    --ws \
    --ws.addr=0.0.0.0 \
    --ws.port=8546 \
    --ws.api=ftm,eth,debug,admin,web3,personal,net,txpool,sfc \
    --ws.origins="*" \
    --nousb
