---
title: "Private Networking"
description: "Contabo Private Networking: isolated Layer 2 networks between VPS and VDS instances in the same region, unmetered traffic, up to /22 per network."
lead: "Isolated Layer 2 networks between VPS and VDS instances in the same region."
date: 2026-09-22
lastmod: 2026-09-23
draft: false
weight: 10
toc: true
---

## Overview

Private Networking connects instances over an isolated Layer 2 LAN that is not reachable from the public internet. Traffic inside a private network is unmetered. The network interface is configured automatically when an instance joins a network.

---

## Availability

| Product | Private Networking |
|---|---|
| VPS (Core, Performance, Storage) | Add-on per instance |
| VDS (Max Performance VPS) | Provisioned manually by support on request (support ticket) |
| GPU VPS | Add-on per instance |

---

## Specifications

| Aspect | Details |
|---|---|
| **Isolation** | Layer 2 LAN, fully isolated from other customers and the public network |
| **Traffic** | Unlimited and unmetered within the private network |
| **Network size** | Up to /22 (1,024 addresses) per network |
| **Networks per instance** | An instance can belong to multiple private networks |
| **Networks per account** | No stated limit |
| **Scope** | One region per network; only instances in the same region can be added |
| **IP assignment** | Private IP addresses assigned automatically |
| **Management** | Control Panel, API and CLI |

---

## Activation

1. Enable the Private Networking add-on on each instance that should join.
2. Create a network in the Control Panel with a name and region.
3. Select the instances to add.
4. Restart each instance to activate the network interface — data is preserved.

For VDS, private networks are not self-service: request them via a support ticket, and support provisions them manually.

---

## Limitations & Notes

- Not offered as a Control Panel add-on for Dedicated Servers; a Dedicated Private Network is available on request.
- Private networks are limited to one region; instances in other regions cannot join.
- There is no built-in firewall for private networks; restrict access with the firewall inside the OS. The Contabo Firewall applies to public traffic only.
- If the instance runs on a host that does not support Private Networking, activation requires an OS reinstall — all data is erased and the public IP address changes. Contact support if an instance does not appear in the network after the restart.
