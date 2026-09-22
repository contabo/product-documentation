# Contabo Product Documentation

Product documentation for [Contabo](https://contabo.com) cloud infrastructure — built with [Hugo Doks](https://getdoks.org) and published automatically to GitHub Pages on every push to `main`.

---

## Contents

- [Repository structure](#repository-structure)
- [Local development](#local-development)
- [How deployment works](#how-deployment-works)
- [Updating content](#updating-content)
  - [Edit an existing product page](#edit-an-existing-product-page)
  - [Add a new product page](#add-a-new-product-page)
  - [Remove a product page](#remove-a-product-page)
  - [Update site-wide metadata](#update-site-wide-metadata)
- [Document structure](#document-structure)
- [Content conventions](#content-conventions)

---

## Repository structure

```
contabo-docs/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions — build & publish to GitHub Pages
├── assets/                     # Sass, JS, images (processed by Hugo)
├── config/
│   └── _default/
│       ├── hugo.toml           # Site config: baseURL, title, deployment target
│       ├── menus.toml          # Sidebar and top navigation
│       ├── module.toml         # Hugo module mounts
│       └── params.toml         # Doks theme parameters
├── content/
│   └── docs/
│       ├── _index.md           # Docs landing page
│       ├── servers-hosting/    # Sidebar groups mirror the Customer Control Panel menu
│       │   ├── _index.md       # group label only (build.render: never)
│       │   ├── vps.md          # Core VPS, Performance VPS and Storage VPS on one page
│       │   ├── gpu-vps.md
│       │   ├── vds.md          # Max Performance VPS (linkTitle "VDS")
│       │   ├── images.md
│       │   ├── dedicated-servers.md
│       │   └── vps-auto-backup.md
│       ├── network-services/
│       │   ├── _index.md
│       │   ├── private-networking.md
│       │   ├── ip-assignment.md
│       │   ├── dns-management.md
│       │   └── firewall.md
│       ├── storage/
│       │   ├── _index.md
│       │   └── object-storage.md
│       ├── domains/
│       │   ├── _index.md
│       │   └── domain-management.md
│       ├── dpa/
│       │   ├── _index.md
│       │   └── dpa.md
│       ├── account-management/
│       │   ├── _index.md
│       │   └── rbac.md
│       └── references/         # Sidebar entries that link out (externalUrl in front matter)
│           ├── _index.md
│           ├── api.md
│           ├── cntb.md
│           └── terraform.md
├── layouts/
│   └── _partials/sidebar/render-section-menu.html  # Doks override: externalUrl support in sidebar
├── static/                     # Static assets served as-is (favicon, etc.)
├── package.json
└── README.md
```

The product pages under `content/docs/` are the authoritative source for all product documentation. Everything else in the repo is theme infrastructure — you will rarely need to touch it.

---

## Local development

**Prerequisite:** [Docker Desktop](https://www.docker.com/products/docker-desktop/)

All local development runs inside Docker — no Node.js or Hugo installation required on your machine.

```bash
npm run dev
```

Open `http://localhost:1313/` in your browser. **Live reload is on by default** — save any file under `content/`, `layouts/`, `assets/`, or `config/` and the browser refreshes automatically within a second or two.

Stop the server with `Ctrl+C`.

If you change `package.json` or `package-lock.json`, restart `npm run dev`.

---

## How deployment works

Pushing any commit to the `main` branch triggers the GitHub Actions workflow defined in `.github/workflows/hugo.yml`. No manual steps are required.


<details>
  <summary>.github/workflows/hugo.yml (2026-06-30)</summary>

```
  # Sample workflow for building and deploying a Hugo site to GitHub Pages
name: Deploy Hugo site to Pages

on:
  # Runs on pushes targeting the default branch
  push:
    branches: ["main"]

  # Allows you to run this workflow manually from the Actions tab
  workflow_dispatch:

# Sets permissions of the GITHUB_TOKEN to allow deployment to GitHub Pages
permissions:
  contents: read
  pages: write
  id-token: write

# Allow only one concurrent deployment, skipping runs queued between the run in-progress and latest queued.
# However, do NOT cancel in-progress runs as we want to allow these production deployments to complete.
concurrency:
  group: "pages"
  cancel-in-progress: false

# Default to bash
defaults:
  run:
    shell: bash

jobs:
  # Build job
  build:
    runs-on: ubuntu-latest
    env:
      HUGO_VERSION: 0.163.3
    steps:
      - name: Install Hugo CLI
        run: |
          wget -O ${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb \
          && sudo dpkg -i ${{ runner.temp }}/hugo.deb
      - name: Install Dart Sass
        run: sudo snap install dart-sass
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: recursive
      - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
      - name: Install Node.js dependencies
        run: "[[ -f package-lock.json || -f npm-shrinkwrap.json ]] && npm ci || true"
      - name: Build with Hugo
        env:
          HUGO_CACHEDIR: ${{ runner.temp }}/hugo_cache
          HUGO_ENVIRONMENT: production
        run: |
          hugo \
            --minify \
            --baseURL "${{ steps.pages.outputs.base_url }}/"
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  # Deployment job
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v5

```

</details>

```
git push origin main
       │
       ▼
GitHub Actions runner
  1. Installs Hugo extended and Node.js
  2. Runs npm ci
  3. Runs hugo --minify --gc  →  ./public/
  4. Publishes ./public/ to the gh-pages branch
       │
       ▼
GitHub Pages serves the site
```
Site will be accesible at [https://docs.contabo.com/](https://docs.contabo.com/)


**Enabling GitHub Pages for the first time:**

1. Go to **Settings → Pages** in this repository.
2. Under *Source*, select **GitHub Actions**.
3. Save. The next push to `main` will publish the site.

Deployments are visible under the **Actions** tab. A green checkmark means the site is live; a red cross means the build failed — click the run for logs.

Attention: the repository has to be public in order to use Github Pages. To use Github Pages with private repositories, an Enterprise Account is required.

---

## Updating content

The sidebar mirrors the Customer Control Panel menu. Each group is a directory under `content/docs/` whose `_index.md` has `build.render: never` (label only, no page); the pages inside are the entries and are sorted by `weight`. Product pages (VPS, VDS, Dedicated Servers, GPU VPS, Object Storage) describe a product; feature pages (Images, VPS Auto Backup, Private Networking, IP Assignment, DNS Management, Firewall) hold the shared feature facts once, and product pages link to them from a short **Network & Security** section instead of repeating them.

### Edit an existing page

Open the file and edit the relevant section. Pages are plain Markdown — no shortcodes or template logic. Update `lastmod` in the front matter.

```bash
$EDITOR content/docs/servers-hosting/vps.md
git add content/docs/servers-hosting/vps.md
git commit -m "Update Core VPS plans table — September 2026"
```

| What changed | Where to edit |
|---|---|
| A plan was added, removed or its specifications changed | **Plans** table (VPS: the family's table) |
| A feature was added or changed | **Key Features** table, or the feature page under Network Services / Servers & Hosting |
| A new region | **Availability & Locations** |
| A new OS or image | `servers-hosting/images.md` |
| A limitation was resolved | **Limitations & Notes** |

### Add a page

1. Create `content/docs/<group>/<page>.md` in the group where the Customer Control Panel shows the feature. The URL is `/docs/<group>/<slug-of-title>/`.
2. Front matter: `title`, `description` (110–160 characters), `lead`, `date`, `lastmod`, `draft: false`, `weight` (10 higher than the last page in the group), `toc: true`. Add `linkTitle` if the sidebar label should differ from the title (e.g. `linkTitle: "VDS"`).
3. Fill in the sections listed under [Document structure](#document-structure). Start the body with `## Overview` — no `h1`.
4. To add a **new group**, create `content/docs/<group>/_index.md` with `title`, `weight` and `build: {render: never, list: always}`.
5. External sidebar links (as under References) are pages with an `externalUrl` front-matter field; the sidebar override in `layouts/_partials/sidebar/render-section-menu.html` renders them as outbound links.

The sidebar is generated from the content tree; nothing has to be registered in `menus.en.toml`. Remove a page with `git rm`; its sidebar entry disappears with it.

### Site-wide settings

| What to change | File | Key |
|---|---|---|
| Site title | `config/_default/hugo.toml` | `title` |
| Site description | `config/_default/params.toml` | `description` |
| Base URL | `config/_default/hugo.toml` | `baseurl` |
| Top navigation | `config/_default/menus/menus.en.toml` | `[[main]]` entries |
| Homepage cards and buttons | `layouts/home.html` | |
| Logo or favicon | `static/`, `assets/` | Replace files directly |

---

## Document structure

Every product page uses the same section order. The page title comes from the `title` front-matter field; files start directly with `## Overview`.

```
## Overview
## Plans                                    ← omit if the product has no fixed plans
## Key Features                             ← one line per feature, linking to the feature page or section
## Rescue System                            ← server products
## Upgrades, Migration & Storage Extension  ← server products
## Management & DevOps
## Availability & Locations
## Limitations & Notes                      ← only facts not stated elsewhere on the page
```

Pages with additional technical detail (e.g. Object Storage: **Limits**, **Storage Regions & Endpoints**, **S3 Feature Support**; GPU VPS: **GPU Specifications**) add product-specific sections between **Key Features** and **Management & DevOps**.

**Positives first, limitations last.** Every section before *Limitations & Notes* states what the product has or does. Anything that is not available, not supported, not offered, or only possible with a workaround goes under *Limitations & Notes*; in comparison and availability tables use "—" for the missing item and list it there.

**Each fact appears exactly once per page.** Family comparisons belong in *Products at a Glance* (VPS), per-plan numbers in the plan tables, one-line feature summaries with links in *Key Features*; a detail section exists only where there is detail beyond one line. Operating systems, 1-Click apps and custom images are documented on the Images page only; network features on the Network Services pages only; Auto Backup on its own page only — product pages link to them. Feature pages (Network Services, Images, VPS Auto Backup) use Overview → Availability → topic-specific sections → Limitations & Notes.

The **VPS** page documents the three plan families Core VPS, Performance VPS and Storage VPS together: Overview → Products at a Glance → one section per family (`## Core VPS {#core-vps}`, plan table directly under the intro paragraph, family-specific bullets) → the shared sections from Key Features onward. Deep-link with `/docs/servers-hosting/vps/#core-vps`, `#performance-vps` or `#storage-vps`.

### Section-by-section guide

**Overview** — two to four sentences: what the product is, how it works, and what makes it technically different from adjacent products.

**Plans** — one row per plan; columns are technical specifications only (CPU, RAM, storage, `Mbit/s Port` with numeric values, snapshots, traffic). Footnotes go in a blockquote directly after the table.

**Key Features** — two-column table `Feature` / `Details`; feature names bold; one clause per cell, with a link to the feature page or the detail section where one exists.

**Rescue System** — how to start it from the Control Panel, access (SSH port 22 as root) and what it can do.

**Upgrades, Migration & Storage Extension** — upgrade, downgrade, product-line change, region migration, storage extension and reinstall, each with its effect on data and IP addresses.

**Management & DevOps** — bullets starting with a bold tool or interface name; inline `code` for commands and endpoints.

**Availability & Locations** — one sentence listing regions, then a blockquote with region-specific technical caveats.

**Limitations & Notes** — constraints a customer might expect to work differently and that are not already stated in another section of the page. Omit the section if nothing remains.

---

## Content conventions

**Scope** — technical product reference only. Specifications, limits, behaviour, availability per product and procedures in the Control Panel. Anything commercial (prices, fees, discounts, billing terms, offers) or promotional (target audiences, use cases, badges, comparisons, value claims) is out of scope and belongs on contabo.com.

**No Control Panel locations** — never describe where a function sits in the Customer Control Panel (menu paths, tab or section names, URLs such as my.contabo.com); write "in the Control Panel". The panel's structure changes.

**Sources** — contabo.com is authoritative for product names and specifications; help.contabo.com for feature behaviour. Where they disagree, the website wins. Internal Confluence pages are the source for products without a public page (GPU VPS).

**Product names** — Core VPS, Performance VPS, Max Performance VPS, Storage VPS, Dedicated Servers, GPU VPS, Object Storage, as on contabo.com. Plan names follow the website (Cloud VPS 4, Cloud VPS Plus 4, Cloud VDS S, Storage VPS 10). "VDS" appears only as the sidebar label and plan-name prefix of Max Performance VPS.

**Tone** — factual and direct; numbers and precise statements, no superlatives or vague qualifiers.

**Dates** — `Month YYYY` in prose; update `lastmod` in the front matter on every substantive edit.

**Tables** — GFM pipe tables with `|---|` separators; keep cells to a short clause. Footnotes use `*` in the cell and a blockquote after the table, not `[^1]` syntax.

**Descriptions** — the front-matter `description` must be 110–160 characters; the build warns otherwise.

**draft: false** — all published pages must have `draft: false`.

---

*Sources: contabo.com · help.contabo.com · Last updated: September 2026*
