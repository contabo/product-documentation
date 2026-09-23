---
title: "IP Assignment"
description: "IPv4 and IPv6 on Contabo servers: one static IPv4 and a /64 IPv6 per server, additional IPv4 limits per product (1 VPS, 15 VDS, 25 Dedicated), activation."
lead: "IPv4 and IPv6 allocation, additional addresses per product, and when an IP changes."
date: 2026-09-22
lastmod: 2026-09-23
draft: false
weight: 20
toc: true
---

## Overview

Every server is assigned a public IPv4 address and an IPv6 subnet; further IPv4 addresses are available up to a per-product maximum.

---

## IPv4

| Product | Included | Maximum additional IPv4 |
|---|---|---|
| VPS (Core, Performance, Storage) | 1 static IPv4 | 1 |
| GPU VPS | 1 static IPv4 | 1 |
| VDS (Max Performance VPS) | 1 static IPv4 | 15 |
| Dedicated Servers | 1 static IPv4 | 25 |

- The primary IPv4 address persists for the lifetime of the server.

---

## IPv6

- Every server receives a **/64 IPv6 subnet**, preconfigured on the Contabo side.
- IPv6 must be **activated in the OS**:
  - **Linux:** run the `enable_ipv6` command over SSH, then restart.
  - **Windows:** set the `DisabledComponents` registry value to `0x00` in an elevated command prompt, then restart.
- The assigned IPv6 details are shown in the Control Panel.
- Reaching the server over IPv6 requires an IPv6-capable connection on the client side.

---

## When the IP Address Changes

| Action | IPv4 / IPv6 |
|---|---|
| Upgrade to a larger plan (in place) | Unchanged |
| Reinstall | Unchanged |
| Region migration (VPS/VDS) | Both change |
| Relocation within a region | Unchanged |
| Downgrade or change of plan family / product line (new server) | New addresses |
| Private Networking activation on an incompatible host (reinstall) | Public IP changes |

---

## Reverse DNS

PTR records for IPv4 and IPv6 addresses are managed in the Control Panel under Reverse DNS Management — see [DNS Management](/docs/network-services/dns-management/).

---

## Limitations & Notes

- Additional IPv4 addresses are not configured automatically — they must be added to the network configuration inside the OS.
- Additional IPv4 addresses for Dedicated Servers are assigned via support, not self-service.
- Dedicated Servers cannot be migrated between regions; a relocation within a region keeps the addresses.
