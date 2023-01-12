import { PrismaClient } from "@prisma/client";
import { links } from "../data/links.mjs";
const prisma = new PrismaClient();

async function main() {
  const newUser = {
    email: `abdelwahab@prisma.io`,
    role: "ADMIN",
  };
  await prisma.user.upsert({
    create: newUser,
    update: newUser,
    where: {
      email: newUser.email
    }
  });

  const allUsers = await prisma.user.findMany();
  console.dir(allUsers);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
