DROP TABLE IF EXISTS `trade_after_sale`;

CREATE TABLE `trade_after_sale`
(
    `creator`           varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint       NOT NULL DEFAULT '0',
    `id`                BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`           TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `no`                VARCHAR(64)  NOT NULL COMMENT '售后单号',
    `status`            INT          NOT NULL COMMENT '退款状态',
    `way`               INT          NOT NULL COMMENT '售后方式',
    `type`              INT          NOT NULL COMMENT '售后类型',
    `user_id`           BIGINT       NOT NULL COMMENT '用户编号',
    `apply_reason`      TEXT         NOT NULL COMMENT '申请原因',
    `apply_description` TEXT COMMENT '补充描述',
    `apply_pic_urls`    JSON COMMENT '补充凭证图片',
    `order_id`          BIGINT       NOT NULL COMMENT '交易订单编号',
    `order_no`          VARCHAR(64)  NOT NULL COMMENT '订单流水号',
    `order_item_id`     BIGINT       NOT NULL COMMENT '交易订单项编号',
    `spu_id`            BIGINT       NOT NULL COMMENT '商品 SPU 编号',
    `spu_name`          VARCHAR(255) NOT NULL COMMENT '商品 SPU 名称',
    `sku_id`            BIGINT       NOT NULL COMMENT '商品 SKU 编号',
    `properties`        JSON         NOT NULL COMMENT '属性数组',
    `pic_url`           VARCHAR(512) NOT NULL COMMENT '商品图片',
    `count`             INT          NOT NULL COMMENT '退货商品数量',
    `audit_time`        DATETIME COMMENT '审批时间',
    `audit_user_id`     BIGINT COMMENT '审批人',
    `audit_reason`      TEXT COMMENT '审批备注',
    `refund_price`      INT          NOT NULL COMMENT '退款金额',
    `pay_refund_id`     BIGINT COMMENT '支付退款编号',
    `refund_time`       DATETIME COMMENT '退款时间',
    `logistics_id`      BIGINT COMMENT '物流公司编号',
    `logistics_no`      VARCHAR(255) COMMENT '物流单号',
    `delivery_time`     DATETIME COMMENT '退货时间',
    `receive_time`      DATETIME COMMENT '收货时间',
    `receive_reason`    TEXT COMMENT '收货备注',

    KEY `idx_order_id` (`order_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_after_sale_log`;

CREATE TABLE `trade_after_sale_log`
(
    `creator`       varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint      NOT NULL DEFAULT '0',
    `id`            BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`       TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`       BIGINT      NOT NULL COMMENT '用户编号',
    `user_type`     INT         NOT NULL COMMENT '用户类型',
    `after_sale_id` BIGINT      NOT NULL COMMENT '售后编号',
    `before_status` INT         NOT NULL COMMENT '操作前状态',
    `after_status`  INT         NOT NULL COMMENT '操作后状态',
    `operate_type`  INT         NOT NULL COMMENT '操作类型',
    `content`       TEXT        NOT NULL COMMENT '操作明细',

    KEY `idx_after_sale_id` (`after_sale_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_brokerage_record`;

CREATE TABLE `trade_brokerage_record`
(
    `creator`           varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint       NOT NULL DEFAULT '0',
    `id`                INT          NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`           TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`           BIGINT       NOT NULL COMMENT '用户编号',
    `biz_id`            VARCHAR(64)  NOT NULL COMMENT '业务编号',
    `biz_type`          INT          NOT NULL COMMENT '业务类型',
    `title`             VARCHAR(255) NOT NULL COMMENT '标题',
    `description`       TEXT COMMENT '说明',
    `price`             INT          NOT NULL COMMENT '金额',
    `total_price`       INT          NOT NULL COMMENT '当前总佣金',
    `status`            INT          NOT NULL COMMENT '状态',
    `frozen_days`       INT          NOT NULL COMMENT '冻结时间',
    `unfreeze_time`     DATETIME COMMENT '解冻时间',
    `source_user_level` INT          NOT NULL COMMENT '来源用户等级',
    `source_user_id`    BIGINT       NOT NULL COMMENT '来源用户编号',

    KEY `idx_user_id` (`user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_brokerage_user`;

CREATE TABLE `trade_brokerage_user`
(
    `creator`           varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint      NOT NULL DEFAULT '0',
    `id`                BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`       DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`           TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `bind_user_id`      BIGINT COMMENT '推广员编号',
    `bind_user_time`    DATETIME COMMENT '绑定时间',
    `brokerage_enabled` TINYINT     NOT NULL DEFAULT 0 COMMENT '是否有分销资格',
    `brokerage_time`    DATETIME COMMENT '成为分销员时间',
    `brokerage_price`   INT         NOT NULL DEFAULT 0 COMMENT '可用佣金',
    `frozen_price`      INT         NOT NULL DEFAULT 0 COMMENT '冻结佣金',

    KEY `idx_bind_user_id` (`bind_user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_brokerage_withdraw`;

CREATE TABLE `trade_brokerage_withdraw`
(
    `creator`               varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`               varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`             bigint       NOT NULL DEFAULT '0',
    `id`                    BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`               TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`               BIGINT       NOT NULL COMMENT '用户编号',
    `price`                 INT          NOT NULL COMMENT '提现金额',
    `fee_price`             INT          NOT NULL COMMENT '提现手续费',
    `total_price`           INT          NOT NULL COMMENT '当前总佣金',
    `type`                  INT          NOT NULL COMMENT '提现类型',
    `user_name`             VARCHAR(255) NOT NULL COMMENT '提现姓名',
    `user_account`          VARCHAR(255) NOT NULL COMMENT '提现账号',
    `qr_code_url`           VARCHAR(512) COMMENT '收款码',
    `bank_name`             VARCHAR(255) COMMENT '银行名称',
    `bank_address`          VARCHAR(255) COMMENT '开户地址',
    `status`                INT          NOT NULL COMMENT '状态',
    `audit_reason`          TEXT COMMENT '审核驳回原因',
    `audit_time`            DATETIME COMMENT '审核时间',
    `remark`                TEXT COMMENT '备注',
    `pay_transfer_id`       BIGINT COMMENT '转账单编号',
    `transfer_channel_code` VARCHAR(64) COMMENT '转账渠道',
    `transfer_time`         DATETIME COMMENT '转账成功时间',
    `transfer_error_msg`    TEXT COMMENT '转账错误提示',

    KEY `idx_user_id` (`user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_cart`;

CREATE TABLE `trade_cart`
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
    `sku_id`      BIGINT      NOT NULL COMMENT '商品 SKU 编号',
    `count`       INT         NOT NULL COMMENT '商品购买数量',
    `selected`    TINYINT     NOT NULL DEFAULT 1 COMMENT '是否选中',

    KEY `idx_user_id` (`user_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_config`;

CREATE TABLE `trade_config`
(
    `creator`                        varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`                        varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`                      bigint      NOT NULL DEFAULT '0',
    `id`                             BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`                    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`                        TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `after_sale_refund_reasons`      JSON        NOT NULL COMMENT '退款理由',
    `after_sale_return_reasons`      JSON        NOT NULL COMMENT '退货理由',
    `delivery_express_free_enabled`  TINYINT     NOT NULL DEFAULT 0 COMMENT '全场包邮',
    `delivery_express_free_price`    INT         NOT NULL DEFAULT 0 COMMENT '最小金额',
    `delivery_pick_up_enabled`       TINYINT     NOT NULL DEFAULT 0 COMMENT '是否开启自提',
    `brokerage_enabled`              TINYINT     NOT NULL DEFAULT 0 COMMENT '是否启用分佣',
    `brokerage_enabled_condition`    INT         NOT NULL COMMENT '分佣模式',
    `brokerage_bind_mode`            INT         NOT NULL COMMENT '绑定模式',
    `brokerage_poster_urls`          JSON        NOT NULL COMMENT '分销海报图',
    `brokerage_first_percent`        INT         NOT NULL COMMENT '一级返佣比例',
    `brokerage_second_percent`       INT         NOT NULL COMMENT '二级返佣比例',
    `brokerage_withdraw_min_price`   INT         NOT NULL COMMENT '最低提现金额',
    `brokerage_withdraw_fee_percent` INT         NOT NULL COMMENT '提现手续费百分比',
    `brokerage_frozen_days`          INT         NOT NULL COMMENT '佣金冻结天数',
    `brokerage_withdraw_types`       JSON        NOT NULL COMMENT '提现方式',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_delivery_express`;

CREATE TABLE `trade_delivery_express`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `code`        VARCHAR(64)  NOT NULL COMMENT '快递公司 code',
    `name`        VARCHAR(255) NOT NULL COMMENT '快递公司名称',
    `logo`        VARCHAR(512) NOT NULL COMMENT '快递公司 logo',
    `sort`        INT          NOT NULL COMMENT '排序',
    `status`      INT          NOT NULL COMMENT '状态',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_delivery_express_template`;

CREATE TABLE `trade_delivery_express_template`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`        VARCHAR(255) NOT NULL COMMENT '模板名称',
    `charge_mode` INT          NOT NULL COMMENT '计费方式',
    `sort`        INT          NOT NULL COMMENT '排序',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_delivery_express_template_charge`;

CREATE TABLE `trade_delivery_express_template_charge`
(
    `creator`     varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint         NOT NULL DEFAULT '0',
    `id`          BIGINT         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT        NOT NULL DEFAULT 0 COMMENT '是否删除',
    `template_id` BIGINT         NOT NULL COMMENT '配送模板编号',
    `area_ids`    JSON           NOT NULL COMMENT '配送区域编号列表',
    `charge_mode` INT            NOT NULL COMMENT '配送计费方式',
    `start_count` DECIMAL(10, 2) NOT NULL COMMENT '首件数量',
    `start_price` INT            NOT NULL COMMENT '起步价',
    `extra_count` DECIMAL(10, 2) NOT NULL COMMENT '续件数量',
    `extra_price` INT            NOT NULL COMMENT '额外价',

    KEY `idx_template_id` (`template_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_delivery_express_template_free`;

CREATE TABLE `trade_delivery_express_template_free`
(
    `creator`     varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint      NOT NULL DEFAULT '0',
    `id`          BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `template_id` BIGINT      NOT NULL COMMENT '配送模板编号',
    `area_ids`    JSON        NOT NULL COMMENT '配送区域编号列表',
    `free_price`  INT         NOT NULL COMMENT '包邮金额',
    `free_count`  INT         NOT NULL COMMENT '包邮件数',

    KEY `idx_template_id` (`template_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `trade_delivery_pick_up_store`;

CREATE TABLE `trade_delivery_pick_up_store`
(
    `creator`         varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`         varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`       bigint         NOT NULL DEFAULT '0',
    `id`              BIGINT         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`     DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`         TINYINT        NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`            VARCHAR(255)   NOT NULL COMMENT '门店名称',
    `introduction`    TEXT COMMENT '门店简介',
    `phone`           VARCHAR(32)    NOT NULL COMMENT '门店手机',
    `area_id`         INT            NOT NULL COMMENT '区域编号',
    `detail_address`  VARCHAR(512)   NOT NULL COMMENT '详细地址',
    `logo`            VARCHAR(512)   NOT NULL COMMENT '门店 logo',
    `opening_time`    TIME           NOT NULL COMMENT '营业开始时间',
    `closing_time`    TIME           NOT NULL COMMENT '营业结束时间',
    `latitude`        DECIMAL(10, 6) NOT NULL COMMENT '纬度',
    `longitude`       DECIMAL(10, 6) NOT NULL COMMENT '经度',
    `verify_user_ids` JSON           NOT NULL COMMENT '核销员工编号数组',
    `status`          INT            NOT NULL COMMENT '门店状态',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `trade_order`;

CREATE TABLE `trade_order`
(
    `creator`                     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`                     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`                   bigint       NOT NULL DEFAULT '0',
    `id`                          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`                 DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`                 DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`                     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `no`                          VARCHAR(64)  NOT NULL COMMENT '订单流水号',
    `type`                        INT          NOT NULL COMMENT '订单类型',
    `terminal`                    INT          NOT NULL COMMENT '订单来源',
    `user_id`                     BIGINT       NOT NULL COMMENT '用户编号',
    `user_ip`                     VARCHAR(64)  NOT NULL COMMENT '用户 IP',
    `user_remark`                 TEXT COMMENT '用户备注',
    `status`                      INT          NOT NULL COMMENT '订单状态',
    `product_count`               INT          NOT NULL COMMENT '商品数量',
    `finish_time`                 DATETIME COMMENT '完成时间',
    `cancel_time`                 DATETIME COMMENT '取消时间',
    `cancel_type`                 INT COMMENT '取消类型',
    `remark`                      TEXT COMMENT '商家备注',
    `comment_status`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否评价',
    `brokerage_user_id`           BIGINT COMMENT '推广人编号',
    `pay_order_id`                BIGINT COMMENT '支付订单编号',
    `pay_status`                  TINYINT      NOT NULL DEFAULT 0 COMMENT '是否已支付',
    `pay_time`                    DATETIME COMMENT '付款时间',
    `pay_channel_code`            VARCHAR(64) COMMENT '支付渠道',
    `total_price`                 INT          NOT NULL COMMENT '商品原价',
    `discount_price`              INT          NOT NULL COMMENT '优惠金额',
    `delivery_price`              INT          NOT NULL COMMENT '运费金额',
    `adjust_price`                INT          NOT NULL COMMENT '调价',
    `pay_price`                   INT          NOT NULL COMMENT '应付金额',
    `delivery_type`               INT          NOT NULL COMMENT '配送方式',
    `logistics_id`                BIGINT       NOT NULL DEFAULT 0 COMMENT '物流公司编号',
    `logistics_no`                VARCHAR(255) NOT NULL DEFAULT '' COMMENT '物流单号',
    `delivery_time`               DATETIME COMMENT '发货时间',
    `receive_time`                DATETIME COMMENT '收货时间',
    `receiver_name`               VARCHAR(255) NOT NULL COMMENT '收件人',
    `receiver_mobile`             VARCHAR(32)  NOT NULL COMMENT '手机号',
    `receiver_area_id`            INT          NOT NULL COMMENT '地区编号',
    `receiver_detail_address`     VARCHAR(512) NOT NULL COMMENT '详细地址',
    `pick_up_store_id`            BIGINT COMMENT '自提门店编号',
    `pick_up_verify_code`         VARCHAR(64) COMMENT '自提核销码',
    `refund_status`               INT          NOT NULL COMMENT '售后状态',
    `refund_price`                INT          NOT NULL COMMENT '退款金额',
    `coupon_id`                   BIGINT COMMENT '优惠劵编号',
    `coupon_price`                INT          NOT NULL COMMENT '优惠券减免金额',
    `use_point`                   INT          NOT NULL COMMENT '使用积分',
    `point_price`                 INT          NOT NULL COMMENT '积分抵扣金额',
    `give_point`                  INT          NOT NULL COMMENT '赠送积分',
    `refund_point`                INT          NOT NULL COMMENT '退还积分',
    `vip_price`                   INT          NOT NULL COMMENT 'VIP 减免金额',
    `give_coupon_template_counts` JSON         NOT NULL COMMENT '赠送优惠券',
    `give_coupon_ids`             JSON         NOT NULL COMMENT '赠送优惠券编号',
    `seckill_activity_id`         BIGINT COMMENT '秒杀活动编号',
    `bargain_activity_id`         BIGINT COMMENT '砍价活动编号',
    `bargain_record_id`           BIGINT COMMENT '砍价记录编号',
    `combination_activity_id`     BIGINT COMMENT '拼团活动编号',
    `combination_head_id`         BIGINT COMMENT '拼团团长编号',
    `combination_record_id`       BIGINT COMMENT '拼团记录编号',
    `point_activity_id`           BIGINT COMMENT '积分商城活动编号',

    KEY `idx_user_id` (`user_id`),
    KEY `idx_status` (`status`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `trade_order_item`;

CREATE TABLE `trade_order_item`
(
    `creator`           varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint       NOT NULL DEFAULT '0',
    `id`                BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`           TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`           BIGINT       NOT NULL COMMENT '用户编号',
    `order_id`          BIGINT       NOT NULL COMMENT '订单编号',
    `cart_id`           BIGINT       NOT NULL COMMENT '购物车项编号',
    `spu_id`            BIGINT       NOT NULL COMMENT 'SPU 编号',
    `spu_name`          VARCHAR(255) NOT NULL COMMENT 'SPU 名称',
    `sku_id`            BIGINT       NOT NULL COMMENT 'SKU 编号',
    `properties`        JSON         NOT NULL COMMENT '属性数组',
    `pic_url`           VARCHAR(512) NOT NULL COMMENT '商品图片',
    `count`             INT          NOT NULL COMMENT '购买数量',
    `comment_status`    TINYINT      NOT NULL DEFAULT 0 COMMENT '是否评价',
    `price`             INT          NOT NULL COMMENT '商品原价',
    `discount_price`    INT          NOT NULL COMMENT '优惠金额',
    `delivery_price`    INT          NOT NULL COMMENT '运费金额',
    `adjust_price`      INT          NOT NULL COMMENT '订单调价',
    `pay_price`         INT          NOT NULL COMMENT '应付金额',
    `coupon_price`      INT          NOT NULL COMMENT '优惠劵减免金额',
    `point_price`       INT          NOT NULL COMMENT '积分抵扣金额',
    `use_point`         INT          NOT NULL COMMENT '使用积分',
    `give_point`        INT          NOT NULL COMMENT '赠送积分',
    `vip_price`         INT          NOT NULL COMMENT 'VIP 减免金额',
    `after_sale_id`     BIGINT COMMENT '售后单编号',
    `after_sale_status` INT COMMENT '售后状态',

    KEY `idx_order_id` (`order_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `trade_order_log`;

CREATE TABLE `trade_order_log`
(
    `creator`       varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint      NOT NULL DEFAULT '0',
    `id`            BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`       TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`       BIGINT      NOT NULL COMMENT '用户编号',
    `user_type`     INT         NOT NULL COMMENT '用户类型',
    `order_id`      BIGINT      NOT NULL COMMENT '订单号',
    `before_status` INT         NOT NULL COMMENT '操作前状态',
    `after_status`  INT         NOT NULL COMMENT '操作后状态',
    `operate_type`  INT         NOT NULL COMMENT '操作类型',
    `content`       TEXT        NOT NULL COMMENT '订单日志信息',

    KEY `idx_order_id` (`order_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `trade_order_log`;

CREATE TABLE `trade_order_log`
(
    `creator`       varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint      NOT NULL DEFAULT '0',
    `id`            BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`       TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`       BIGINT      NOT NULL COMMENT '用户编号',
    `user_type`     INT         NOT NULL COMMENT '用户类型',
    `order_id`      BIGINT      NOT NULL COMMENT '订单号',
    `before_status` INT         NOT NULL COMMENT '操作前状态',
    `after_status`  INT         NOT NULL COMMENT '操作后状态',
    `operate_type`  INT         NOT NULL COMMENT '操作类型',
    `content`       TEXT        NOT NULL COMMENT '订单日志信息',

    KEY `idx_order_id` (`order_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
