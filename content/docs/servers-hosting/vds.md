---
title: "Max Performance VPS"
description: "Max Performance VPS (Cloud VDS): virtual dedicated servers with 6 to 24 dedicated AMD EPYC 7282 vCores, reserved RAM, NVMe storage and nested virtualization."
lead: "Virtual dedicated servers with dedicated CPU cores and reserved RAM."
date: 2026-06-25
lastmod: 2026-09-23
draft: false
weight: 20
linkTitle: "VDS"
toc: true
---
## Overview

Max Performance VPS — sold in the Customer Control Panel as VDS and previously as Cloud VDS; the plan names keep that prefix — is the top product line of the Contabo VPS family. Every instance runs on **dedicated CPU cores** allocated exclusively to it, so other tenants on the same host do not compete for CPU time, and RAM is 100% reserved. Storage is NVMe and nested virtualization is supported.

---

## Plans

| Model | Dedicated vCores | CPU Model | RAM | NVMe Storage | Mbit/s Port | Traffic |
|---|---|---|---|---|---|---|
| Cloud VDS S | 6 vCores | AMD EPYC 7282, 2.8 GHz | 24 GB | 180 GB NVMe | 250 | Unlimited* |
| Cloud VDS M | 8 vCores | AMD EPYC 7282, 2.8 GHz | 32 GB | 240 GB NVMe | 500 | Unlimited* |
| Cloud VDS L | 12 vCores | AMD EPYC 7282, 2.8 GHz | 48 GB | 360 GB NVMe | 750 | Unlimited* |
| Cloud VDS XL | 16 vCores | AMD EPYC 7282, 2.8 GHz | 64 GB | 480 GB NVMe | 1,000 | Unlimited* |
| Cloud VDS XXL | 24 vCores | AMD EPYC 7282, 2.8 GHz | 96 GB | 720 GB NVMe | 1,000 | Unlimited* |

> vCores are counted with AMD Simultaneous Multithreading (SMT) enabled: each physical core provides 2 vCores. Additional SSD storage is available beyond the base amounts listed.  
> \* No default bandwidth cap; a fair usage policy applies. Contabo notifies customers by email if usage is exceptionally high or disruptive and reserves the right to throttle affected servers.

---

## Key Features

| Feature | Details |
|---|---|
| **CPU** | AMD EPYC 7282, cores allocated exclusively to the instance; SMT enabled; AMD Core Performance Boost |
| **RAM** | 100% dedicated — no memory ballooning or sharing with other tenants |
| **Storage** | NVMe SSD on all plans; additional SSD storage via support |
| **Provisioning** | Control Panel, API, or CLI |
| **IP addresses** | 1 static IPv4 + /64 IPv6 subnet per instance; up to 15 additional IPv4 — [IP Assignment](/docs/network-services/ip-assignment/) |
| **Firewall** | Included; network-level — [Firewall](/docs/network-services/firewall/) |
| **Private Networking** | Provisioned manually via support ticket; isolated Layer 2 network between instances in the same region — [Private Networking](/docs/network-services/private-networking/) |
| **DNS and reverse DNS** | Managed in the Control Panel — [DNS Management](/docs/network-services/dns-management/) |
| **DDoS protection** | Always-on, network-level, automatic |
| **Rescue System** | Live system booted into RAM from the Control Panel (see below) |
| **Nested virtualization** | Supported — Proxmox VE, KVM, XenServer |
| **Remote management** | Control Panel VNC console |
| **Images** | OS, 1-Click and custom images — [Images](/docs/servers-hosting/images/) |
| **Windows Server** | Add-on; Contabo-provided license |

---

## Rescue System

The Rescue System, started from the Control Panel, boots a live system into RAM. Access is via SSH on port 22 as `root` with the password set at activation. Existing partitions (Linux and NTFS) can be mounted to repair the installation or retrieve data; a reboot returns to the installed OS.

---

## Upgrades & Migration

- **Upgrade:** in place via Control Panel; the IP address is kept.
- **Region migration:** live migration (data preserved) or fresh setup (data erased); both IPv4 and IPv6 addresses change.
- **Storage changes** (type or capacity): arranged via support.
- **Reinstall:** the IP address is unchanged.

---

## Management & DevOps

- **Customer Control Panel**: start/stop/restart, reinstall, VNC console, rescue system, firewall, DNS and reverse DNS
- **Contabo API** (`api.contabo.com`): RESTful; OAuth2 authentication with client ID, client secret and an API user password created in the Control Panel; no limit on the number of API users
- **CLI (`cntb`)**: open-source command-line client (github.com/contabo/cntb) using the same OAuth2 credentials
- **cloud-init**: user-data scripts at boot
- **SSH keys**: injected at deployment via Control Panel or API

---

## Availability & Locations

Deployed across **11 locations** in **9 regions**:

EU · United Kingdom · USA (3 locations) · Singapore · Japan · India · Australia

> Region selection is available at order time.

---

## Limitations & Notes

- CPU cores and RAM are exclusively reserved, but the host machine is still multi-tenant at the hardware level.
- Snapshots and the Auto Backup add-on are not available.
- Hyper-V does not run on VDS with Windows Server; other hypervisors are supported.
- IPMI is not available (Dedicated Servers only).
- No direct downgrade: requires a new smaller server, manual data migration and cancellation of the original — the IP address changes.
- No direct conversion between the VPS plan families and Max Performance VPS — same procedure as a downgrade.
- Storage changes (type or capacity) require a reinstall — all data is erased.
- Instances with an additional SSD cannot be region-migrated.
- Windows Server bring-your-own-license is not permitted on VDS.
