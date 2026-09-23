---
title: "VPS"
description: "Contabo VPS: KVM virtual private servers in three plan families — Core VPS (SSD), Performance VPS (NVMe, AMD EPYC) and Storage VPS (high-capacity SSD)."
lead: "KVM-based virtual private servers in three plan families: Core VPS, Performance VPS and Storage VPS."
date: 2026-06-25
lastmod: 2026-09-23
draft: false
weight: 10
toc: true
---
## Overview

Contabo VPS are KVM-based virtual servers with shared vCPU cores and a fixed RAM allocation, sold in three plan families — **[Core VPS](#core-vps)**, **[Performance VPS](#performance-vps)** and **[Storage VPS](#storage-vps)** — that run on the same platform and share every feature from [Key Features](#key-features) onward. The families differ in CPU generation, storage type and capacity, port speed, snapshots and backup options. For dedicated cores see Max Performance VPS (VDS), for bare metal see Dedicated Servers.

---

## Products at a Glance

| | Core VPS | Performance VPS | Storage VPS |
|---|---|---|---|
| **Plans** | Cloud VPS 4 – 18 | Cloud VPS Plus 4 – 18 | Storage VPS 10 – 50 |
| **CPU** | Shared vCPUs, multiple CPU generations | Shared vCPUs, latest AMD EPYC generations | Shared vCPUs |
| **vCPU / RAM** | 4 – 18 vCPUs / 8 – 96 GB | 4 – 18 vCPUs / 8 – 96 GB | 2 – 14 vCPUs / 4 – 50 GB |
| **Storage** | 100 – 600 GB SSD | 150 – 900 GB PCIe Gen 4 NVMe | 300 GB – 1.4 TB SSD |
| **Mbit/s Port** | 200 – 1,000 | 500 – 1,000 | 200 – 1,000 |
| **Snapshots** | 1 – 3, per plan (see table) | 5 | — |
| **Auto Backup add-on** | Available | Available | — |
| **Storage Extension add-on** | Available | Available | — |

Operating systems, 1-Click apps and custom images per family: see [Images](/docs/servers-hosting/images/).

---

## Core VPS {#core-vps}

Core VPS is the entry plan family: shared vCPU cores on infrastructure spanning multiple CPU generations, with SSD storage.

| Model | vCPU Cores | RAM | SSD Storage | Mbit/s Port | Snapshots | Traffic |
|---|---|---|---|---|---|---|
| Cloud VPS 4 | 4 vCPUs | 8 GB | 100 GB SSD | 200 | 1 | Unlimited* |
| Cloud VPS 6 | 6 vCPUs | 12 GB | 200 GB SSD | 300 | 2 | Unlimited* |
| Cloud VPS 8 | 8 vCPUs | 24 GB | 300 GB SSD | 600 | 3 | Unlimited* |
| Cloud VPS 12 | 12 vCPUs | 48 GB | 400 GB SSD | 800 | 3 | Unlimited* |
| Cloud VPS 16 | 16 vCPUs | 64 GB | 500 GB SSD | 1,000 | 3 | Unlimited* |
| Cloud VPS 18 | 18 vCPUs | 96 GB | 600 GB SSD | 1,000 | 3 | Unlimited* |

---

## Performance VPS {#performance-vps}

Performance VPS is the upper plan family: shared vCPU cores on the latest AMD EPYC generations with PCIe Gen 4 NVMe storage and higher port speeds on the smaller plans. Resources remain shared at the hypervisor level; GPU VPS is built on the Cloud VPS Plus 18 tier.

| Model | vCPU Cores | RAM | NVMe Storage | Mbit/s Port | Traffic |
|---|---|---|---|---|---|
| Cloud VPS Plus 4 | 4 vCPUs (AMD EPYC) | 8 GB | 150 GB NVMe | 500 | Unlimited* |
| Cloud VPS Plus 6 | 6 vCPUs (AMD EPYC) | 12 GB | 300 GB NVMe | 500 | Unlimited* |
| Cloud VPS Plus 8 | 8 vCPUs (AMD EPYC) | 24 GB | 450 GB NVMe | 1,000 | Unlimited* |
| Cloud VPS Plus 12 | 12 vCPUs (AMD EPYC) | 48 GB | 600 GB NVMe | 1,000 | Unlimited* |
| Cloud VPS Plus 16 | 16 vCPUs (AMD EPYC) | 64 GB | 750 GB NVMe | 1,000 | Unlimited* |
| Cloud VPS Plus 18 | 18 vCPUs (AMD EPYC) | 96 GB | 900 GB NVMe | 1,000 | Unlimited* |

---

## Storage VPS {#storage-vps}

Storage VPS is the storage-heavy plan family: shared vCPU cores and a large SSD block device inside a full virtual machine with root access, sized for capacity rather than peak I/O throughput. Unlike Object Storage, which is accessed via the S3 API, Storage VPS provides a complete Linux or Windows environment.

| Model | vCPU Cores | RAM | SSD Storage | Mbit/s Port | Traffic |
|---|---|---|---|---|---|
| Storage VPS 10 | 2 vCPUs | 4 GB | 300 GB SSD | 200 | Unlimited* |
| Storage VPS 20 | 3 vCPUs | 8 GB | 400 GB SSD | 300 | Unlimited* |
| Storage VPS 30 | 6 vCPUs | 18 GB | 1 TB SSD | 600 | Unlimited* |
| Storage VPS 40 | 8 vCPUs | 30 GB | 1.2 TB SSD | 800 | Unlimited* |
| Storage VPS 50 | 14 vCPUs | 50 GB | 1.4 TB SSD | 1,000 | Unlimited* |

> \* No default bandwidth cap; a fair usage policy applies. Contabo notifies customers by email if usage is exceptionally high or disruptive and reserves the right to throttle affected servers.

---

## Key Features

| Feature | Details |
|---|---|
| **Provisioning** | Control Panel, API, or CLI |
| **IP addresses** | 1 static IPv4 + /64 IPv6 subnet per instance; maximum 1 additional IPv4 — [IP Assignment](/docs/network-services/ip-assignment/) |
| **Firewall** | Included; network-level — [Firewall](/docs/network-services/firewall/) |
| **Private Networking** | Add-on; isolated Layer 2 network between instances in the same region — [Private Networking](/docs/network-services/private-networking/) |
| **DNS and reverse DNS** | Managed in the Control Panel — [DNS Management](/docs/network-services/dns-management/) |
| **DDoS protection** | Always-on, network-level, automatic |
| **Snapshots** | Image of the VPS disk, retained for 30 days; slots per family as in Products at a Glance |
| **Auto Backup** | Add-on for Core VPS and Performance VPS — [VPS Auto Backup](/docs/servers-hosting/vps-auto-backup/) |
| **Rescue System** | Live system booted into RAM from the Control Panel (see below) |
| **Storage Extension** | Add-on for Core VPS and Performance VPS; additional storage of the plan's type |
| **Images** | OS, 1-Click and custom images — [Images](/docs/servers-hosting/images/) |
| **Windows Server** | Add-on; Contabo-provided license |

---

## Rescue System

The Rescue System, started from the Control Panel, boots a live system into RAM. Access is via SSH on port 22 as `root` with the password set at activation. Existing partitions (Linux and NTFS) can be mounted to repair the installation or retrieve data; a reboot returns to the installed OS.

---

## Upgrades & Migration

- **Upgrade:** in place via Control Panel to a larger plan within the same plan family; the IP address is kept.
- **Region migration:** live migration (data preserved) or fresh setup (data erased); both IPv4 and IPv6 addresses change.
- **Storage Extension:** adds storage of the plan's type (Core VPS and Performance VPS only).
- **Reinstall:** the IP address is unchanged.

---

## Management & DevOps

- **Customer Control Panel**: start/stop/restart, reinstall, snapshots, VNC console, rescue system, firewall, private networking, storage extension, DNS and reverse DNS
- **Contabo API** (`api.contabo.com`): RESTful; OAuth2 authentication with client ID, client secret and an API user password created in the Control Panel; no limit on the number of API users
- **CLI (`cntb`)**: open-source command-line client (github.com/contabo/cntb) using the same OAuth2 credentials
- **cloud-init**: user-data scripts at boot
- **SSH keys**: injected at deployment via Control Panel or API

---

## Availability & Locations

Deployed across **11 locations** in **9 regions**:

EU · United Kingdom · USA (3 locations) · Singapore · Japan · India · Australia

> Region selection is available at order time. The Customer Control Panel displays expected latency per location.

---

## Limitations & Notes

- Nested virtualization is not supported on any VPS plan family.
- CPU and RAM are dedicated allocations but shared at the hypervisor level.
- Storage VPS: no snapshots, no Auto Backup add-on and no Storage Extension.
- No direct downgrade: requires a new smaller server, manual data migration and cancellation of the original — the IP address changes.
- No direct conversion between Core VPS, Performance VPS and Storage VPS, nor to Max Performance VPS — same procedure as a downgrade.
- Moving from SSD to NVMe means moving from Core VPS or Storage VPS to Performance VPS and requires a reinstall — all data is erased.
- Instances with an additional SSD cannot be region-migrated.
- Windows Server bring-your-own-license is not permitted on VPS.
- Cryptocurrency mining is not permitted on VPS.
- Provisioning time is typically a few minutes; may vary by location.
