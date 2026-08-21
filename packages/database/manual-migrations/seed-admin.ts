import { PrismaClient, OrganizationType, OrganizationRoles, Currency } from "../src";
import crypto from "crypto";

const prisma = new PrismaClient();

async function hashPassword(password: string): Promise<string> {
  return new Promise((resolve, reject) => {
    const salt = crypto.randomBytes(16).toString("hex");
    crypto.scrypt(password, salt, 64, (err, derivedKey) => {
      if (err) reject(err);
      resolve(`${salt}:${derivedKey.toString("hex")}`);
    });
  });
}

async function main() {
  const email = (process.env.ADMIN_EMAIL || "admin@central-store.local").toLowerCase().trim();
  const password = "Password123!";
  const passwordHash = await hashPassword(password);

  console.log(`Setting up user: ${email}`);

  // 1. Create or update User
  const user = await prisma.user.upsert({
    where: { email },
    update: {
      firstName: "Admin",
      lastName: "User",
      onboarded: true,
    },
    create: {
      email,
      firstName: "Admin",
      lastName: "User",
      onboarded: true,
    },
  });

  // 2. Create or update LocalUser credentials
  await prisma.localUser.upsert({
    where: { email },
    update: {
      passwordHash,
      userId: user.id,
    },
    create: {
      email,
      passwordHash,
      userId: user.id,
    },
  });

  // 3. Create or find Organization
  let org = await prisma.organization.findFirst({
    where: { userId: user.id },
  });

  if (!org) {
    org = await prisma.organization.create({
      data: {
        name: "Central Store",
        type: OrganizationType.PERSONAL,
        currency: Currency.USD,
        userId: user.id,
      },
    });
  }

  // 4. Link UserOrganization
  await prisma.userOrganization.upsert({
    where: {
      userId_organizationId: {
        userId: user.id,
        organizationId: org.id,
      },
    },
    update: {
      roles: [OrganizationRoles.OWNER, OrganizationRoles.ADMIN],
    },
    create: {
      userId: user.id,
      organizationId: org.id,
      roles: [OrganizationRoles.OWNER, OrganizationRoles.ADMIN],
    },
  });

  // 5. Update user's lastSelectedOrganizationId
  await prisma.user.update({
    where: { id: user.id },
    data: {
      lastSelectedOrganizationId: org.id,
    },
  });

  console.log("Admin setup successful!");
  console.log(`Email: ${email}`);
  console.log(`Password: ${password}`);
  console.log(`Org ID: ${org.id}`);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
