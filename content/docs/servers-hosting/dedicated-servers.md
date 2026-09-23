---
title: "Dedicated Servers"
description: "Dedicated Servers: single-tenant bare-metal servers with AMD Ryzen 9, AMD EPYC Genoa, or AMD EPYC Turin CPUs, ECC RAM, NVMe/SSD/HDD storage, and IPMI access."
lead: "Single-tenant bare-metal servers with full hardware access and IPMI remote management."
date: 2026-06-25
lastmod: 2026-09-23
draft: false
weight: 40
toc: true
---
## Overview

Dedicated Servers — also referred to as Bare Metal — are single-tenant physical machines where every resource (CPU, RAM, storage, and network) belongs exclusively to one customer. There are no shared hypervisors, no neighboring tenants, and no resource contention. You either run the OS directly on the hardware or install your own hypervisor to create your own virtualized environment.

The lineup includes AMD Ryzen 9 (consumer-grade), AMD EPYC Genoa, and AMD EPYC Turin (9th gen) processors. Servers from older hardware generations with fixed configurations are sold as **Server Deals** (contabo.com/en/server-outlet/), subject to availability.

---

## Plans

| Server | CPU | Cores / Freq. | Base RAM | Max RAM | Base Storage | Port | Traffic |
|---|---|---|---|---|---|---|---|
| AMD Ryzen 12 Cores | AMD Ryzen 9 7900 | 12 × 3.70 GHz | 64 GB | 128 GB | 1 TB NVMe | 1 Gbit/s | Unlimited* |
| AMD Genoa 24 Cores | AMD EPYC 9224 | 24 × 2.50 GHz (3.70 max) | 128 GB REG ECC | 768 GB | 2 × 1 TB SSD | 1 Gbit/s | Unlimited* |
| AMD Turin 32 Cores | AMD EPYC 9355P | 32 × 3.55 GHz (4.20 max) | 128 GB | 768 GB | 2 × 1 TB NVMe | 1 Gbit/s (10 Gbit/s available) | Unlimited* |
| AMD Turin 64 Cores | AMD EPYC 9555P | 64 × 3.20 GHz (4.20 max) | 192 GB | 1,152 GB | 2 × 1 TB NVMe | 1 Gbit/s (10 Gbit/s available) | Unlimited* |

> Additional RAM, storage and GPU configurations are available for all models.  
> \* No default bandwidth cap; a fair usage policy applies.

---

## Key Features

| Feature | Details |
|---|---|
| **Resource isolation** | 100% single-tenant — CPU, RAM, storage, and network exclusively yours |
| **CPU** | AMD Ryzen 9 (consumer), AMD EPYC Genoa, or AMD EPYC Turin |
| **RAM** | ECC memory on EPYC platforms; up to 1,152 GB on the 64-core Turin |
| **Storage** | HDD, SSD or NVMe, configurable; hardware and software RAID available |
| **Network port** | 1 Gbit/s standard; 10 Gbit/s available on Turin-generation servers |
| **Provisioning** | Standard configurations within 90 minutes of payment confirmation |
| **GPU add-on** | NVIDIA GeForce GT 1030 or NVIDIA Tesla A2; CUDA supported |
| **Nested virtualization** | Full hypervisor support — Proxmox VE, KVM, XenServer, VMware, Hyper-V |
| **Remote management** | IPMI: out-of-band console, independent of the installed OS |
| **IP addresses** | 1 static IPv4 + /64 IPv6 subnet per server; up to 25 additional IPv4 — [IP Assignment](/docs/network-services/ip-assignment/) |
| **DNS and reverse DNS** | Managed in the Control Panel — [DNS Management](/docs/network-services/dns-management/) |
| **DDoS protection** | Always-on, network-level, automatic |
| **Rescue System** | Live system booted into RAM from the Control Panel (see below) |
| **Images** | OS images and custom ISOs — [Images](/docs/servers-hosting/images/) |
| **Windows Server** | Bring-your-own-license permitted; Contabo-provided licenses also available |

---

## Rescue System

The Rescue System, started from the Control Panel, boots a live system into RAM. Access is via SSH on port 22 as `root` with the password set at activation. Existing partitions (Linux and NTFS) can be mounted to repair the installation or retrieve data.

---

## Upgrades

- **Hardware changes** (CPU, RAM, storage, GPU): arranged via support and carried out by Contabo engineers.

---

## Availability & Locations

Deployed across **11 locations** in **9 regions**:

EU · United Kingdom · USA (3 locations) · Singapore · Japan · India · Australia

---

## Limitations & Notes

- The 90-minute provisioning applies to standard configurations only, up to 5 servers per order, with automated payment and no order notes; custom configurations (non-standard RAM, storage, GPU) take longer.
- Hardware changes may require downtime and a hardware swap; a storage type change (e.g. SSD → NVMe) requires a reinstall — all data is erased.
- Region migration is not available — Dedicated Servers cannot be moved to another location.
- Snapshots and the Auto Backup add-on are not available.
- Dedicated Servers are managed in the Control Panel only; the Contabo API and CLI do not cover them.
- The Control Panel Firewall add-on is not offered — use the OS firewall. A Dedicated Private Network is available on request.
- Bandwidth upgrade packages are not offered.
- GPU add-ons are subject to availability per configuration and location.
