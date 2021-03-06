##Создаем тестовые данные

#Но сначала удаляем старые, если есть
delete from task_log;
delete from tasks;
delete from task_statuses;
delete from task_statuses_types;
delete from categories;
delete from users;
delete from roles;

#Роли
insert into roles
    (name)
VALUES
    ('admin');
insert into roles
    (name)
VALUES
    ('user');

#Пользователи
insert into users
    (email, password, role_id)
VALUES
    ('owner-of-all-real@ya.ru', 'owner', 1);

#Проекты
insert into projects
    (user_id, name, description, create_date)
VALUES
    (1, "test project", "test project description", "1970-01-01");

#Категории
insert into categories
    (user_id, project_id, name, description, create_date)
VALUES
    (1, 1, "test category", "test category description", "1970-01-01");

#Задачи
insert into tasks
    (user_id, category_id, project_id, name, description, create_date)
VALUES
    (1, 1, 1, "test task", "test task description", "2019-12-19");

insert into tasks
    (user_id, category_id, project_id, name, description, create_date)
VALUES
    (1, 1, 1, "test task 2", "new test task description", "2019-12-20");

#Лог задач
insert into task_log
    (task_id, execution_start, execution_end)
VALUES
    (1, "2019-12-19", "2019-12-20");