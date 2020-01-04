##Создаем тестовые данные
delete from task_log;
delete from tasks;
delete from task_statuses;
delete from task_statuses_types;
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
insert into categories (user_id, name, description, create_date) 
VALUES (1, "test category", "test category description", "1970-01-01");

#Типы статусов задач
insert into task_statuses_types (name) VALUES ("Intermediate");
insert into task_statuses_types (name) VALUES ("Final");

#Статусы_задач
insert into task_statuses (user_id, type_id, name, create_date) VALUES (1, 1, "Waiting", "1970-01-01");
insert into task_statuses (user_id, type_id, name, create_date) VALUES (1, 1, "Partially completed", "1970-01-01");
insert into task_statuses (user_id, type_id, name, create_date) VALUES (1, 2, "Completed", "1970-01-01");
insert into task_statuses (user_id, type_id, name, create_date) VALUES (1, 1, "Wait for feedback", "1970-01-01");

#Задачи
insert into tasks (user_id, category_id, status_id, name, description, create_date) 
VALUES (1, 1, 1, "test task", "test task description", "2019-12-19");

insert into tasks (user_id, category_id, status_id, name, description, create_date) 
VALUES (1, 1, 1, "test task 2", "new test task description", "2019-12-20");

#Лог задач
insert into task_log (task_id, execution_start, execution_end) 
VALUES (1, "2019-12-19", "2019-12-20");