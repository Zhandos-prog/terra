-- Adminer 4.7.8 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `types` (`id`, `is_hidden`, `name`, `label`) VALUES
(1,	0,	'User',	'Пользователь CMS'),
(33,	0,	'Menu',	'Меню'),
(34,	1,	'MenuElement',	'Элемент меню'),
(35,	0,	'Page',	'Страница'),
(37,	1,	'LinkTranslatable',	'Ссылка языковая'),
(38,	0,	'Seo',	'SEO'),
(44,	0,	'News',	'Новость'),
(48,	0,	'Photo',	'Фотография'),
(65,	0,	'Category',	'Category'),
(67,	0,	'Product',	'Товар'),
(73,	0,	'Variable',	'Переменные'),
(81,	1,	'Link',	'Ссылка'),
(90,	0,	'Slider',	'Слайдер'),
(96,	0,	'Contacts',	'Контакты'),
(97,	0,	'Social',	'Социальные сети'),
(99,	0,	'About',	'О компании');

DROP TABLE IF EXISTS `types_attributes`;
CREATE TABLE `types_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `kind` varchar(255) NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_type_name` (`type`,`name`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `types_attributes` (`id`, `type`, `name`, `label`, `kind`, `settings`) VALUES
(1,	'User',	'created_at',	'Date of creation',	'DATETIME',	'{\"translatable\":0,\"interface\":{\"required\":1,\"visible\":1,\"sort\":400}}'),
(2,	'User',	'name',	'User name',	'STRING',	'{\"translatable\":0,\"interface\":{\"required\":1,\"visible\":1,\"sort\":100}}'),
(3,	'User',	'email',	'User email',	'STRING',	'{\"translatable\":0,\"interface\":{\"required\":1,\"visible\":1,\"sort\":200}}'),
(4,	'User',	'password',	'User password',	'PASSWORD',	'{\"translatable\":0,\"interface\":{\"required\":0,\"visible\":0,\"sort\":300}}'),
(5,	'User',	'remember_token',	'Remember token',	'STRING',	'{\"translatable\":0,\"interface\":{\"required\":0,\"visible\":0,\"sort\":700}}'),
(92,	'Menu',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"1\",\"visible\":\"1\",\"sort\":1510028180}}'),
(93,	'MenuElement',	'title',	'Заголовок',	'STRING',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":100}}'),
(94,	'Menu',	'elements',	'Элементы меню',	'DIRECT_RELATION',	'{\"is\":\"MenuElement\",\"strong\":\"0\",\"single\":0,\"interface\":{\"internal\":0,\"sort\":1510028313}}'),
(95,	'MenuElement',	'elements',	'Элементы меню',	'DIRECT_RELATION',	'{\"is\":\"MenuElement\",\"strong\":\"0\",\"single\":0,\"interface\":{\"internal\":0,\"sort\":400}}'),
(96,	'MenuElement',	'sort',	'Сортировка',	'NUMBER',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":200}}'),
(97,	'Page',	'title',	'Заголовок',	'STRING',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1510028465}}'),
(98,	'Page',	'body',	'Содержание',	'HTML',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1510028495}}'),
(101,	'LinkTranslatable',	'name',	'Название',	'STRING',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1510028618}}'),
(102,	'LinkTranslatable',	'url',	'URL',	'STRING',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1510028628}}'),
(103,	'MenuElement',	'body',	'Содержание',	'DIRECT_RELATION',	'{\"is\":[\"Page\",\"LinkTranslatable\"],\"strong\":\"1\",\"single\":1,\"interface\":{\"internal\":\"1\",\"sort\":300}}'),
(104,	'Seo',	'title',	'Title',	'STRING',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1510028926}}'),
(105,	'Seo',	'keywords',	'Keywords',	'TEXT',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1510028939}}'),
(106,	'Seo',	'description',	'Description',	'TEXT',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1510028963}}'),
(107,	'Page',	'seo',	'SEO',	'DIRECT_RELATION',	'{\"is\":\"Seo\",\"strong\":\"1\",\"single\":1,\"interface\":{\"internal\":\"1\",\"sort\":1510029022}}'),
(118,	'News',	'title',	'Заголовок',	'STRING',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":100}}'),
(119,	'News',	'preview',	'Анонс',	'TEXT',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":200}}'),
(120,	'News',	'text',	'Текст',	'HTML',	'{\"translatable\":\"1\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":300}}'),
(121,	'News',	'date',	'Дата',	'DATE',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":400}}'),
(131,	'Photo',	'src',	'Файл',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"1\",\"visible\":\"1\",\"sort\":1510809934}}'),
(136,	'User',	'recieve_simple_orders',	'Получать письма с контактов',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":500}}'),
(153,	'User',	'recieve_help_calc',	'Получать просьбы в просчетах',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":600}}'),
(264,	'User',	'root',	'Супер админ',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1521017520}}'),
(271,	'User',	'manager',	'Менеджер заказов',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1522289183}}'),
(273,	'Category',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":200}}'),
(279,	'Product',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":100}}'),
(289,	'Category',	'products',	'Товары',	'DIRECT_RELATION',	'{\"is\":\"Product\",\"strong\":\"1\",\"single\":0,\"interface\":{\"internal\":0,\"sort\":600}}'),
(298,	'News',	'image',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1523850963}}'),
(317,	'Variable',	'value',	'Значение',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":200}}'),
(318,	'Variable',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":100}}'),
(320,	'Product',	'parent',	'категория',	'BACK_RELATION',	'{\"is\":\"Category\",\"relation\":\"products\",\"single\":1,\"interface\":{\"sort\":200}}'),
(339,	'Category',	'image',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":100}}'),
(356,	'Main',	'image1',	'Изображение 1',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1568365713}}'),
(357,	'Main',	'text1',	'Заголовок',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568601504}}'),
(358,	'Main',	'text2',	'Текст',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568601538}}'),
(359,	'Main',	'text3',	'Название ссылки',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568601567}}'),
(360,	'Main',	'link1',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568601588}}'),
(364,	'Main',	'image2',	'Изображение 2',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568611617}}'),
(365,	'Main',	'text4',	'Заголовок',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568611653}}'),
(366,	'Main',	'text5',	'Текст',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568611681}}'),
(367,	'Main',	'link2',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568611701}}'),
(368,	'Main',	'text6',	'Название ссылки',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568611720}}'),
(369,	'Main',	'image3',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568611751}}'),
(374,	'Main',	'text7',	'Заголовок',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568616337}}'),
(375,	'Main',	'text8',	'Текст',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568616460}}'),
(376,	'Main',	'link3',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568616478}}'),
(377,	'Main',	'text9',	'Название ссылки',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568616512}}'),
(378,	'Main',	'image4',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568616683}}'),
(379,	'Main',	'image5',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568616701}}'),
(380,	'Main',	'text10',	'Название ссылки',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568617176}}'),
(381,	'Main',	'link4',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568617195}}'),
(382,	'Main',	'image6',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618172}}'),
(383,	'Main',	'text11',	'Заголовок',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618210}}'),
(384,	'Main',	'text12',	'Текст',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618263}}'),
(385,	'Main',	'text13',	'Текст',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618273}}'),
(386,	'Main',	'link5',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618300}}'),
(387,	'Main',	'text14',	'Название ссылки',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618314}}'),
(388,	'Main',	'image7',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1568618329}}'),
(412,	'Link',	'value',	'Значение',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1587093771}}'),
(424,	'Category',	'categories',	'Подкатегории',	'DIRECT_RELATION',	'{\"is\":\"Category\",\"strong\":\"1\",\"single\":0,\"interface\":{\"internal\":0,\"sort\":1587273989}}'),
(428,	'Product',	'price',	'Цена',	'NUMBER',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":400}}'),
(430,	'Product',	'novetly',	'Новинка',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":500}}'),
(431,	'Product',	'description',	'Описание',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":300}}'),
(461,	'Slider',	'text',	'Текст',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1587656499}}'),
(462,	'Slider',	'image',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1587656511}}'),
(499,	'Product',	'sale',	'Скидка',	'NUMBER',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":600}}'),
(500,	'Product',	'articul',	'Артикул',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1594301982}}'),
(501,	'Color',	'name',	'Цвет',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1594302011}}'),
(502,	'Color',	'code',	'Штрих-код',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1594302167}}'),
(508,	'Colors',	'articul',	'Артикул',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1594316894}}'),
(517,	'Category',	'parent',	'Родительская категория',	'BACK_RELATION',	'{\"is\":\"Category\",\"relation\":\"categories\",\"single\":1,\"interface\":{\"sort\":1594612360}}'),
(518,	'MenuElement',	'cat_id',	'ID каталога',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1594623417}}'),
(519,	'MenuElement',	'back_name',	'Название в фоне',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1594623498}}'),
(520,	'MenuElement',	'image',	'Изображение',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1594624324}}'),
(521,	'Photo',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1607666182}}'),
(522,	'Contacts',	'map',	'Карта',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620182652}}'),
(523,	'Contacts',	'email',	'Электронный адрес',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1620182677}}'),
(524,	'Contacts',	'phones',	'Телефоны',	'TEXT',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620182697}}'),
(525,	'Contacts',	'address',	'Адрес',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620182735}}'),
(526,	'Social',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1620185015}}'),
(527,	'Social',	'url',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1620185042}}'),
(528,	'Contacts',	'social',	'соц сети',	'DIRECT_RELATION',	'{\"is\":\"Social\",\"strong\":\"1\",\"single\":0,\"interface\":{\"internal\":0,\"sort\":1620185077}}'),
(529,	'Social',	'sort',	'Сортировка',	'NUMBER',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620188594}}'),
(530,	'Slider',	'url',	'Ссылка',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1620193633}}'),
(531,	'Product',	'bestseller',	'Хит продаж',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620201604}}'),
(532,	'Product',	'recommendation',	'Рекомендумые',	'CHECKBOX',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620201643}}'),
(533,	'Product',	'image',	'Картинка',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620201948}}'),
(534,	'Gallery',	'photo',	'Фотография',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1620205215}}'),
(536,	'About',	'name',	'Название',	'STRING',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"1\",\"sort\":1620207412}}'),
(537,	'About',	'text',	'Текст',	'HTML',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620207437}}'),
(538,	'About',	'anons',	'Анонс',	'HTML',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620207460}}'),
(539,	'About',	'logo',	'Лого',	'PHOTO',	'{\"translatable\":\"0\",\"interface\":{\"required\":\"0\",\"visible\":\"0\",\"sort\":1620207478}}'),
(540,	'About',	'gallery',	'Галерея',	'DIRECT_RELATION',	'{\"is\":\"Photo\",\"strong\":\"1\",\"single\":0,\"interface\":{\"internal\":0,\"sort\":1620207513}}'),
(541,	'Category',	'seo',	'Сео',	'DIRECT_RELATION',	'{\"is\":\"Seo\",\"strong\":\"1\",\"single\":1,\"interface\":{\"internal\":\"1\",\"sort\":1620297301}}');

