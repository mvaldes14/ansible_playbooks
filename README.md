# Overview

Repo used to install and normalize some of the common tasks done in new machines.

# Playbooks
- Base: Set up for a brand new machine, creates user and defines the basic structure for project repos
- Dotfiles: No longer being used since we do mostly everything with nix
- Homelab: Sets up machines that belong to the homelab cluster

# Testing
Since this is ansible we use molecule to test the various scenarios done by the roles/playbooks.

## Important
By default molecule will not find this repo roles so make sure you export the following env variable so it works.

```bash
export ANSIBLE_ROLES_PATH="$(pwd)/roles"
molecule -s <scenario_name>
```
