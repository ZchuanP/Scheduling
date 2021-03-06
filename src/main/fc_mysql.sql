/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2021/4/13 9:58:33                            */
/*==============================================================*/


drop table if exists distri_process;

drop table if exists need_resouce;

drop table if exists orderinfo;

drop table if exists processes;

drop table if exists product_fixed;

drop table if exists product_semi;

drop table if exists real_product;

drop table if exists resource;

drop table if exists semi_product;

/*==============================================================*/
/* Table: distri_process                                        */
/*==============================================================*/
create table distri_process
(
    process_id           int not null,
    resource_id          int not null,
    semi_id              int not null,
    is_para              bool not null,
    max_para             int not null,
    oper_time            int not null,
    pro_workspace        varchar(20) not null,
    pro_start_time       int not null,
    pro_end_time         int not null,
    id                   int not null,
    primary key (id)
);

/*==============================================================*/
/* Table: need_resouce                                          */
/*==============================================================*/
create table need_resouce
(
    resource_type        varchar(20) not null,
    resouce_num          int not null,
    need_id              int not null,
    process_id           int not null,
    primary key (need_id)
);

/*==============================================================*/
/* Table: ordeinfo                                              */
/*==============================================================*/
create table ordeinfo
(
    order_id             int not null,
    order_end_time       int not null,
    order_descri         text,
    order_start_time     int not null,
    real_start_time      int,
    real_end_time        int,
    primary key (order_id)
);

/*==============================================================*/
/* Table: processes                                             */
/*==============================================================*/
create table processes
(
    process_id           int not null,
    semi_id              int not null,
    is_para              bool not null,
    max_para             int not null,
    oper_time            int not null,
    pro_workspace        varchar(20) not null,
    primary key (process_id)
);

/*==============================================================*/
/* Table: product_fixed                                         */
/*==============================================================*/
create table product_fixed
(
    product_id           int not null,
    primary key (product_id)
);

/*==============================================================*/
/* Table: product_semi                                          */
/*==============================================================*/
create table product_semi
(
    product_id           int not null,
    semi_id              int not null,
    primary key (product_id, semi_id)
);

/*==============================================================*/
/* Table: real_product                                          */
/*==============================================================*/
create table real_product
(
    product_id           int not null,
    order_id             int not null,
    product_num          int not null,
    id                   int not null,
    primary key (id)
);

/*==============================================================*/
/* Table: resource                                              */
/*==============================================================*/
create table resource
(
    resource_id          int not null,
    workspace            varchar(20) not null,
    resource_type        varchar(20) not null,
    to_free_time         int not null,
    primary key (resource_id)
);

/*==============================================================*/
/* Table: semi_product                                          */
/*==============================================================*/
create table semi_product
(
    semi_id              int not null,
    primary key (semi_id)
);

alter table distri_process add constraint FK_Relationship_7 foreign key (resource_id)
    references resource (resource_id) on delete restrict on update restrict;

alter table distri_process add constraint FK_distri_pro foreign key (process_id)
    references processes (process_id) on delete restrict on update restrict;

alter table need_resouce add constraint FK_pro_resouce foreign key (process_id)
    references processes (process_id) on delete restrict on update restrict;

alter table processes add constraint FK_pro_semi foreign key (semi_id)
    references semi_product (semi_id) on delete restrict on update restrict;

alter table product_semi add constraint FK_product_semi foreign key (product_id)
    references product_fixed (product_id) on delete restrict on update restrict;

alter table product_semi add constraint FK_product_semi2 foreign key (semi_id)
    references semi_product (semi_id) on delete restrict on update restrict;

alter table real_product add constraint FK_be_order foreign key (product_id)
    references product_fixed (product_id) on delete restrict on update restrict;

alter table real_product add constraint FK_order_product foreign key (order_id)
    references orderinfo (order_id) on delete restrict on update restrict;