DROP TABLE IF EXISTS `type_about_relations`;
CREATE TABLE `type_about_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `relation_subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`relation`,`subject_id`,`relation_subject_id`),
  KEY `relation` (`relation`,`subject_id`),
  KEY `relation_2` (`relation`,`relation_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_about_relations` (`id`, `relation`, `subject_id`, `relation_subject_id`) VALUES
(1,	'gallery',	1,	3),
(2,	'gallery',	1,	4),
(3,	'gallery',	1,	5),
(4,	'gallery',	1,	6),
(5,	'gallery',	1,	7),
(6,	'gallery',	1,	8);

DROP TABLE IF EXISTS `type_about_subjects`;
CREATE TABLE `type_about_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `text` longtext,
  `anons` longtext,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_about_subjects` (`id`, `is_related`, `name`, `text`, `anons`, `logo`) VALUES
(1,	0,	'О компании',	NULL,	'<p>Мы рады приветствовать вас на сайте нашей компании!</p>\r\n\r\n<p>Наша компания была основана в 2010 году, а наш интернет-магазин стал одним из первых магазинов, осуществляющих on-line продажу в регионе. Компания специализируется на оптовой и розничной продаже.</p>\r\n\r\n<p>На данный момент мы представляем собой крупную компанию, владеющую интернет&ndash;магазином в нашей компании работают сотрудники с многолетним стажем работы в сфере автомобильной электроники и автозвука, компания имеет собственные склады c постоянным наличием необходимого запаса товаров.</p>\r\n',	'/uploads/images/2021/05/05/f_79caf43df68986630eb207738f68c76ec760f0ae.png');

DROP TABLE IF EXISTS `type_category_relations`;
CREATE TABLE `type_category_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `relation_subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`relation`,`subject_id`,`relation_subject_id`),
  KEY `relation` (`relation`,`subject_id`),
  KEY `relation_2` (`relation`,`relation_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_category_relations` (`id`, `relation`, `subject_id`, `relation_subject_id`) VALUES
(34,	'products',	2,	10),
(32,	'products',	2,	21),
(28,	'products',	2,	22),
(27,	'products',	2,	23),
(41,	'products',	14,	11),
(45,	'products',	18,	12),
(47,	'products',	19,	13),
(51,	'products',	22,	14),
(52,	'products',	22,	15),
(53,	'products',	22,	16),
(54,	'products',	22,	17),
(55,	'products',	22,	18),
(57,	'products',	24,	19),
(1,	'products',	25,	1),
(2,	'products',	25,	2);

DROP TABLE IF EXISTS `type_category_subjects`;
CREATE TABLE `type_category_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_category_subjects` (`id`, `is_related`, `name`, `image`) VALUES
(55,	0,	'Pioneer',	'/uploads/images/2021/05/05/f_0df2c9849c7511ef154721bb743705d4c1952a85.jpg'),
(56,	0,	'Kenwood',	'/uploads/images/2021/05/05/f_324adfae14d28e8e9ab36c08b11489dc763d3209.jpg'),
(57,	0,	'JVC',	'/uploads/images/2021/05/05/f_8f9aafff8c9426fe59780705bbbc6e454252de59.jpg');

DROP TABLE IF EXISTS `type_contacts_relations`;
CREATE TABLE `type_contacts_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `relation_subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`relation`,`subject_id`,`relation_subject_id`),
  KEY `relation` (`relation`,`subject_id`),
  KEY `relation_2` (`relation`,`relation_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_contacts_relations` (`id`, `relation`, `subject_id`, `relation_subject_id`) VALUES
(1,	'social',	1,	1),
(2,	'social',	1,	2),
(3,	'social',	1,	3);

DROP TABLE IF EXISTS `type_contacts_subjects`;
CREATE TABLE `type_contacts_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `map` text,
  `email` varchar(255) DEFAULT NULL,
  `phones` text,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_contacts_subjects` (`id`, `is_related`, `map`, `email`, `phones`, `address`) VALUES
(1,	0,	'            <script type=\"text/javascript\" charset=\"utf-8\" async src=\"https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A8aae6af9831030da709d44772c306b271670b0bb49aec916c6eea314c675659a&amp;width=100%&amp;height=100%&amp;lang=ru_RU&amp;scroll=true\"></script>\r\n',	'info@soundterra.kz',	'+7 (747) 321 01 01\r\n+7 (747) 321 01 02\r\n+7 (747) 321 01 03',	'г.Алматы, Аксай 1, 11/7, помещение 181');

DROP TABLE IF EXISTS `type_linktranslatable_subjects`;
CREATE TABLE `type_linktranslatable_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `_ru_name` varchar(255) DEFAULT NULL,
  `_en_name` varchar(255) DEFAULT NULL,
  `_kz_name` varchar(255) DEFAULT NULL,
  `_ru_url` varchar(255) DEFAULT NULL,
  `_en_url` varchar(255) DEFAULT NULL,
  `_kz_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_linktranslatable_subjects` (`id`, `is_related`, `_ru_name`, `_en_name`, `_kz_name`, `_ru_url`, `_en_url`, `_kz_url`) VALUES
(33,	1,	'Скидки',	NULL,	NULL,	'/ru/catalog/sale',	NULL,	NULL),
(34,	1,	'Каталог',	NULL,	NULL,	'/catalog',	NULL,	NULL),
(35,	1,	'О компании',	NULL,	NULL,	'/about',	NULL,	NULL),
(36,	1,	'Новости',	NULL,	NULL,	'/news',	NULL,	NULL),
(37,	1,	'Контакты',	NULL,	NULL,	'/contacts',	NULL,	NULL);

DROP TABLE IF EXISTS `type_link_subjects`;
CREATE TABLE `type_link_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `type_main_subjects`;
CREATE TABLE `type_main_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `image1` varchar(255) DEFAULT NULL,
  `text1` varchar(255) DEFAULT NULL,
  `text2` varchar(255) DEFAULT NULL,
  `text3` varchar(255) DEFAULT NULL,
  `link1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `text4` varchar(255) DEFAULT NULL,
  `text5` text,
  `link2` varchar(255) DEFAULT NULL,
  `text6` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `text7` varchar(255) DEFAULT NULL,
  `text8` text,
  `link3` varchar(255) DEFAULT NULL,
  `text9` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  `text10` varchar(255) DEFAULT NULL,
  `link4` varchar(255) DEFAULT NULL,
  `image6` varchar(255) DEFAULT NULL,
  `text11` varchar(255) DEFAULT NULL,
  `text12` varchar(255) DEFAULT NULL,
  `text13` varchar(255) DEFAULT NULL,
  `link5` varchar(255) DEFAULT NULL,
  `text14` varchar(255) DEFAULT NULL,
  `image7` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `type_menuelement_relations`;
CREATE TABLE `type_menuelement_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `relation_subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`relation`,`subject_id`,`relation_subject_id`),
  KEY `relation` (`relation`,`subject_id`),
  KEY `relation_2` (`relation`,`relation_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_menuelement_relations` (`id`, `relation`, `subject_id`, `relation_subject_id`) VALUES
(6,	'body',	5,	4),
(10,	'body',	8,	5),
(14,	'body',	12,	6),
(15,	'body',	13,	7),
(33,	'body',	28,	17),
(34,	'body',	29,	18),
(35,	'body',	30,	19),
(36,	'body',	31,	20),
(40,	'body',	35,	21),
(63,	'body',	58,	33),
(64,	'body',	59,	34),
(65,	'body',	60,	35),
(66,	'body',	61,	36),
(67,	'body',	62,	37),
(22,	'elements',	1,	13),
(41,	'elements',	33,	35);

DROP TABLE IF EXISTS `type_menuelement_subjects`;
CREATE TABLE `type_menuelement_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `_ru_title` varchar(255) DEFAULT NULL,
  `_en_title` varchar(255) DEFAULT NULL,
  `_kz_title` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `cat_id` varchar(255) DEFAULT NULL,
  `back_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_menuelement_subjects` (`id`, `is_related`, `_ru_title`, `_en_title`, `_kz_title`, `sort`, `body`, `cat_id`, `back_name`, `image`) VALUES
(59,	1,	'Каталог',	NULL,	NULL,	0,	'LinkTranslatable',	NULL,	NULL,	NULL),
(60,	1,	'О компании',	NULL,	NULL,	0,	'LinkTranslatable',	NULL,	NULL,	NULL),
(61,	1,	'Новости',	NULL,	NULL,	0,	'LinkTranslatable',	NULL,	NULL,	NULL),
(62,	1,	'Контакты',	NULL,	NULL,	0,	'LinkTranslatable',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `type_menu_relations`;
CREATE TABLE `type_menu_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `relation_subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`relation`,`subject_id`,`relation_subject_id`),
  KEY `relation` (`relation`,`subject_id`),
  KEY `relation_2` (`relation`,`relation_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_menu_relations` (`id`, `relation`, `subject_id`, `relation_subject_id`) VALUES
(69,	'elements',	1,	59),
(70,	'elements',	1,	60),
(71,	'elements',	1,	61),
(72,	'elements',	1,	62),
(67,	'elements',	2,	57),
(68,	'elements',	2,	58),
(73,	'elements',	3,	60),
(74,	'elements',	3,	61),
(75,	'elements',	3,	62),
(35,	'elements',	4,	28),
(36,	'elements',	4,	29),
(37,	'elements',	4,	30),
(38,	'elements',	4,	31);

DROP TABLE IF EXISTS `type_menu_subjects`;
CREATE TABLE `type_menu_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_menu_subjects` (`id`, `is_related`, `name`) VALUES
(1,	0,	'Главное меню'),
(3,	0,	'Информация');

DROP TABLE IF EXISTS `type_news_subjects`;
CREATE TABLE `type_news_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `_ru_title` varchar(255) DEFAULT NULL,
  `_en_title` varchar(255) DEFAULT NULL,
  `_kz_title` varchar(255) DEFAULT NULL,
  `_ru_preview` text,
  `_en_preview` text,
  `_kz_preview` text,
  `_ru_text` longtext,
  `_en_text` longtext,
  `_kz_text` longtext,
  `date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_news_subjects` (`id`, `is_related`, `_ru_title`, `_en_title`, `_kz_title`, `_ru_preview`, `_en_preview`, `_kz_preview`, `_ru_text`, `_en_text`, `_kz_text`, `date`, `image`) VALUES
(1,	0,	'Лекарство от «старости»: в России создали чудо-защиту деталей от износа',	NULL,	NULL,	'Ведущие автопроизводители могут выпускать новинки хоть еженедельно, но одной марке достаточно сделать одну новую модель в течение года и ей будет посвящено всё внимание ... журналистов и вообще всей аудитории.',	NULL,	NULL,	'<p>Ведущие автопроизводители могут выпускать новинки хоть еженедельно, но одной марке достаточно сделать одну новую модель в течение года и ей будет посвящено всё внимание ... журналистов и вообще всей аудитории.</p>\r\n',	NULL,	NULL,	'2020-04-22',	'/uploads/images/2020/04/23/f_699ae1b369d5843f10054c50af674f611c09d482.jpg'),
(2,	0,	'Лекарство от «старости»: в России создали чудо-защиту деталей от износа',	NULL,	NULL,	'Специальные покрытия защитят автокомпоненты не только от износа, но и от окисления и коррозии, утверждают специалисты. Нанокомпозитные покрытия изобрели в университете МИСиС ...',	NULL,	NULL,	'<p>Специальные покрытия защитят автокомпоненты не только от износа, но и от окисления и коррозии, утверждают специалисты. Нанокомпозитные покрытия изобрели в университете МИСиС ...</p>\r\n',	NULL,	NULL,	'2020-04-15',	'/uploads/images/2020/04/23/f_ba0ce731d8cffb61c2deac16ee1e65d8319ccbad.jpg'),
(3,	0,	'Лекарство от «старости»: в России создали чудо-защиту деталей от износа',	NULL,	NULL,	'Специальные покрытия защитят автокомпоненты не только от износа, но и от окисления и коррозии, утверждают специалисты. Нанокомпозитные покрытия изобрели в университете МИСиС ...',	NULL,	NULL,	'<p>Специальные покрытия защитят автокомпоненты не только от износа, но и от окисления и коррозии, утверждают специалисты. Нанокомпозитные покрытия изобрели в университете МИСиС ...</p>\r\n',	NULL,	NULL,	'2020-04-20',	'/uploads/images/2020/04/23/f_72fa1eb76746ff7791cf4d03983d470c629d7fc4.jpg'),
(4,	0,	'Лекарство от «старости»: в России создали чудо-защиту деталей от износа',	NULL,	NULL,	'Специальные покрытия защитят автокомпоненты не только от износа, но и от окисления и коррозии, утверждают специалисты. Нанокомпозитные покрытия изобрели в университете МИСиС ...',	NULL,	NULL,	'<p>Специальные покрытия защитят автокомпоненты не только от износа, но и от окисления и коррозии, утверждают специалисты. Нанокомпозитные покрытия изобрели в университете МИСиС ...</p>\r\n',	NULL,	NULL,	'2020-04-24',	'/uploads/images/2020/04/23/f_9d9443399614bf498806566503ab2044ed83b2b5.jpg');

DROP TABLE IF EXISTS `type_page_relations`;
CREATE TABLE `type_page_relations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation` varchar(255) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `relation_subject_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`relation`,`subject_id`,`relation_subject_id`),
  KEY `relation` (`relation`,`subject_id`),
  KEY `relation_2` (`relation`,`relation_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_page_relations` (`id`, `relation`, `subject_id`, `relation_subject_id`) VALUES
(1,	'seo',	21,	3);

DROP TABLE IF EXISTS `type_page_subjects`;
CREATE TABLE `type_page_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `_ru_title` varchar(255) DEFAULT NULL,
  `_en_title` varchar(255) DEFAULT NULL,
  `_kz_title` varchar(255) DEFAULT NULL,
  `_ru_body` longtext,
  `_en_body` longtext,
  `_kz_body` longtext,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_page_subjects` (`id`, `is_related`, `_ru_title`, `_en_title`, `_kz_title`, `_ru_body`, `_en_body`, `_kz_body`) VALUES
(4,	1,	'Документация',	'Документация',	'Документация',	'<p>Документация</p>\r\n',	'<p>Документация</p>\r\n',	'<p>Документация</p>\r\n'),
(5,	1,	'Элемент нижнего меню',	'Элемент нижнего меню',	'Элемент нижнего меню',	'<p>Текст элемента нижнего меню.</p>\r\n',	'<p>Текст элемента нижнего меню.</p>\r\n',	'<p>Текст элемента нижнего меню.</p>\r\n'),
(6,	1,	'Партнеры',	'Партнеры',	'Партнеры',	'<p><img alt=\"\" src=\"/uploads/images/partner5%281%29.jpg\" style=\"margin: 5px;\" />&nbsp;<img alt=\"\" src=\"/uploads/images/partner3%281%29.jpg\" style=\"margin: 5px;\" />&nbsp;<img alt=\"\" src=\"/uploads/images/47957912_w640_h640_vorota_doorhan_1%281%29.png\" style=\"margin: 5px;\" />&nbsp;<img alt=\"\" src=\"/uploads/images/logo%281%29.jpg\" style=\"margin: 5px;\" />&nbsp;<img alt=\"\" src=\"/uploads/images/tumen.png\" style=\"margin: 5px;\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n',	'<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/partner1.jpg\" /></td>\r\n			<td style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/47957912_w640_h640_vorota_doorhan_1.png\" /></td>\r\n			<td style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/logo.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/uploads/images/partner5.jpg\" /></td>\r\n			<td><img alt=\"\" src=\"/uploads/images/partner3.jpg\" /></td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n',	'<table border=\"0\" cellpadding=\"3\" cellspacing=\"1\" style=\"width: 100%;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/partner1.jpg\" /></td>\r\n			<td style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/47957912_w640_h640_vorota_doorhan_1.png\" /></td>\r\n			<td style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/images/logo.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"/uploads/images/partner5.jpg\" /></td>\r\n			<td><img alt=\"\" src=\"/uploads/images/partner3.jpg\" /></td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n'),
(7,	1,	'Вакансии',	'Вакансии',	'Вакансии',	'<p>На данный момент открытых вакансий нет.</p>\r\n\r\n<p>Вы можете отправить свое резюме на эл.адрес: <a href=\"mailto:aleko@aleko.kz\">aleko@aleko.kz</a>. Мы сохраним его в базу и обязательно свяжемся с Вами в случае открытия подходящей для Вас вакансии!&nbsp;</p>\r\n',	'<p>Вакансии</p>\r\n',	'<p>Вакансии</p>\r\n'),
(17,	1,	'Доставка',	'Доставка',	'Доставка',	'<p>Данный раздел находится в разработке.</p>\r\n',	'<p>Доставка</p>\r\n',	'<p>Доставка</p>\r\n'),
(18,	1,	'Оплата',	'Оплата',	'Оплата',	'<p>Данный раздел находится в разработке.</p>\r\n',	'<ul>\r\n	<li><a href=\"http://wgm.evolutiongym.kz/ru/#\">Оплата</a></li>\r\n</ul>\r\n',	'<ul>\r\n	<li><a href=\"http://wgm.evolutiongym.kz/ru/#\">Оплата</a></li>\r\n</ul>\r\n'),
(19,	1,	'Возврат',	'Возврат',	'Возврат',	'<p>Данный раздел находится в разработке.</p>\r\n',	'<p>Возврат</p>\r\n',	'<p>Возврат</p>\r\n'),
(20,	1,	'Гарантия',	'Гарантия',	'Гарантия',	'<p>Данный раздел находится в разработке.</p>\r\n',	'<ul>\r\n	<li><a href=\"http://wgm.evolutiongym.kz/ru/#\">Гарантия</a></li>\r\n</ul>\r\n',	'<ul>\r\n	<li><a href=\"http://wgm.evolutiongym.kz/ru/#\">Гарантия</a></li>\r\n</ul>\r\n'),
(21,	1,	'О компании3dfdf',	'О компании',	NULL,	'<p>О компанииsfdsfdfsdfdsf11111111111</p>\r\n',	'<p>О компании</p>\r\n',	NULL);

DROP TABLE IF EXISTS `type_photo_subjects`;
CREATE TABLE `type_photo_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `src` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_photo_subjects` (`id`, `is_related`, `src`, `name`) VALUES
(1,	0,	'/uploads/images/2021/05/05/f_383caa64851077dce6d18d88d6c3ab8b5c3fbf7e.png',	'логотип в шапке'),
(2,	0,	'/uploads/images/2021/05/05/f_c6916cd10aa87f748390e1186d13d7b86f3a0853.png',	'Большое лого'),
(3,	1,	'/uploads/images/2021/05/05/f_81e4f7251873a7418748bd87d4900fb2c9481f99.jpg',	'Фото1'),
(4,	1,	'/uploads/images/2021/05/05/f_855012d29ba659c80566942dbb8348fa3aaada42.jpg',	'Фото2'),
(5,	1,	'/uploads/images/2021/05/05/f_3502c450b902116f0c083cf9c9213dd61bed2bb3.jpg',	'Фото3'),
(6,	1,	'/uploads/images/2021/05/05/f_0fad1a17abba3657729d63a923b20988d95b0ab4.jpg',	'Фото4'),
(7,	1,	'/uploads/images/2021/05/05/f_04ec961fab6a178dd7ac2c49a1cd4031e0f34849.jpg',	'Фото5'),
(8,	1,	'/uploads/images/2021/05/05/f_775b4bf580e736b3b9e09fb8c7470babc914783d.jpg',	'Фото6');

DROP TABLE IF EXISTS `type_product_subjects`;
CREATE TABLE `type_product_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `novetly` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `sale` int(11) DEFAULT NULL,
  `articul` varchar(255) DEFAULT NULL,
  `bestseller` tinyint(1) NOT NULL DEFAULT '0',
  `recommendation` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_product_subjects` (`id`, `is_related`, `name`, `price`, `novetly`, `description`, `sale`, `articul`, `bestseller`, `recommendation`, `image`) VALUES
(41,	0,	'DMH-ZF9350BT',	0,	0,	'9\" Floating Hi-Res AV Receiver with Wireless Apple CarPlay, Android Auto and Alexa Built-In',	0,	NULL,	1,	0,	'/uploads/images/2021/05/05/f_f82e7aa80764ce756871bd648d0285cec10b8156.jpg'),
(42,	0,	'DMH-ZF9350BT',	0,	0,	'9\" Floating Hi-Res AV Receiver with Wireless Apple CarPlay, Android Auto and Alexa Built-In',	0,	NULL,	0,	1,	'/uploads/images/2021/05/05/f_f82e7aa80764ce756871bd648d0285cec10b8156.jpg'),
(43,	0,	'DMH-ZF9350BT',	0,	0,	'9\" Floating Hi-Res AV Receiver with Wireless Apple CarPlay, Android Auto and Alexa Built-In',	0,	NULL,	1,	0,	'/uploads/images/2021/05/05/f_f82e7aa80764ce756871bd648d0285cec10b8156.jpg'),
(44,	0,	'DMH-ZF9350BT',	0,	1,	'9\" Floating Hi-Res AV Receiver with Wireless Apple CarPlay, Android Auto and Alexa Built-In',	0,	NULL,	1,	0,	'/uploads/images/2021/05/05/f_f82e7aa80764ce756871bd648d0285cec10b8156.jpg'),
(45,	0,	'DMH-ZF9350BT',	0,	1,	'9\" Floating Hi-Res AV Receiver with Wireless Apple CarPlay, Android Auto and Alexa Built-In',	0,	NULL,	0,	0,	'/uploads/images/2021/05/05/f_f82e7aa80764ce756871bd648d0285cec10b8156.jpg');

DROP TABLE IF EXISTS `type_seo_subjects`;
CREATE TABLE `type_seo_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `_ru_title` varchar(255) DEFAULT NULL,
  `_en_title` varchar(255) DEFAULT NULL,
  `_kz_title` varchar(255) DEFAULT NULL,
  `_ru_keywords` text,
  `_en_keywords` text,
  `_kz_keywords` text,
  `_ru_description` text,
  `_en_description` text,
  `_kz_description` text,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_seo_subjects` (`id`, `is_related`, `_ru_title`, `_en_title`, `_kz_title`, `_ru_keywords`, `_en_keywords`, `_kz_keywords`, `_ru_description`, `_en_description`, `_kz_description`) VALUES
(1,	0,	'Terra',	'',	'',	'Кейвордс',	'',	'',	'Дескрипшн',	'',	''),
(3,	1,	'keksdfsdf',	NULL,	NULL,	'test',	NULL,	NULL,	'tes',	NULL,	NULL),
(4,	0,	'О компании',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS `type_slider_subjects`;
CREATE TABLE `type_slider_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `text` text,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_slider_subjects` (`id`, `is_related`, `text`, `image`, `url`) VALUES
(3,	0,	'Автозвук и мультимедиа',	'/uploads/images/2021/05/05/f_4187cd1f6944a3cb409e01ac288659e86be4a4a8.jpg',	NULL),
(4,	0,	'Автозвук и мультимедиа',	'/uploads/images/2021/05/05/f_17c8faca266a6a63fcfe7fdd9090d6c505db545a.jpg',	NULL),
(5,	0,	'Автозвук и мультимедиа',	'/uploads/images/2021/05/05/f_814d54044f1b7f76822a43eb33cdf5a57e146de0.jpg',	NULL);

DROP TABLE IF EXISTS `type_social_subjects`;
CREATE TABLE `type_social_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_social_subjects` (`id`, `is_related`, `name`, `url`, `sort`) VALUES
(1,	1,	'instagram',	'https://www.instagram.com/',	100),
(2,	1,	'facebook',	'https://www.facebook.com/',	300),
(3,	1,	'vk',	'https://vk.com/',	200);

DROP TABLE IF EXISTS `type_user_subjects`;
CREATE TABLE `type_user_subjects` (
  `id` bigint(20) NOT NULL,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `recieve_simple_orders` tinyint(1) NOT NULL DEFAULT '0',
  `recieve_help_calc` tinyint(1) NOT NULL DEFAULT '0',
  `root` tinyint(1) NOT NULL DEFAULT '0',
  `manager` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_user_subjects` (`id`, `is_related`, `created_at`, `name`, `email`, `password`, `remember_token`, `recieve_simple_orders`, `recieve_help_calc`, `root`, `manager`) VALUES
(1,	0,	'2017-07-22 21:00:51',	'Kazplay',	'director@artmedia.kz',	'7c4a8d09ca3762af61e59520943dc26494f8941b',	'd077125950d758539e28da93e2234a43abe009fa',	1,	1,	1,	1);

DROP TABLE IF EXISTS `type_variable_subjects`;
CREATE TABLE `type_variable_subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_related` tinyint(1) NOT NULL DEFAULT '0',
  `value` text,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `is_related` (`is_related`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `type_variable_subjects` (`id`, `is_related`, `value`, `name`) VALUES
(1,	0,	'info@mail.ru',	'E-mail администратора'),
(2,	0,	'Copyright © 2021 «Sound Terra»',	'Копирайт'),
(3,	0,	'Создание сайта',	'Создание сайта');

-- 2021-05-11 09:42:36
