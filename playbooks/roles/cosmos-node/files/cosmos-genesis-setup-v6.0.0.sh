#!/usr/bin/env bash

BLOCK_HEIGHT='9672930'
BLOCK_HASH='0BA9E883DCED83A35CF7913448C65367D3151BD1CF281D0155312F057881A68B'

#
# prepare genesis file for cosmoshub-4
#
wget -c https://github.com/cosmos/mainnet/raw/master/genesis.cosmoshub-4.json.gz --directory-prefix=/tmp/
gzip -d /tmp/genesis.cosmoshub-4.json.gz
mv /tmp/genesis.cosmoshub-4.json /root/.gaia/config/genesis.json
rm -rf /tmp/genesis.cosmoshub-4.json.gz

#
# set minimum gas price & peers
#
sed -i'' 's/minimum-gas-prices = ""/minimum-gas-prices = "0.0025uatom"/' /root/.gaia/config/app.toml
sed -i'' 's/persistent_peers = ""/persistent_peers = "6e08b23315a9f0e1b23c7ed847934f7d6f848c8b@165.232.156.86:26656,ee27245d88c632a556cf72cc7f3587380c09b469@45.79.249.253:26656,538ebe0086f0f5e9ca922dae0462cc87e22f0a50@34.122.34.67:26656,d3209b9f88eec64f10555a11ecbf797bb0fa29f4@34.125.169.233:26656,bdc2c3d410ca7731411b7e46a252012323fbbf37@34.83.209.166:26656,585794737e6b318957088e645e17c0669f3b11fc@54.160.123.34:26656,5b4ed476e01c49b23851258d867cc0cfc0c10e58@206.189.4.227:26656"/' /root/.gaia/config/config.toml

#
# configure State Sync
#
cd /root/.gaia/config
sed -i'' 's/enable = false/enable = true/' /root/.gaia/config/config.toml
sed -i'' 's/trust_height = 0/trust_height = $BLOCK_HEIGHT/' /root/.gaia/config/config.toml
sed -i'' 's/trust_hash = ""/trust_hash = "$BLOCK_HASH"/' /root/.gaia/config/config.toml
sed -i'' 's/rpc_servers = ""/rpc_servers = "https:\/\/rpc.cosmos.network:443,https:\/\/rpc.cosmos.network:443"/' /root/.gaia/config/config.toml

# start gaia-daemon
gaiad start --x-crisis-skip-assert-invariants

#
# notify cosmos-sdk version
#
echo "cosmos-sdk-ver-6"
