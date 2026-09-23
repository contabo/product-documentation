---
title: "Domain Management"
description: "Registering, transferring and managing domains with Contabo: 300+ TLDs, Control Panel workflow, contact handles, nameservers, transfer requirements and DNS."
lead: "Register, transfer and manage domains from the Customer Control Panel."
date: 2026-09-22
lastmod: 2026-09-23
draft: false
weight: 10
toc: true
---

## Overview

Contabo acts as registrar for more than 300 top-level domains and provides self-service domain management in the Customer Control Panel: registration, transfer-in, contact (handle) management and DNS.

---

## Supported TLDs

| Category | Examples |
|---|---|
| Generic (gTLD) | .com, .net, .org, .info, .biz |
| Country-code (ccTLD) | .de, .eu, .ch, .co.uk, .nl, .es, .cz |
| New (nTLD) | .online, .cloud, .academy, .blog, .shop, .email |

The complete list of registrable TLDs is shown in the Control Panel when entering a domain name.

---

## Registering a Domain

1. Start a domain registration in the Control Panel.
2. Enter the domain name and select the extension; the contract period is displayed.
3. Provide contact handles: **Owner** and **Admin** are mandatory; **Tech** and **Zone** are prefilled with Contabo defaults. Owner data must be valid per ICANN requirements.
4. Choose nameservers: Contabo default (`ns2.contabo.net`, `ns3.contabo.net`, configured automatically) or custom nameservers for external DNS.
5. Choose the assignment: no assignment (configure DNS later), an existing Contabo server from the account, or a custom IP address.
6. Review and place the binding order.

The domain is typically active within minutes; full DNS propagation can take up to 24 hours. Confirmation e-mails are sent during the process.

---

## Transferring a Domain to Contabo

**Prerequisites at the current registrar:** obtain the authorization code (EPP / transfer key), unlock the domain, and temporarily disable WHOIS privacy protection.

1. Start a domain transfer in the Control Panel.
2. Enter the domain name, extension and authorization code.
3. Complete the contact handles.
4. Choose the nameserver configuration.
5. Review and submit the transfer request.

Transfers typically complete within **5 to 7 days** because of the ICANN verification steps; status updates are sent by e-mail.

---

## DNS for Domains

- DNS records (A, AAAA, MX, TXT, SRV, CNAME) are managed self-service in the Control Panel — see [DNS Management](/docs/network-services/dns-management/).
- A domain kept at another registrar can still use Contabo DNS: create the zone in the Control Panel, then point the domain's nameservers to Contabo's.

---

## Domain Lifecycle

Domains are registered for a fixed period with auto-renewal enabled. Renewal reminders are sent before expiry; an expired domain passes through a grace period (recoverable), then a redemption phase (recovery with additional effort), and finally becomes publicly available again. Registrant data is held in the WHOIS system; registrar-provided privacy services can replace personal data with proxy contact details.

---

## Limitations & Notes

- Domains are available only to customers with at least one other active Contabo product.
