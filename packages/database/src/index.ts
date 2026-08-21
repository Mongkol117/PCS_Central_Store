// Re-export the database client factory and types
export { createDatabaseClient } from "./client";
export type { ExtendedPrismaClient } from "./client";

// Re-export Prisma client and types
export { Prisma, PrismaClient } from "@prisma/client";
export type * from "@prisma/client";

// Re-export enums explicitly (export type * does not re-export runtime values)
export {
  ActivityAction,
  ActivityEntity,
  AssetIndexMode,
  AssetStatus,
  AuditAssetStatus,
  AuditAssignmentRole,
  AuditStatus,
  BarcodeType,
  BookingStatus,
  CalibrationResult,
  Currency,
  CustomFieldType,
  ErrorCorrection,
  HandoverStatus,
  InventoryAuditStatus,
  InviteStatuses,
  KitStatus,
  NoteType,
  OrganizationRoles,
  OrganizationType,
  PartStockChangeType,
  QrIdDisplayPreference,
  Roles,
  TagUseFor,
  TierId,
  TransferStatus,
  UpdateStatus,
} from "@prisma/client";
