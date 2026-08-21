-- CreateEnum
CREATE TYPE "HandoverStatus" AS ENUM ('PENDING', 'ACCEPTED', 'REJECTED', 'CANCELLED');

-- CreateTable
CREATE TABLE "Handover" (
    "id" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "recipientId" TEXT NOT NULL,
    "status" "HandoverStatus" NOT NULL DEFAULT 'PENDING',
    "token" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "createdById" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Handover_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Handover_token_key" ON "Handover"("token");

-- CreateIndex
CREATE INDEX "Handover_assetId_idx" ON "Handover"("assetId");

-- CreateIndex
CREATE INDEX "Handover_recipientId_idx" ON "Handover"("recipientId");

-- CreateIndex
CREATE INDEX "Handover_organizationId_idx" ON "Handover"("organizationId");

-- CreateIndex
CREATE INDEX "Handover_token_idx" ON "Handover"("token");

-- AddForeignKey
ALTER TABLE "Handover" ADD CONSTRAINT "Handover_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Handover" ADD CONSTRAINT "Handover_recipientId_fkey" FOREIGN KEY ("recipientId") REFERENCES "TeamMember"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Handover" ADD CONSTRAINT "Handover_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Handover" ADD CONSTRAINT "Handover_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
