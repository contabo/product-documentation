---
title: "Firewall"
description: "Contabo Firewall for VPS and VDS: network-level filtering, default-drop inbound, TCP/UDP/ICMP rules with IPv4/IPv6 sources and port ranges, and limitations."
lead: "Network-level firewall for VPS and VDS instances, managed in the Control Panel, API and CLI."
date: 2026-09-22
lastmod: 2026-09-23
draft: false
weight: 40
toc: true
---

## Overview

The Contabo Firewall filters traffic at network level, before it reaches the instance. It runs independently of the guest operating system: rules survive reboots, reinstalls and OS-level misconfiguration. All inbound traffic is blocked from the moment a firewall is activated; the customer decides what is allowed in.

---

## Availability

| Product | Firewall |
|---|---|
| VPS (Core, Performance, Storage) | Included |
| VDS (Max Performance VPS) | Included |
| GPU VPS | Included |

---

## Rules

- **Default policy:** all inbound traffic is dropped by a permanent default rule; outbound traffic is unrestricted.
- **Protocols:** TCP, UDP and ICMP.
- **Sources:** any (IPv4 and IPv6), any IPv4, any IPv6, a single IP address (e.g. `203.0.113.10`) or a CIDR range (e.g. `203.0.113.0/24`); comma-separated lists are converted to tags.
- **Ports:** a single port (`22`), a comma-separated list (`22,80,443`) or a range (`8000-8100`); valid range 0–65535.
- **Predefined types:** common rule types such as SSH and HTTPS can be selected instead of entering ports manually.

---

## Assignment and Management

- A firewall is attached to one or more instances; rules take effect immediately.
- Management: Control Panel, API and CLI.

---

## Limitations & Notes

- Not offered for Dedicated Servers — use the firewall inside the OS.
- Rules cannot be filtered or searched in the Control Panel.
- Traffic logs are not available in the Control Panel.
- Deleting a firewall or a rule is permanent and irreversible.
- Private networks are not covered — use the OS firewall inside a private network.
