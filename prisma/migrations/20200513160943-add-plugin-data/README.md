# Migration `20200513160943-add-plugin-data`

This migration has been generated by fmvilas at 5/13/2020, 4:09:43 PM.
You can check out the [state of the schema](./schema.prisma) after the migration.

## Database Steps

```sql
ALTER TABLE "public"."users" ADD COLUMN "plugin_data" jsonb   DEFAULT '{}';
```

## Changes

```diff
diff --git schema.prisma schema.prisma
migration 20200510163316-default-free-plan..20200513160943-add-plugin-data
--- datamodel.dml
+++ datamodel.dml
@@ -3,9 +3,9 @@
 }
 datasource db {
   provider = "postgresql"
-  url = "***"
+  url      = env("DATABASE_URL")
 }
 model apis {
   asyncapi          String
@@ -79,8 +79,9 @@
   featureFlags         Json?                 @map(name: "feature_flags")
   id                   Int                   @default(autoincrement()) @id
   username             String                @unique
   planName             String?               @default("free") @map(name: "plan_name")
+  pluginData           Json?                 @default("'{}'") @map(name: "plugin_data")
   apis                 apis[]
   invitations          invitations[]
   organizationsForUser organizationsUsers[]
   projects             projects[]
```

