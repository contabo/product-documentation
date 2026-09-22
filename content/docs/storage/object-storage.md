---
title: "Object Storage"
description: "Contabo Object Storage: S3-compatible storage on a Ceph cluster with triple replication, regions in the EU, US Central and Singapore, and 5 TB objects."
lead: "S3-compatible object storage with triple replication, TLS encryption, and regions in the EU, US Central and Singapore."
date: 2026-06-25
lastmod: 2026-09-21
draft: false
weight: 10
toc: true
---
## Overview

Contabo Object Storage is an S3-compatible object storage service built on a Ceph cluster following Red Hat production guidance. Unlike Storage VPS, which provides a full virtual machine with a block disk, Object Storage is accessed entirely via the S3 API or a web UI — there is no server to manage.

---

## Key Features

| Feature | Details |
|---|---|
| **API** | S3-compatible; migration from AWS S3 or another S3 provider needs only a new endpoint and new credentials |
| **Redundancy** | Every object triple-replicated across servers; high availability mode by default |
| **Encryption** | In transit (TLS) and at rest |
| **Regions** | EU, US Central, Singapore — chosen per storage; data is never moved to another region without the customer's written consent |
| **Access** | S3 API (HTTPS only) and a web UI with drag-and-drop file and bucket management |
| **Custom domains** | Via a TLS-terminating proxy such as Cloudflare (CNAME) |
| **DDoS protection** | Always-on, network-level, automatic |

---

## Quotas

| Limit | Value |
|---|---|
| Maximum object size | 5 TB |
| Buckets per account | 100 (default) |
| Objects per account | 3 million (default; increasable on request) |
| API requests | 250 per second |
| Bandwidth | 10 MB/s (80 Mbit/s) default; also depends on the client's connection |
| Capacity | Added in 250 GB increments |
| Auto-scaling | Optional automatic expansion in 250 GB increments up to a monthly cap set per account |

---

## Storage Regions & Endpoints

| Region | S3 Endpoint |
|---|---|
| EU | `https://eu2.contabostorage.com` |
| US Central | `https://usc1.contabostorage.com` |
| Singapore | `https://sin1.contabostorage.com` |

---

## Credentials

- **S3 credentials:** Access Key and Secret Key are shown in the Control Panel; the Secret Key can be regenerated there.
- **Management credentials:** the Contabo API and `cntb` CLI use the OAuth2 credentials (client ID, client secret, API user, API password) from the Control Panel, not the S3 keys.

---

## S3 Feature Support

| Feature | Status | Notes |
|---|---|---|
| Bucket and object operations, multipart upload, metadata | Supported | |
| Bucket versioning | Supported | Bucket-wide (`put-bucket-versioning`); suspending stops new versions but keeps existing ones; current version marked `IsLatest: true` |
| Lifecycle configuration | Supported (expiration) | `Expiration` rules in days, optionally by `Prefix` |
| Object Lock | Supported | GOVERNANCE and COMPLIANCE modes; enabled with `--object-lock-enabled-for-bucket` at bucket creation; retention via `put-object-lock-configuration` |
| Bucket policies | Supported | IAM policy format `2012-10-17`; principal ARN `arn:aws:iam::<s3TenantId>:user/<customerId>:<userId>`; `s3TenantId` via `cntb get objectStorages -o=json`, `userId` via `cntb get users` |
| Access control lists (ACL) | Supported | Per bucket and per object, via web UI or API; public or private links to individual objects |
| Pre-signed URLs | Supported | Standard S3 SDK behaviour |

---

## Compatible Tools & Integrations

| Tool | Type |
|---|---|
| **cntb** | Contabo CLI — create and manage Object Storage and users |
| **AWS CLI** | Command-line S3 management |
| **Rclone** | Bulk migration, sync, and transfer |
| **Cyberduck** | GUI-based file management |
| **s3cmd** | Command-line S3 client |
| **WinSCP** | Windows GUI client |
| **Cloudberry Explorer** | GUI-based management |
| **BucketAnywhere** | Multi-cloud storage manager |
| **goofys** | Mount as a filesystem |
| **s3fs-fuse** | Mount as a FUSE filesystem |
| **Nextcloud** | Self-hosted file sync and share integration |
| **Apache Spark** | Big data processing integration |
| **Velero** | Kubernetes backup and restore |
| **Virtualmin** | Web hosting panel integration |
| **Plesk** | Control panel backup integration |
| **Mastodon** | Media storage backend |

> cPanel/WHM can use Object Storage as a backup destination via folder mounting.

---

## Management

- **Web UI**: bucket creation, uploads, ACLs, link sharing
- **S3 API**: versioning, lifecycle, Object Lock, ACLs, bucket policies
- **Contabo API / `cntb`**: provisioning of Object Storage, capacity changes, user management
- **Capacity and auto-scaling**: Control Panel

---

## Limitations & Notes

- The S3 API covers most standard operations but does not guarantee full parity with AWS S3; server access logging is not supported.
- Object Lock cannot be enabled on an existing bucket — create a new bucket with Object Lock enabled.
- Lifecycle rules support expiration only; storage-class transitions are not documented, and expiration deletes objects irreversibly.
- SFTP/SCP, FTP/FTPS, NFS/CIFS/SMB and RTSP are not supported — access is via the S3 API and web UI; use a FUSE client (s3fs-fuse, goofys) for filesystem access.
- Plain HTTP is not supported (HTTPS only); a custom domain requires a TLS-terminating proxy.
- FileZilla Pro forces virtual-hosted-style bucket names and is not compatible; use Cyberduck instead.
- Objects changed from public to private may remain cached and accessible for up to one hour after the permission change.
