/*
  Warnings:

  - Added the required column `contet` to the `Memory` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Memory" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "coverUrl" TEXT NOT NULL,
    "contet" TEXT NOT NULL,
    "isPublic" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Memory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Memory" ("coverUrl", "createdAt", "id", "isPublic", "userId") SELECT "coverUrl", "createdAt", "id", "isPublic", "userId" FROM "Memory";
DROP TABLE "Memory";
ALTER TABLE "new_Memory" RENAME TO "Memory";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
