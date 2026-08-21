-- CreateEnum
CREATE TYPE "PartStockChangeType" AS ENUM ('ADDITION', 'ALLOCATION', 'ADJUSTMENT');

-- CreateTable
CREATE TABLE "SparePart" (
    "id" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sku" TEXT,
    "description" TEXT,
    "minQuantity" INTEGER NOT NULL DEFAULT 0,
    "quantity" INTEGER NOT NULL DEFAULT 0,
    "unit" TEXT DEFAULT 'pcs',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SparePart_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PartAllocation" (
    "id" TEXT NOT NULL,
    "sparePartId" TEXT NOT NULL,
    "assetId" TEXT,
    "repairId" TEXT,
    "quantity" INTEGER NOT NULL,
    "allocatedById" TEXT NOT NULL,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PartAllocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PartStockHistory" (
    "id" TEXT NOT NULL,
    "sparePartId" TEXT NOT NULL,
    "changeType" "PartStockChangeType" NOT NULL,
    "quantity" INTEGER NOT NULL,
    "notes" TEXT,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PartStockHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_AssetCompatibleSpareParts" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_AssetCompatibleSpareParts_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "SparePart_organizationId_idx" ON "SparePart"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "SparePart_organizationId_sku_key" ON "SparePart"("organizationId", "sku");

-- CreateIndex
CREATE INDEX "PartAllocation_sparePartId_idx" ON "PartAllocation"("sparePartId");

-- CreateIndex
CREATE INDEX "PartAllocation_assetId_idx" ON "PartAllocation"("assetId");

-- CreateIndex
CREATE INDEX "PartAllocation_repairId_idx" ON "PartAllocation"("repairId");

-- CreateIndex
CREATE INDEX "PartStockHistory_sparePartId_idx" ON "PartStockHistory"("sparePartId");

-- CreateIndex
CREATE INDEX "_AssetCompatibleSpareParts_B_index" ON "_AssetCompatibleSpareParts"("B");

-- AddForeignKey
ALTER TABLE "SparePart" ADD CONSTRAINT "SparePart_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartAllocation" ADD CONSTRAINT "PartAllocation_sparePartId_fkey" FOREIGN KEY ("sparePartId") REFERENCES "SparePart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartAllocation" ADD CONSTRAINT "PartAllocation_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartAllocation" ADD CONSTRAINT "PartAllocation_repairId_fkey" FOREIGN KEY ("repairId") REFERENCES "RepairRecord"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartAllocation" ADD CONSTRAINT "PartAllocation_allocatedById_fkey" FOREIGN KEY ("allocatedById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartStockHistory" ADD CONSTRAINT "PartStockHistory_sparePartId_fkey" FOREIGN KEY ("sparePartId") REFERENCES "SparePart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PartStockHistory" ADD CONSTRAINT "PartStockHistory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AssetCompatibleSpareParts" ADD CONSTRAINT "_AssetCompatibleSpareParts_A_fkey" FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AssetCompatibleSpareParts" ADD CONSTRAINT "_AssetCompatibleSpareParts_B_fkey" FOREIGN KEY ("B") REFERENCES "SparePart"("id") ON DELETE CASCADE ON UPDATE CASCADE;
