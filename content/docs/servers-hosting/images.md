---
title: "Images"
description: "Operating system, 1-Click app, blockchain and custom images available for Contabo VPS, VDS and Dedicated Servers, with availability per product."
lead: "Operating systems, 1-Click apps, blockchain images and custom images per product."
date: 2026-09-22
lastmod: 2026-09-23
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
| VPS — Core VPS, Performance VPS | Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS, openSUSE, FreeBSD | 2016, 2019, 2022, 2025; Contabo license (add-on) |
| VPS — Storage VPS | Ubuntu, Debian, AlmaLinux, Rocky Linux, Fedora, FreeBSD | 2016, 2019, 2022, 2025; Contabo license (add-on) |
| VDS (Max Performance VPS) | Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS, openSUSE, FreeBSD | 2016, 2019, 2022, 2025; Contabo license (add-on) |
| Dedicated Servers | Ubuntu, Debian, AlmaLinux, Rocky Linux, CentOS | Contabo license or bring-your-own-license |

Windows Server is an add-on with a Contabo-provided license on all VPS families and VDS, with the same versions on each; bring-your-own-license is permitted on Dedicated Servers. Reinstalling from the Control Panel keeps the server's IP address.

---

## 1-Click App Images

An OS image with an application preinstalled and configured at first boot.

| Product | 1-Click images |
|---|---|
| VPS and VDS (Max Performance VPS) | OpenClaw · n8n · Nextcloud · WireGuard · GitLab CE · cPanel · Plesk · Dokploy · Paperclip AI · Hermes Agent · Ollama |

1-Click apps are selected in the order configurator or installed on an existing server via reinstall; the current selection is shown there.

---

## Blockchain Images

Node images for **Bitcoin**, **Ethereum**, **IPFS** and **Horizen** are available for VPS and VDS (Horizen also for Storage VPS).

---

## Custom Images

| Aspect | Details |
|---|---|
| **Products** | VPS and VDS; the Custom Image Storage add-on can be ordered at any time |
| **Formats** | ISO (bootable installer) or QCOW2 (pre-installed disk image, uncompressed). The image type is validated, not just the file extension |
| **Architecture** | x86-64 (amd64) only |
| **Drivers** | VirtIO storage (`virtio_scsi`) and network (`virtio_net`) drivers required |
| **Source** | Customer-provided image files |

Dedicated Servers do not use the Custom Image Storage add-on; custom ISOs are booted through IPMI.

---

## Limitations & Notes

- Windows Server bring-your-own-license is not permitted on VPS and VDS.
- Custom Windows images are not permitted (Microsoft licensing); support cannot assist with servers running one.
- Custom images without VirtIO drivers do not boot.
- Reinstalling erases all data on the disk; changing storage type (SSD ↔ NVMe) or plan family always requires a reinstall.
- Cryptocurrency mining is not permitted on VPS.
