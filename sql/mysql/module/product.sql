DROP TABLE IF EXISTS `product_brand`;

CREATE TABLE `product_brand`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`        VARCHAR(255) NOT NULL COMMENT '品牌名称',
    `pic_url`     VARCHAR(512) NOT NULL COMMENT '品牌图片',
    `sort`        INT          NOT NULL COMMENT '品牌排序',
    `description` TEXT COMMENT '品牌描述',
    `status`      INT          NOT NULL COMMENT '状态（CommonStatusEnum）',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `parent_id`   BIGINT       NOT NULL DEFAULT 0 COMMENT '父分类编号',
    `name`        VARCHAR(255) NOT NULL COMMENT '分类名称',
    `pic_url`     VARCHAR(512) NOT NULL COMMENT '移动端分类图',
    `sort`        INT          NOT NULL COMMENT '分类排序',
    `status`      INT          NOT NULL COMMENT '开启状态（CommonStatusEnum）',

    KEY `idx_parent_id` (`parent_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;



DROP TABLE IF EXISTS `product_comment`;

CREATE TABLE `product_comment`
(
    `creator`            varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`            varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`          bigint       NOT NULL DEFAULT '0',
    `id`                 BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`            TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`            BIGINT       NOT NULL COMMENT '评价人用户编号',
    `user_nickname`      VARCHAR(255) NOT NULL COMMENT '评价人名称',
    `user_avatar`        VARCHAR(512) NOT NULL COMMENT '评价人头像',
    `anonymous`          TINYINT      NOT NULL DEFAULT 0 COMMENT '是否匿名',
    `order_id`           BIGINT       NOT NULL COMMENT '交易订单编号',
    `order_item_id`      BIGINT       NOT NULL COMMENT '交易订单项编号',
    `spu_id`             BIGINT       NOT NULL COMMENT '商品 SPU 编号',
    `spu_name`           VARCHAR(255) NOT NULL COMMENT '商品 SPU 名称',
    `sku_id`             BIGINT       NOT NULL COMMENT '商品 SKU 编号',
    `sku_pic_url`        VARCHAR(512) NOT NULL COMMENT 'SKU 图片地址',
    `sku_properties`     JSON         NOT NULL COMMENT '属性数组',
    `visible`            TINYINT      NOT NULL DEFAULT 1 COMMENT '是否可见',
    `scores`             INT          NOT NULL COMMENT '评分星级',
    `description_scores` INT          NOT NULL COMMENT '描述星级',
    `benefit_scores`     INT          NOT NULL COMMENT '服务星级',
    `content`            TEXT         NOT NULL COMMENT '评论内容',
    `pic_urls`           JSON         NOT NULL COMMENT '评论图片地址数组',
    `reply_status`       TINYINT      NOT NULL DEFAULT 0 COMMENT '商家是否回复',
    `reply_user_id`      BIGINT COMMENT '回复管理员编号',
    `reply_content`      TEXT COMMENT '商家回复内容',
    `reply_time`         DATETIME COMMENT '商家回复时间',

    KEY `idx_spu_id` (`spu_id`),
    KEY `idx_sku_id` (`sku_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `product_favorite`;

CREATE TABLE `product_favorite`
(
    `creator`     varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint      NOT NULL DEFAULT '0',
    `id`          BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`     BIGINT      NOT NULL COMMENT '用户编号',
    `spu_id`      BIGINT      NOT NULL COMMENT '商品 SPU 编号',

    UNIQUE KEY `uk_user_id_spu_id` (`user_id`, `spu_id`),
    KEY `idx_user_id` (`user_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `product_browse_history`;

CREATE TABLE `product_browse_history`
(
    `creator`      varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint      NOT NULL DEFAULT '0',
    `id`           BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`      TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `spu_id`       BIGINT      NOT NULL COMMENT '商品 SPU 编号',
    `user_id`      BIGINT      NOT NULL COMMENT '用户编号',
    `user_deleted` TINYINT     NOT NULL DEFAULT 0 COMMENT '用户是否删除',

    KEY `idx_user_id` (`user_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `product_browse_history`;

CREATE TABLE `product_browse_history`
(
    `creator`      varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint      NOT NULL DEFAULT '0',
    `id`           BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`      TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `spu_id`       BIGINT      NOT NULL COMMENT '商品 SPU 编号',
    `user_id`      BIGINT      NOT NULL COMMENT '用户编号',
    `user_deleted` TINYINT     NOT NULL DEFAULT 0 COMMENT '用户是否删除',

    KEY `idx_user_id` (`user_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `product_property`;

CREATE TABLE `product_property`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`        VARCHAR(255) NOT NULL COMMENT '属性名称',
    `remark`      TEXT COMMENT '备注',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `product_property_value`;

CREATE TABLE `product_property_value`
(
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `property_id` BIGINT       NOT NULL COMMENT '属性项编号',
    `name`        VARCHAR(255) NOT NULL COMMENT '属性值名称',
    `remark`      TEXT COMMENT '备注',

    KEY `idx_property_id` (`property_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `product_sku`;

CREATE TABLE `product_sku`
(
    `id`                     BIGINT         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`            DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`            DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`                TINYINT        NOT NULL DEFAULT 0 COMMENT '是否删除',
    `spu_id`                 BIGINT         NOT NULL COMMENT 'SPU 编号',
    `properties`             JSON           NOT NULL COMMENT '属性数组',
    `price`                  INT            NOT NULL COMMENT '商品价格，单位分',
    `market_price`           INT            NOT NULL COMMENT '市场价，单位分',
    `cost_price`             INT            NOT NULL COMMENT '成本价，单位分',
    `bar_code`               VARCHAR(255) COMMENT '商品条码',
    `pic_url`                VARCHAR(512)   NOT NULL COMMENT '图片地址',
    `stock`                  INT            NOT NULL COMMENT '库存',
    `weight`                 DECIMAL(10, 2) NOT NULL COMMENT '商品重量 kg',
    `volume`                 DECIMAL(10, 2) NOT NULL COMMENT '商品体积 m^3',
    `first_brokerage_price`  INT            NOT NULL COMMENT '一级分销佣金，单位分',
    `second_brokerage_price` INT            NOT NULL COMMENT '二级分销佣金，单位分',
    `sales_count`            INT            NOT NULL DEFAULT 0 COMMENT '销量',

    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `product_spu`;

CREATE TABLE `product_spu`
(
    `creator`              varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`              varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`            bigint       NOT NULL DEFAULT '0',
    `id`                   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`                 VARCHAR(255) NOT NULL COMMENT '商品名称',
    `keyword`              VARCHAR(255) NOT NULL COMMENT '关键字',
    `introduction`         TEXT         NOT NULL COMMENT '商品简介',
    `description`          TEXT         NOT NULL COMMENT '商品详情',
    `category_id`          BIGINT       NOT NULL COMMENT '商品分类编号',
    `brand_id`             BIGINT       NOT NULL COMMENT '商品品牌编号',
    `pic_url`              VARCHAR(512) NOT NULL COMMENT '封面图',
    `slider_pic_urls`      JSON         NOT NULL COMMENT '轮播图列表',
    `sort`                 INT          NOT NULL COMMENT '排序字段',
    `status`               INT          NOT NULL COMMENT '商品状态',
    `spec_type`            TINYINT      NOT NULL DEFAULT 0 COMMENT '规格类型',
    `price`                INT          NOT NULL COMMENT '商品价格，单位分',
    `market_price`         INT          NOT NULL COMMENT '市场价，单位分',
    `cost_price`           INT          NOT NULL COMMENT '成本价，单位分',
    `stock`                INT          NOT NULL COMMENT '库存',
    `delivery_types`       JSON         NOT NULL COMMENT '配送方式数组',
    `delivery_template_id` BIGINT       NOT NULL COMMENT '物流配置模板编号',
    `give_integral`        INT          NOT NULL COMMENT '赠送积分',
    `sub_commission_type`  TINYINT      NOT NULL DEFAULT 0 COMMENT '分销类型',
    `sales_count`          INT          NOT NULL DEFAULT 0 COMMENT '销量',
    `virtual_sales_count`  INT          NOT NULL DEFAULT 0 COMMENT '虚拟销量',
    `browse_count`         INT          NOT NULL DEFAULT 0 COMMENT '浏览量',

    KEY `idx_category_id` (`category_id`),
    KEY `idx_brand_id` (`brand_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
