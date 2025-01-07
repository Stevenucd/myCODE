create database if not exists myCODE;

use myCODE;

-- User Table
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userAccount  varchar(256)                           not null comment 'account',
    userPassword varchar(512)                           not null comment 'password',
    unionId      varchar(256)                           null comment 'unionId',
    mpOpenId     varchar(256)                           null comment 'myOpenId',
    userName     varchar(256)                           null comment 'username',
    userAvatar   varchar(1024)                          null comment 'user avatar',
    userProfile  varchar(512)                           null comment 'user profile',
    userRole     varchar(256) default 'user'            not null comment 'user role：user/admin/ban',
    editTime     datetime     default CURRENT_TIMESTAMP not null comment 'user edit time',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment 'create time',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'update time',
    isDelete     tinyint      default 0                 not null comment 'is delete or not',
    index idx_unionId (unionId)
) comment 'user' collate = utf8mb4_unicode_ci;


-- question bank table
create table if not exists question_bank
(
    id          bigint auto_increment comment 'id' primary key,
    title       varchar(256)                       null comment 'title',
    description text                               null comment 'description',
    picture     varchar(2048)                      null comment 'picture',
    userId      bigint                             not null comment 'user id',
    editTime    datetime default CURRENT_TIMESTAMP not null comment 'edit time',
    createTime  datetime default CURRENT_TIMESTAMP not null comment 'create time',
    updateTime  datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'update time',
    isDelete    tinyint  default 0                 not null comment 'is delete or not',
    index idx_title (title)
) comment 'question_bank' collate = utf8mb4_unicode_ci;


-- question table
create table if not exists question
(
    id         bigint auto_increment comment 'id' primary key,
    title      varchar(256)                       null comment 'title',
    content    text                               null comment 'content',
    tags       varchar(1024)                      null comment 'tag list（json array）',
    answer     text                               null comment 'answer',
    userId     bigint                             not null comment 'user id',
    editTime   datetime default CURRENT_TIMESTAMP not null comment 'edit time',
    createTime datetime default CURRENT_TIMESTAMP not null comment 'create time',
    updateTime datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'update time',
    isDelete   tinyint  default 0                 not null comment 'is delete or not',
    index idx_title (title),
    index idx_userId (userId)
) comment 'question' collate = utf8mb4_unicode_ci;


-- question bank question（delete directly）
create table if not exists question_bank_question
(
    id             bigint auto_increment comment 'id' primary key,
    questionBankId bigint                             not null comment 'question bank id',
    questionId     bigint                             not null comment 'question id',
    userId         bigint                             not null comment 'user id',
    createTime     datetime default CURRENT_TIMESTAMP not null comment 'create time',
    updateTime     datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'update time',
    UNIQUE (questionBankId, questionId)
) comment 'question_bank_question' collate = utf8mb4_unicode_ci;
