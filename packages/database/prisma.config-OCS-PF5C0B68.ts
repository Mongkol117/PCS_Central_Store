import path from "node:path";
import { defineConfig } from "prisma/config";

try {
  // @ts-ignore
  const dotenv = await import("dotenv");
  dotenv.default.config({ path: path.resolve(__dirname, "../../.env") });
} catch (e) {
  // Ignore if dotenv is not available in the environment
}

export default defineConfig({
  schema: "prisma/schema.prisma",
});
