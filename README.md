<div align="center">

# 🏢 PCS Central Store

**Enterprise Asset Management Platform**

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/PCS-IOT/PCS_Central_Store)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Node](https://img.shields.io/badge/node-%3E%3D22.20.0-brightgreen.svg)](https://nodejs.org)
[![pnpm](https://img.shields.io/badge/pnpm-9.15.9-orange.svg)](https://pnpm.io)
[![Docker](https://img.shields.io/badge/docker-ready-2496ED.svg)](https://docker.com)

A full-featured asset management system built with Remix, React, TypeScript, and PostgreSQL.
Track assets, manage bookings, handle calibrations, and monitor inventory across your organization.

[Quick Start](#-quick-start) · [Features](#-features) · [Architecture](#-architecture) · [API](#-api-reference) · [Contributing](#-contributing)

---

![Demo](https://via.placeholder.com/800x400/1a1a2e/ffffff?text=PCS+Central+Store+Dashboard)

</div>

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📦 **Asset Management** | Track assets with categories, tags, custom fields, and QR codes |
| 📋 **Booking System** | Reserve and manage asset bookings with approval workflows |
| 🔬 **Calibration Tracking** | Log calibration results, due dates, and compliance certificates |
| 🏷️ **QR Code Generation** | Generate and scan QR codes for quick asset identification |
| 📊 **Dashboard & Reporting** | Real-time analytics, charts, and export capabilities |
| 👥 **Team Management** | Role-based access control with organization hierarchy |
| 🔄 **Asset Transfers** | Manage asset movements between locations and custodians |
| 🔧 **Spare Parts** | Track spare parts inventory and stock changes |
| 📝 **Audit System** | Conduct inventory audits with status tracking |
| 🗺️ **Location Management** | Organize assets by locations with geocoding support |
| 📧 **Notifications** | Email notifications and in-app alerts |
| 🌐 **Multi-tenant** | Organization-level isolation and configuration |

## 🏗️ Architecture

```
central_store/
├── apps/
│   └── webapp/          # Remix + React web application
│       ├── app/
│       │   ├── components/    # Shared UI components
│       │   ├── modules/       # Business logic modules
│       │   ├── routes/        # Remix route modules
│       │   ├── utils/         # Utility functions
│       │   └── integrations/  # Third-party integrations
│       ├── server/            # Hono server entry
│       └── vite.config.ts
├── packages/
│   └── database/        # Prisma schema & migrations
│       └── prisma/
│           ├── schema.prisma
│           └── migrations/
├── docker/
│   ├── docker-compose.yml
│   └── app.Dockerfile
└── tooling/
    └── typescript/      # Shared TypeScript configs
```

### Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React 19, Remix v7, Tailwind CSS, Radix UI |
| **Backend** | Hono, React Router v7 (SSR) |
| **Database** | PostgreSQL 16, Prisma 6.19 |
| **Storage** | Supabase Storage (S3-compatible) |
| **Email** | Nodemailer + SMTP |
| **Search** | PostgreSQL Full-Text Search |
| **Monitoring** | Sentry |
| **Build** | Vite 7.3, Turborepo, pnpm |
| **Container** | Docker, Docker Compose |

## 🚀 Quick Start

### Prerequisites

- [Node.js](https://nodejs.org) >= 22.20.0
- [pnpm](https://pnpm.io) >= 9.15.9
- [Docker](https://docker.com) (optional, for containerized setup)

### 1. Clone & Install

```bash
git clone https://github.com/PCS-IOT/PCS_Central_Store.git
cd PCS_Central_Store
pnpm install
```

### 2. Environment Setup

```bash
cp .env.example .env
# Edit .env with your configuration
```

### 3. Database Setup

```bash
pnpm db:generate
pnpm db:deploy-migration
```

### 4. Start Development

```bash
pnpm webapp:dev
```

Visit [http://localhost:3000](http://localhost:3000) 🎉

### Docker Setup (Alternative)

```bash
docker compose -f docker/docker-compose.yml up -d
```

This starts:
- **App** → http://localhost:3000
- **PostgreSQL** → localhost:5432
- **MinIO** → http://localhost:9002
- **MailDev** → http://localhost:1080

## 🔧 Configuration

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | ✅ | PostgreSQL connection string |
| `DIRECT_URL` | ✅ | Direct database connection (for migrations) |
| `SESSION_SECRET` | ✅ | Secret for session encryption |
| `INVITE_TOKEN_SECRET` | ✅ | Secret for invite tokens |
| `SUPABASE_URL` | ✅ | Supabase project URL |
| `SUPABASE_ANON_PUBLIC` | ✅ | Supabase anonymous key |
| `SUPABASE_SERVICE_ROLE` | ✅ | Supabase service role key |
| `SMTP_HOST` | ❌ | SMTP server host |
| `SMTP_PORT` | ❌ | SMTP server port |
| `SERVER_URL` | ✅ | Application URL |
| `MAPTILER_TOKEN` | ❌ | Map tile service token |

## 📦 Available Scripts

| Script | Description |
|--------|-------------|
| `pnpm webapp:dev` | Start development server |
| `pnpm webapp:build` | Build for production |
| `pnpm webapp:start` | Start production server |
| `pnpm webapp:test` | Run unit tests |
| `pnpm webapp:validate` | Run full validation pipeline |
| `pnpm db:generate` | Generate Prisma client |
| `pnpm db:prepare-migration` | Create new migration |
| `pnpm db:deploy-migration` | Apply migrations |
| `pnpm db:reset` | Reset database |
| `pnpm turbo lint` | Run ESLint |
| `pnpm turbo typecheck` | Run TypeScript checks |

## 🧪 Testing

```bash
# Run all tests
pnpm webapp:test -- --run

# Run validation pipeline (lint + typecheck + tests)
pnpm webapp:validate
```

## 📁 Project Structure

### Key Modules

| Module | Path | Description |
|--------|------|-------------|
| `asset` | `app/modules/asset/` | Asset CRUD, search, filtering |
| `booking` | `app/modules/booking/` | Booking lifecycle management |
| `calibration` | `app/modules/calibrations/` | Calibration tracking & certificates |
| `location` | `app/modules/location/` | Location management & geocoding |
| `kit` | `app/modules/kit/` | Kit grouping & management |
| `team` | `app/modules/team/` | Team & user management |
| `notification` | `app/modules/notification/` | Notification system |
| `audit` | `app/modules/audit/` | Inventory audit system |
| `spare-parts` | `app/modules/spare-parts/` | Spare parts inventory |
| `asset-transfer` | `app/modules/asset-transfer/` | Asset transfer workflows |

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Commit Convention

This project uses [Conventional Commits](https://www.conventionalcommits.org/):

- `feat:` — New feature
- `fix:` — Bug fix
- `docs:` — Documentation changes
- `style:` — Code style changes
- `refactor:` — Code refactoring
- `test:` — Adding tests
- `chore:` — Maintenance tasks

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Built on top of [Shelf.nu](https://github.com/Shelf-nu/shelf.nu) — an open-source asset management platform.

---

<div align="center">

**Made with ❤️ by [PCS-IOT](https://github.com/PCS-IOT)**

[⬆ Back to top](#-pcs-central-store)

</div>
