/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     19/05/10 12:50:24                            */
/*==============================================================*/


drop table if exists Address;

drop table if exists cart;

drop table if exists contact_manager;

drop table if exists goods;

drop table if exists goods_assess;

drop table if exists `order`;

drop table if exists order_detail;

drop table if exists syslog;

drop table if exists user;

/*==============================================================*/
/* Table: Address                                               */
/*==============================================================*/
create table Address
(
   address_id           int not null  AUTO_INCREMENT comment 'ID',
   user_id              int comment '用户ID-外键',
   user_name            varchar(255) not null comment '收货人姓名',
   user_phone           varchar(20) not null comment '收货人手机号码',
   detail_address       varchar(255) not null comment '详细地址',
   is_default           bool comment '默认地址',
   address_valid        bool not null default 1 comment '0-无效 1-有效',
   primary key (address_id)
);

/*==============================================================*/
/* Table: cart                                                  */
/*==============================================================*/
create table cart
(
   cart_id              int not null AUTO_INCREMENT comment 'ID',
   user_id              int comment '用户ID-外键',
   goods_id             int comment '商品ID-外键',
   isBuy                smallint not null default 0 comment '0-未购买 1-已购买',
   cart_goods_num       char(10) not null comment '购物车商品数量',
   cart_valid           bool not null default 1 comment '0-无效 1-有效',
   primary key (cart_id)
);

/*==============================================================*/
/* Table: contact_manager                                       */
/*==============================================================*/
create table contact_manager
(
   contact_manager_id   int not null AUTO_INCREMENT comment 'ID',
   user_id              int comment '用户ID-外键',
   goods_id             int comment '商品ID-外键',
   user_msg             varchar(255) comment '用户消息',
   manager_msg          varchar(255) comment '管理员回复',
   isReply              bool not null default 0 comment '0-未回复 1-已回复',
   manager_name         varchar(255) comment '回复者',
   contact_manager_valid bool not null default 1 comment '0-无效 1-有效',
   primary key (contact_manager_id)
);

/*==============================================================*/
/* Table: goods                                                 */
/*==============================================================*/
create table goods
(
   goods_id             int not null AUTO_INCREMENT comment 'ID',
   goods_no             varchar(255) not null comment '商品编号',
   goods_name           varchar(255) not null comment '商品名称',
   goods_image_url      varchar(255) not null comment '商品图片url',
   goods_price          double not null comment '商品价格',
   goods_num            int not null comment '商品数量',
   goods_stock          int not null comment '商品库存',
   goods_desc           varchar(255) comment '商品描述',
   goods_score          double comment '商品评价',
   visit_num            int default 0 comment '访问数',
   goods_valid          bool default 1 comment '0-无效 1-有效',
   primary key (goods_id)
);

/*==============================================================*/
/* Table: goods_assess                                          */
/*==============================================================*/
create table goods_assess
(
   goods_assess_id      int not null AUTO_INCREMENT comment 'ID',
   user_id              int comment '用户ID-外键',
   goods_id             int comment '商品ID-外键',
   goods_assess_score   int comment '总评价分',
   goods_assess_content varchar(255) comment '评价内容',
   canAssess            bool not null default 0 comment '0-无权限 1-有权限 用户购买商品后才能有权限进行评价',
   goods_assess_valid   bool not null default 1 comment '0-无效 1-有效',
   primary key (goods_assess_id)
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table `order`
(
   order_id             int not null AUTO_INCREMENT comment 'ID',
   user_id              int comment '用户ID-外键',
   order_no             varchar(255) not null comment '订单号',
   goods_money          double not null comment '商品总额',
   deliver_money        double not null comment '运费',
   total_money          double not null comment '订单总金额',
   order_status         smallint not null default 0 comment '0-未支付 1-待发货 2-用户取消 3-配送中 4-用户确认收货',
   isPay                smallint not null default 0 comment '0-未支付 1-已支付',
   isInvoice            smallint not null default 0 comment '0-不需要发票 1-需要发票',
   isClosed             smallint not null default 0 comment '0-订单未完结 1-订单已完结',
   invoice_client       varchar(255) comment '发票抬头',
   tax_num              varchar(255) comment '发票税号',
   order_remark         varchar(255) comment '订单备注',
   receive_time         timestamp comment '收货时间',
   delivery_time        timestamp comment '发货时间',
   create_time          timestamp comment '下单时间',
   express_no           varchar(255) comment '快递号',
   express_name         varchar(255) comment '快递公司',
   order_valid          bool not null default 1 comment '0-无效 1-有效',
   primary key (order_id)
);

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail
(
   order_detail_id      int not null AUTO_INCREMENT comment 'ID',
   goods_id             int comment '商品ID',
   order_id             int comment '订单ID',
   order_goods_num      int not null default 0 comment '商品数量',
   order_detail_valid   bool not null default 1 comment '0-无效 1-有效',
   primary key (order_detail_id)
);

/*==============================================================*/
/* Table: syslog                                                */
/*==============================================================*/
create table syslog
(
   log_id               int not null AUTO_INCREMENT comment 'ID',
   sys_user             varchar(255) not null comment '用户名',
   sys_operator         varchar(255) comment '操作名',
   sys_module           varchar(255) comment '操作模块',
   sys_ip               varchar(255) comment 'IP',
   sys_content          varchar(255) comment '操作内容',
   sys_time				timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
   sys_valid            bool not null default 1 comment '0-无效 1-有效',
   primary key (log_id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   user_id              int not null AUTO_INCREMENT comment 'ID',
   login_account        varchar(255) not null comment '登录账号',
   password             varchar(255) not null comment '密码',
   id_card              varchar(255) not null comment '身份证',
   phone                varchar(255) not null comment '联系电话',
   email                varchar(255) comment '电子邮箱',
   sex                  varchar(10) comment '性别',
   manage               bool not null default 0 comment '0-用户 1-管理员',
   user_valid           bool not null default 1 comment '0-无效 1-有效',
   primary key (user_id)
);

alter table Address add constraint FK_Relationship_13 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table cart add constraint FK_Relationship_12 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table cart add constraint FK_Relationship_2 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table contact_manager add constraint FK_Relationship_10 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table contact_manager add constraint FK_Relationship_11 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table goods_assess add constraint FK_Relationship_8 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table goods_assess add constraint FK_Relationship_9 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table `order` add constraint FK_Relationship_4 foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table order_detail add constraint FK_Relationship_5 foreign key (goods_id)
      references goods (goods_id) on delete restrict on update restrict;

alter table order_detail add constraint FK_Relationship_6 foreign key (order_id)
      references `order` (order_id) on delete restrict on update restrict;

