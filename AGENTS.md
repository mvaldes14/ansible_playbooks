# Agent Instructions for ansible_playbooks

This document provides instructions for AI agents working on this Ansible repository.

## Build, Lint, and Test

- **Linting:** Run `ansible-lint` from the root of the repository. This is also enforced by a GitHub Action.
- **Testing:** This project uses `molecule` for testing roles. To run all tests for a role, navigate to the role's directory (e.g., `roles/base`) and run `molecule test`. There is no configured way to run a single test.

## Code Style

- **General:** Follow standard Ansible best practices.
- **Formatting:** Adhere to the formatting of existing YAML files. Use 2-space indentation.
- **Naming:** Variables should be descriptive. The `var-naming` linting rule is currently disabled, but strive for clear and consistent naming.
- **Imports:** Use fully qualified collection names for modules (e.g., `ansible.builtin.user`).
- **Error Handling:** No specific error handling patterns were found.
- **Secrets:** Do not commit any secrets to the repository.

## Project Structure

- Roles are located in the `roles/` directory.
- Playbooks are in the `playbooks/` directory.
- Inventory is managed in the `inventory` file and `playbooks/host_vars`.
