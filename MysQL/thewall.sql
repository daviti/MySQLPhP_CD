CREATE DATABASE /*!32312 IF NOT EXISTS*/`wall` /*!40100 DEFAULT CHARACTER SET latin1 */;
​
USE `wall`;
​
​/*Table structure for table `comments` */​
​
DROP TABLE IF EXISTS `comments`;
​
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
​
​/*Data for the table `comments` */​
​
insert  into `comments`(`id`,`user_id`,`post_id`,`content`,`created_at`,`updated_at`) values (1,1,7,'such post','2013-12-11 14:59:38',NULL),(2,1,8,'much improve','2013-12-11 15:01:05',NULL);
​
​/*Table structure for table `posts` */​
​
DROP TABLE IF EXISTS `posts`;
​
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
​
​/*Data for the table `posts` */​
​
insert  into `posts`(`id`,`user_id`,`content`,`created_at`,`updated_at`) values (7,1,'Wow','2013-12-11 14:59:35',NULL),(8,1,'So amaze','2013-12-11 15:00:58',NULL);
​
​/*Table structure for table `users` */​
​
DROP TABLE IF EXISTS `users`;
​
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
​
​/*Data for the table `users` */​
​
insert  into `users`(`id`,`first_name`,`last_name`,`email`,`password`,`created_at`,`updated_at`) values (1,'Oliver','Rosales','jrosales@village88.com','5f4dcc3b5aa765d61d8327deb882cf99','2013-12-11 11:47:46',NULL);
​`wall`