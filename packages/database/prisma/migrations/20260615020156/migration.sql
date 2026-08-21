-- CreateEnum
CREATE TYPE "CalibrationResult" AS ENUM ('PASS', 'FAIL');

-- AlterTable
ALTER TABLE "Asset" ADD COLUMN     "calibrationStatus" TEXT,
ADD COLUMN     "lastCalibratedAt" TIMESTAMP(3),
ADD COLUMN     "nextCalibrationDueDate" TIMESTAMP(3);

-- CreateTable
CREATE TABLE "Calibration" (
    "id" TEXT NOT NULL,
    "assetId" TEXT NOT NULL,
    "organizationId" TEXT NOT NULL,
    "calibratedAt" TIMESTAMP(3) NOT NULL,
    "dueDate" TIMESTAMP(3) NOT NULL,
    "performedBy" TEXT NOT NULL,
    "result" "CalibrationResult" NOT NULL,
    "certificateUrl" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Calibration_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Calibration_assetId_idx" ON "Calibration"("assetId");

-- CreateIndex
CREATE INDEX "Calibration_organizationId_idx" ON "Calibration"("organizationId");

-- CreateIndex
CREATE INDEX "Calibration_dueDate_idx" ON "Calibration"("dueDate");

-- AddForeignKey
ALTER TABLE "Calibration" ADD CONSTRAINT "Calibration_assetId_fkey" FOREIGN KEY ("assetId") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Calibration" ADD CONSTRAINT "Calibration_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
