-- CreateEnum
CREATE TYPE "InventoryAuditStatus" AS ENUM ('DRAFT', 'COMPLETED', 'CANCELLED');

-- CreateTable
CREATE TABLE "InventoryAuditSession" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "status" "InventoryAuditStatus" NOT NULL DEFAULT 'DRAFT',
    "notes" TEXT,
    "createdById" TEXT NOT NULL,
    "completedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryAuditSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InventoryAuditItem" (
    "id" TEXT NOT NULL,
    "auditSessionId" TEXT NOT NULL,
    "sparePartId" TEXT NOT NULL,
    "systemQuantity" INTEGER NOT NULL,
    "countedQuantity" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InventoryAuditItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "InventoryAuditSession_organizationId_idx" ON "InventoryAuditSession"("organizationId");

-- CreateIndex
CREATE INDEX "InventoryAuditItem_auditSessionId_idx" ON "InventoryAuditItem"("auditSessionId");

-- CreateIndex
CREATE INDEX "InventoryAuditItem_sparePartId_idx" ON "InventoryAuditItem"("sparePartId");

-- CreateIndex
CREATE UNIQUE INDEX "InventoryAuditItem_auditSessionId_sparePartId_key" ON "InventoryAuditItem"("auditSessionId", "sparePartId");

-- AddForeignKey
ALTER TABLE "InventoryAuditSession" ADD CONSTRAINT "InventoryAuditSession_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryAuditSession" ADD CONSTRAINT "InventoryAuditSession_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryAuditItem" ADD CONSTRAINT "InventoryAuditItem_auditSessionId_fkey" FOREIGN KEY ("auditSessionId") REFERENCES "InventoryAuditSession"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InventoryAuditItem" ADD CONSTRAINT "InventoryAuditItem_sparePartId_fkey" FOREIGN KEY ("sparePartId") REFERENCES "SparePart"("id") ON DELETE CASCADE ON UPDATE CASCADE;