insert into orderinfo values (1, 1000, '12th????????????', 0,5,15);
insert into orderinfo values (2, 1050, '12th????????????', 0,0,3);
insert into orderinfo values (3, 950, '12th????????????', 0,10,25);


insert into product_fixed values (1);
insert into product_fixed values (2);
insert into product_fixed values (3);
insert into product_fixed values (4);
insert into product_fixed values (5);
insert into product_fixed values (6);

# insert into semi_product values (2),(3),(4),(5),(6);
#
# insert into product_semi values (1,2),
#                                 (1,3),
#                                 (1,4),
#                                 (2,1),
#                                 (2,5),
#                                 (3,2),
#                                 (3,6),
#                                 (4,2),
#                                 (4,4),
#                                 (5,3),
#                                 (5,6),
#                                 (6,1),
#                                 (6,2);
#
# insert into product_fixed values (1);
#
# insert into product_fixed (product_id) values (1);
# insert into  semi_product (semi_id) values (2);
# insert into product_semi (product_id, semi_id) values (1,2);
# insert into resource (resource_id, workspace, resource_type, to_free_time) values
#     (1,'produce','??????',30);
# insert into need_resouce (resource_type, resouce_num, process_id) values
#     ('??????',2,1);
# insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values
#     (1,1,true,10,20,'assemble');
#
#
#
#
# insert into processes values (1,1,true,10,5,'Processing'),
#                              (2,1,false,1,10,'Processing'),
#                              (3,1,false,1,2,'Processing'),
#                              (4,1,true,15,20,'assembly'),
#                              (5,2,false,1,12,'Processing'),
#                              (6,2,false,1,10,'Processing'),
#                              (7,2,false,1,20,'Processing'),
#                              (8,2,true,15,20,'assembly'),
#                              (9,3,false,1,5,'Processing'),
#                              (10,3,false,1,10,'Processing'),
#                              (11,3,false,1,2,'Processing'),
#                              (12,3,true,15,20,'assembly'),
#                              (13,4,false,1,5,'Processing'),
#                              (14,4,true,12,10,'assembly'),
#                              (15,5,false,1,2,'Processing'),
#                              (16,5,true,15,20,'assembly'),
#                              (17,6,false,1,2,'Processing'),
#                              (18,6,true,15,20,'assembly');
#
# insert into need_resouce values ('??????',1,1,1),
#                                 ('??????',2,2,1),
#                                 ('????????????',2,3,1),
#                                 ('??????',1,4,2),
#                                 ('??????',2,5,2),
#                                 ('????????????',2,6,2),
#                                 ('??????',1,7,3),
#                                 ('??????',2,8,3),
#                                 ('????????????',2,9,3),
#                                 ('??????',1,10,4),
#                                 ('??????',2,11,4),
#                                 ('????????????',2,54,4),
#                                 ('??????',1,12,5),
#                                 ('??????',2,13,5),
#                                 ('????????????',2,14,5),
#                                 ('??????',1,15,6),
#                                 ('??????',2,16,6),
#                                 ('????????????',2,17,6),
#                                 ('??????',1,18,7),
#                                 ('??????',2,19,7),
#                                 ('????????????',2,20,7),
#                                 ('??????',1,21,8),
#                                 ('??????',2,22,8),
#                                 ('????????????',2,23,8),
#                                 ('??????',1,24,9),
#                                 ('??????',2,25,9),
#                                 ('????????????',2,26,9),
#                                 ('??????',1,27,10),
#                                 ('??????',2,28,10),
#                                 ('????????????',2,29,10),
#                                 ('??????',1,30,11),
#                                 ('??????',2,31,11),
#                                 ('????????????',2,32,11),
#                                 ('??????',1,33,12),
#                                 ('??????',2,34,12),
#                                 ('????????????',2,35,12),
#                                 ('??????',1,36,13),
#                                 ('??????',2,37,13),
#                                 ('????????????',2,38,13),
#                                 ('??????',1,39,14),
#                                 ('??????',2,40,14),
#                                 ('????????????',2,41,14),
#                                 ('??????',1,42,15),
#                                 ('??????',2,43,15),
#                                 ('????????????',2,44,15),
#                                 ('??????',1,45,16),
#                                 ('??????',2,46,16),
#                                 ('????????????',2,47,16),
#                                 ('??????',1,48,17),
#                                 ('??????',2,49,17),
#                                 ('????????????',2,50,17),
#                                 ('??????',1,51,18),
#                                 ('??????',2,52,18),
#                                 ('????????????',2,53,18);
#
# insert into real_product values (5,1,18,1);
# insert into real_product values (6,1,6,2);
# insert into real_product values (4,2,10,3);
# insert into real_product values (2,2,15,4);
# insert into real_product values (5,2,18,5);
# insert into real_product values (3,3,15,6);
# insert into real_product values (1,3,10,7);

