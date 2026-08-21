-- AlterEnum
ALTER TYPE "AssetStatus" ADD VALUE 'MISSING';

-- AlterTable
ALTER TABLE "Location" ADD COLUMN     "contractEndDate" TIMESTAMP(3),
ADD COLUMN     "contractNumber" TEXT,
ADD COLUMN     "contractStatus" TEXT DEFAULT 'ACTIVE';
