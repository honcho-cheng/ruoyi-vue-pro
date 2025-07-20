DROP TABLE IF EXISTS report_go_view_project;

CREATE TABLE report_go_view_project
(
    `creator`   varchar(64)  NULL     DEFAULT '' COMMENT '创建者',
    `updater`   varchar(64)  NULL     DEFAULT '' COMMENT '更新者',
    `tenant_id` bigint       NOT NULL DEFAULT '0',
    `id`        bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    create_time DATETIME     NOT NULL COMMENT '创建时间',
    update_time DATETIME     NOT NULL COMMENT '更新时间',
    deleted     INT          NOT NULL DEFAULT 0 COMMENT '是否删除 (0-未删除, 1-已删除)',
    name        VARCHAR(255) NOT NULL COMMENT '项目名称',
    pic_url     VARCHAR(255) COMMENT '预览图片 URL',
    content     TEXT         NOT NULL COMMENT '报表内容 JSON 配置',
    status      INT          NOT NULL COMMENT '发布状态: 0-已发布, 1-未发布',
    remark      TEXT COMMENT '项目备注',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='GoView 项目表';
