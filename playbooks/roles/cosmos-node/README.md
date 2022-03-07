### COSMOS NODE ROLE
--------------------

This role deploys a Cosmos Mainnet (Hub 4) Node to the docker container running as the figment user. The role only needs to start the process of syncing it does not need to preform the binary change at height 6910000. Primary role capabilities are :

- To build the required binary from source
- To init a new node
- To provide the ability to update the binary in future if required

#### Requirements
-----------------

- Go 1.16+ or later is required for the Cosmos SDK.
- Ansible 4.0+
- Python 3.6+

#### Role Variables
-------------------

The settable variables for this role should go into vars/main.yml, and any variables that can/should be set via parameters to the role. At the minimum Service-Account-User and $HOME
with a corresponding cosmos-SDK version can set as following:-

- sa_user: "figment"
- sa_user_home: "/home/figment"
- cosmos_sdk_ver: "v6.0.0"

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
./bin/provision -t bootstrap

#
# sync cosmos-sdk node
#
./bin/provision -t sync
```

#### Author
-----------

- Gerald Luzangi