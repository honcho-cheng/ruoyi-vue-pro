DROP TABLE IF EXISTS crm_business;

CREATE TABLE crm_business
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name                VARCHAR(255)   NOT NULL COMMENT '商机名称',
    customer_id         BIGINT         NOT NULL COMMENT '客户编号',
    follow_up_status    BOOLEAN COMMENT '跟进状态',
    contact_last_time   DATETIME COMMENT '最后跟进时间',
    contact_next_time   DATETIME COMMENT '下次联系时间',
    owner_user_id       BIGINT         NOT NULL COMMENT '负责人用户编号',
    status_type_id      BIGINT         NOT NULL COMMENT '商机状态组编号',
    status_id           BIGINT         NOT NULL COMMENT '商机状态编号',
    end_status          INT COMMENT '结束状态',
    end_remark          TEXT COMMENT '结束备注',
    deal_time           DATETIME COMMENT '预计成交日期',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '产品总金额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '整单折扣百分比',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '商机总金额',
    remark              TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 商机表';



DROP TABLE IF EXISTS crm_business_product;

CREATE TABLE crm_business_product
(
    `creator`      varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint         NOT NULL DEFAULT '0',
    `id`           bigint         NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time    DATETIME       NOT NULL COMMENT '创建时间',
    update_time    DATETIME       NOT NULL COMMENT '更新时间',
    deleted        INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    business_id    BIGINT         NOT NULL COMMENT '商机编号',
    product_id     BIGINT         NOT NULL COMMENT '产品编号',
    product_price  DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    business_price DECIMAL(18, 2) NOT NULL COMMENT '商机价格',
    count          DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price    DECIMAL(18, 2) NOT NULL COMMENT '总计价格',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 商机产品关联表';


DROP TABLE IF EXISTS crm_business_status;

CREATE TABLE crm_business_status
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    type_id     BIGINT       NOT NULL COMMENT '状态类型编号',
    name        VARCHAR(255) NOT NULL COMMENT '状态名',
    percent     INT          NOT NULL COMMENT '赢单率百分比',
    sort        INT          NOT NULL COMMENT '排序',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 商机状态表';


DROP TABLE IF EXISTS crm_business_status_type;

CREATE TABLE crm_business_status_type
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '状态类型名',
    dept_ids    JSON COMMENT '使用部门编号数组',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 商机状态组表';


DROP TABLE IF EXISTS crm_clue;

CREATE TABLE crm_clue
(
    `creator`            varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`            varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`          bigint       NOT NULL DEFAULT '0',
    `id`                 bigint       NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time          DATETIME     NOT NULL COMMENT '创建时间',
    update_time          DATETIME     NOT NULL COMMENT '更新时间',
    deleted              INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name                 VARCHAR(255) NOT NULL COMMENT '线索名称',
    follow_up_status     BOOLEAN COMMENT '跟进状态',
    contact_last_time    DATETIME COMMENT '最后跟进时间',
    contact_last_content TEXT COMMENT '最后跟进内容',
    contact_next_time    DATETIME COMMENT '下次联系时间',
    owner_user_id        BIGINT       NOT NULL COMMENT '负责人用户编号',
    transform_status     BOOLEAN      NOT NULL COMMENT '转化状态',
    customer_id          BIGINT COMMENT '客户编号',
    mobile               VARCHAR(20) COMMENT '手机号',
    telephone            VARCHAR(20) COMMENT '电话',
    qq                   VARCHAR(30) COMMENT 'QQ',
    wechat               VARCHAR(255) COMMENT '微信',
    email                VARCHAR(255) COMMENT '邮箱',
    area_id              INT COMMENT '所在地',
    detail_address       VARCHAR(255) COMMENT '详细地址',
    industry_id          INT COMMENT '所属行业',
    level                INT COMMENT '客户等级',
    source               INT COMMENT '客户来源',
    remark               TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 线索表';

DROP TABLE IF EXISTS crm_contact;

CREATE TABLE crm_contact
(
    `creator`            varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`            varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`          bigint       NOT NULL DEFAULT '0',
    `id`                 bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time          DATETIME     NOT NULL COMMENT '创建时间',
    update_time          DATETIME     NOT NULL COMMENT '更新时间',
    deleted              INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name                 VARCHAR(255) NOT NULL COMMENT '联系人姓名',
    customer_id          BIGINT       NOT NULL COMMENT '客户编号',
    contact_last_time    DATETIME COMMENT '最后跟进时间',
    contact_last_content TEXT COMMENT '最后跟进内容',
    contact_next_time    DATETIME COMMENT '下次联系时间',
    owner_user_id        BIGINT       NOT NULL COMMENT '负责人用户编号',
    mobile               VARCHAR(20) COMMENT '手机号',
    telephone            VARCHAR(20) COMMENT '电话',
    email                VARCHAR(255) COMMENT '电子邮箱',
    qq                   BIGINT COMMENT 'QQ',
    wechat               VARCHAR(255) COMMENT '微信',
    area_id              INT COMMENT '所在地',
    detail_address       VARCHAR(255) COMMENT '详细地址',
    sex                  INT COMMENT '性别',
    master               BOOLEAN COMMENT '是否关键决策人',
    post                 VARCHAR(255) COMMENT '职位',
    parent_id            BIGINT COMMENT '直属上级',
    remark               TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 联系人表';


DROP TABLE IF EXISTS crm_contact_business;

CREATE TABLE crm_contact_business
(
    `creator`   varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint      NOT NULL DEFAULT '0',
    `id`        bigint      NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME    NOT NULL COMMENT '创建时间',
    update_time DATETIME    NOT NULL COMMENT '更新时间',
    deleted     INT         NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    contact_id  BIGINT      NOT NULL COMMENT '联系人编号',
    business_id BIGINT      NOT NULL COMMENT '商机编号',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 联系人与商机关联表';

DROP TABLE IF EXISTS crm_contract_config;

CREATE TABLE crm_contract_config
(
    `creator`      varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint      NOT NULL DEFAULT '0',
    `id`           bigint      NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time    DATETIME    NOT NULL COMMENT '创建时间',
    update_time    DATETIME    NOT NULL COMMENT '更新时间',
    deleted        INT         NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    notify_enabled BOOLEAN     NOT NULL COMMENT '是否开启提前提醒',
    notify_days    INT         NOT NULL COMMENT '提前提醒天数',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 合同配置表';

DROP TABLE IF EXISTS crm_contract;

CREATE TABLE crm_contract
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT '合同编号',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name                VARCHAR(255)   NOT NULL COMMENT '合同名称',
    no                  VARCHAR(255)   NOT NULL COMMENT '合同编号',
    customer_id         BIGINT         NOT NULL COMMENT '客户编号',
    business_id         BIGINT COMMENT '商机编号',
    contact_last_time   DATETIME COMMENT '最后跟进时间',
    owner_user_id       BIGINT         NOT NULL COMMENT '负责人用户编号',
    process_instance_id VARCHAR(255) COMMENT '工作流编号',
    audit_status        INT            NOT NULL COMMENT '审批状态',
    order_date          DATETIME       NOT NULL COMMENT '下单日期',
    start_time          DATETIME       NOT NULL COMMENT '开始时间',
    end_time            DATETIME       NOT NULL COMMENT '结束时间',
    total_product_price DECIMAL(18, 2) NOT NULL COMMENT '产品总金额',
    discount_percent    DECIMAL(10, 2) NOT NULL COMMENT '整单折扣',
    total_price         DECIMAL(18, 2) NOT NULL COMMENT '合同总金额',
    sign_contact_id     BIGINT COMMENT '客户签约人',
    sign_user_id        BIGINT COMMENT '公司签约人',
    remark              TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 合同表';

DROP TABLE IF EXISTS crm_contract_product;

CREATE TABLE crm_contract_product
(
    `creator`      varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`      varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`    bigint         NOT NULL DEFAULT '0',
    `id`           bigint         NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time    DATETIME       NOT NULL COMMENT '创建时间',
    update_time    DATETIME       NOT NULL COMMENT '更新时间',
    deleted        INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    contract_id    BIGINT         NOT NULL COMMENT '合同编号',
    product_id     BIGINT         NOT NULL COMMENT '产品编号',
    product_price  DECIMAL(18, 2) NOT NULL COMMENT '产品单价',
    contract_price DECIMAL(18, 2) NOT NULL COMMENT '合同价格',
    count          DECIMAL(18, 2) NOT NULL COMMENT '数量',
    total_price    DECIMAL(18, 2) NOT NULL COMMENT '总计价格',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 合同产品关联表';


DROP TABLE IF EXISTS crm_customer;

CREATE TABLE crm_customer
(
    `creator`            varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`            varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`          bigint       NOT NULL DEFAULT '0',
    `id`                 bigint       NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time          DATETIME     NOT NULL COMMENT '创建时间',
    update_time          DATETIME     NOT NULL COMMENT '更新时间',
    deleted              INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name                 VARCHAR(255) NOT NULL COMMENT '客户名称',
    follow_up_status     BOOLEAN COMMENT '跟进状态',
    contact_last_time    DATETIME COMMENT '最后跟进时间',
    contact_last_content TEXT COMMENT '最后跟进内容',
    contact_next_time    DATETIME COMMENT '下次联系时间',
    owner_user_id        BIGINT       NOT NULL COMMENT '负责人用户编号',
    owner_time           DATETIME COMMENT '成为负责人的时间',
    lock_status          BOOLEAN COMMENT '锁定状态',
    deal_status          BOOLEAN COMMENT '成交状态',
    mobile               VARCHAR(20) COMMENT '手机号',
    telephone            VARCHAR(20) COMMENT '电话',
    qq                   VARCHAR(30) COMMENT 'QQ',
    wechat               VARCHAR(255) COMMENT '微信',
    email                VARCHAR(255) COMMENT '邮箱',
    area_id              INT COMMENT '所在地',
    detail_address       VARCHAR(255) COMMENT '详细地址',
    industry_id          INT COMMENT '所属行业',
    level                INT COMMENT '客户等级',
    source               INT COMMENT '客户来源',
    remark               TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 客户表';


DROP TABLE IF EXISTS crm_customer_limit_config;

CREATE TABLE crm_customer_limit_config
(
    `creator`          varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`          varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`        bigint      NOT NULL DEFAULT '0',
    `id`               bigint      NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time        DATETIME    NOT NULL COMMENT '创建时间',
    update_time        DATETIME    NOT NULL COMMENT '更新时间',
    deleted            INT         NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    type               INT         NOT NULL COMMENT '规则类型',
    user_ids           JSON COMMENT '规则适用人群',
    dept_ids           JSON COMMENT '规则适用部门',
    max_count          INT         NOT NULL COMMENT '数量上限',
    deal_count_enabled BOOLEAN COMMENT '成交客户是否占有拥有客户数',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 客户限制配置表';

DROP TABLE IF EXISTS crm_customer_pool_config;

CREATE TABLE crm_customer_pool_config
(
    `creator`           varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint      NOT NULL DEFAULT '0',
    `id`                bigint      NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time         DATETIME    NOT NULL COMMENT '创建时间',
    update_time         DATETIME    NOT NULL COMMENT '更新时间',
    deleted             INT         NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    enabled             BOOLEAN     NOT NULL COMMENT '是否启用客户公海',
    contact_expire_days INT         NOT NULL COMMENT '未跟进放入公海天数',
    deal_expire_days    INT         NOT NULL COMMENT '未成交放入公海天数',
    notify_enabled      BOOLEAN     NOT NULL COMMENT '是否开启提前提醒',
    notify_days         INT         NOT NULL COMMENT '提前提醒天数',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 客户公海配置表';

DROP TABLE IF EXISTS crm_follow_up_record;

CREATE TABLE crm_follow_up_record
(
    `creator`    varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`    varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`  bigint      NOT NULL DEFAULT '0',
    `id`         bigint      NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time  DATETIME    NOT NULL COMMENT '创建时间',
    update_time  DATETIME    NOT NULL COMMENT '更新时间',
    deleted      INT         NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    biz_type     INT         NOT NULL COMMENT '数据类型',
    biz_id       BIGINT      NOT NULL COMMENT '数据编号',
    type         INT         NOT NULL COMMENT '跟进类型',
    content      TEXT        NOT NULL COMMENT '跟进内容',
    next_time    DATETIME    NOT NULL COMMENT '下次联系时间',
    pic_urls     JSON COMMENT '图片URLs',
    file_urls    JSON COMMENT '附件URLs',
    business_ids JSON COMMENT '关联商机编号数组',
    contact_ids  JSON COMMENT '关联联系人编号数组',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 跟进记录表';

DROP TABLE IF EXISTS crm_permission;

CREATE TABLE crm_permission
(
    `creator`   varchar(64) NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64) NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint      NOT NULL DEFAULT '0',
    `id`        bigint      NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time DATETIME    NOT NULL COMMENT '创建时间',
    update_time DATETIME    NOT NULL COMMENT '更新时间',
    deleted     INT         NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    biz_type    INT         NOT NULL COMMENT '数据类型',
    biz_id      BIGINT      NOT NULL COMMENT '数据编号',
    user_id     BIGINT      NOT NULL COMMENT '用户编号',
    level       INT         NOT NULL COMMENT '权限级别',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 数据权限表';


DROP TABLE IF EXISTS crm_product_category;

CREATE TABLE crm_product_category
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '分类编号',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '分类名称',
    parent_id   BIGINT       NOT NULL COMMENT '父级编号',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 产品分类表';

DROP TABLE IF EXISTS crm_product;

CREATE TABLE crm_product
(
    `creator`     varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint         NOT NULL DEFAULT '0',
    `id`          bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time   DATETIME       NOT NULL COMMENT '创建时间',
    update_time   DATETIME       NOT NULL COMMENT '更新时间',
    deleted       INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name          VARCHAR(255)   NOT NULL COMMENT '产品名称',
    no            VARCHAR(255)   NOT NULL COMMENT '产品编码',
    unit          INT            NOT NULL COMMENT '单位',
    price         DECIMAL(18, 2) NOT NULL COMMENT '价格',
    status        INT            NOT NULL COMMENT '状态',
    category_id   BIGINT         NOT NULL COMMENT '产品分类ID',
    description   TEXT COMMENT '产品描述',
    owner_user_id BIGINT         NOT NULL COMMENT '负责人用户编号',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 产品表';

DROP TABLE IF EXISTS crm_receivable;

CREATE TABLE crm_receivable
(
    `creator`           varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`           varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`         bigint         NOT NULL DEFAULT '0',
    `id`                bigint         NOT NULL AUTO_INCREMENT COMMENT 'ID',
    create_time         DATETIME       NOT NULL COMMENT '创建时间',
    update_time         DATETIME       NOT NULL COMMENT '更新时间',
    deleted             INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    no                  VARCHAR(255)   NOT NULL COMMENT '回款编号',
    plan_id             BIGINT COMMENT '回款计划编号',
    customer_id         BIGINT         NOT NULL COMMENT '客户编号',
    contract_id         BIGINT         NOT NULL COMMENT '合同编号',
    owner_user_id       BIGINT         NOT NULL COMMENT '负责人编号',
    return_time         DATETIME       NOT NULL COMMENT '回款日期',
    return_type         INT            NOT NULL COMMENT '回款方式',
    price               DECIMAL(18, 2) NOT NULL COMMENT '计划回款金额',
    remark              TEXT COMMENT '备注',
    process_instance_id VARCHAR(255) COMMENT '工作流编号',
    audit_status        INT            NOT NULL COMMENT '审批状态',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 回款表';

DROP TABLE IF EXISTS crm_receivable_plan;

CREATE TABLE crm_receivable_plan
(
    `creator`     varchar(64)    NULL     DEFAULT '' COMMENT '创建者',
    `updater`     varchar(64)    NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id`   bigint         NOT NULL DEFAULT '0',
    `id`          bigint         NOT NULL AUTO_INCREMENT COMMENT '编号',
    create_time   DATETIME       NOT NULL COMMENT '创建时间',
    update_time   DATETIME       NOT NULL COMMENT '更新时间',
    deleted       INT            NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    `period`      INT            NOT NULL COMMENT '期数',
    customer_id   BIGINT         NOT NULL COMMENT '客户编号',
    contract_id   BIGINT         NOT NULL COMMENT '合同编号',
    owner_user_id BIGINT         NOT NULL COMMENT '负责人编号',
    return_time   DATETIME       NOT NULL COMMENT '计划回款日期',
    return_type   INT            NOT NULL COMMENT '计划回款类型',
    price         DECIMAL(18, 2) NOT NULL COMMENT '计划回款金额',
    receivable_id BIGINT COMMENT '回款编号',
    remind_days   INT            NOT NULL COMMENT '提前几天提醒',
    remind_time   DATETIME COMMENT '提醒日期',
    remark        TEXT COMMENT '备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='CRM 回款计划表';
