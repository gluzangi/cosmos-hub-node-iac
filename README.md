### COSMOS NODE IaC
--------------------

This role deploys a Cosmos Mainnet (Hub 4) Node to the docker container running as the figment user. The role only needs to start the process of syncing it does not need to preform the binary change at height 6910000. Primary role capabilities are :

- To build the required binary from source
- To init a new node
- To provide the ability to update the binary in future if required

#### Requirements
-----------------

- Go 1.16+ or later is an essential requirement for the cosmos-SDK.
- Ansible 4.0+
- Python 3.6+
- Docker 20.10+
- docker-compose 1.28+

#### Launch Dockerized DEV-ENV
------------------------------

```bash
#
# start docker-compose :- 
# 
# - will start up a container running SYSTEMD
# - current directory is bind mounted into "/tmp/ansible"
#
docker-compose up -d

#
# exec into the docker container
#
docker-compose exec ops-challenge /bin/bash

#
# run ansible using
#
./bin/provision

#
# To stop the container and get a fresh container just run
#
# docker-compose down -t 0
#
# docker-compose up --force-recreate -d
```

#### Role Variables
-------------------

The settable variables for this role should go into vars/main.yml, and any variables that can/should be set via parameters to the role. Minimum requirements to launch a node with Service-Account-User running a particular cosmos-SDK version can be set as follows :-

- `sa_user: "figment"`
- `sa_user_home: "/home/figment"`
- `cosmos_sdk_ver: "v6.0.0"`
- `block_height: "9672930"`
- `block_hash: "0BA9E883DCED83A35CF7913448C65367D3151BD1CF281D0155312F057881A68B"`
- `minimum_gas_prices: "0.0025uatom"`

#### Playbook Execution Examples
--------------------------------

- Here are examples on how to run/use this playbook:

```bash
#
# check for cosmos-sdk installation
#
./bin/provision -t check

#
# run cosmos-sdk installation
#
./bin/provision -t install

#
# setup cosmos-sdk runtime environment
#
./bin/provision -t setup

#
# initialize cosmos-sdk node
#
./bin/provision -t init

#
# launch cosmos-sdk node
#
./bin/provision -t launch

#
# update cosmos-sdk node configuration
#
./bin/provision -t update

#
# monitor cosmos-sdk node/scrape prometheus
#
./bin/provision -t monitor

#
# NOTE :
#
# - check the health/state of the running cosmos-hub node daemon :
#    journalctl -u gaiad.service -n 50 -f
#
# - grab container's IPAddress with :
#    docker container inspect cosmos-node | jq .[].NetworkSettings.Networks | grep -i ipaddress
#
# - prometheus listens to port 26660 eg:
#    http://192.168.192.2:26660/
#
```

#### Author
-----------

- Gerald Luzangi