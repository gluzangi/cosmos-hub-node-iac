Role Name - COSMOS NODE
========================

This role deploys a Cosmos Mainnet (Hub 4) Node to the docker container running as the figment user. The role only needs to start the process of syncing it does not need to preform the binary change at height 6910000. Primary role capabilities are :

- To build the required binary from source
- To init a new node
- To provide the ability to update the binary in future if required

Requirements
------------

- Go 1.16+ or later is required for the Cosmos SDK.
- Ansible 4.0+
- Python 3.6+

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Playbook Execution Examples
---------------------------

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

License
-------

BSD

Author Information - Gerald Luzangi
-----------------------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
