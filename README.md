# Ansible Playbooks for Personal Machine Setup

## Overview

This repository contains a collection of Ansible playbooks and roles to automate the setup and configuration of personal machines. It helps normalize common tasks for setting up new workstations, development environments, and a homelab cluster.

## Structure

-   `playbooks/`: Contains the main playbooks that orchestrate the roles.
-   `roles/`: Contains the individual roles responsible for configuring specific applications or settings (e.g., `base`, `homelab`, `asdf`).
-   `inventory`: Defines the hosts and groups that Ansible will manage.
-   `ansible.cfg`: Configuration file for Ansible, setting default behaviors.

## Available Roles

-   **base**: Performs initial server setup, creating users and basic directory structures.
-   **homelab**: Configures machines that are part of the homelab cluster.
-   **asdf**: Installs and configures the `asdf` version manager.
-   **i3**: Sets up the i3 window manager configuration.
-   **shell**: Configures shell environments (Zsh, Bash, etc.).
-   **windows**: Contains tasks for configuring Windows machines.

## Usage

To run a playbook, use the `ansible-playbook` command, specifying an inventory and the playbook file.

For example, to run the `demo.yaml` playbook on the `pi` host:

```bash
ansible-playbook -i inventory playbooks/demo.yaml --limit pi
```

## Testing

This project uses `Molecule` to test roles in isolated environments. To run the tests for a specific role:

1.  Navigate to the role's directory.
2.  Run `molecule test`.

For example, to test the `base` role:

```bash
# Navigate to the role directory
cd roles/base

# Run the default test scenario
molecule test
```

**Important:** Molecule may not automatically discover the roles path from the repository root. If you encounter issues, you may need to set the `ANSIBLE_ROLES_PATH` environment variable:

```bash
export ANSIBLE_ROLES_PATH="$(pwd)/roles"
```