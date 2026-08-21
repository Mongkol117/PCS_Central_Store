# Changelog

All notable changes to **PCS Central Store** will be documented in this file.

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [1.0.0] - 2026-08-21

### 🎉 Initial Release

First production-ready release of PCS Central Store — a complete enterprise asset management platform.

### ✨ Features

#### Core Asset Management
- Full asset CRUD with categories, tags, and custom fields
- Asset status tracking (Available, Deployed, Retired, etc.)
- QR code generation and scanning for quick identification
- Barcode support (Code128, QR, UPC, EAN, etc.)
- Asset image management with Supabase storage
- Bulk asset operations (export, delete, QR download)

#### Booking System
- Asset reservation with date range selection
- Booking approval workflow (Self-service, Admin)
- Kit-based booking (book multiple assets together)
- Booking status management (Draft, Reserved, Checked-out, Checked-in)
- Calendar view with FullCalendar integration
- Booking notes and comments

#### Calibration Management
- Calibration record logging with results (PASS/FAIL)
- Due date tracking with overdue alerts
- Compliance certificate upload (PDF/Images)
- Calibration history per asset
- Organization-wide calibration dashboard

#### Inventory & Audit
- Inventory audit sessions with item-level tracking
- Audit status management (DRAFT, COMPLETED, CANCELLED)
- Asset assignment status during audits
- Audit notes and reporting

#### Spare Parts
- Spare parts inventory tracking
- Stock change logging (ADDITION, ALLOCATION, ADJUSTMENT)
- Integration with asset maintenance workflows

#### Asset Transfer
- Transfer requests between custodians
- Approval workflow (Sender → Receiver)
- Transfer status tracking (PENDING, APPROVED, REJECTED, CANCELLED)

#### Location Management
- Hierarchical location structure (parent/child)
- Geocoding with MapTiler integration
- Contract tracking (number, end date, status)
- Location-based asset organization

#### Kit Management
- Group assets into kits for batch operations
- Kit status tracking (Available, Deployed, Retired)
- Kit asset count as single unit option

#### Team & Access Control
- Organization-based multi-tenancy
- Role-based access control (Owner, Admin, Team Member, Base)
- Team member invitations with email
- User profile management

#### Notifications
- Real-time in-app notifications
- Email notifications via SMTP
- Booking reminders and status updates
- Calibration due date alerts

#### Dashboard & Reporting
- Real-time asset statistics
- Booking overview charts
- Calibration status dashboard
- Asset export (CSV)
- Print-friendly views

### 🏗️ Architecture
- **Monorepo** with pnpm workspaces + Turborepo
- **Remix v7** with React Router and SSR
- **Hono** server with Sentry instrumentation
- **Prisma 6.19** ORM with PostgreSQL 16
- **Vite 7.3** build tooling with experimental v8 API
- **Docker** multi-stage build with dev/production targets
- **Supabase** for file storage and authentication

### 🔧 Development
- Vitest unit test suite
- ESLint + Prettier code formatting
- Conventional Commits with commitlint
- Lefthook git hooks
- Path aliases for clean imports
- Co-located tests with source files

### 🐳 Deployment
- Docker Compose for local development
- Fly.io deployment configuration
- Health check endpoint (`/healthcheck`)
- Database migration on startup

---

## [Unreleased]

### Planned
- [ ] Mobile companion app (React Native/Expo)
- [ ] Advanced analytics dashboard
- [ ] Webhook integrations
- [ ] API rate limiting
- [ ] Multi-language support (i18n)
- [ ] Dark mode toggle
- [ ] Asset maintenance scheduling
- [ ] Bulk import from CSV/Excel

---

[1.0.0]: https://github.com/PCS-IOT/PCS_Central_Store/releases/tag/v1.0.0
[Unreleased]: https://github.com/PCS-IOT/PCS_Central_Store/compare/v1.0.0...HEAD
