-- AlterEnum
ALTER TYPE "AssetStatus" ADD VALUE 'UNDER_REPAIR';

-- CreateTable
CREATE TABLE "RepairRecord" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "serviceProvider" TEXT NOT NULL,
    "sentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "returnedDate" TIMESTAMP(3),
    "cost" DOUBLE PRECISION,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RepairRecord_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "RepairRecord_organizationId_idx" ON "RepairRecord"("organizationId");

-- CreateIndex
CREATE INDEX "RepairRecord_assetId_idx" ON "RepairRecord"("assetId");

-- AddForeignKey
ALTER TABLE "RepairRecord" ADD CONSTRAINT "RepairRecord_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RepairRecord" ADD CONSTRAINT "RepairRecord_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;
