DROP TABLE IF EXISTS `pay_app`;

CREATE TABLE `pay_app`
(
    `creator`             varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint       NOT NULL DEFAULT '0',
    `id`                  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `app_key`             VARCHAR(255) NOT NULL COMMENT '应用标识',
    `name`                VARCHAR(255) NOT NULL COMMENT '应用名',
    `status`              INT          NOT NULL COMMENT '状态（CommonStatusEnum）',
    `remark`              TEXT COMMENT '备注',
    `order_notify_url`    VARCHAR(512) COMMENT '支付结果回调地址',
    `refund_notify_url`   VARCHAR(512) COMMENT '退款结果回调地址',
    `transfer_notify_url` VARCHAR(512) COMMENT '转账结果回调地址',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
DROP TABLE IF EXISTS `pay_channel`;

CREATE TABLE `pay_channel`
(
    `creator`     varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint         NOT NULL DEFAULT '0',
    `id`          BIGINT         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT        NOT NULL DEFAULT 0 COMMENT '是否删除',
    `code`        VARCHAR(64)    NOT NULL COMMENT '渠道编码（PayChannelEnum）',
    `status`      INT            NOT NULL COMMENT '状态（CommonStatusEnum）',
    `fee_rate`    DECIMAL(10, 2) NOT NULL COMMENT '费率百分比',
    `remark`      TEXT COMMENT '备注',
    `app_id`      BIGINT         NOT NULL COMMENT '关联 pay_app.id',
    `config`      JSON           NOT NULL COMMENT '支付渠道配置',

    KEY `idx_app_id` (`app_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `pay_demo_order`;

CREATE TABLE `pay_demo_order`
(
    `creator`          varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`          varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`        bigint       NOT NULL DEFAULT '0',
    `id`               BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`          TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`          BIGINT       NOT NULL COMMENT '用户编号',
    `spu_id`           BIGINT       NOT NULL COMMENT '商品编号',
    `spu_name`         VARCHAR(255) NOT NULL COMMENT '商品名称',
    `price`            INT          NOT NULL COMMENT '价格，单位分',
    `pay_status`       TINYINT      NOT NULL COMMENT '是否支付',
    `pay_order_id`     BIGINT COMMENT '支付订单编号',
    `pay_time`         DATETIME COMMENT '支付时间',
    `pay_channel_code` VARCHAR(64) COMMENT '支付渠道编码',
    `pay_refund_id`    BIGINT COMMENT '支付退款单号',
    `refund_price`     INT COMMENT '退款金额',
    `refund_time`      DATETIME COMMENT '退款完成时间',

    KEY `idx_user_id` (`user_id`),
    KEY `idx_spu_id` (`spu_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_demo_withdraw`;

CREATE TABLE `pay_demo_withdraw`
(
    `creator`               varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`               varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`             bigint       NOT NULL DEFAULT '0',
    `id`                    BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`               TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `subject`               VARCHAR(255) NOT NULL COMMENT '提现标题',
    `price`                 INT          NOT NULL COMMENT '提现金额，单位分',
    `user_account`          VARCHAR(255) NOT NULL COMMENT '收款人账号',
    `userName`              VARCHAR(255) NOT NULL COMMENT '收款人姓名',
    `type`                  INT          NOT NULL COMMENT '提现方式（PayDemoWithdrawTypeEnum）',
    `status`                INT          NOT NULL COMMENT '提现状态（PayDemoWithdrawStatusEnum）',
    `pay_transfer_id`       BIGINT COMMENT '转账单编号',
    `transfer_channel_code` VARCHAR(64) COMMENT '转账渠道',
    `transfer_time`         DATETIME COMMENT '转账成功时间',
    `transfer_error_msg`    TEXT COMMENT '转账错误提示',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `pay_notify_log`;

CREATE TABLE `pay_notify_log`
(
    `creator`      varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint      NOT NULL DEFAULT '0',
    `id`           BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`      TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `task_id`      BIGINT      NOT NULL COMMENT '任务编号',
    `notify_times` INT         NOT NULL COMMENT '第几次被通知',
    `response`     TEXT        NOT NULL COMMENT 'HTTP 响应结果',
    `status`       INT         NOT NULL COMMENT '通知状态（PayNotifyStatusEnum）',

    KEY `idx_task_id` (`task_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;



DROP TABLE IF EXISTS `pay_notify_task`;

CREATE TABLE `pay_notify_task`
(
    `creator`              varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`              varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`            bigint       NOT NULL DEFAULT '0',
    `id`                   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `app_id`               BIGINT       NOT NULL COMMENT '应用编号',
    `type`                 INT          NOT NULL COMMENT '通知类型（PayNotifyTypeEnum）',
    `data_id`              BIGINT       NOT NULL COMMENT '数据编号',
    `merchant_order_id`    VARCHAR(255) COMMENT '商户订单编号',
    `merchant_refund_id`   VARCHAR(255) COMMENT '商户退款编号',
    `merchant_transfer_id` VARCHAR(255) COMMENT '商户转账编号',
    `status`               INT          NOT NULL COMMENT '通知状态（PayNotifyStatusEnum）',
    `next_notify_time`     DATETIME     NOT NULL COMMENT '下一次通知时间',
    `last_execute_time`    DATETIME COMMENT '最后一次执行时间',
    `notify_times`         INT          NOT NULL COMMENT '当前通知次数',
    `max_notify_times`     INT          NOT NULL COMMENT '最大可通知次数',
    `notify_url`           VARCHAR(512) NOT NULL COMMENT '通知地址',

    KEY `idx_app_id` (`app_id`),
    KEY `idx_data_id` (`data_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_order`;

CREATE TABLE `pay_order`
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                BIGINT         NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`       DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`           TINYINT        NOT NULL DEFAULT 0 COMMENT '是否删除',
    `app_id`            BIGINT         NOT NULL COMMENT '应用编号',
    `channel_id`        BIGINT         NOT NULL COMMENT '渠道编号',
    `channel_code`      VARCHAR(64)    NOT NULL COMMENT '渠道编码',
    `merchant_order_id` VARCHAR(255)   NOT NULL COMMENT '商户订单编号',
    `subject`           VARCHAR(255)   NOT NULL COMMENT '商品标题',
    `body`              TEXT COMMENT '商品描述信息',
    `notify_url`        VARCHAR(512)   NOT NULL COMMENT '异步通知地址',
    `price`             INT            NOT NULL COMMENT '支付金额，单位分',
    `channel_fee_rate`  DECIMAL(10, 2) NOT NULL COMMENT '手续费率百分比',
    `channel_fee_price` INT            NOT NULL COMMENT '手续金额，单位分',
    `status`            INT            NOT NULL COMMENT '支付状态（PayOrderStatusEnum）',
    `user_ip`           VARCHAR(64)    NOT NULL COMMENT '用户 IP',
    `expire_time`       DATETIME       NOT NULL COMMENT '订单失效时间',
    `success_time`      DATETIME COMMENT '订单支付成功时间',
    `extension_id`      BIGINT COMMENT '拓展单编号',
    `no`                VARCHAR(255)   NOT NULL COMMENT '外部订单号',
    `refund_price`      INT            NOT NULL COMMENT '退款总金额',
    `channel_user_id`   VARCHAR(255) COMMENT '渠道用户编号',
    `channel_order_no`  VARCHAR(255) COMMENT '渠道订单号',

    UNIQUE KEY `uk_merchant_order_id` (`merchant_order_id`),
    KEY `idx_app_id` (`app_id`),
    KEY `idx_channel_id` (`channel_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_order_extension`;

CREATE TABLE `pay_order_extension`
(
    `creator`             varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint       NOT NULL DEFAULT '0',
    `id`                  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `no`                  VARCHAR(255) NOT NULL COMMENT '外部订单号',
    `order_id`            BIGINT       NOT NULL COMMENT '订单编号',
    `channel_id`          BIGINT       NOT NULL COMMENT '渠道编号',
    `channel_code`        VARCHAR(64)  NOT NULL COMMENT '渠道编码',
    `user_ip`             VARCHAR(64)  NOT NULL COMMENT '用户 IP',
    `status`              INT          NOT NULL COMMENT '支付状态（PayOrderStatusEnum）',
    `channel_extras`      JSON COMMENT '额外参数',
    `channel_error_code`  VARCHAR(255) COMMENT '错误码',
    `channel_error_msg`   TEXT COMMENT '错误提示',
    `channel_notify_data` TEXT COMMENT '通知内容',

    KEY `idx_order_id` (`order_id`),
    KEY `idx_channel_id` (`channel_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_refund`;

CREATE TABLE `pay_refund`
(
    `creator`             varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`             varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`           bigint       NOT NULL DEFAULT '0',
    `id`                  BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`             TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `no`                  VARCHAR(255) NOT NULL COMMENT '外部退款号',
    `app_id`              BIGINT       NOT NULL COMMENT '应用编号',
    `channel_id`          BIGINT       NOT NULL COMMENT '渠道编号',
    `channel_code`        VARCHAR(64)  NOT NULL COMMENT '渠道编码',
    `order_id`            BIGINT       NOT NULL COMMENT '订单编号',
    `order_no`            VARCHAR(255) NOT NULL COMMENT '支付订单编号',
    `merchant_order_id`   VARCHAR(255) NOT NULL COMMENT '商户订单编号',
    `merchant_refund_id`  VARCHAR(255) NOT NULL COMMENT '商户退款编号',
    `notify_url`          VARCHAR(512) NOT NULL COMMENT '异步通知地址',
    `status`              INT          NOT NULL COMMENT '退款状态（PayRefundStatusEnum）',
    `pay_price`           INT          NOT NULL COMMENT '支付金额',
    `refund_price`        INT          NOT NULL COMMENT '退款金额',
    `reason`              TEXT COMMENT '退款原因',
    `user_ip`             VARCHAR(64)  NOT NULL COMMENT '用户 IP',
    `channel_order_no`    VARCHAR(255) NOT NULL COMMENT '渠道订单号',
    `channel_refund_no`   VARCHAR(255) COMMENT '渠道退款单号',
    `success_time`        DATETIME COMMENT '退款成功时间',
    `channel_error_code`  VARCHAR(255) COMMENT '错误码',
    `channel_error_msg`   TEXT COMMENT '错误提示',
    `channel_notify_data` TEXT COMMENT '通知内容',

    KEY `idx_app_id` (`app_id`),
    KEY `idx_order_id` (`order_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_transfer`;

CREATE TABLE `pay_transfer`
(
    `creator`              varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`              varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`            bigint       NOT NULL DEFAULT '0',
    `id`                   BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`              TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `no`                   VARCHAR(255) NOT NULL COMMENT '转账单号',
    `app_id`               BIGINT       NOT NULL COMMENT '应用编号',
    `channel_id`           BIGINT       NOT NULL COMMENT '转账渠道编号',
    `channel_code`         VARCHAR(64)  NOT NULL COMMENT '转账渠道编码',
    `merchant_transfer_id` VARCHAR(255) NOT NULL COMMENT '商户转账单编号',
    `subject`              VARCHAR(255) NOT NULL COMMENT '转账标题',
    `price`                INT          NOT NULL COMMENT '转账金额，单位分',
    `user_account`         VARCHAR(255) NOT NULL COMMENT '收款人账号',
    `user_name`            VARCHAR(255) NOT NULL COMMENT '收款人姓名',
    `status`               INT          NOT NULL COMMENT '转账状态（PayTransferStatusEnum）',
    `success_time`         DATETIME COMMENT '转账成功时间',
    `notify_url`           VARCHAR(512) NOT NULL COMMENT '异步通知地址',
    `user_ip`              VARCHAR(64)  NOT NULL COMMENT '用户 IP',
    `channel_extras`       JSON COMMENT '额外参数',
    `channel_transfer_no`  VARCHAR(255) COMMENT '渠道转账单号',
    `channel_error_code`   VARCHAR(255) COMMENT '错误码',
    `channel_error_msg`    TEXT COMMENT '错误提示',
    `channel_notify_data`  TEXT COMMENT '通知内容',
    `channel_package_info` TEXT COMMENT '微信 Package 信息',

    KEY `idx_app_id` (`app_id`),
    KEY `idx_channel_id` (`channel_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_wallet`;

CREATE TABLE `pay_wallet`
(
    `creator`        varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`        varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`      bigint      NOT NULL DEFAULT '0',
    `id`             BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`        TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `user_id`        BIGINT      NOT NULL COMMENT '用户编号',
    `user_type`      INT         NOT NULL COMMENT '用户类型（UserTypeEnum）',
    `balance`        INT         NOT NULL COMMENT '余额，单位分',
    `freeze_price`   INT         NOT NULL COMMENT '冻结金额',
    `total_expense`  INT         NOT NULL COMMENT '累计支出',
    `total_recharge` INT         NOT NULL COMMENT '累计充值',

    KEY `idx_user_id` (`user_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;


DROP TABLE IF EXISTS `pay_wallet_recharge`;

CREATE TABLE `pay_wallet_recharge`
(
    `creator`            varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`            varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`          bigint      NOT NULL DEFAULT '0',
    `id`                 BIGINT      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time`        DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`            TINYINT     NOT NULL DEFAULT 0 COMMENT '是否删除',
    `wallet_id`          BIGINT      NOT NULL COMMENT '钱包编号',
    `total_price`        INT         NOT NULL COMMENT '实际到账金额',
    `pay_price`          INT         NOT NULL COMMENT '实际支付金额',
    `bonus_price`        INT         NOT NULL COMMENT '赠送金额',
    `package_id`         BIGINT COMMENT '充值套餐编号',
    `pay_status`         TINYINT     NOT NULL COMMENT '是否已支付',
    `pay_order_id`       BIGINT COMMENT '支付订单编号',
    `pay_channel_code`   VARCHAR(64) COMMENT '支付渠道',
    `pay_time`           DATETIME COMMENT '支付时间',
    `pay_refund_id`      BIGINT COMMENT '退款单编号',
    `refund_total_price` INT COMMENT '退款总金额',
    `refund_pay_price`   INT COMMENT '退款支付金额',
    `refund_bonus_price` INT COMMENT '退款赠送金额',
    `refund_time`        DATETIME COMMENT '退款时间',
    `refund_status`      INT COMMENT '退款状态',

    KEY `idx_wallet_id` (`wallet_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `pay_wallet_recharge_package`;

CREATE TABLE `pay_wallet_recharge_package`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `name`        VARCHAR(255) NOT NULL COMMENT '套餐名',
    `pay_price`   INT          NOT NULL COMMENT '支付金额',
    `bonus_price` INT          NOT NULL COMMENT '赠送金额',
    `status`      INT          NOT NULL COMMENT '状态（CommonStatusEnum）',

    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

DROP TABLE IF EXISTS `pay_wallet_transaction`;

CREATE TABLE `pay_wallet_transaction`
(
    `creator`     varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint       NOT NULL DEFAULT '0',
    `id`          BIGINT       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `create_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `deleted`     TINYINT      NOT NULL DEFAULT 0 COMMENT '是否删除',
    `no`          VARCHAR(255) NOT NULL COMMENT '流水号',
    `wallet_id`   BIGINT       NOT NULL COMMENT '钱包编号',
    `biz_type`    INT          NOT NULL COMMENT '业务分类（PayWalletBizTypeEnum）',
    `biz_id`      VARCHAR(255) NOT NULL COMMENT '业务编号',
    `title`       VARCHAR(255) NOT NULL COMMENT '流水说明',
    `price`       INT          NOT NULL COMMENT '交易金额，正为增加，负为减少',
    `balance`     INT          NOT NULL COMMENT '交易后余额',

    KEY `idx_wallet_id` (`wallet_id`),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
