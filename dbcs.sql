BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `django_migrations` (
	`id`	integer NOT NULL,
	`app`	varchar(255) NOT NULL,
	`name`	varchar(255) NOT NULL,
	`applied`	datetime NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
	`id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT),
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
	`id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	`group_id`	integer NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT),
	FOREIGN KEY(`group_id`) REFERENCES `auth_group`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
	`id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	`permission_id`	integer NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`permission_id`) REFERENCES `auth_permission`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `django_admin_log` (
	`id`	integer NOT NULL,
	`action_time`	datetime NOT NULL,
	`object_id`	text,
	`object_repr`	varchar(200) NOT NULL,
	`change_message`	text NOT NULL,
	`content_type_id`	integer,
	`user_id`	integer NOT NULL,
	`action_flag`	smallint unsigned NOT NULL CHECK(`action_flag` >= 0),
	PRIMARY KEY(`id` AUTOINCREMENT),
	FOREIGN KEY(`user_id`) REFERENCES `auth_user`(`id`) DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `django_content_type` (
	`id`	integer NOT NULL,
	`app_label`	varchar(100) NOT NULL,
	`model`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `auth_permission` (
	`id`	integer NOT NULL,
	`content_type_id`	integer NOT NULL,
	`codename`	varchar(100) NOT NULL,
	`name`	varchar(255) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT),
	FOREIGN KEY(`content_type_id`) REFERENCES `django_content_type`(`id`) DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS `auth_group` (
	`id`	integer NOT NULL,
	`name`	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `auth_user` (
	`id`	integer NOT NULL,
	`password`	varchar(128) NOT NULL,
	`last_login`	datetime,
	`is_superuser`	bool NOT NULL,
	`username`	varchar(150) NOT NULL UNIQUE,
	`last_name`	varchar(150) NOT NULL,
	`email`	varchar(254) NOT NULL,
	`is_staff`	bool NOT NULL,
	`is_active`	bool NOT NULL,
	`date_joined`	datetime NOT NULL,
	`first_name`	varchar(150) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `django_session` (
	`session_key`	varchar(40) NOT NULL,
	`session_data`	text NOT NULL,
	`expire_date`	datetime NOT NULL,
	PRIMARY KEY(`session_key`)
);
CREATE TABLE IF NOT EXISTS `despesas_despesa` (
	`id`	integer NOT NULL,
	`descricao`	varchar(100) NOT NULL,
	`valor_gasto`	decimal NOT NULL,
	`valor_recebido`	decimal NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `servico_assistencia` (
	`id`	integer NOT NULL,
	`assistencia`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `RodsanSolutions_assistencia` (
	`id`	integer NOT NULL,
	`assistencia`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `RodsanSolutions_servico` (
	`id`	integer NOT NULL,
	`assistencia`	varchar(100) NOT NULL,
	`valoros`	varchar(100) NOT NULL,
	`clientesegurado`	varchar(100) NOT NULL,
	`endereco`	text NOT NULL,
	`servico`	varchar(100) NOT NULL,
	`data`	date NOT NULL,
	`senha`	varchar(100) NOT NULL,
	`cidadeestado`	varchar(100) NOT NULL,
	`telefone`	varchar(100) NOT NULL,
	`material`	varchar(100) NOT NULL,
	`empresa`	varchar(1000) NOT NULL,
	`decricao`	text NOT NULL,
	`foto`	varchar(100) NOT NULL,
	`valorterceirizado`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `servico_serviço` (
	`id`	integer NOT NULL,
	`assistencia`	varchar(100) NOT NULL,
	`clientesegurado`	varchar(100) NOT NULL,
	`servico`	varchar(100) NOT NULL,
	`data`	date NOT NULL,
	`senha`	varchar(100) NOT NULL,
	`cidadeestado`	varchar(100) NOT NULL,
	`telefone`	varchar(100) NOT NULL,
	`material`	varchar(100) NOT NULL,
	`decricao`	text NOT NULL,
	`foto`	varchar(100) NOT NULL,
	`empresa`	varchar(1000) NOT NULL,
	`valoros`	varchar(100) NOT NULL,
	`endereco`	text NOT NULL,
	`valorterceirizado`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `DadosAnteriores_arquivo` (
	`id`	integer NOT NULL,
	`nome`	varchar(100) NOT NULL,
	`data`	date NOT NULL,
	`arquivos1`	varchar(100) NOT NULL,
	`arquivos2`	varchar(100) NOT NULL,
	`arquivos3`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `Colaborador_serviço` (
	`id`	integer NOT NULL,
	`nome`	varchar(100) NOT NULL,
	`assistencia`	varchar(100) NOT NULL,
	`assisnatura`	varchar(100) NOT NULL,
	`checklist`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS `Colaborador_assistencia` (
	`id`	integer NOT NULL,
	`assistencia`	varchar(100) NOT NULL,
	PRIMARY KEY(`id` AUTOINCREMENT)
);
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-05-20 21:53:11.116678');
INSERT INTO `django_migrations` VALUES (2,'auth','0001_initial','2023-05-20 21:53:11.138705');
INSERT INTO `django_migrations` VALUES (3,'admin','0001_initial','2023-05-20 21:53:11.156453');
INSERT INTO `django_migrations` VALUES (4,'admin','0002_logentry_remove_auto_add','2023-05-20 21:53:11.192818');
INSERT INTO `django_migrations` VALUES (5,'admin','0003_logentry_add_action_flag_choices','2023-05-20 21:53:11.209435');
INSERT INTO `django_migrations` VALUES (6,'contenttypes','0002_remove_content_type_name','2023-05-20 21:53:11.227577');
INSERT INTO `django_migrations` VALUES (7,'auth','0002_alter_permission_name_max_length','2023-05-20 21:53:11.240642');
INSERT INTO `django_migrations` VALUES (8,'auth','0003_alter_user_email_max_length','2023-05-20 21:53:11.253380');
INSERT INTO `django_migrations` VALUES (9,'auth','0004_alter_user_username_opts','2023-05-20 21:53:11.263099');
INSERT INTO `django_migrations` VALUES (10,'auth','0005_alter_user_last_login_null','2023-05-20 21:53:11.276690');
INSERT INTO `django_migrations` VALUES (11,'auth','0006_require_contenttypes_0002','2023-05-20 21:53:11.281688');
INSERT INTO `django_migrations` VALUES (12,'auth','0007_alter_validators_add_error_messages','2023-05-20 21:53:11.292892');
INSERT INTO `django_migrations` VALUES (13,'auth','0008_alter_user_username_max_length','2023-05-20 21:53:11.306295');
INSERT INTO `django_migrations` VALUES (14,'auth','0009_alter_user_last_name_max_length','2023-05-20 21:53:11.319926');
INSERT INTO `django_migrations` VALUES (15,'auth','0010_alter_group_name_max_length','2023-05-20 21:53:11.331146');
INSERT INTO `django_migrations` VALUES (16,'auth','0011_update_proxy_permissions','2023-05-20 21:53:11.340700');
INSERT INTO `django_migrations` VALUES (17,'auth','0012_alter_user_first_name_max_length','2023-05-20 21:53:11.354874');
INSERT INTO `django_migrations` VALUES (18,'sessions','0001_initial','2023-05-20 21:53:11.366121');
INSERT INTO `django_migrations` VALUES (19,'servico','0001_initial','2023-05-21 02:02:15.760856');
INSERT INTO `django_migrations` VALUES (20,'servico','0002_auto_20230520_2321','2023-05-21 02:21:13.548166');
INSERT INTO `django_migrations` VALUES (21,'servico','0003_servico_decricao','2023-05-21 02:34:21.646089');
INSERT INTO `django_migrations` VALUES (22,'servico','0004_auto_20230521_0015','2023-05-21 03:15:04.194095');
INSERT INTO `django_migrations` VALUES (23,'servico','0005_servico_foto','2023-05-21 06:09:08.120329');
INSERT INTO `django_migrations` VALUES (24,'servico','0006_servico_empresa','2023-05-21 18:20:13.164266');
INSERT INTO `django_migrations` VALUES (25,'servico','0007_auto_20230521_1540','2023-05-21 18:40:09.937866');
INSERT INTO `django_migrations` VALUES (26,'servico','0008_servico_valorterceizado','2023-05-21 18:42:28.221505');
INSERT INTO `django_migrations` VALUES (27,'servico','0009_servico_endereco','2023-05-21 19:01:02.327498');
INSERT INTO `django_migrations` VALUES (28,'Colaborador','0001_initial','2023-05-21 20:18:50.753588');
INSERT INTO `django_migrations` VALUES (29,'despesas','0001_initial','2023-05-21 20:18:50.761588');
INSERT INTO `django_migrations` VALUES (30,'Colaborador','0002_auto_20230521_1813','2023-05-21 21:13:15.181845');
INSERT INTO `django_migrations` VALUES (31,'servico','0010_assistencia','2023-05-21 21:13:15.188855');
INSERT INTO `django_migrations` VALUES (32,'RodsanSolutions','0001_initial','2023-05-21 22:45:09.558135');
INSERT INTO `django_migrations` VALUES (33,'RodsanSolutions','0002_alter_servico_foto','2023-05-21 22:51:46.369357');
INSERT INTO `django_migrations` VALUES (34,'RodsanSolutions','0003_alter_servico_valoros','2023-05-21 22:52:41.740136');
INSERT INTO `django_migrations` VALUES (35,'servico','0011_alter_servico_valoros','2023-05-21 22:54:53.152462');
INSERT INTO `django_migrations` VALUES (36,'RodsanSolutions','0004_auto_20230521_2000','2023-05-21 23:00:30.788534');
INSERT INTO `django_migrations` VALUES (37,'servico','0012_auto_20230521_2000','2023-05-21 23:00:30.807530');
INSERT INTO `django_migrations` VALUES (38,'servico','0013_auto_20230521_2020','2023-05-21 23:20:54.051100');
INSERT INTO `django_migrations` VALUES (39,'servico','0014_auto_20230521_2031','2023-05-21 23:31:11.755176');
INSERT INTO `django_migrations` VALUES (40,'servico','0015_alter_servico_foto','2023-05-21 23:35:38.747872');
INSERT INTO `django_migrations` VALUES (41,'RodsanSolutions','0005_rename_servico_servicos','2023-05-21 23:49:27.520021');
INSERT INTO `django_migrations` VALUES (42,'DadosAnteriores','0001_initial','2023-05-22 00:03:36.838130');
INSERT INTO `django_migrations` VALUES (43,'Colaborador','0003_rename_colaborador_colaboradore','2023-05-22 00:07:05.390426');
INSERT INTO `django_migrations` VALUES (44,'DadosAnteriores','0002_rename_arquivos_arquivo','2023-05-22 00:07:05.405430');
INSERT INTO `django_migrations` VALUES (45,'RodsanSolutions','0006_rename_servicos_servico','2023-05-22 00:07:05.419419');
INSERT INTO `django_migrations` VALUES (46,'DadosAnteriores','0003_auto_20230521_2138','2023-05-22 00:38:12.567228');
INSERT INTO `django_migrations` VALUES (47,'servico','0016_alter_servico_empresa','2023-05-22 00:38:12.581236');
INSERT INTO `django_migrations` VALUES (48,'Colaborador','0004_colaboradore_nome','2023-05-22 00:55:27.776921');
INSERT INTO `django_migrations` VALUES (49,'Colaborador','0005_colaboradore_assistencia','2023-05-22 00:58:38.281237');
INSERT INTO `django_migrations` VALUES (50,'Colaborador','0006_auto_20230521_2159','2023-05-22 01:00:01.162643');
INSERT INTO `django_migrations` VALUES (51,'Colaborador','0007_assistencia','2023-05-22 01:03:36.409640');
INSERT INTO `django_migrations` VALUES (52,'Colaborador','0008_rename_servico_serviço','2023-05-22 01:07:00.061014');
INSERT INTO `django_migrations` VALUES (53,'servico','0017_rename_servico_serviço','2023-05-22 01:07:00.076016');
INSERT INTO `auth_group_permissions` VALUES (27,4,1);
INSERT INTO `auth_group_permissions` VALUES (28,4,2);
INSERT INTO `auth_group_permissions` VALUES (29,4,3);
INSERT INTO `auth_group_permissions` VALUES (30,4,4);
INSERT INTO `auth_group_permissions` VALUES (31,4,5);
INSERT INTO `auth_group_permissions` VALUES (32,4,6);
INSERT INTO `auth_group_permissions` VALUES (33,4,7);
INSERT INTO `auth_group_permissions` VALUES (34,4,8);
INSERT INTO `auth_group_permissions` VALUES (35,4,9);
INSERT INTO `auth_group_permissions` VALUES (36,4,10);
INSERT INTO `auth_group_permissions` VALUES (37,4,11);
INSERT INTO `auth_group_permissions` VALUES (38,4,12);
INSERT INTO `auth_group_permissions` VALUES (39,4,13);
INSERT INTO `auth_group_permissions` VALUES (40,4,14);
INSERT INTO `auth_group_permissions` VALUES (41,4,15);
INSERT INTO `auth_group_permissions` VALUES (42,4,16);
INSERT INTO `auth_group_permissions` VALUES (43,4,17);
INSERT INTO `auth_group_permissions` VALUES (44,4,18);
INSERT INTO `auth_group_permissions` VALUES (45,4,19);
INSERT INTO `auth_group_permissions` VALUES (46,4,20);
INSERT INTO `auth_group_permissions` VALUES (47,4,21);
INSERT INTO `auth_group_permissions` VALUES (48,4,22);
INSERT INTO `auth_group_permissions` VALUES (49,4,23);
INSERT INTO `auth_group_permissions` VALUES (50,4,24);
INSERT INTO `auth_group_permissions` VALUES (51,4,25);
INSERT INTO `auth_group_permissions` VALUES (52,4,26);
INSERT INTO `auth_group_permissions` VALUES (53,4,27);
INSERT INTO `auth_group_permissions` VALUES (54,4,28);
INSERT INTO `auth_group_permissions` VALUES (55,3,28);
INSERT INTO `auth_group_permissions` VALUES (61,2,80);
INSERT INTO `auth_group_permissions` VALUES (62,2,77);
INSERT INTO `auth_group_permissions` VALUES (63,2,78);
INSERT INTO `auth_user_groups` VALUES (1,2,4);
INSERT INTO `auth_user_groups` VALUES (2,3,2);
INSERT INTO `auth_user_groups` VALUES (3,1,4);
INSERT INTO `auth_user_groups` VALUES (4,4,4);
INSERT INTO `auth_user_groups` VALUES (5,5,2);
INSERT INTO `auth_user_groups` VALUES (6,6,4);
INSERT INTO `auth_user_user_permissions` VALUES (41,3,24);
INSERT INTO `django_admin_log` VALUES (1,'2023-05-21 00:10:10.903982','1','Liliane Castro','[{`added`: {}}]',3,1,1);
INSERT INTO `django_admin_log` VALUES (2,'2023-05-21 00:10:28.360696','1','Liliane Castro','',3,1,3);
INSERT INTO `django_admin_log` VALUES (3,'2023-05-21 00:11:25.565584','2','Liliane_Castro','[{`added`: {}}]',4,1,1);
INSERT INTO `django_admin_log` VALUES (4,'2023-05-21 00:11:28.896685','2','Liliane_Castro','[]',4,1,2);
INSERT INTO `django_admin_log` VALUES (5,'2023-05-21 00:13:08.559568','2','Colaborador','[{`added`: {}}]',3,1,1);
INSERT INTO `django_admin_log` VALUES (6,'2023-05-21 00:13:28.296103','3','Cliente/Segurado','[{`added`: {}}]',3,1,1);
INSERT INTO `django_admin_log` VALUES (7,'2023-05-21 03:37:18.877968','1','9662249','[{`added`: {}}]',7,1,1);
INSERT INTO `django_admin_log` VALUES (8,'2023-05-21 03:56:12.551637','1','9662249','[{`changed`: {`fields`: [`Descri\u00e7\u00e3o`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (9,'2023-05-21 03:56:39.824353','1','9662249','[{`changed`: {`fields`: [`Descri\u00e7\u00e3o`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (10,'2023-05-21 03:56:46.803840','1','9662249','[]',7,1,2);
INSERT INTO `django_admin_log` VALUES (11,'2023-05-21 03:57:13.234360','1','9662249','[{`changed`: {`fields`: [`Descri\u00e7\u00e3o`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (12,'2023-05-21 03:59:11.449632','4','Administradores','[{`added`: {}}]',3,1,1);
INSERT INTO `django_admin_log` VALUES (13,'2023-05-21 03:59:34.936971','3','Cliente/Segurado','[{`changed`: {`fields`: [`Permissions`]}}]',3,1,2);
INSERT INTO `django_admin_log` VALUES (14,'2023-05-21 04:01:44.553573','2','lili4758','[{`changed`: {`fields`: [`Username`, `First name`, `Last name`, `Staff status`, `Superuser status`, `Groups`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (15,'2023-05-21 04:03:06.044529','3','adm123','[{`added`: {}}]',4,1,1);
INSERT INTO `django_admin_log` VALUES (16,'2023-05-21 04:03:32.090865','3','adm123','[{`changed`: {`fields`: [`First name`, `Groups`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (17,'2023-05-21 04:04:15.390827','1','admin','[{`changed`: {`fields`: [`Groups`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (18,'2023-05-21 04:04:25.273771','3','coop123','[{`changed`: {`fields`: [`Username`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (19,'2023-05-21 04:05:46.449544','2','Colaborador','[{`changed`: {`fields`: [`Permissions`]}}]',3,1,2);
INSERT INTO `django_admin_log` VALUES (20,'2023-05-21 04:07:01.862681','3','coop123','[{`changed`: {`fields`: [`password`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (21,'2023-05-21 04:21:13.023763','3','coop123','[{`changed`: {`fields`: [`Staff status`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (22,'2023-05-21 06:09:52.958308','1','9662249','[{`changed`: {`fields`: [`Anexar Imagem`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (23,'2023-05-21 15:59:23.691619','1','9662249','[{`changed`: {`fields`: [`Anexar Imagem`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (24,'2023-05-21 16:00:46.201947','1','9662249','[{`changed`: {`fields`: [`Anexar Imagem`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (25,'2023-05-21 18:13:36.488023','4','alinemessias','[{`added`: {}}]',4,1,1);
INSERT INTO `django_admin_log` VALUES (26,'2023-05-21 18:14:01.555036','4','alinemessias','[{`changed`: {`fields`: [`First name`, `Last name`, `Staff status`, `Superuser status`, `Groups`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (27,'2023-05-21 18:17:54.712026','2','3773530','[{`added`: {}}]',7,4,1);
INSERT INTO `django_admin_log` VALUES (28,'2023-05-21 18:23:39.396198','3','coop123','[]',4,2,2);
INSERT INTO `django_admin_log` VALUES (29,'2023-05-21 18:27:02.817864','5','colaborador1','[{`added`: {}}]',4,1,1);
INSERT INTO `django_admin_log` VALUES (30,'2023-05-21 18:31:42.161609','5','colaborador1','[{`changed`: {`fields`: [`First name`, `Last name`, `Staff status`, `Groups`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (31,'2023-05-21 18:43:53.377052','2','3773530','[{`changed`: {`fields`: [`Valor OS`, `Valor Tercezizado`, `Empresa/Seguro`]}}]',7,1,2);
INSERT INTO `django_admin_log` VALUES (32,'2023-05-21 18:51:08.046207','6','LucasRodsan','[{`added`: {}}]',4,1,1);
INSERT INTO `django_admin_log` VALUES (33,'2023-05-21 18:51:43.956553','6','LucasRodsan','[{`changed`: {`fields`: [`First name`, `Last name`, `Email address`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (34,'2023-05-21 18:51:53.150453','6','LucasRodsan','[{`changed`: {`fields`: [`Staff status`, `Superuser status`, `Groups`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (35,'2023-05-21 18:52:13.089596','2','LilianeCastro','[{`changed`: {`fields`: [`Username`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (36,'2023-05-21 18:52:41.755566','2','LilianeCastro','[{`changed`: {`fields`: [`Email address`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (37,'2023-05-21 18:52:47.746836','2','LilianeCastro','[]',4,1,2);
INSERT INTO `django_admin_log` VALUES (38,'2023-05-21 18:53:02.553209','4','AlineMessias','[{`changed`: {`fields`: [`Username`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (39,'2023-05-21 18:53:54.964169','4','AlineMessias','[{`changed`: {`fields`: [`First name`, `Last name`, `Email address`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (40,'2023-05-21 18:53:58.061886','4','AlineMessias','[]',4,1,2);
INSERT INTO `django_admin_log` VALUES (41,'2023-05-21 20:26:28.802062','1','asdasd','[{`added`: {}}]',9,1,1);
INSERT INTO `django_admin_log` VALUES (42,'2023-05-21 20:28:42.185744','1','servico','[{`changed`: {`fields`: [`Descricao`, `Valor gasto`, `Valor recebido`]}}]',9,1,2);
INSERT INTO `django_admin_log` VALUES (43,'2023-05-21 20:38:44.846621','1','Colaborador object (1)','[{`added`: {}}]',8,1,1);
INSERT INTO `django_admin_log` VALUES (44,'2023-05-21 20:39:45.401275','2','Colaborador object (2)','[{`added`: {}}]',8,1,1);
INSERT INTO `django_admin_log` VALUES (45,'2023-05-21 20:40:29.773812','2','Colaborador object (2)','',8,1,3);
INSERT INTO `django_admin_log` VALUES (46,'2023-05-21 20:40:29.778811','1','Colaborador object (1)','',8,1,3);
INSERT INTO `django_admin_log` VALUES (47,'2023-05-21 21:16:59.819044','2','Colaborador','[]',3,1,2);
INSERT INTO `django_admin_log` VALUES (48,'2023-05-21 21:58:00.810557','1','admin','[{`changed`: {`fields`: [`User permissions`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (49,'2023-05-21 22:17:58.212480','1','admin','[{`changed`: {`fields`: [`User permissions`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (50,'2023-05-21 22:18:20.397467','3','coop123','[{`changed`: {`fields`: [`User permissions`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (51,'2023-05-21 22:20:07.868782','2','Colaborador','[{`changed`: {`fields`: [`Permissions`]}}]',3,1,2);
INSERT INTO `django_admin_log` VALUES (52,'2023-05-21 22:42:25.562976','1','Assistencia object (1)','[{`added`: {}}]',10,5,1);
INSERT INTO `django_admin_log` VALUES (53,'2023-05-21 22:47:58.746891','1','asd','[{`added`: {}}]',12,1,1);
INSERT INTO `django_admin_log` VALUES (54,'2023-05-21 22:57:06.035405','3','asd','[{`added`: {}}]',7,1,1);
INSERT INTO `django_admin_log` VALUES (55,'2023-05-21 23:33:21.940143','3','asd','',7,1,3);
INSERT INTO `django_admin_log` VALUES (56,'2023-05-22 00:11:30.396129','2','LilianeCastro','[{`changed`: {`fields`: [`password`]}}]',4,1,2);
INSERT INTO `django_admin_log` VALUES (57,'2023-05-22 00:13:40.529214','4','asd','[{`added`: {}}]',7,2,1);
INSERT INTO `django_admin_log` VALUES (58,'2023-05-22 00:14:14.692854','4','asd','[{`changed`: {`fields`: [`Empresa/Seguro`]}}]',7,2,2);
INSERT INTO `django_admin_log` VALUES (59,'2023-05-22 00:15:11.499405','1','mes maio2023-05-24','[{`added`: {}}]',13,2,1);
INSERT INTO `django_admin_log` VALUES (60,'2023-05-22 00:17:14.918683','1','Colaboradore object (1)','[{`added`: {}}]',8,2,1);
INSERT INTO `django_admin_log` VALUES (61,'2023-05-22 00:19:43.468504','1','mes maio2023-05-24','[{`changed`: {`fields`: [`Anexar Arquivo`]}}]',13,2,2);
INSERT INTO `django_admin_log` VALUES (62,'2023-05-22 00:26:28.437123','1','asd','[{`changed`: {`fields`: [`Anexar Imagem`]}}]',12,2,2);
INSERT INTO `django_admin_log` VALUES (63,'2023-05-22 00:27:57.196376','2','asd2023-05-22','[{`added`: {}}]',13,2,1);
INSERT INTO `django_admin_log` VALUES (64,'2023-05-22 00:28:16.219360','2','asd2023-05-22','[{`changed`: {`fields`: [`Anexar Arquivo`]}}]',13,2,2);
INSERT INTO `django_admin_log` VALUES (65,'2023-05-22 00:28:38.268676','2','asd2023-05-22','[{`changed`: {`fields`: [`Anexar Arquivo`, `Anexar Arquivo`]}}]',13,2,2);
INSERT INTO `django_admin_log` VALUES (66,'2023-05-22 00:38:37.988132','2','Colaboradore object (2)','[{`added`: {}}]',8,2,1);
INSERT INTO `django_admin_log` VALUES (67,'2023-05-22 00:39:57.480389','3','Colaboradore object (3)','[{`added`: {}}]',8,2,1);
INSERT INTO `django_admin_log` VALUES (68,'2023-05-22 00:55:44.853345','4','Colaboradore object (4)','[{`added`: {}}]',8,2,1);
INSERT INTO `django_admin_log` VALUES (69,'2023-05-22 01:01:24.904380','1','Servico object (1)','[{`added`: {}}]',14,2,1);
INSERT INTO `django_admin_log` VALUES (70,'2023-05-22 01:12:06.448388','2','Colaborador','[{`changed`: {`fields`: [`Permissions`]}}]',3,2,2);
INSERT INTO `django_admin_log` VALUES (71,'2023-05-22 01:14:40.783155','2','Colaborador','[{`changed`: {`fields`: [`Permissions`]}}]',3,1,2);
INSERT INTO `django_content_type` VALUES (1,'admin','logentry');
INSERT INTO `django_content_type` VALUES (2,'auth','permission');
INSERT INTO `django_content_type` VALUES (3,'auth','group');
INSERT INTO `django_content_type` VALUES (4,'auth','user');
INSERT INTO `django_content_type` VALUES (5,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (6,'sessions','session');
INSERT INTO `django_content_type` VALUES (7,'servico','serviço');
INSERT INTO `django_content_type` VALUES (8,'Colaborador','colaboradore');
INSERT INTO `django_content_type` VALUES (9,'despesas','despesa');
INSERT INTO `django_content_type` VALUES (10,'servico','assistencia');
INSERT INTO `django_content_type` VALUES (11,'RodsanSolutions','assistencia');
INSERT INTO `django_content_type` VALUES (12,'RodsanSolutions','servico');
INSERT INTO `django_content_type` VALUES (13,'DadosAnteriores','arquivo');
INSERT INTO `django_content_type` VALUES (14,'Colaborador','serviço');
INSERT INTO `django_content_type` VALUES (15,'Colaborador','assistencia');
INSERT INTO `auth_permission` VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO `auth_permission` VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO `auth_permission` VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO `auth_permission` VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO `auth_permission` VALUES (5,2,'add_permission','Can add permission');
INSERT INTO `auth_permission` VALUES (6,2,'change_permission','Can change permission');
INSERT INTO `auth_permission` VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO `auth_permission` VALUES (8,2,'view_permission','Can view permission');
INSERT INTO `auth_permission` VALUES (9,3,'add_group','Can add group');
INSERT INTO `auth_permission` VALUES (10,3,'change_group','Can change group');
INSERT INTO `auth_permission` VALUES (11,3,'delete_group','Can delete group');
INSERT INTO `auth_permission` VALUES (12,3,'view_group','Can view group');
INSERT INTO `auth_permission` VALUES (13,4,'add_user','Can add user');
INSERT INTO `auth_permission` VALUES (14,4,'change_user','Can change user');
INSERT INTO `auth_permission` VALUES (15,4,'delete_user','Can delete user');
INSERT INTO `auth_permission` VALUES (16,4,'view_user','Can view user');
INSERT INTO `auth_permission` VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO `auth_permission` VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO `auth_permission` VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO `auth_permission` VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO `auth_permission` VALUES (21,6,'add_session','Can add session');
INSERT INTO `auth_permission` VALUES (22,6,'change_session','Can change session');
INSERT INTO `auth_permission` VALUES (23,6,'delete_session','Can delete session');
INSERT INTO `auth_permission` VALUES (24,6,'view_session','Can view session');
INSERT INTO `auth_permission` VALUES (25,7,'add_servico','Can add servico');
INSERT INTO `auth_permission` VALUES (26,7,'change_servico','Can change servico');
INSERT INTO `auth_permission` VALUES (27,7,'delete_servico','Can delete servico');
INSERT INTO `auth_permission` VALUES (28,7,'view_servico','Can view servico');
INSERT INTO `auth_permission` VALUES (29,8,'add_colaborador','Can add colaborador');
INSERT INTO `auth_permission` VALUES (30,8,'change_colaborador','Can change colaborador');
INSERT INTO `auth_permission` VALUES (31,8,'delete_colaborador','Can delete colaborador');
INSERT INTO `auth_permission` VALUES (32,8,'view_colaborador','Can view colaborador');
INSERT INTO `auth_permission` VALUES (33,9,'add_despesa','Can add despesa');
INSERT INTO `auth_permission` VALUES (34,9,'change_despesa','Can change despesa');
INSERT INTO `auth_permission` VALUES (35,9,'delete_despesa','Can delete despesa');
INSERT INTO `auth_permission` VALUES (36,9,'view_despesa','Can view despesa');
INSERT INTO `auth_permission` VALUES (37,10,'add_assistencia','Can add assistencia');
INSERT INTO `auth_permission` VALUES (38,10,'change_assistencia','Can change assistencia');
INSERT INTO `auth_permission` VALUES (39,10,'delete_assistencia','Can delete assistencia');
INSERT INTO `auth_permission` VALUES (40,10,'view_assistencia','Can view assistencia');
INSERT INTO `auth_permission` VALUES (41,11,'add_assistencia','Can add assistencia');
INSERT INTO `auth_permission` VALUES (42,11,'change_assistencia','Can change assistencia');
INSERT INTO `auth_permission` VALUES (43,11,'delete_assistencia','Can delete assistencia');
INSERT INTO `auth_permission` VALUES (44,11,'view_assistencia','Can view assistencia');
INSERT INTO `auth_permission` VALUES (45,12,'add_servico','Can add servico');
INSERT INTO `auth_permission` VALUES (46,12,'change_servico','Can change servico');
INSERT INTO `auth_permission` VALUES (47,12,'delete_servico','Can delete servico');
INSERT INTO `auth_permission` VALUES (48,12,'view_servico','Can view servico');
INSERT INTO `auth_permission` VALUES (49,12,'add_servicos','Can add servicos');
INSERT INTO `auth_permission` VALUES (50,12,'change_servicos','Can change servicos');
INSERT INTO `auth_permission` VALUES (51,12,'delete_servicos','Can delete servicos');
INSERT INTO `auth_permission` VALUES (52,12,'view_servicos','Can view servicos');
INSERT INTO `auth_permission` VALUES (53,13,'add_arquivos','Can add arquivos');
INSERT INTO `auth_permission` VALUES (54,13,'change_arquivos','Can change arquivos');
INSERT INTO `auth_permission` VALUES (55,13,'delete_arquivos','Can delete arquivos');
INSERT INTO `auth_permission` VALUES (56,13,'view_arquivos','Can view arquivos');
INSERT INTO `auth_permission` VALUES (57,8,'add_colaboradore','Can add colaboradore');
INSERT INTO `auth_permission` VALUES (58,8,'change_colaboradore','Can change colaboradore');
INSERT INTO `auth_permission` VALUES (59,8,'delete_colaboradore','Can delete colaboradore');
INSERT INTO `auth_permission` VALUES (60,8,'view_colaboradore','Can view colaboradore');
INSERT INTO `auth_permission` VALUES (61,13,'add_arquivo','Can add arquivo');
INSERT INTO `auth_permission` VALUES (62,13,'change_arquivo','Can change arquivo');
INSERT INTO `auth_permission` VALUES (63,13,'delete_arquivo','Can delete arquivo');
INSERT INTO `auth_permission` VALUES (64,13,'view_arquivo','Can view arquivo');
INSERT INTO `auth_permission` VALUES (65,14,'add_servico','Can add servico');
INSERT INTO `auth_permission` VALUES (66,14,'change_servico','Can change servico');
INSERT INTO `auth_permission` VALUES (67,14,'delete_servico','Can delete servico');
INSERT INTO `auth_permission` VALUES (68,14,'view_servico','Can view servico');
INSERT INTO `auth_permission` VALUES (69,15,'add_assistencia','Can add assistencia');
INSERT INTO `auth_permission` VALUES (70,15,'change_assistencia','Can change assistencia');
INSERT INTO `auth_permission` VALUES (71,15,'delete_assistencia','Can delete assistencia');
INSERT INTO `auth_permission` VALUES (72,15,'view_assistencia','Can view assistencia');
INSERT INTO `auth_permission` VALUES (73,7,'add_serviço','Can add serviço');
INSERT INTO `auth_permission` VALUES (74,7,'change_serviço','Can change serviço');
INSERT INTO `auth_permission` VALUES (75,7,'delete_serviço','Can delete serviço');
INSERT INTO `auth_permission` VALUES (76,7,'view_serviço','Can view serviço');
INSERT INTO `auth_permission` VALUES (77,14,'add_serviço','Can add serviço');
INSERT INTO `auth_permission` VALUES (78,14,'change_serviço','Can change serviço');
INSERT INTO `auth_permission` VALUES (79,14,'delete_serviço','Can delete serviço');
INSERT INTO `auth_permission` VALUES (80,14,'view_serviço','Can view serviço');
INSERT INTO `auth_group` VALUES (2,'Colaborador');
INSERT INTO `auth_group` VALUES (3,'Cliente/Segurado');
INSERT INTO `auth_group` VALUES (4,'Administradores');
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$9WawUiD6N8SFnRjUasJMQi$xAZ7xp9HLNWf/cLtIalX1lQMSI7IohbLbp+oBGMO0UI=','2023-05-22 01:12:55.193377',1,'admin','','moisesgames523@gmail.com',1,1,'2023-05-20 21:53:39','');
INSERT INTO `auth_user` VALUES (2,'pbkdf2_sha256$260000$tUDCtv9AvY7fj6jNMyY6ol$dF/Pl+zeN4Hbx/B2GQsIWpqRDSs4FlDJ+7yxZ3rlxa0=','2023-05-22 00:11:43.234587',1,'LilianeCastro','Castro','lilianeevitorya@hotmail.com',1,1,'2023-05-21 00:11:25','Liliane');
INSERT INTO `auth_user` VALUES (3,'pbkdf2_sha256$260000$nGwS7nEKsqO7c3DQgyt5hl$/zcn0AG7FLW+lnqNeJ0XQRG8KzoOVfVLwMFRKA+3e4s=','2023-05-21 04:21:36',0,'coop123','','',1,1,'2023-05-21 04:03:05','fucionario');
INSERT INTO `auth_user` VALUES (4,'pbkdf2_sha256$260000$oTYjwvNCJBdZSgolslJVPa$wxbDSw0bi0vgyrK3DUPKq59nPebEdYgjspphC6rWw2k=','2023-05-21 18:14:33',1,'AlineMessias','Messias','alinemessias9295@gmail.com',1,1,'2023-05-21 18:13:36','Aline');
INSERT INTO `auth_user` VALUES (5,'pbkdf2_sha256$260000$IkUSpaqfFhk9J1vvwQ85tR$rxVAIfmTbQbNkddV20w4gamuRjMxNK9Hy6Ah29V1khQ=','2023-05-22 01:15:15.707565',0,'colaborador1','asd','',1,1,'2023-05-21 18:27:02','aasd');
INSERT INTO `auth_user` VALUES (6,'pbkdf2_sha256$260000$PoRdDNi5ysiagBKMuOHwrM$tx0R0IzWfrcoswUEfQ9zYWzj2PR2V+p7amQ+46XHDy0=',NULL,1,'LucasRodsan','Rodrigues Santos','lucasalugueis@gmail.com',1,1,'2023-05-21 18:51:07','Lucas');
INSERT INTO `django_session` VALUES ('niv9q2rrblg809b4g442kdmzgjpfyzr9','.eJxVjDsOwjAQBe_iGln-xmtKes5grXcdHECOFCcV4u4QKQW0b2beSyTc1pq2XpY0sTgLLU6_W0Z6lLYDvmO7zZLmti5TlrsiD9rldebyvBzu30HFXr-1CsF5iI4GIgbEaEaFyrBlpxUAgwLNo48Oi7bWRKsBKFD2udhiBhDvD8upN0o:1q0lTv:r1DGG-FW3zJXWTx-nzERqDTQYLlwSZHWGHWZHxvC4GU','2023-06-04 16:00:27.388601');
INSERT INTO `django_session` VALUES ('czr5jw8bu9isip3u3o3wnlrsxn5mee0e','.eJxVjMsOwiAQRf-FtSFTWh7j0r3fQAYYpGogKe3K-O_apAvd3nPOfQlP21r81nnxcxJnocXpdwsUH1x3kO5Ub03GVtdlDnJX5EG7vLbEz8vh_h0U6uVbZwyTMWoEh-gUk1LJREDiqO0YxykjBzCU4gAAzqA1kO2QQbNzDhWI9wfPAjb3:1q0u8p:2j8tAWjEwAn1Yasewn9NMxO9dEB2ud6miSJ-9sEzy30','2023-06-05 01:15:15.711564');
INSERT INTO `despesas_despesa` VALUES (1,'servico',200,300);
INSERT INTO `servico_assistencia` VALUES (1,'a');
INSERT INTO `RodsanSolutions_servico` VALUES (1,'asd','asd','asd','asd','asd','2023-05-21','asd','asd','asd','asd','asd','asd','media/testepdf.pdf','');
INSERT INTO `servico_serviço` VALUES (1,'9662249','Luiz Ferreira Dias','Chaveiro','2023-04-24','.','São Paulo','.','.','aaaaaaaaaa','media/testepdf.pdf','','','','');
INSERT INTO `servico_serviço` VALUES (2,'3773530','Gustavo Silveira','Eltricista','2023-05-21','.','Brasilia','38999649722','não','Chave geral da residência desarmando','media/testepdf_eAU34ci.pdf','123','112','','');
INSERT INTO `servico_serviço` VALUES (4,'asd','asd','asd','2023-05-22','','asd','','','','','asd','','asd','');
INSERT INTO `DadosAnteriores_arquivo` VALUES (1,'mes maio','2023-05-24','media/testepdf_M99HCLw.pdf','','media/testepdf_RsDFRiN.pdf');
INSERT INTO `DadosAnteriores_arquivo` VALUES (2,'asd','2023-05-22','Arquivo/testepdf.pdf','Arquivo/testepdf_Mx5uHK0.pdf','Arquivo/testepdf_Byv8SCx.pdf');
INSERT INTO `Colaborador_serviço` VALUES (1,'moises','9656683','assinatura/testepdf_0bVIxtP.pdf','checklist/testepdf_72teV3C.pdf');
CREATE UNIQUE INDEX IF NOT EXISTS `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` ON `auth_group_permissions` (
	`group_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_group_id_b120cbf9` ON `auth_group_permissions` (
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_group_permissions_permission_id_84c5c92e` ON `auth_group_permissions` (
	`permission_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_groups_user_id_group_id_94350c0c_uniq` ON `auth_user_groups` (
	`user_id`,
	`group_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_user_id_6a12ed8b` ON `auth_user_groups` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_groups_group_id_97559544` ON `auth_user_groups` (
	`group_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` ON `auth_user_user_permissions` (
	`user_id`,
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_user_id_a95ead1b` ON `auth_user_user_permissions` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `auth_user_user_permissions_permission_id_1fbb5f2c` ON `auth_user_user_permissions` (
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_content_type_id_c4bce8eb` ON `django_admin_log` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `django_admin_log_user_id_c564eba6` ON `django_admin_log` (
	`user_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `django_content_type_app_label_model_76bd3d3b_uniq` ON `django_content_type` (
	`app_label`,
	`model`
);
CREATE UNIQUE INDEX IF NOT EXISTS `auth_permission_content_type_id_codename_01ab375a_uniq` ON `auth_permission` (
	`content_type_id`,
	`codename`
);
CREATE INDEX IF NOT EXISTS `auth_permission_content_type_id_2f476e4b` ON `auth_permission` (
	`content_type_id`
);
CREATE INDEX IF NOT EXISTS `django_session_expire_date_a5c62663` ON `django_session` (
	`expire_date`
);
COMMIT;
