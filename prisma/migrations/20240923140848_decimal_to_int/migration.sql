/*
  Warnings:

  - You are about to alter the column `distance` on the `Job` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Int`.
  - You are about to alter the column `travelTime` on the `Job` table. The data in that column could be lost. The data in that column will be cast from `Decimal` to `Int`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Job" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "isHybrid" BOOLEAN NOT NULL DEFAULT false,
    "distance" INTEGER,
    "travelTime" INTEGER,
    "dateSent" DATETIME NOT NULL,
    "isRejected" BOOLEAN NOT NULL DEFAULT false,
    "interviews" INTEGER NOT NULL DEFAULT 0,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "senderId" INTEGER NOT NULL,
    CONSTRAINT "Job_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Job" ("company", "createdAt", "dateSent", "distance", "id", "interviews", "isHybrid", "isRejected", "location", "senderId", "title", "travelTime", "updatedAt") SELECT "company", "createdAt", "dateSent", "distance", "id", "interviews", "isHybrid", "isRejected", "location", "senderId", "title", "travelTime", "updatedAt" FROM "Job";
DROP TABLE "Job";
ALTER TABLE "new_Job" RENAME TO "Job";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
