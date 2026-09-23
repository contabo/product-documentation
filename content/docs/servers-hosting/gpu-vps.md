---
title: "GPU VPS"
description: "GPU VPS: Performance VPS with a dedicated NVIDIA RTX 6000 PRO Blackwell GPU (96 GB VRAM) via PCIe passthrough — 18 vCPU, 96 GB RAM, 900 GB NVMe, Ubuntu CUDA."
lead: "Performance VPS with a dedicated NVIDIA RTX 6000 PRO GPU attached via PCIe passthrough."
date: 2026-09-21
lastmod: 2026-09-23
draft: false
weight: 15
toc: true
---
## Overview

GPU VPS is a Performance VPS instance with a physically dedicated NVIDIA GPU attached via PCIe passthrough: the guest OS has direct access to the whole device, one GPU per instance.

GPU VPS is offered in a single configuration, built on the Performance VPS 18 tier (Cloud VPS Plus 18) with an NVIDIA RTX 6000 PRO Blackwell Server Edition. Network, IP addressing and add-on behaviour follow Performance VPS unless stated otherwise on this page.

---

## Plans

| Model | GPU | GPU Memory | vCPU Cores | RAM | NVMe Storage | Traffic |
|---|---|---|---|---|---|---|
| GPU VPS | 1 × NVIDIA RTX 6000 PRO (Blackwell Server Edition) | 96 GB | 18 vCPUs (AMD EPYC) | 96 GB | 900 GB NVMe | Unlimited* |

> \* No default bandwidth cap; a fair usage policy applies. Contabo notifies customers by email if usage is exceptionally high or disruptive and reserves the right to throttle affected servers.

---

## GPU Specifications

| Specification | NVIDIA RTX 6000 PRO Blackwell Server Edition |
|---|---|
| **Architecture** | NVIDIA Blackwell |
| **GPU memory** | 96 GB |
| **CUDA cores** | 24,064 |
| **FP32 performance** | ~120 TFLOPS |
| **Precision support** | Includes FP4 (Blackwell), enabling lower-precision quantised models |
| **Model capacity** | A 70B-parameter LLM at FP8 fits in GPU memory |
| **ISV certification** | Certified for professional 3D applications including Maya, Houdini and Cinema 4D |
| **Toolkit** | CUDA; NVIDIA driver and CUDA toolkit preinstalled in the OS image |

---

## Key Features

| Feature | Details |
|---|---|
| **Operating system** | Ubuntu 24.04 LTS CUDA image (NVIDIA driver and CUDA toolkit preinstalled) — [Images](/docs/servers-hosting/images/) |
| **Provisioning** | Ordering via the One-Click Configurator only; existing instances are managed in the Control Panel, API and CLI like other VPS |
| **Add-ons (Control Panel)** | Storage Extension, Backup Space, Private Networking, Additional IPv4, Object Storage, Monitoring |
| **IP addresses** | 1 static IPv4 + /64 IPv6 subnet; maximum 1 additional IPv4 — [IP Assignment](/docs/network-services/ip-assignment/) |
| **Firewall** | Included; network-level — [Firewall](/docs/network-services/firewall/) |
| **Private Networking** | Add-on — [Private Networking](/docs/network-services/private-networking/) |
| **DNS and reverse DNS** | Managed in the Control Panel — [DNS Management](/docs/network-services/dns-management/) |
| **DDoS protection** | Always-on, network-level, automatic |
| **Snapshots** | 5 per instance, as Performance VPS |
| **Rescue System** | Live system booted into RAM from the Control Panel |
| **Root access** | Full root access to the instance and the passed-through GPU |
| **Storage Extension** | Add-on; additional NVMe storage |
| **Reinstall** | Reinstalls the Ubuntu 24.04 LTS CUDA image; the IP address is unchanged |


---

## Management & DevOps

- **Customer Control Panel**: start/stop/restart, reinstall, snapshots, VNC console, rescue system, firewall, private networking, add-ons, DNS and reverse DNS
- **Contabo API** (`api.contabo.com`) and **CLI (`cntb`)**: management of existing instances with the standard OAuth2 credentials
- **GPU access in the OS**: `nvidia-smi` shows the passed-through device; container workloads can use the NVIDIA Container Toolkit with Docker
- **SSH keys**: injected at deployment

---

## Availability & Locations

Available in **2 locations**: EU · US Central.

---

## Limitations & Notes

- Single fixed configuration: CPU, RAM, storage and GPU cannot be changed, and there is no upgrade or downgrade path.
- One GPU per instance; multi-GPU configurations, GPU clustering and multi-node interconnects are not supported. The GPU cannot be sliced or shared (no vGPU).
- Ubuntu 24.04 LTS CUDA is the only operating system offered; Windows Server, other distributions and custom images are not available.
- Provisioning is via the One-Click Configurator only; not available via the Contabo API or CLI.
- The Auto Backup add-on is not available — use Backup Space or Object Storage. Plesk and cPanel are not available.
- Region migration is not available. Live migration between hosts is not supported: if Contabo must move an instance (e.g. hardware maintenance), it is shut down for the duration and moved only to a host with an identical, unallocated GPU model.
- Capacity is limited to two locations (EU, US Central); the One-Click Configurator shows current availability.
