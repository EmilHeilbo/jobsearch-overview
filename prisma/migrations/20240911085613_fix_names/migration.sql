/*
  Warnings:

  - You are about to drop the `Job_Application` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Job_Application";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Job" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "isHybrid" BOOLEAN NOT NULL DEFAULT false,
    "distance" DECIMAL,
    "dateSent" DATETIME NOT NULL,
    "isRejected" BOOLEAN NOT NULL DEFAULT false,
    "interviews" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "senderId" INTEGER NOT NULL,
    CONSTRAINT "Job_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
