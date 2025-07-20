DROP TABLE IF EXISTS erp_account;

CREATE TABLE erp_account
(
    `creator`      varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint       NOT NULL DEFAULT '0',
    `id`           bigint       NOT NULL AUTO_INCREMENT COMMENT '结算账户编号',
    create_time    DATETIME     NOT NULL COMMENT '创建时间',
    update_time    DATETIME     NOT NULL COMMENT '更新时间',
    deleted        TINYINT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name           VARCHAR(255) NOT NULL COMMENT '账户名称',
    `no`             VARCHAR(255) NOT NULL COMMENT '账户编码',
    remark         TEXT COMMENT '备注',
    status         INT          NOT NULL  COMMENT '开启状态',
    sort           INT          NOT NULL COMMENT '排序',
    default_status BOOLEAN      NOT NULL default 0 COMMENT '是否默认',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 结算账户表';

DROP TABLE IF EXISTS erp_finance_payment;

CREATE TABLE erp_finance_payment
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no              VARCHAR(255)   NOT NULL COMMENT '付款单号',
    status          INT            NOT NULL COMMENT '付款状态',
    payment_time    DATETIME       NOT NULL COMMENT '付款时间',
    finance_user_id BIGINT         NOT NULL COMMENT '财务人员编号',
    supplier_id     BIGINT         NOT NULL COMMENT '供应商编号',
    account_id      BIGINT         NOT NULL COMMENT '付款账户编号',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '合计价格',
    discount_price  DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    payment_price   DECIMAL(18, 2) NOT NULL COMMENT '实付金额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 付款单表';


DROP TABLE IF EXISTS erp_finance_payment_item;

CREATE TABLE erp_finance_payment_item
(
    `creator`     varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint         NOT NULL DEFAULT '0',
    `id`          bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time   DATETIME       NOT NULL COMMENT '创建时间',
    update_time   DATETIME       NOT NULL COMMENT '更新时间',
    deleted       INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    payment_id    BIGINT         NOT NULL COMMENT '付款单编号',
    biz_type      INT            NOT NULL COMMENT '业务类型',
    biz_id        BIGINT         NOT NULL COMMENT '业务编号',
    biz_no        VARCHAR(255)   NOT NULL COMMENT '业务单号',
    total_price   DECIMAL(18, 2) NOT NULL COMMENT '应付金额',
    paid_price    DECIMAL(18, 2) NOT NULL COMMENT '已付金额',
    payment_price DECIMAL(18, 2) NOT NULL COMMENT '本次付款',
    remark        TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 付款项表';


DROP TABLE IF EXISTS erp_finance_payment_item;

CREATE TABLE erp_finance_payment_item
(
    `creator`     varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint         NOT NULL DEFAULT '0',
    `id`          bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time   DATETIME       NOT NULL COMMENT '创建时间',
    update_time   DATETIME       NOT NULL COMMENT '更新时间',
    deleted       INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    payment_id    BIGINT         NOT NULL COMMENT '付款单编号',
    biz_type      INT            NOT NULL COMMENT '业务类型',
    biz_id        BIGINT         NOT NULL COMMENT '业务编号',
    biz_no        VARCHAR(255)   NOT NULL COMMENT '业务单号',
    total_price   DECIMAL(18, 2) NOT NULL COMMENT '应付金额',
    paid_price    DECIMAL(18, 2) NOT NULL COMMENT '已付金额',
    payment_price DECIMAL(18, 2) NOT NULL COMMENT '本次付款',
    remark        TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 付款项表';


DROP TABLE IF EXISTS erp_finance_receipt;

CREATE TABLE erp_finance_receipt
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no              VARCHAR(255)   NOT NULL COMMENT '收款单号',
    status          INT            NOT NULL COMMENT '收款状态',
    receipt_time    DATETIME       NOT NULL COMMENT '收款时间',
    finance_user_id BIGINT         NOT NULL COMMENT '财务人员编号',
    customer_id     BIGINT         NOT NULL COMMENT '客户编号',
    account_id      BIGINT         NOT NULL COMMENT '收款账户编号',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '合计价格',
    discount_price  DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    receipt_price   DECIMAL(18, 2) NOT NULL COMMENT '实收金额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 收款单表';


DROP TABLE IF EXISTS erp_finance_receipt_item;

CREATE TABLE erp_finance_receipt_item
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    receipt_id      BIGINT         NOT NULL COMMENT '收款单编号',
    biz_type        INT            NOT NULL COMMENT '业务类型',
    biz_id          BIGINT         NOT NULL COMMENT '业务编号',
    biz_no          VARCHAR(255)   NOT NULL COMMENT '业务单号',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '应收金额',
    receipted_price DECIMAL(18, 2) NOT NULL COMMENT '已收金额',
    receipt_price   DECIMAL(18, 2) NOT NULL COMMENT '本次收款',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 收款项表';



DROP TABLE IF EXISTS erp_product_category;

CREATE TABLE erp_product_category
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '分类编号',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    parent_id   BIGINT       NOT NULL COMMENT '父分类编号',
    name        VARCHAR(255) NOT NULL COMMENT '分类名称',
    code        VARCHAR(255) NOT NULL COMMENT '分类编码',
    sort        INT          NOT NULL COMMENT '分类排序',
    status      INT          NOT NULL COMMENT '分类状态',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 产品分类表';


DROP TABLE IF EXISTS erp_product;

CREATE TABLE erp_product
(
    `creator`      varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint         NOT NULL DEFAULT '0',
    `id`           bigint         NOT NULL AUTO_INCREMENT COMMENT '产品编号',
    create_time    DATETIME       NOT NULL COMMENT '创建时间',
    update_time    DATETIME       NOT NULL COMMENT '更新时间',
    deleted        INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name           VARCHAR(255)   NOT NULL COMMENT '产品名称',
    bar_code       VARCHAR(255)   NOT NULL COMMENT '产品条码',
    category_id    BIGINT         NOT NULL COMMENT '产品分类编号',
    unit_id        BIGINT         NOT NULL COMMENT '单位编号',
    status         INT            NOT NULL COMMENT '产品状态',
    standard       VARCHAR(255)   NOT NULL COMMENT '产品规格',
    remark         TEXT COMMENT '产品备注',
    expiry_day     INT            NOT NULL COMMENT '保质期天数',
    weight         DECIMAL(18, 2) NOT NULL COMMENT '基础重量（kg）',
    purchase_price DECIMAL(18, 2) NOT NULL COMMENT '采购价格',
    sale_price     DECIMAL(18, 2) NOT NULL COMMENT '销售价格',
    min_price      DECIMAL(18, 2) NOT NULL COMMENT '最低价格',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 产品表';


DROP TABLE IF EXISTS erp_product_unit;

CREATE TABLE erp_product_unit
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '单位编号',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '单位名字',
    status      INT          NOT NULL COMMENT '单位状态',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 产品单位表';


DROP TABLE IF EXISTS erp_purchase_in;

CREATE TABLE erp_purchase_in
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '采购入库单号',
    status              INT            NOT NULL COMMENT '入库状态',
    supplier_id         BIGINT         NOT NULL COMMENT '供应商编号',
    account_id          BIGINT         NOT NULL COMMENT '结算账户编号',
    in_time             DATETIME       NOT NULL COMMENT '入库时间',
    order_id            BIGINT         NOT NULL COMMENT '采购订单编号',
    order_no            VARCHAR(255)   NOT NULL COMMENT '采购订单号',
    total_count         DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '最终合计价格',
    payment_price       DECIMAL(18, 2) NOT NULL COMMENT '已支付金额',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '合计产品价格',
    total_tax_price     DECIMAL(18, 2) NOT NULL COMMENT '合计税额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '优惠率百分比',
    discount_price      DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    other_price         DECIMAL(18, 2) NOT NULL COMMENT '其它金额',
    file_url            VARCHAR(255)   NOT NULL COMMENT '附件地址',
    remark              TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 采购入库表';


DROP TABLE IF EXISTS erp_purchase_in_items;

CREATE TABLE erp_purchase_in_items
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    in_id           BIGINT         NOT NULL COMMENT '采购入库编号',
    order_item_id   BIGINT         NOT NULL COMMENT '采购订单项编号',
    warehouse_id    BIGINT         NOT NULL COMMENT '仓库编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '总价',
    tax_percent     DECIMAL(10, 2) NOT NULL COMMENT '税率百分比',
    tax_price       DECIMAL(18, 2) NOT NULL COMMENT '税额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 采购入库项表';


DROP TABLE IF EXISTS erp_purchase_order;

CREATE TABLE erp_purchase_order
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '采购订单号',
    status              INT            NOT NULL COMMENT '采购状态',
    supplier_id         BIGINT         NOT NULL COMMENT '供应商编号',
    account_id          BIGINT         NOT NULL COMMENT '结算账户编号',
    order_time          DATETIME       NOT NULL COMMENT '下单时间',
    total_count         DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '最终合计价格',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '合计产品价格',
    total_tax_price     DECIMAL(18, 2) NOT NULL COMMENT '合计税额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '优惠率百分比',
    discount_price      DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    deposit_price       DECIMAL(18, 2) NOT NULL COMMENT '定金金额',
    file_url            VARCHAR(255)   NOT NULL COMMENT '附件地址',
    remark              TEXT COMMENT '备注',
    in_count            DECIMAL(18, 2) NOT NULL COMMENT '采购入库数量',
    return_count        DECIMAL(18, 2) NOT NULL COMMENT '采购退货数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 采购订单表';

DROP TABLE IF EXISTS erp_purchase_order_items;

CREATE TABLE erp_purchase_order_items
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    order_id        BIGINT         NOT NULL COMMENT '采购订单编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '总价',
    tax_percent     DECIMAL(10, 2) NOT NULL COMMENT '税率百分比',
    tax_price       DECIMAL(18, 2) NOT NULL COMMENT '税额',
    remark          TEXT COMMENT '备注',
    in_count        DECIMAL(18, 2) NOT NULL COMMENT '采购入库数量',
    return_count    DECIMAL(18, 2) NOT NULL COMMENT '采购退货数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 采购订单项表';


DROP TABLE IF EXISTS erp_purchase_return;

CREATE TABLE erp_purchase_return
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '采购退货单号',
    status              INT            NOT NULL COMMENT '退货状态',
    supplier_id         BIGINT         NOT NULL COMMENT '供应商编号',
    account_id          BIGINT         NOT NULL COMMENT '结算账户编号',
    return_time         DATETIME       NOT NULL COMMENT '退货时间',
    order_id            BIGINT         NOT NULL COMMENT '采购订单编号',
    order_no            VARCHAR(255)   NOT NULL COMMENT '采购订单号',
    total_count         DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '最终合计价格',
    refund_price        DECIMAL(18, 2) NOT NULL COMMENT '已退款金额',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '合计产品价格',
    total_tax_price     DECIMAL(18, 2) NOT NULL COMMENT '合计税额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '优惠率百分比',
    discount_price      DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    other_price         DECIMAL(18, 2) NOT NULL COMMENT '其它金额',
    file_url            VARCHAR(255)   NOT NULL COMMENT '附件地址',
    remark              TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 采购退货表';


DROP TABLE IF EXISTS erp_purchase_return_items;

CREATE TABLE erp_purchase_return_items
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    return_id       BIGINT         NOT NULL COMMENT '采购退货编号',
    order_item_id   BIGINT         NOT NULL COMMENT '采购订单项编号',
    warehouse_id    BIGINT         NOT NULL COMMENT '仓库编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '总价',
    tax_percent     DECIMAL(10, 2) NOT NULL COMMENT '税率百分比',
    tax_price       DECIMAL(18, 2) NOT NULL COMMENT '税额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 采购退货项表';


DROP TABLE IF EXISTS erp_supplier;

CREATE TABLE erp_supplier
(
    `creator`    varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`    varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`  bigint         NOT NULL DEFAULT '0',
    `id`         bigint         NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
    create_time  DATETIME       NOT NULL COMMENT '创建时间',
    update_time  DATETIME       NOT NULL COMMENT '更新时间',
    deleted      INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name         VARCHAR(255)   NOT NULL COMMENT '供应商名称',
    contact      VARCHAR(255)   NOT NULL COMMENT '联系人',
    mobile       VARCHAR(20)    NOT NULL default '' COMMENT '手机号码',
    telephone    VARCHAR(20)    NOT NULL default '' COMMENT '联系电话',
    email        VARCHAR(255) COMMENT '电子邮箱',
    fax          VARCHAR(255) COMMENT '传真',
    remark       TEXT COMMENT '备注',
    status       tinyint        NOT NULL default 0 COMMENT '开启状态',
    sort         tinyint        NOT NULL COMMENT '排序',
    tax_no       VARCHAR(255)   NOT NULL COMMENT '纳税人识别号',
    tax_percent  DECIMAL(10, 2) NOT NULL default 0 COMMENT '税率',
    bank_name    VARCHAR(255)   NOT NULL COMMENT '开户行',
    bank_account VARCHAR(255)   NOT NULL COMMENT '开户账号',
    bank_address VARCHAR(255)   NOT NULL COMMENT '开户地址',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 供应商表';


DROP TABLE IF EXISTS erp_customer;

CREATE TABLE erp_customer
(
    `creator`    varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`    varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`  bigint         NOT NULL DEFAULT '0',
    `id`         bigint         NOT NULL AUTO_INCREMENT COMMENT '客户编号',
    create_time  DATETIME       NOT NULL COMMENT '创建时间',
    update_time  DATETIME       NOT NULL COMMENT '更新时间',
    deleted      INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name         VARCHAR(255)   NOT NULL default '' COMMENT '客户名称',
    contact      VARCHAR(255)   NOT NULL default ''COMMENT '联系人',
    mobile       VARCHAR(20)    NOT NULL default '' COMMENT '手机号码',
    telephone    VARCHAR(20)    NOT NULL default '' COMMENT '联系电话',
    email        VARCHAR(255)   NOT NULL default '' COMMENT '电子邮箱',
    fax          VARCHAR(255)   NOT NULL default '' COMMENT '传真',
    remark       TEXT COMMENT '备注',
    status       INT            NOT NULL default 0 COMMENT '开启状态',
    sort         INT            NOT NULL COMMENT '排序',
    tax_no       VARCHAR(255)   NOT NULL default '' COMMENT '纳税人识别号',
    tax_percent  DECIMAL(10, 2) NOT NULL default '' COMMENT '税率',
    bank_name    VARCHAR(255)   NOT NULL default '' COMMENT '开户行',
    bank_account VARCHAR(255)   NOT NULL default '' COMMENT '开户账号',
    bank_address VARCHAR(255)   NOT NULL default '' COMMENT '开户地址',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 客户表';


DROP TABLE IF EXISTS erp_sale_order;

CREATE TABLE erp_sale_order
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '销售订单号',
    status              INT            NOT NULL COMMENT '销售状态',
    customer_id         BIGINT         NOT NULL COMMENT '客户编号',
    account_id          BIGINT         NOT NULL COMMENT '结算账户编号',
    sale_user_id        BIGINT         NOT NULL COMMENT '销售员编号',
    order_time          DATETIME       NOT NULL COMMENT '下单时间',
    total_count         DECIMAL(18, 2) NOT NULL default 0 COMMENT '合计数量',
    total_price         DECIMAL(18, 2) NOT NULL default 0 COMMENT '最终合计价格',
    total_product_price DECIMAL(18, 2) NOT NULL default 0 COMMENT '合计产品价格',
    total_tax_price     DECIMAL(18, 2) NOT NULL default 0 COMMENT '合计税额',
    discount_percent    DECIMAL(10, 2) NOT NULL default 0 COMMENT '优惠率百分比',
    discount_price      DECIMAL(18, 2) NOT NULL default 0 COMMENT '优惠金额',
    deposit_price       DECIMAL(18, 2) NOT NULL default 0 COMMENT '定金金额',
    file_url            VARCHAR(255)   NOT NULL COMMENT '附件地址',
    remark              TEXT COMMENT '备注',
    out_count           DECIMAL(18, 2) NOT NULL COMMENT '销售出库数量',
    return_count        DECIMAL(18, 2) NOT NULL COMMENT '销售退货数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 销售订单表';


DROP TABLE IF EXISTS erp_sale_order_items;

CREATE TABLE erp_sale_order_items
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    order_id        BIGINT         NOT NULL COMMENT '销售订单编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '总价',
    tax_percent     DECIMAL(10, 2) NOT NULL COMMENT '税率百分比',
    tax_price       DECIMAL(18, 2) NOT NULL COMMENT '税额',
    remark          TEXT COMMENT '备注',
    out_count       DECIMAL(18, 2) NOT NULL COMMENT '销售出库数量',
    return_count    DECIMAL(18, 2) NOT NULL COMMENT '销售退货数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 销售订单项表';


DROP TABLE IF EXISTS erp_sale_out;

CREATE TABLE erp_sale_out
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '销售出库单号',
    status              INT            NOT NULL COMMENT '出库状态',
    customer_id         BIGINT         NOT NULL COMMENT '客户编号',
    account_id          BIGINT         NOT NULL COMMENT '结算账户编号',
    sale_user_id        BIGINT         NOT NULL COMMENT '销售员编号',
    out_time            DATETIME       NOT NULL COMMENT '出库时间',
    order_id            BIGINT         NOT NULL COMMENT '销售订单编号',
    order_no            VARCHAR(255)   NOT NULL COMMENT '销售订单号',
    total_count         DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '最终合计价格',
    receipt_price       DECIMAL(18, 2) NOT NULL COMMENT '已收款金额',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '合计产品价格',
    total_tax_price     DECIMAL(18, 2) NOT NULL COMMENT '合计税额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '优惠率百分比',
    discount_price      DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    other_price         DECIMAL(18, 2) NOT NULL COMMENT '其它金额',
    file_url            VARCHAR(255)   NOT NULL COMMENT '附件地址',
    remark              TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 销售出库表';


DROP TABLE IF EXISTS erp_sale_out_items;

CREATE TABLE erp_sale_out_items
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    out_id          BIGINT         NOT NULL COMMENT '销售出库编号',
    order_item_id   BIGINT         NOT NULL COMMENT '销售订单项编号',
    warehouse_id    BIGINT         NOT NULL COMMENT '仓库编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '总价',
    tax_percent     DECIMAL(10, 2) NOT NULL COMMENT '税率百分比',
    tax_price       DECIMAL(18, 2) NOT NULL COMMENT '税额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 销售出库项表';


DROP TABLE IF EXISTS erp_sale_return;

CREATE TABLE erp_sale_return
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '销售退货单号',
    status              INT            NOT NULL COMMENT '退货状态',
    customer_id         BIGINT         NOT NULL COMMENT '客户编号',
    account_id          BIGINT         NOT NULL COMMENT '结算账户编号',
    sale_user_id        BIGINT         NOT NULL COMMENT '销售员编号',
    return_time         DATETIME       NOT NULL COMMENT '退货时间',
    order_id            BIGINT         NOT NULL COMMENT '销售订单编号',
    order_no            VARCHAR(255)   NOT NULL COMMENT '销售订单号',
    total_count         DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '最终合计价格',
    refund_price        DECIMAL(18, 2) NOT NULL COMMENT '已退款金额',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '合计产品价格',
    total_tax_price     DECIMAL(18, 2) NOT NULL COMMENT '合计税额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '优惠率百分比',
    discount_price      DECIMAL(18, 2) NOT NULL COMMENT '优惠金额',
    other_price         DECIMAL(18, 2) NOT NULL COMMENT '其它金额',
    file_url            VARCHAR(255)   NOT NULL COMMENT '附件地址',
    remark              TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 销售退货表';


DROP TABLE IF EXISTS erp_sale_return_items;

CREATE TABLE erp_sale_return_items
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    return_id       BIGINT         NOT NULL COMMENT '销售退货编号',
    order_item_id   BIGINT         NOT NULL COMMENT '销售订单项编号',
    warehouse_id    BIGINT         NOT NULL COMMENT '仓库编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '总价',
    tax_percent     DECIMAL(10, 2) NOT NULL COMMENT '税率百分比',
    tax_price       DECIMAL(18, 2) NOT NULL COMMENT '税额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 销售退货项表';


DROP TABLE IF EXISTS erp_stock_check;

CREATE TABLE erp_stock_check
(
    `creator`   varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint         NOT NULL DEFAULT '0',
    `id`        bigint         NOT NULL AUTO_INCREMENT COMMENT '盘点编号',
    create_time DATETIME       NOT NULL COMMENT '创建时间',
    update_time DATETIME       NOT NULL COMMENT '更新时间',
    deleted     INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no          VARCHAR(255)   NOT NULL COMMENT '盘点单号',
    check_time  DATETIME       NOT NULL COMMENT '盘点时间',
    total_count DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    status      INT            NOT NULL COMMENT '状态',
    remark      TEXT COMMENT '备注',
    file_url    VARCHAR(255)   NOT NULL COMMENT '附件 URL',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 库存盘点单表';


DROP TABLE IF EXISTS erp_stock_check_item;

CREATE TABLE erp_stock_check_item
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '盘点项编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    check_id        BIGINT         NOT NULL COMMENT '盘点编号',
    warehouse_id    BIGINT         NOT NULL COMMENT '仓库编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    stock_count     DECIMAL(18, 2) NOT NULL COMMENT '账面数量',
    actual_count    DECIMAL(18, 2) NOT NULL COMMENT '实际数量',
    count           DECIMAL(18, 2) NOT NULL COMMENT '盈亏数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 库存盘点单项表';

DROP TABLE IF EXISTS erp_stock;

CREATE TABLE erp_stock
(
    `creator`    varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`    varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`  bigint         NOT NULL DEFAULT '0',
    `id`         bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time  DATETIME       NOT NULL COMMENT '创建时间',
    update_time  DATETIME       NOT NULL COMMENT '更新时间',
    deleted      INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    product_id   BIGINT         NOT NULL COMMENT '产品编号',
    warehouse_id BIGINT         NOT NULL COMMENT '仓库编号',
    count        DECIMAL(18, 2) NOT NULL COMMENT '库存数量',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 产品库存';

DROP TABLE IF EXISTS erp_stock_in;

CREATE TABLE erp_stock_in
(
    `creator`   varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint         NOT NULL DEFAULT '0',
    `id`        bigint         NOT NULL AUTO_INCREMENT COMMENT '入库编号',
    create_time DATETIME       NOT NULL COMMENT '创建时间',
    update_time DATETIME       NOT NULL COMMENT '更新时间',
    deleted     INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no          VARCHAR(255)   NOT NULL COMMENT '入库单号',
    supplier_id BIGINT         NOT NULL COMMENT '供应商编号',
    in_time     DATETIME       NOT NULL COMMENT '入库时间',
    total_count DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    status      INT            NOT NULL COMMENT '状态',
    remark      TEXT COMMENT '备注',
    file_url    VARCHAR(255) COMMENT '附件 URL',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 其它入库单';

DROP TABLE IF EXISTS erp_stock_in_item;

CREATE TABLE erp_stock_in_item
(
    `creator`       varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint         NOT NULL DEFAULT '0',
    `id`            bigint         NOT NULL AUTO_INCREMENT COMMENT '入库项编号',
    create_time     DATETIME       NOT NULL COMMENT '创建时间',
    update_time     DATETIME       NOT NULL COMMENT '更新时间',
    deleted         INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    in_id           BIGINT         NOT NULL COMMENT '入库编号',
    warehouse_id    BIGINT         NOT NULL COMMENT '仓库编号',
    product_id      BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price   DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count           DECIMAL(18, 2) NOT NULL COMMENT '产品数量',
    total_price     DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    remark          TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 其它入库单项';


DROP TABLE IF EXISTS erp_stock_move;

CREATE TABLE erp_stock_move
(
    `creator`   varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint         NOT NULL DEFAULT '0',
    `id`        bigint         NOT NULL AUTO_INCREMENT COMMENT '调拨编号',
    create_time DATETIME       NOT NULL COMMENT '创建时间',
    update_time DATETIME       NOT NULL COMMENT '更新时间',
    deleted     INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no          VARCHAR(255)   NOT NULL COMMENT '调拨单号',
    move_time   DATETIME       NOT NULL COMMENT '调拨时间',
    total_count DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    status      INT            NOT NULL COMMENT '状态',
    remark      TEXT COMMENT '备注',
    file_url    VARCHAR(255) COMMENT '附件 URL',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 库存调拨单';


DROP TABLE IF EXISTS erp_stock_move_item;

CREATE TABLE erp_stock_move_item
(
    `creator`         varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`         varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`       bigint         NOT NULL DEFAULT '0',
    `id`              bigint         NOT NULL AUTO_INCREMENT COMMENT '调拨项编号',
    create_time       DATETIME       NOT NULL COMMENT '创建时间',
    update_time       DATETIME       NOT NULL COMMENT '更新时间',
    deleted           INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    move_id           BIGINT         NOT NULL COMMENT '调拨编号',
    from_warehouse_id BIGINT         NOT NULL COMMENT '调出仓库编号',
    to_warehouse_id   BIGINT         NOT NULL COMMENT '调入仓库编号',
    product_id        BIGINT         NOT NULL COMMENT '产品编号',
    product_unit_id   BIGINT         NOT NULL COMMENT '产品单位编号',
    product_price     DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    count             DECIMAL(18, 2) NOT NULL COMMENT '产品数量',
    total_price       DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    remark            TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 库存调拨单项';


DROP TABLE IF EXISTS erp_stock_out;

CREATE TABLE erp_stock_out
(
    `creator`   varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint         NOT NULL DEFAULT '0',
    `id`        bigint         NOT NULL AUTO_INCREMENT COMMENT '出库编号',
    create_time DATETIME       NOT NULL COMMENT '创建时间',
    update_time DATETIME       NOT NULL COMMENT '更新时间',
    deleted     INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no          VARCHAR(255)   NOT NULL COMMENT '出库单号',
    customer_id BIGINT         NOT NULL COMMENT '客户编号',
    out_time    DATETIME       NOT NULL COMMENT '出库时间',
    total_count DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    status      INT            NOT NULL COMMENT '状态',
    remark      TEXT COMMENT '备注',
    file_url    VARCHAR(255) COMMENT '附件 URL',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 其它出库单';


DROP TABLE IF EXISTS erp_stock_out;

CREATE TABLE erp_stock_out
(
    `creator`   varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint         NOT NULL DEFAULT '0',
    `id`        bigint         NOT NULL AUTO_INCREMENT COMMENT '出库编号',
    create_time DATETIME       NOT NULL COMMENT '创建时间',
    update_time DATETIME       NOT NULL COMMENT '更新时间',
    deleted     INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no          VARCHAR(255)   NOT NULL COMMENT '出库单号',
    customer_id BIGINT         NOT NULL COMMENT '客户编号',
    out_time    DATETIME       NOT NULL COMMENT '出库时间',
    total_count DECIMAL(18, 2) NOT NULL COMMENT '合计数量',
    total_price DECIMAL(18, 2) NOT NULL COMMENT '合计金额',
    status      INT            NOT NULL COMMENT '状态',
    remark      TEXT COMMENT '备注',
    file_url    VARCHAR(255) COMMENT '附件 URL',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 其它出库单';

DROP TABLE IF EXISTS erp_stock_record;

CREATE TABLE erp_stock_record
(
    `creator`    varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`    varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`  bigint         NOT NULL DEFAULT '0',
    `id`         bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time  DATETIME       NOT NULL COMMENT '创建时间',
    update_time  DATETIME       NOT NULL COMMENT '更新时间',
    deleted      INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    product_id   BIGINT         NOT NULL COMMENT '产品编号',
    warehouse_id BIGINT         NOT NULL COMMENT '仓库编号',
    count        DECIMAL(18, 2) NOT NULL COMMENT '出入库数量',
    total_count  DECIMAL(18, 2) NOT NULL COMMENT '总库存量',
    biz_type     INT            NOT NULL COMMENT '业务类型',
    biz_id       BIGINT         NOT NULL COMMENT '业务编号',
    biz_item_id  BIGINT         NOT NULL COMMENT '业务项编号',
    biz_no       VARCHAR(255)   NOT NULL COMMENT '业务单号',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 产品库存明细';


DROP TABLE IF EXISTS erp_warehouse;

CREATE TABLE erp_warehouse
(
    `creator`       varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`       varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`     bigint       NOT NULL DEFAULT '0',
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT '仓库编号',
    create_time     DATETIME     NOT NULL COMMENT '创建时间',
    update_time     DATETIME     NOT NULL COMMENT '更新时间',
    deleted         INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name            VARCHAR(255) NOT NULL COMMENT '仓库名称',
    address         VARCHAR(255) NOT NULL COMMENT '仓库地址',
    sort            BIGINT       NOT NULL COMMENT '排序',
    remark          TEXT COMMENT '备注',
    principal       VARCHAR(255) COMMENT '负责人',
    warehouse_price DECIMAL(18, 2) COMMENT '仓储费',
    truckage_price  DECIMAL(18, 2) COMMENT '搬运费',
    status          INT          NOT NULL COMMENT '开启状态',
    default_status  BOOLEAN      NOT NULL COMMENT '是否默认',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='ERP 仓库信息';
