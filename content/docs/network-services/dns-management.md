---
title: "DNS Management"
description: "Contabo DNS Management: nameservers ns1 to ns3.contabo.net, record types, TTL rules, zone creation in the Control Panel and reverse DNS for IPv4 and IPv6."
lead: "Nameservers, DNS zones and records, TTL rules and reverse DNS in the Control Panel."
date: 2026-09-22
lastmod: 2026-09-22
draft: false
weight: 30
toc: true
---

## Overview

DNS zones for domains registered with Contabo or with a third-party registrar can be hosted on Contabo's authoritative nameservers and managed self-service in the Control Panel. Reverse DNS (PTR) records for server IP addresses are managed in the same place.

---

## Nameservers

| Nameserver | IPv4 | IPv6 |
|---|---|---|
| `ns1.contabo.net` | 79.143.182.242 | 2a02:c205:0:0882::1 |
| `ns2.contabo.net` | 178.238.234.231 | 2a02:c205:0:0891::1 |
| `ns3.contabo.net` | 5.189.191.29 | 2a02:c207:0:0842::1 |

Domains registered through Contabo are assigned `ns2.contabo.net` and `ns3.contabo.net` by default; custom nameservers can be entered instead.

---

## DNS Zones and Records

- **Create a zone:** in the Control Panel, enter the domain and select the target server IP address; default records pointing at that server are created.
- **Record types:** A, AAAA, MX, TXT, SRV and CNAME records can be added and edited.
- **TTL:** minimum 14,400 seconds; default recommendation 86,400 seconds.
- **Propagation:** changes can take up to 24 hours to propagate.
- **Domain at another registrar:** create the zone at Contabo, then set the domain's nameservers at the registrar to the Contabo nameservers above.

---

## Reverse DNS (PTR)

- PTR records map a server IP address to a hostname and are checked by many receiving mail servers.
- Supported for **IPv4 and IPv6** addresses.
- Managed in the Control Panel (edit and delete per address).

---

## Limitations & Notes

- DNS zone management covers the record types listed above; other record types are not documented as supported.
- Outbound e-mail from servers is subject to a soft limit of roughly 25 messages per minute; set a valid PTR record for mail servers.
