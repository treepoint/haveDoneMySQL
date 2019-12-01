CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` varchar(4000) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id)  REFERENCES users (id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(400) NOT NULL,
  `description` varchar(4000) NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (user_id)  REFERENCES users (id),
    FOREIGN KEY (category_id)  REFERENCES categories (id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;