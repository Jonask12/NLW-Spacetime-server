/*
  Warnings:

  - A unique constraint covering the columns `[githubId]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `avatarUrl` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `githubId` to the `user` table without a default value. This is not possible if the table is not empty.
  - Added the required column `login` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "user" ADD COLUMN     "avatarUrl" TEXT NOT NULL,
ADD COLUMN     "githubId" INTEGER NOT NULL,
ADD COLUMN     "login" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "memory" (
    "id" TEXT NOT NULL,
    "coverUrl" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "memory_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_githubId_key" ON "user"("githubId");

-- AddForeignKey
ALTER TABLE "memory" ADD CONSTRAINT "memory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