INSERT INTO SEMI_PRODUCT VALUES(1);
INSERT INTO SEMI_PRODUCT VALUES(18);
INSERT INTO SEMI_PRODUCT VALUES(15);
INSERT INTO SEMI_PRODUCT VALUES(14);
INSERT INTO SEMI_PRODUCT VALUES(6);
INSERT INTO SEMI_PRODUCT VALUES(16);
INSERT INTO SEMI_PRODUCT VALUES(9);
INSERT INTO SEMI_PRODUCT VALUES(4);
INSERT INTO SEMI_PRODUCT VALUES(19);
INSERT INTO SEMI_PRODUCT VALUES(3);
INSERT INTO SEMI_PRODUCT VALUES(20);
INSERT INTO SEMI_PRODUCT VALUES(5);
INSERT INTO SEMI_PRODUCT VALUES(12);
INSERT INTO SEMI_PRODUCT VALUES(17);
INSERT INTO SEMI_PRODUCT VALUES(7);
INSERT INTO SEMI_PRODUCT VALUES(10);


INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,4);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,15);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,1);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,10);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,18);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(1,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,19);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,5);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,15);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,14);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(2,1);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,16);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,7);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,19);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,10);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(3,4);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,19);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,14);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,3);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,20);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(4,5);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,6);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,12);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,17);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,7);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,4);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(5,10);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(6,1);
INSERT INTO PRODUCT_SEMI (product_id, semi_id) VALUES(6,4);



insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(6,1,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(7,1,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(8,1,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(9,1,true,15,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(11,2,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(12,2,true,8,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(13,2,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(14,2,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(16,3,true,15,80,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(17,3,true,8,80,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(18,3,true,10,80,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(19,3,true,6,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(21,4,true,10,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(22,4,true,6,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(23,4,true,10,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(24,4,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(26,5,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(27,5,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(28,5,true,6,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(29,5,true,8,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(31,6,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(32,6,true,8,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(33,6,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(34,6,true,15,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(36,7,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(37,7,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(38,7,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(39,7,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(41,8,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(42,8,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(43,8,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(44,8,true,6,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(46,9,true,10,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(47,9,true,10,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(48,9,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(49,9,true,6,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(51,10,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(52,10,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(53,10,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(54,10,true,8,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(56,11,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(57,11,true,6,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(58,11,true,10,80,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(59,11,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(61,12,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(62,12,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(63,12,true,8,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(64,12,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(66,13,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(67,13,true,10,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(68,13,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(69,13,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(71,14,true,8,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(72,14,true,6,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(73,14,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(74,14,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(76,15,false,1,1,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(77,15,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(78,15,true,15,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(79,15,true,8,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(81,16,true,10,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(82,16,true,6,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(83,16,true,15,80,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(84,16,true,10,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(86,17,true,8,20,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(87,17,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(88,17,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(89,17,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(91,18,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(92,18,false,1,4,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(93,18,true,6,120,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(94,18,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(96,19,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(97,19,true,6,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(98,19,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(99,19,true,15,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(101,20,true,10,40,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(102,20,false,1,2,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(103,20,false,1,6,'??????');
insert into processes (process_id, semi_id, is_para, max_para, oper_time, pro_workspace) values(104,20,false,1,6,'??????');


insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,6);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,7);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,8);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,9);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,11);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,12);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,12);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,12);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,13);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,14);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,16);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,17);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,17);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,17);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,18);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,19);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,21);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,22);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,23);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,24);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,26);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,27);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,27);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,28);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,29);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,31);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,32);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,33);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,34);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,34);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,36);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,37);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,37);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,37);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,38);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,38);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,38);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,39);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,41);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,42);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,43);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,44);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,46);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,46);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,47);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,48);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,49);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,49);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,49);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,51);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,52);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,53);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,54);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,56);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,57);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,58);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,59);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,61);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,62);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,63);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,64);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,66);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,67);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,68);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,69);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,71);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,72);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,73);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,74);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,76);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,77);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,78);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,78);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,78);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,79);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,81);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,82);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,83);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,84);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,86);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,87);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,88);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,89);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,89);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,89);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,91);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,92);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,93);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,94);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',4,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,96);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,97);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,98);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,99);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,99);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,99);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',5,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,101);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',1,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,102);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',1,103);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',3,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',2,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('????????????',2,104);
insert into need_resouce (resource_type, resouce_num, process_id) values('??????',3,201);


insert into resource (resource_id, workspace, resource_type, to_free_time) values(1,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(2,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(3,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(4,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(5,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(6,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(7,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(8,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(9,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(10,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(11,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(12,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(13,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(14,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(15,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(16,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(17,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(18,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(19,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(20,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(21,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(22,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(23,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(24,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(25,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(26,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(27,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(28,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(29,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(30,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(31,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(32,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(33,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(34,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(35,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(36,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(37,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(38,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(39,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(40,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(41,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(42,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(43,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(44,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(45,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(46,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(47,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(48,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(49,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(50,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(51,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(52,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(53,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(54,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(55,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(56,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(57,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(58,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(59,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(60,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(61,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(62,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(63,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(64,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(65,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(66,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(67,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(68,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(69,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(70,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(71,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(72,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(73,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(74,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(75,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(76,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(77,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(78,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(79,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(80,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(81,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(82,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(83,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(84,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(85,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(86,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(87,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(88,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(89,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(90,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(91,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(92,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(93,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(94,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(95,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(96,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(97,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(98,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(99,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(100,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(101,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(102,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(103,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(104,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(105,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(106,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(107,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(108,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(109,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(110,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(111,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(112,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(113,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(114,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(115,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(116,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(117,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(118,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(119,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(120,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(121,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(122,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(123,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(124,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(125,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(126,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(127,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(128,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(129,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(130,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(131,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(132,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(133,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(134,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(135,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(136,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(137,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(138,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(139,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(140,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(141,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(142,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(143,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(144,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(145,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(146,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(147,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(148,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(149,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(150,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(151,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(152,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(153,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(154,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(155,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(156,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(157,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(158,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(159,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(160,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(161,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(162,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(163,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(164,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(165,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(166,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(167,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(168,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(169,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(170,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(171,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(172,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(173,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(174,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(175,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(176,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(177,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(178,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(179,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(180,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(181,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(182,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(183,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(184,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(185,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(186,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(187,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(188,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(189,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(190,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(191,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(192,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(193,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(194,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(195,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(196,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(197,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(198,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(199,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(200,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(201,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(202,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(203,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(204,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(205,'??????','??????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(206,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(207,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(208,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(209,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(210,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(211,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(212,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(213,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(214,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(215,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(216,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(217,'??????','????????????',0);
insert into resource (resource_id, workspace, resource_type, to_free_time) values(218,'??????','????????????',0);

