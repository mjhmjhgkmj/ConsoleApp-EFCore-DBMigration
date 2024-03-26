CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" TEXT NOT NULL CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY,
    "ProductVersion" TEXT NOT NULL
);

BEGIN TRANSACTION;

CREATE TABLE "Users" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NULL,
    "Age" INTEGER NOT NULL,
    "Test" INTEGER NOT NULL
);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20240326162503_first', '9.0.0-preview.2.24128.4');

COMMIT;

BEGIN TRANSACTION;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20240326163240_m2', '9.0.0-preview.2.24128.4');

COMMIT;

BEGIN TRANSACTION;

CREATE TABLE "ef_temp_Users" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Users" PRIMARY KEY AUTOINCREMENT,
    "Age" INTEGER NOT NULL,
    "Name" TEXT NULL
);

INSERT INTO "ef_temp_Users" ("Id", "Age", "Name")
SELECT "Id", "Age", "Name"
FROM "Users";

COMMIT;

PRAGMA foreign_keys = 0;

BEGIN TRANSACTION;

DROP TABLE "Users";

ALTER TABLE "ef_temp_Users" RENAME TO "Users";

COMMIT;

PRAGMA foreign_keys = 1;

BEGIN TRANSACTION;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20240326163637_m3', '9.0.0-preview.2.24128.4');

COMMIT;

BEGIN TRANSACTION;

ALTER TABLE "Users" ADD "S" INTEGER NOT NULL DEFAULT 0;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20240326164704_m4', '9.0.0-preview.2.24128.4');

COMMIT;

