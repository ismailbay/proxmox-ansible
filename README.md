# Proxmox Ansible Management

This repository manages my Proxmox VE nodes using Ansible.

## Features
- SSH key–based access
- SOPS-encrypted secrets (age)
- Cluster-safe base configuration
- Extensible role structure

## Requirements
- ansible
- sops
- age
- ssh access to Proxmox nodes

## Usage

```bash
ansible-playbook playbooks/base.yml
```