#Удалим все таблицы если есть
DROP TABLE task_log;
DROP TABLE tasks;
DROP TABLE task_statuses;
DROP TABLE task_statuses_types;
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
  `name_style` varchar(600) NOT NULL DEFAULT `{}`,
  `description` varchar(4000) NULL,
  `create_date` DATETIME NOT NULL,
  `close_date` DATETIME NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;

#Задачи
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` varchar(4000) NULL,
  `create_date` DATETIME NOT NULL,
  `closed_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  `moved_date` DATETIME NULL,
  `on_fire` TINYINT NOT NULL DEFAULT 0,
  `frozen` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (category_id)  REFERENCES categories (id) ON DELETE CASCADE,
  FOREIGN KEY (status_id)  REFERENCES task_statuses (id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;

#Лог выполнения задач
CREATE TABLE IF NOT EXISTS `task_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NULL,
  `comment` varchar(4000) NULL,
  `execution_start` DATETIME,
  `execution_end` DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (task_id)  REFERENCES tasks (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;

#Пользовательские настройки
CREATE TABLE IF NOT EXISTS `user_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL UNIQUE,
  `wallpaper` LONGTEXT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id)  REFERENCES users (id) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;
