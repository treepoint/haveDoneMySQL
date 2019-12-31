##Создаем тестовые данные
delete from task_log;
delete from tasks;
delete from task_statuses;
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

#Статусы_задач
insert into task_statuses (user_id, name) VALUES (1, "Waiting");
insert into task_statuses (user_id, name) VALUES (1, "Partially completed");
insert into task_statuses (user_id, name) VALUES (1, "Сompleted");
insert into task_statuses (user_id, name) VALUES (1, "Wait for feedback");

#Задачи
insert into tasks (user_id, category_id, status_id, name, description) 
VALUES (1, 1, 1, "test task", "test task description");

insert into tasks (user_id, category_id, status_id, name, description) 
VALUES (1, 1, 1, "test task 2", "new test task description");

#Лог задач
insert into task_log (task_id, execution_start, execution_end) 
VALUES (1, '2019-12-19', '2019-12-20');