/*
 Navicat Premium Dump SQL

 Source Server         : leyu-test
 Source Server Type    : PostgreSQL
 Source Server Version : 180001 (180001)
 Source Host           : dpg-d5rfn1pr0fns73e4gr90-a.virginia-postgres.render.com:5432
 Source Catalog        : leyu
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 180001 (180001)
 File Encoding         : 65001

 Date: 26/01/2026 14:10:18
*/


-- ----------------------------
-- Table structure for sys__dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys__dept";
CREATE TABLE "public"."sys__dept" (
  "id" int8 NOT NULL,
  "parent_id" int8,
  "tenant_id" int8 NOT NULL,
  "name" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(64) COLLATE "pg_catalog"."default",
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "leader_id" int8,
  "status" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."sys__dept" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."sys__dept"."id" IS '主键';
COMMENT ON COLUMN "public"."sys__dept"."parent_id" IS '父部门ID';
COMMENT ON COLUMN "public"."sys__dept"."tenant_id" IS '租户 / 公司ID（SaaS隔离）';
COMMENT ON COLUMN "public"."sys__dept"."name" IS '部门名称';
COMMENT ON COLUMN "public"."sys__dept"."code" IS '部门编码';
COMMENT ON COLUMN "public"."sys__dept"."path" IS '层级路径，如 /1/3/8';
COMMENT ON COLUMN "public"."sys__dept"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys__dept"."leader_id" IS '负责人用户ID';
COMMENT ON COLUMN "public"."sys__dept"."status" IS '状态：1=启用，0=停用';
COMMENT ON COLUMN "public"."sys__dept"."deleted" IS '逻辑删除';
COMMENT ON COLUMN "public"."sys__dept"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."sys__dept"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."sys__dept" IS '系统--组织部门表';

-- ----------------------------
-- Records of sys__dept
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (1, NULL, 1, '旭升的企业1', 'QY', '/1', 1, 2, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (2, 1, 1, '研发部1', 'YF', '/1/2', 1, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (3, 1, 1, '市场部1', 'SC', '/1/3', 2, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (4, 2, 1, '前端组1', 'QD', '/1/2/4', 1, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (5, 2, 1, '后端组1', 'HD', '/1/2/5', 2, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (6, NULL, 6, '旭升的企业2', 'QY', '/6', 1, 3, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (7, 6, 6, '研发部2', 'YF', '/6/7', 1, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (8, 6, 6, '市场部2', 'SC', '/6/8', 2, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (9, 7, 6, '前端组2', 'QD', '/6/7/9', 1, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__dept" ("id", "parent_id", "tenant_id", "name", "code", "path", "sort", "leader_id", "status", "deleted", "created_at", "updated_at") VALUES (10, 7, 6, '后端组2', 'HD', '/6/7/10', 2, NULL, 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
COMMIT;

-- ----------------------------
-- Table structure for sys__permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys__permission";
CREATE TABLE "public"."sys__permission" (
  "id" int8 NOT NULL,
  "parent_id" int8,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "method" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "module_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "auth_level" int4 NOT NULL,
  "status" int2 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."sys__permission" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."sys__permission"."id" IS '主键';
COMMENT ON COLUMN "public"."sys__permission"."parent_id" IS '父权限ID';
COMMENT ON COLUMN "public"."sys__permission"."name" IS '权限名';
COMMENT ON COLUMN "public"."sys__permission"."code" IS '权限编码';
COMMENT ON COLUMN "public"."sys__permission"."method" IS '请求方式';
COMMENT ON COLUMN "public"."sys__permission"."path" IS '接口路径';
COMMENT ON COLUMN "public"."sys__permission"."module_name" IS '权限模块名称';
COMMENT ON COLUMN "public"."sys__permission"."auth_level" IS '访问级别：0权限校验 1白名单 2登录即可';
COMMENT ON COLUMN "public"."sys__permission"."status" IS '状态：1=启用，0=停用';
COMMENT ON COLUMN "public"."sys__permission"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."sys__permission"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."sys__permission" IS '系统--权限表';

-- ----------------------------
-- Records of sys__permission
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys__permission" ("id", "parent_id", "name", "code", "method", "path", "module_name", "auth_level", "status", "created_at", "updated_at") VALUES (1, NULL, '全局模块', 'ALL', '*', '/**', '全局', 0, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__permission" ("id", "parent_id", "name", "code", "method", "path", "module_name", "auth_level", "status", "created_at", "updated_at") VALUES (2, 1, '全局查看', 'ALL_GET', 'GET', '/**', '全局', 0, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
COMMIT;

-- ----------------------------
-- Table structure for sys__role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys__role";
CREATE TABLE "public"."sys__role" (
  "id" int8 NOT NULL,
  "tenant_id" int8,
  "name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "deleted" int2 NOT NULL,
  "source" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."sys__role" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."sys__role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys__role"."tenant_id" IS '租户 / 公司ID（SaaS隔离）';
COMMENT ON COLUMN "public"."sys__role"."name" IS '角色名';
COMMENT ON COLUMN "public"."sys__role"."code" IS '角色编码';
COMMENT ON COLUMN "public"."sys__role"."deleted" IS '逻辑删除';
COMMENT ON COLUMN "public"."sys__role"."source" IS '数据来源：SYSTEM=系统内置，USER=用户创建';
COMMENT ON COLUMN "public"."sys__role"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."sys__role"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."sys__role" IS '系统--角色表';

-- ----------------------------
-- Records of sys__role
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys__role" ("id", "tenant_id", "name", "code", "deleted", "source", "created_at", "updated_at") VALUES (1, NULL, '超级管理员', 'SUPER_ADMIN', 0, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__role" ("id", "tenant_id", "name", "code", "deleted", "source", "created_at", "updated_at") VALUES (2, NULL, '观察者', 'OBSERVER', 0, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
COMMIT;

-- ----------------------------
-- Table structure for sys__role_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys__role_permission";
CREATE TABLE "public"."sys__role_permission" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL,
  "source" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."sys__role_permission" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."sys__role_permission"."id" IS '主键';
COMMENT ON COLUMN "public"."sys__role_permission"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys__role_permission"."permission_id" IS '权限ID';
COMMENT ON COLUMN "public"."sys__role_permission"."source" IS '数据来源：SYSTEM=系统内置，USER=用户创建';
COMMENT ON COLUMN "public"."sys__role_permission"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."sys__role_permission"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."sys__role_permission" IS '系统--角色-权限关联表';

-- ----------------------------
-- Records of sys__role_permission
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys__role_permission" ("id", "role_id", "permission_id", "source", "created_at", "updated_at") VALUES (1, 1, 1, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__role_permission" ("id", "role_id", "permission_id", "source", "created_at", "updated_at") VALUES (2, 2, 2, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
COMMIT;

-- ----------------------------
-- Table structure for sys__user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys__user";
CREATE TABLE "public"."sys__user" (
  "id" int8 NOT NULL,
  "dept_id" int8,
  "tenant_id" int8,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "token_version" int4 NOT NULL,
  "sort" int4 NOT NULL,
  "source" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "status" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."sys__user" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."sys__user"."id" IS '主键';
COMMENT ON COLUMN "public"."sys__user"."dept_id" IS '所属部门ID';
COMMENT ON COLUMN "public"."sys__user"."tenant_id" IS '租户 / 公司ID（SaaS隔离）';
COMMENT ON COLUMN "public"."sys__user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys__user"."name" IS '用户名';
COMMENT ON COLUMN "public"."sys__user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys__user"."token_version" IS 'token版本';
COMMENT ON COLUMN "public"."sys__user"."sort" IS '排序';
COMMENT ON COLUMN "public"."sys__user"."source" IS '数据来源：SYSTEM=系统内置，USER=用户创建';
COMMENT ON COLUMN "public"."sys__user"."status" IS '状态：1=启用，0=停用';
COMMENT ON COLUMN "public"."sys__user"."deleted" IS '逻辑删除';
COMMENT ON COLUMN "public"."sys__user"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."sys__user"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."sys__user" IS '系统--用户表';

-- ----------------------------
-- Records of sys__user
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys__user" ("id", "dept_id", "tenant_id", "email", "name", "password", "token_version", "sort", "source", "status", "deleted", "created_at", "updated_at") VALUES (1, NULL, NULL, 'admin@qq.com', 'admin', '$2a$10$0.RvF.iEnw4grHb.WkAfdOi7qeKPyIfXDIAtrlZZk6QtfCNsRugMO', 0, 0, 'SYSTEM', 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__user" ("id", "dept_id", "tenant_id", "email", "name", "password", "token_version", "sort", "source", "status", "deleted", "created_at", "updated_at") VALUES (2, 1, 1, 'xusheng94@qq.com', '旭升1', '$2a$10$zIbKDqIoDB8U6NkolRYfE.f9W9/BajwuZ/6KdbqzK8LyU6SgUIhUu', 0, 0, 'SYSTEM', 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__user" ("id", "dept_id", "tenant_id", "email", "name", "password", "token_version", "sort", "source", "status", "deleted", "created_at", "updated_at") VALUES (3, 6, 6, '695644578@qq.com', '旭升2', '$2a$10$zIbKDqIoDB8U6NkolRYfE.f9W9/BajwuZ/6KdbqzK8LyU6SgUIhUu', 0, 0, 'SYSTEM', 1, 0, '2026-01-26 05:52:08', '2026-01-26 05:52:08');
COMMIT;

-- ----------------------------
-- Table structure for sys__user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys__user_role";
CREATE TABLE "public"."sys__user_role" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "source" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."sys__user_role" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."sys__user_role"."id" IS '主键';
COMMENT ON COLUMN "public"."sys__user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys__user_role"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys__user_role"."source" IS '数据来源：SYSTEM=系统内置，USER=用户创建';
COMMENT ON COLUMN "public"."sys__user_role"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."sys__user_role"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."sys__user_role" IS '系统--用户-角色关联表';

-- ----------------------------
-- Records of sys__user_role
-- ----------------------------
BEGIN;
INSERT INTO "public"."sys__user_role" ("id", "user_id", "role_id", "source", "created_at", "updated_at") VALUES (1, 1, 1, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__user_role" ("id", "user_id", "role_id", "source", "created_at", "updated_at") VALUES (2, 2, 1, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
INSERT INTO "public"."sys__user_role" ("id", "user_id", "role_id", "source", "created_at", "updated_at") VALUES (3, 3, 1, 'SYSTEM', '2026-01-26 05:52:08', '2026-01-26 05:52:08');
COMMIT;

-- ----------------------------
-- Table structure for test_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."test_table";
CREATE TABLE "public"."test_table" (
  "id" int8 NOT NULL,
  "tenant_id" int8,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "sort" int4 NOT NULL,
  "status" int2 NOT NULL,
  "deleted" int2 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6) NOT NULL
)
;
ALTER TABLE "public"."test_table" OWNER TO "xusheng";
COMMENT ON COLUMN "public"."test_table"."id" IS '主键';
COMMENT ON COLUMN "public"."test_table"."tenant_id" IS '租户 / 公司ID（SaaS隔离）';
COMMENT ON COLUMN "public"."test_table"."name" IS '名称';
COMMENT ON COLUMN "public"."test_table"."sort" IS '排序';
COMMENT ON COLUMN "public"."test_table"."status" IS '状态：1=启用，0=停用';
COMMENT ON COLUMN "public"."test_table"."deleted" IS '逻辑删除';
COMMENT ON COLUMN "public"."test_table"."created_at" IS '创建时间';
COMMENT ON COLUMN "public"."test_table"."updated_at" IS '更新时间';
COMMENT ON TABLE "public"."test_table" IS '测试表';

-- ----------------------------
-- Records of test_table
-- ----------------------------
BEGIN;
INSERT INTO "public"."test_table" ("id", "tenant_id", "name", "sort", "status", "deleted", "created_at", "updated_at") VALUES (2015372023198502913, NULL, 'string', 1073741824, 1, 0, '2026-01-25 10:31:49', '2026-01-25 10:31:49');
COMMIT;

-- ----------------------------
-- Indexes structure for table sys__dept
-- ----------------------------
CREATE INDEX "idx_parent_id" ON "public"."sys__dept" USING btree (
  "parent_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_path" ON "public"."sys__dept" USING btree (
  "path" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);
CREATE INDEX "idx_tenant" ON "public"."sys__dept" USING btree (
  "tenant_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys__dept
-- ----------------------------
ALTER TABLE "public"."sys__dept" ADD CONSTRAINT "sys__dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys__permission
-- ----------------------------
ALTER TABLE "public"."sys__permission" ADD CONSTRAINT "sys__permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys__role
-- ----------------------------
CREATE INDEX "idx_sys__role_tenant_id" ON "public"."sys__role" USING btree (
  "tenant_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys__role
-- ----------------------------
ALTER TABLE "public"."sys__role" ADD CONSTRAINT "sys__role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys__role_permission
-- ----------------------------
CREATE UNIQUE INDEX "uniq_role_permission" ON "public"."sys__role_permission" USING btree (
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "permission_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys__role_permission
-- ----------------------------
ALTER TABLE "public"."sys__role_permission" ADD CONSTRAINT "sys__role_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys__user
-- ----------------------------
CREATE INDEX "idx_dept_id" ON "public"."sys__user" USING btree (
  "dept_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);
CREATE INDEX "idx_sys__user_tenant_id" ON "public"."sys__user" USING btree (
  "tenant_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys__user
-- ----------------------------
ALTER TABLE "public"."sys__user" ADD CONSTRAINT "sys__user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys__user_role
-- ----------------------------
CREATE UNIQUE INDEX "uniq_user_role" ON "public"."sys__user_role" USING btree (
  "user_id" "pg_catalog"."int8_ops" ASC NULLS LAST,
  "role_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys__user_role
-- ----------------------------
ALTER TABLE "public"."sys__user_role" ADD CONSTRAINT "sys__user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table test_table
-- ----------------------------
CREATE INDEX "idx_tenant_id" ON "public"."test_table" USING btree (
  "tenant_id" "pg_catalog"."int8_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table test_table
-- ----------------------------
ALTER TABLE "public"."test_table" ADD CONSTRAINT "test_table_pkey" PRIMARY KEY ("id");
