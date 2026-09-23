---
title: "User Management"
description: "User Management at Contabo: account users, their roles (Owner, Full Access, Technician, Billing Admin and more) and an access matrix by area."
lead: "Account users, their roles and permissions, and an access matrix by area."
date: 2026-09-22
lastmod: 2026-09-23
draft: false
weight: 10
toc: true
---

## Overview

A Contabo account can have several users. Each user holds a role that determines which areas of the account and which functions are accessible. The account owner holds every permission; additional users are assigned one of the roles below.

---

## Roles

| Role | Permissions | Areas |
|---|---|---|
| **Owner** | All permissions on the account | Billing · Contract · Order · Technical & Configuration · Abuse & Fraud |
| **Full Access** | All resources and settings of the account, except ordering and terminating services and add-ons | Billing (except Billing Address Change) · Contract: Customer Control Panel / Login, Other · Order: Pre-Sales Question, Order Status, Other · Technical & Configuration · Abuse & Fraud |
| **Technician** | Full control over instances, firewalls, networks, IPs, DNS, backups and custom images; no billing or contract access | Technical & Configuration |
| **Billing Admin** | Full access to billing, payments, orders, upgrades, cancellations and DPA management; no infrastructure or technical access | Billing |
| **Invoice** | Exclusive recipient of invoices; can view and download invoices; no further permissions | Billing: Payment & Invoice |
| **Abuse & Fraud** | Read-only access to instances, firewalls, networking, IPs and DNS; no create, edit or delete permissions | Technical & Configuration: IP/Network Configuration, Domains / DNS, Firewall · Abuse & Fraud |
| **Object Storage** | Access to Object Storage | Technical & Configuration: Backups / Object Storage |
| **Object Storage r/w** | Read-write access to Object Storage | Technical & Configuration: Backups / Object Storage |

---

## Credentials

| Credential | Details |
|---|---|
| **Client ID / client secret** | Identify the account towards `api.contabo.com` (OAuth2); shown in the Control Panel |
| **API user and password** | Created in the Control Panel; the password is set via a link sent by e-mail; no set limit on the number of API users |
| **Used by** | Contabo API, `cntb` CLI, Terraform provider |
| **S3 Access Key / Secret Key** | For Object Storage; shown in the Control Panel, where the Secret Key can be regenerated |
| **Object Storage users** | Managed via the Contabo API or `cntb get users`; bucket access restricted per user with S3 bucket policies (principal `arn:aws:iam::<s3TenantId>:user/<customerId>:<userId>`) |
