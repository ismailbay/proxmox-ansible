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

```bash
ansible-playbook playbooks/base.yml
```