---
title: "VPS Auto Backup"
description: "Contabo Auto Backup add-on for VPS: daily incremental off-server backups, up to 10 kept for 10 days, restore to the original VPS, relation to snapshots."
lead: "Daily off-server backups for Core VPS and Performance VPS, kept for up to 10 days."
date: 2026-09-22
lastmod: 2026-09-23
draft: false
weight: 50
toc: true
---

## Overview

Auto Backup is an add-on that takes a daily backup of a VPS and stores it off-server in a Contabo data center. It complements snapshots on Core VPS and Performance VPS: a snapshot is an image of the VPS disk retained for 30 days, whereas Auto Backup provides 10 days of daily off-server backups.

---

## Availability

| Product | Auto Backup |
|---|---|
| Core VPS (Cloud VPS 4 – 18) | Available as add-on |
| Performance VPS (Cloud VPS Plus 4 – 18) | Available as add-on |

The add-on can be enabled at deployment or later and starts automatically.

---

## How It Works

- **Initial backup:** a full backup is taken within the standard backup window after provisioning or after the add-on is added.
- **Schedule:** one backup per day, incremental after the initial full backup, with at least 8 hours between backups.
- **Retention:** up to 10 backups are kept, each for a maximum of 10 days; when the limit is reached the oldest backup is deleted first.
- **Storage location:** off-server, in a Contabo data center, so a failure of the VPS host does not affect the backups. The backup location cannot be selected by the customer.

---

## Restore

Any kept backup can be restored to the original VPS from the Control Panel. Restoring **overwrites the current data** on the VPS; the VPS is unavailable until the restore has completed.

---

## Disabling and Cancelling

- The add-on can be cancelled without cancelling the VPS, and the VPS can be cancelled without affecting other services.
- If the service is **disabled**, the most recent backup is kept until the service is re-enabled or the add-on is cancelled completely.

---

## Limitations & Notes

- Not available for Storage VPS, VDS, GPU VPS or Dedicated Servers — use backup software inside the OS, the Backup Space add-on (GPU VPS) or Object Storage.
- Contabo ensures that backups are performed and that backup data is accessible, but does not guarantee recoverability and does not perform recovery on the customer's behalf. Verify backups regularly.
- Restores are whole-VPS restores; individual-file restore is not offered.
- The backup time within the standard window cannot be chosen.
