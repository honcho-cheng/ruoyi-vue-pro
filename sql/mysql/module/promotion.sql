DROP TABLE IF EXISTS `promotion_article_category`;

CREATE TABLE `promotion_article_category`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`        VARCHAR(255) NOT NULL COMMENT '文章分类名称',
    `pic_url`     VARCHAR(512) NOT NULL COMMENT '图标地址',
    `status`      INT          NOT NULL COMMENT '状态',
    `sort`        INT          NOT NULL COMMENT '排序',


    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_article`;

CREATE TABLE `promotion_article`
(
    `creator`          varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`          varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`        bigint       NOT NULL DEFAULT '0',
    `id`               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`          TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `category_id`      BIGINT       NOT NULL COMMENT '分类编号',
    `spu_id`           BIGINT       NOT NULL COMMENT '关联商品编号',
    `title`            VARCHAR(255) NOT NULL COMMENT '文章标题',
    `author`           VARCHAR(255) NOT NULL COMMENT '作者',
    `pic_url`          VARCHAR(512) NOT NULL COMMENT '封面图片',
    `introduction`     TEXT         NOT NULL COMMENT '简介',
    `browse_count`     INT          NOT NULL DEFAULT 0 COMMENT '浏览次数',
    `sort`             INT          NOT NULL COMMENT '排序',
    `status`           INT          NOT NULL COMMENT '状态',
    `recommend_hot`    TINYINT      NOT NULL DEFAULT 0 COMMENT '是否热门',
    `recommend_banner` TINYINT      NOT NULL DEFAULT 0 COMMENT '是否轮播图',
    `content`          TEXT         NOT NULL COMMENT '文章内容',

    KEY `idx_category_id` (`category_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_banner`;

CREATE TABLE `promotion_banner`
(
    `creator`      varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint       NOT NULL DEFAULT '0',
    `id`           BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`      TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `title`        VARCHAR(255) NOT NULL COMMENT '标题',
    `url`          VARCHAR(512) NOT NULL COMMENT '跳转链接',
    `pic_url`      VARCHAR(512) NOT NULL COMMENT '图片链接',
    `sort`         INT          NOT NULL COMMENT '排序',
    `status`       INT          NOT NULL COMMENT '状态',
    `position`     INT          NOT NULL COMMENT '定位',
    `memo`         TEXT COMMENT '备注',
    `browse_count` INT          NOT NULL DEFAULT 0 COMMENT '点击次数',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_banner`;

CREATE TABLE `promotion_banner`
(
    `creator`      varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint       NOT NULL DEFAULT '0',
    `id`           BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`      TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `title`        VARCHAR(255) NOT NULL COMMENT '标题',
    `url`          VARCHAR(512) NOT NULL COMMENT '跳转链接',
    `pic_url`      VARCHAR(512) NOT NULL COMMENT '图片链接',
    `sort`         INT          NOT NULL COMMENT '排序',
    `status`       INT          NOT NULL COMMENT '状态',
    `position`     INT          NOT NULL COMMENT '定位',
    `memo`         TEXT COMMENT '备注',
    `browse_count` INT          NOT NULL DEFAULT 0 COMMENT '点击次数',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_bargain_activity`;

CREATE TABLE `promotion_bargain_activity`
(
    `creator`             varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint       NOT NULL DEFAULT '0',
    `id`                  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`                VARCHAR(255) NOT NULL COMMENT '活动名称',
    `start_time`          DATETIME     NOT NULL COMMENT '开始时间',
    `end_time`            DATETIME     NOT NULL COMMENT '结束时间',
    `status`              INT          NOT NULL COMMENT '活动状态',
    `spu_id`              BIGINT       NOT NULL COMMENT '商品 SPU 编号',
    `sku_id`              BIGINT       NOT NULL COMMENT '商品 SKU 编号',
    `bargain_first_price` INT          NOT NULL COMMENT '起始价格',
    `bargain_min_price`   INT          NOT NULL COMMENT '底价',
    `stock`               INT          NOT NULL COMMENT '库存',
    `total_stock`         INT          NOT NULL COMMENT '总库存',
    `help_max_count`      INT          NOT NULL COMMENT '砍价人数',
    `bargain_count`       INT          NOT NULL COMMENT '帮砍次数',
    `total_limit_count`   INT          NOT NULL COMMENT '总限购数量',
    `random_min_price`    INT          NOT NULL COMMENT '最小砍价金额',
    `random_max_price`    INT          NOT NULL COMMENT '最大砍价金额',

    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_bargain_help`;

CREATE TABLE `promotion_bargain_help`
(
    `creator`      varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint      NOT NULL DEFAULT '0',
    `id`           BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`      TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `activity_id`  BIGINT      NOT NULL COMMENT '活动编号',
    `record_id`    BIGINT      NOT NULL COMMENT '记录编号',
    `user_id`      BIGINT      NOT NULL COMMENT '用户编号',
    `reduce_price` INT         NOT NULL COMMENT '减少价格',

    KEY `idx_activity_id` (`activity_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_bargain_record`;

CREATE TABLE `promotion_bargain_record`
(
    `creator`             varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint      NOT NULL DEFAULT '0',
    `id`                  BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`             BIGINT      NOT NULL COMMENT '用户编号',
    `activity_id`         BIGINT      NOT NULL COMMENT '活动编号',
    `spu_id`              BIGINT      NOT NULL COMMENT 'SPU 编号',
    `sku_id`              BIGINT      NOT NULL COMMENT 'SKU 编号',
    `bargain_first_price` INT         NOT NULL COMMENT '起始价格',
    `bargain_price`       INT         NOT NULL COMMENT '当前价格',
    `status`              INT         NOT NULL COMMENT '砍价状态',
    `end_time`            DATETIME COMMENT '结束时间',
    `order_id`            BIGINT COMMENT '订单编号',

    KEY `idx_activity_id` (`activity_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_combination_activity`;

CREATE TABLE `promotion_combination_activity`
(
    `creator`            varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`            varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`          bigint       NOT NULL DEFAULT '0',
    `id`                 BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`            TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`               VARCHAR(255) NOT NULL COMMENT '拼团名称',
    `spu_id`             BIGINT       NOT NULL COMMENT 'SPU 编号',
    `total_limit_count`  INT          NOT NULL COMMENT '总限购数量',
    `single_limit_count` INT          NOT NULL COMMENT '单次限购数量',
    `start_time`         DATETIME     NOT NULL COMMENT '开始时间',
    `end_time`           DATETIME     NOT NULL COMMENT '结束时间',
    `user_size`          INT          NOT NULL COMMENT '几人团',
    `virtual_group`      TINYINT      NOT NULL DEFAULT 0 COMMENT '虚拟成团',
    `status`             INT          NOT NULL COMMENT '活动状态',
    `limit_duration`     INT          NOT NULL COMMENT '限制时长',

    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_combination_product`;

CREATE TABLE `promotion_combination_product`
(
    `creator`             varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint      NOT NULL DEFAULT '0',
    `id`                  BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `activity_id`         BIGINT      NOT NULL COMMENT '活动编号',
    `spu_id`              BIGINT      NOT NULL COMMENT 'SPU 编号',
    `sku_id`              BIGINT      NOT NULL COMMENT 'SKU 编号',
    `combination_price`   INT         NOT NULL COMMENT '拼团价格（分）',
    `activity_status`     INT         NOT NULL COMMENT '活动状态',
    `activity_start_time` DATETIME    NOT NULL COMMENT '活动开始时间',
    `activity_end_time`   DATETIME    NOT NULL COMMENT '活动结束时间',

    KEY `idx_activity_id` (`activity_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_combination_record`;

CREATE TABLE `promotion_combination_record`
(
    `creator`           varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint       NOT NULL DEFAULT '0',
    `id`                BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`           TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `activity_id`       BIGINT       NOT NULL COMMENT '活动编号',
    `combination_price` INT          NOT NULL COMMENT '拼团价格（分）',
    `spu_id`            BIGINT       NOT NULL COMMENT 'SPU 编号',
    `spu_name`          VARCHAR(255) NOT NULL COMMENT 'SPU 名称',
    `pic_url`           VARCHAR(512) NOT NULL COMMENT '商品图片',
    `sku_id`            BIGINT       NOT NULL COMMENT 'SKU 编号',
    `count`             INT          NOT NULL COMMENT '购买数量',
    `user_id`           BIGINT       NOT NULL COMMENT '用户编号',
    `nickname`          VARCHAR(255) NOT NULL COMMENT '用户昵称',
    `avatar`            VARCHAR(512) NOT NULL COMMENT '用户头像',
    `head_id`           BIGINT       NOT NULL DEFAULT 0 COMMENT '团长编号',
    `status`            INT          NOT NULL COMMENT '开团状态',
    `order_id`          BIGINT COMMENT '订单编号',
    `user_size`         INT          NOT NULL COMMENT '需要人数',
    `user_count`        INT          NOT NULL DEFAULT 0 COMMENT '已加入人数',
    `virtual_group`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否虚拟成团',
    `expire_time`       DATETIME COMMENT '过期时间',
    `start_time`        DATETIME     NOT NULL COMMENT '开始时间',
    `end_time`          DATETIME COMMENT '结束时间',

    KEY `idx_activity_id` (`activity_id`),
    KEY `idx_user_id` (`user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_coupon_template`;

CREATE TABLE `promotion_coupon_template`
(
    `creator`              varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`              varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`            bigint       NOT NULL DEFAULT '0',
    `id`                   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`                 VARCHAR(255) NOT NULL COMMENT '优惠券名',
    `description`          TEXT COMMENT '说明',
    `status`               INT          NOT NULL COMMENT '状态（CommonStatusEnum）',
    `total_count`          INT          NOT NULL DEFAULT -1 COMMENT '发放数量（-1不限制）',
    `take_limit_count`     INT          NOT NULL DEFAULT -1 COMMENT '每人限领数（-1不限制）',
    `take_type`            INT          NOT NULL COMMENT '领取方式',
    `use_price`            INT          NOT NULL DEFAULT 0 COMMENT '满多少可用（分）',
    `product_scope`        INT          NOT NULL COMMENT '商品范围',
    `product_scope_values` JSON         NOT NULL COMMENT '商品范围值数组',
    `validity_type`        INT          NOT NULL COMMENT '生效类型',
    `valid_start_time`     DATETIME COMMENT '固定生效开始时间',
    `valid_end_time`       DATETIME COMMENT '固定生效结束时间',
    `fixed_start_term`     INT COMMENT '领取后开始天数',
    `fixed_end_term`       INT COMMENT '领取后结束天数',
    `discount_type`        INT          NOT NULL COMMENT '折扣类型',
    `discount_percent`     INT COMMENT '折扣百分比',
    `discount_price`       INT COMMENT '优惠金额（分）',
    `discount_limit_price` INT COMMENT '折扣上限（分）',
    `take_count`           INT          NOT NULL DEFAULT 0 COMMENT '领取总数',
    `use_count`            INT          NOT NULL DEFAULT 0 COMMENT '使用总数',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_coupon`;

CREATE TABLE `promotion_coupon`
(
    `creator`              varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`              varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`            bigint       NOT NULL DEFAULT '0',
    `id`                   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `template_id`          BIGINT       NOT NULL COMMENT '模板编号',
    `name`                 VARCHAR(255) NOT NULL COMMENT '优惠券名',
    `status`               INT          NOT NULL COMMENT '优惠券状态',
    `user_id`              BIGINT       NOT NULL COMMENT '用户编号',
    `take_type`            INT          NOT NULL COMMENT '领取类型',
    `use_price`            INT          NOT NULL DEFAULT 0 COMMENT '满多少可用（分）',
    `valid_start_time`     DATETIME     NOT NULL COMMENT '生效开始时间',
    `valid_end_time`       DATETIME     NOT NULL COMMENT '生效结束时间',
    `product_scope`        INT          NOT NULL COMMENT '商品范围',
    `product_scope_values` JSON         NOT NULL COMMENT '商品范围值数组',
    `discount_type`        INT          NOT NULL COMMENT '折扣类型',
    `discount_percent`     INT COMMENT '折扣百分比',
    `discount_price`       INT COMMENT '优惠金额（分）',
    `discount_limit_price` INT COMMENT '折扣上限（分）',
    `use_order_id`         BIGINT COMMENT '使用订单编号',
    `use_time`             DATETIME COMMENT '使用时间',

    KEY `idx_template_id` (`template_id`),
    KEY `idx_user_id` (`user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_discount_activity`;

CREATE TABLE `promotion_discount_activity`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`        VARCHAR(255) NOT NULL COMMENT '活动标题',
    `status`      INT          NOT NULL COMMENT '状态（CommonStatusEnum）',
    `start_time`  DATETIME     NOT NULL COMMENT '开始时间',
    `end_time`    DATETIME     NOT NULL COMMENT '结束时间',
    `remark`      TEXT COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;



DROP TABLE IF EXISTS `promotion_discount_product`;

CREATE TABLE `promotion_discount_product`
(
    `creator`             varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint       NOT NULL DEFAULT '0',
    `id`                  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `activity_id`         BIGINT       NOT NULL COMMENT '活动编号',
    `spu_id`              BIGINT       NOT NULL COMMENT 'SPU 编号',
    `sku_id`              BIGINT       NOT NULL COMMENT 'SKU 编号',
    `discount_type`       INT          NOT NULL COMMENT '折扣类型',
    `discount_percent`    INT COMMENT '折扣百分比',
    `discount_price`      INT COMMENT '优惠金额（分）',
    `activity_name`       VARCHAR(255) NOT NULL COMMENT '活动标题',
    `activity_status`     INT          NOT NULL COMMENT '活动状态',
    `activity_start_time` DATETIME     NOT NULL COMMENT '活动开始时间',
    `activity_end_time`   DATETIME     NOT NULL COMMENT '活动结束时间',

    KEY `idx_activity_id` (`activity_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_diy_page`;

CREATE TABLE `promotion_diy_page`
(
    `creator`          varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`          varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`        bigint       NOT NULL DEFAULT '0',
    `id`               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`          TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `template_id`      BIGINT       NOT NULL COMMENT '装修模板编号',
    `name`             VARCHAR(255) NOT NULL COMMENT '页面名称',
    `remark`           TEXT COMMENT '备注',
    `preview_pic_urls` JSON         NOT NULL COMMENT '预览图列表',
    `property`         TEXT COMMENT '页面属性 JSON',

    KEY `idx_template_id` (`template_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_diy_template`;

CREATE TABLE `promotion_diy_template`
(
    `creator`          varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`          varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`        bigint       NOT NULL DEFAULT '0',
    `id`               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`          TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`             VARCHAR(255) NOT NULL COMMENT '模板名称',
    `used`             TINYINT      NOT NULL DEFAULT 0 COMMENT '是否使用',
    `used_time`        DATETIME COMMENT '使用时间',
    `remark`           TEXT COMMENT '备注',
    `preview_pic_urls` JSON         NOT NULL COMMENT '预览图列表',
    `property`         TEXT COMMENT 'uni-app 配置 JSON',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `promotion_kefu_conversation`;

CREATE TABLE `promotion_kefu_conversation`
(
    `creator`                    varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`                    varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`                  bigint      NOT NULL DEFAULT '0',
    `id`                         BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`                DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`                    TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`                    BIGINT      NOT NULL COMMENT '所属用户编号',
    `last_message_time`          DATETIME COMMENT '最后聊天时间',
    `last_message_content`       TEXT COMMENT '最后聊天内容',
    `last_message_content_type`  INT         NOT NULL COMMENT '消息类型',
    `admin_pinned`               TINYINT     NOT NULL DEFAULT 0 COMMENT '管理员置顶',
    `user_deleted`               TINYINT     NOT NULL DEFAULT 0 COMMENT '用户是否删除',
    `admin_deleted`              TINYINT     NOT NULL DEFAULT 0 COMMENT '管理员是否删除',
    `admin_unread_message_count` INT         NOT NULL DEFAULT 0 COMMENT '管理员未读消息数',

    KEY `idx_user_id` (`user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_kefu_message`;

CREATE TABLE `promotion_kefu_message`
(
    `creator`         varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`         varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`       bigint      NOT NULL DEFAULT '0',
    `id`              BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`     DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`         TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `conversation_id` BIGINT      NOT NULL COMMENT '会话编号',
    `sender_id`       BIGINT      NOT NULL COMMENT '发送人编号',
    `sender_type`     INT         NOT NULL COMMENT '发送人类型',
    `receiver_id`     BIGINT      NOT NULL COMMENT '接收人编号',
    `receiver_type`   INT         NOT NULL COMMENT '接收人类型',
    `content_type`    INT         NOT NULL COMMENT '消息类型',
    `content`         TEXT        NOT NULL COMMENT '消息内容',
    `read_status`     TINYINT     NOT NULL DEFAULT 0 COMMENT '是否已读',

    KEY `idx_conversation_id` (`conversation_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_point_activity`;

CREATE TABLE `promotion_point_activity`
(
    `creator`     varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint      NOT NULL DEFAULT '0',
    `id`          BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `spu_id`      BIGINT      NOT NULL COMMENT 'SPU 编号',
    `status`      INT         NOT NULL COMMENT '活动状态',
    `remark`      TEXT COMMENT '备注',
    `sort`        INT         NOT NULL COMMENT '排序',
    `stock`       INT         NOT NULL COMMENT '剩余库存',
    `total_stock` INT         NOT NULL COMMENT '总库存',

    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_point_product`;

CREATE TABLE `promotion_point_product`
(
    `creator`         varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`         varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`       bigint      NOT NULL DEFAULT '0',
    `id`              BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`     DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`         TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `activity_id`     BIGINT      NOT NULL COMMENT '积分活动编号',
    `spu_id`          BIGINT      NOT NULL COMMENT 'SPU 编号',
    `sku_id`          BIGINT      NOT NULL COMMENT 'SKU 编号',
    `count`           INT         NOT NULL COMMENT '兑换次数',
    `point`           INT         NOT NULL COMMENT '所需积分',
    `price`           INT         NOT NULL COMMENT '所需金额（分）',
    `stock`           INT         NOT NULL COMMENT '库存',
    `activity_status` INT         NOT NULL COMMENT '活动状态',

    KEY `idx_activity_id` (`activity_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_reward_activity`;

CREATE TABLE `promotion_reward_activity`
(
    `creator`              varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`              varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`            bigint       NOT NULL DEFAULT '0',
    `id`                   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`                 VARCHAR(255) NOT NULL COMMENT '活动标题',
    `status`               INT          NOT NULL COMMENT '状态（CommonStatusEnum）',
    `start_time`           DATETIME     NOT NULL COMMENT '开始时间',
    `end_time`             DATETIME     NOT NULL COMMENT '结束时间',
    `remark`               TEXT COMMENT '备注',
    `condition_type`       INT          NOT NULL COMMENT '条件类型',
    `product_scope`        INT          NOT NULL COMMENT '商品范围',
    `product_scope_values` JSON         NOT NULL COMMENT '商品范围值数组',
    `rules`                JSON         NOT NULL COMMENT '优惠规则',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_seckill_activity`;

CREATE TABLE `promotion_seckill_activity`
(
    `id`                 BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`            TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `spu_id`             BIGINT       NOT NULL COMMENT 'SPU 编号',
    `name`               VARCHAR(255) NOT NULL COMMENT '秒杀名称',
    `status`             INT          NOT NULL COMMENT '活动状态（CommonStatusEnum）',
    `remark`             TEXT COMMENT '备注',
    `start_time`         DATETIME     NOT NULL COMMENT '开始时间',
    `end_time`           DATETIME     NOT NULL COMMENT '结束时间',
    `sort`               INT          NOT NULL COMMENT '排序',
    `config_ids`         JSON         NOT NULL COMMENT '秒杀时段 ID 列表',
    `total_limit_count`  INT          NOT NULL COMMENT '总限购数量',
    `single_limit_count` INT          NOT NULL COMMENT '单次限购数量',
    `stock`              INT          NOT NULL COMMENT '剩余库存',
    `total_stock`        INT          NOT NULL COMMENT '总库存',

    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_seckill_config`;

CREATE TABLE `promotion_seckill_config`
(
    `creator`         varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`         varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`       bigint       NOT NULL DEFAULT '0',
    `id`              BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`         TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`            VARCHAR(255) NOT NULL COMMENT '时段名称',
    `start_time`      VARCHAR(10)  NOT NULL COMMENT '开始时间点（HH:mm）',
    `end_time`        VARCHAR(10)  NOT NULL COMMENT '结束时间点（HH:mm）',
    `slider_pic_urls` JSON         NOT NULL COMMENT '轮播图列表',
    `status`          INT          NOT NULL COMMENT '状态（CommonStatusEnum）',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `promotion_seckill_product`;

CREATE TABLE `promotion_seckill_product`
(
    `creator`             varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint      NOT NULL DEFAULT '0',
    `id`                  BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `activity_id`         BIGINT      NOT NULL COMMENT '活动编号',
    `config_ids`          JSON        NOT NULL COMMENT '秒杀时段 ID 列表',
    `spu_id`              BIGINT      NOT NULL COMMENT 'SPU 编号',
    `sku_id`              BIGINT      NOT NULL COMMENT 'SKU 编号',
    `seckill_price`       INT         NOT NULL COMMENT '秒杀价格（分）',
    `stock`               INT         NOT NULL COMMENT '库存',
    `activity_status`     INT         NOT NULL COMMENT '活动状态（CommonStatusEnum）',
    `activity_start_time` DATETIME    NOT NULL COMMENT '活动开始时间',
    `activity_end_time`   DATETIME    NOT NULL COMMENT '活动结束时间',

    KEY `idx_activity_id` (`activity_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
