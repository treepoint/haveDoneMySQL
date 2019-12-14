#Удалим все таблицы если есть
DROP TABLE tasks;
DROP TABLE categories;
DROP TABLE users;
DROP TABLE roles;

#Роли
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL UNIQUE,
  `description` varchar(255) NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

#Пользователи
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (role_id)  REFERENCES roles (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

#Категории
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` varchar(4000) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)  REFERENCES users (id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;

#Задачи
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` varchar(4000) NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)  REFERENCES users (id),
    FOREIGN KEY (category_id)  REFERENCES categories (id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;
