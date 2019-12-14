##Создаем тестовые данные
delete from tasks;
delete from categories;
delete from users;
delete from roles;

#Роли
insert into roles (name) VALUES ('admin');
insert into roles (name) VALUES ('user');

#Пользователи
insert into users (email, password, role_id) 
VALUES ('owner-of-all-real@ya.ru', 'owner', 1);

#Категории
insert into categories (user_id, name, description) 
VALUES (1, "test category", "test category description");

#Задачи
insert into tasks (user_id, category_id, name, description) 
VALUES (1, 1, "test task", "test task description");