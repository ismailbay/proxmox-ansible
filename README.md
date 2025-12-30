# Proxmox Ansible Management

This repository manages my Proxmox VE nodes using Ansible.

## Goal
Manage Proxmox nodes with Ansible, avoiding ClickOps and learn Ansible by working on the nodes.

## Features
- SSH key–based access
- SOPS-encrypted secrets (age)
- Extensible role structure

## Requirements
- ansible
- sops
- age
- ssh key access to Proxmox nodes

## Usage

Execute the playbooks:

```bash
ansible-playbook playbooks/setup_proxmox.yml
ansible-playbook playbooks/lxc.yml
ansible-playbook playbooks/....yml
```

### Maintenance tasks:

Wake up machines:

```bash
ansible-playbook playbooks/maintenance.yml --tags power -e power_on=true
```

Take a backup:

```bash
ansible-playbook playbooks/maintenance.yml --tags backup
```

Upgrade packages and dist:

```bash
ansible-playbook playbooks/maintenance.yml --tags upgrade_system -e upgrade_system=true
```

Or shut down:

```bash
ansible-playbook playbooks/maintenance.yml --tags power -e power_off=true
```
