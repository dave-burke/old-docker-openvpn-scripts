# OpenVPN boostrap scripts

This is a set of scripts to streamline the setup and maintenance of the `kylemanna/openvpn` docker image. TL;DR Just run `bootstrap.sh` and follow the prompts. Then, use the generated config file to connect from a client.

You need to have a `config.sh` file to set some global values. If you run `bootstrap.sh` then this will be created for you if it doesn't exist. If you want to do it by hand, you can run

	cp -n config.example config.sh

and then edit `config.sh` to your liking. The only value you *need* to fill in is the `DOMAIN` name of your server.

## Legend

- **01-create-data-volume.sh** Creates a data volume to hold your persistent config and PKI.
- **02-gen-config.sh** Generates a base OpenVPN config file in your data container.
- **03-init-pki.sh** Initializes a certificate store (you will be prompted for a master password).
- **04-run-udp1194.sh** Starts a container running on UDP/1194 (the default OpenVPN port).
- **04-run-tcp443.sh** Starts a container running on TCP/443 (less efficient protocol--only use when UDP/1194 is blocked).
- **05-gen-client.sh** Generates a config with embedded certificate using the first argument as a name.
- **06-get-client.sh** Get a previously generated client config by name (first argument).
- **06-list-clients.sh** List all existing clients.
- **bootstrap.sh** Sets up config.sh (if not present) and runs all the scripts in order prompting for any necessary values.
- **config.example** A template for `config.sh`.
- **util.sh** Some common functions.

