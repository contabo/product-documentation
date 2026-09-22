---
title: "Images"
description: "Operating system, 1-Click app, blockchain and custom images available for Contabo VPS, VDS and Dedicated Servers, with availability per product."
lead: "Operating systems, 1-Click apps, blockchain images and custom images per product."
date: 2026-09-22
lastmod: 2026-09-22
draft: false
weight: 30
toc: true
---

## Overview

Servers are deployed from an image selected at order time or on reinstall. Four kinds are available: operating system images, 1-Click app images (an OS with an application preinstalled), blockchain node images, and customer-provided custom images. Availability depends on the product.

---

## Operating System Images

| Product | Linux / BSD | Windows Server |
|---|---|---|
| VPS — Core VPS, Performance VPS | Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS, openSUSE, FreeBSD | 2016, 2019, 2022, 2025 (Core VPS); Contabo license |
| VPS — Storage VPS | Ubuntu, Debian, AlmaLinux, Rocky Linux, Fedora, FreeBSD | Contabo license |
| VDS (Max Performance VPS) | Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS, openSUSE, FreeBSD | Contabo license |
| Dedicated Servers | Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS | Contabo license or bring-your-own-license |

Windows Server uses the license provided by Contabo on VPS and VDS; bring-your-own-license is permitted on Dedicated Servers. Reinstalling from the Control Panel keeps the server's IP address.

---

## 1-Click App Images

An OS image with an application preinstalled and configured at first boot.

| Product | 1-Click images |
|---|---|
| Core VPS | OpenClaw · n8n · Nextcloud · WireGuard · GitLab CE |
| Performance VPS | OpenClaw · n8n · Nextcloud · WireGuard · GitLab CE · cPanel · Plesk |
| Storage VPS | Webmin · Docker · LAMP · cPanel · Plesk |
| VDS (Max Performance VPS) | OpenClaw · n8n · Nextcloud · WireGuard · GitLab CE |
| Dedicated Servers | Proxmox · Docker · Plesk · cPanel |

Further 1-Click images documented on the help desk for VPS and VDS include Ollama, Dokploy, ZeroClaw, Hermes Agent and Paperclip AI; the current selection is shown in the Control Panel and the order configurator.

---

## Blockchain Images

Node images for **Bitcoin**, **Ethereum**, **IPFS** and **Horizen** are available for VPS and VDS (Horizen also for Storage VPS).

---

## Custom Images

| Aspect | Details |
|---|---|
| **Products** | VPS and VDS (add-on selected at order time; enabled on existing servers via support) |
| **Formats** | ISO (bootable installer) or QCOW2 (pre-installed disk image, uncompressed). The image type is validated, not just the file extension |
| **Architecture** | x86-64 (amd64) only |
| **Drivers** | VirtIO storage (`virtio_scsi`) and network (`virtio_net`) drivers required |
| **Source** | Customer-provided image files |
| **Dedicated Servers** | Custom ISOs can be booted via KVM-over-IP |

---

## Limitations & Notes

- Windows Server bring-your-own-license is not permitted on VPS and VDS.
- Custom Windows images are not permitted (Microsoft licensing); support cannot assist with servers running one.
- Custom images without VirtIO drivers do not boot.
- Reinstalling erases all data on the disk; changing storage type (SSD ↔ NVMe) or plan family always requires a reinstall.
- Cryptocurrency mining is not permitted on VPS.
