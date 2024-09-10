/*
  Warnings:

  - Added the required column `distance` to the `Job_Application` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Job_Application" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "isHybrid" BOOLEAN NOT NULL DEFAULT false,
    "distance" DECIMAL NOT NULL,
    "sendStatus" BOOLEAN NOT NULL DEFAULT false,
    "isRejected" BOOLEAN NOT NULL DEFAULT false,
    "interviews" INTEGER NOT NULL DEFAULT 0,
    "senderId" INTEGER NOT NULL,
    CONSTRAINT "Job_Application_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Job_Application" ("id", "interviews", "isHybrid", "isRejected", "location", "sendStatus", "senderId", "title") SELECT "id", "interviews", "isHybrid", "isRejected", "location", "sendStatus", "senderId", "title" FROM "Job_Application";
DROP TABLE "Job_Application";
ALTER TABLE "new_Job_Application" RENAME TO "Job_Application";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
