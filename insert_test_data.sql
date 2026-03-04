-- Сгенерировать данные о работодателях
WITH employers_test_data(employer_id) AS (
    SELECT generate_series(1, 500) AS employer_id
)
INSERT INTO employers(employer_id, organization_name, phone_number)
SELECT employer_id, 'Рандомная компания ' || employer_id, 'phone_number_here'
FROM employers_test_data;

-- Сгенерировать данные о пользователях
WITH users_test_data(user_id, random_value) AS (
	SELECT 
		generate_series(1, 80000) AS user_id, 
		random() AS random_value
)
INSERT INTO users (user_id, first_name, last_name, gender, phone_number)
SELECT 
	user_id, 
	CASE
		WHEN random_value < 0.5 THEN
			(ARRAY[
				'Александр',
				'Алексей',
				'Андрей',
				'Анатолий',
				'Антон',
				'Аркадий',
				'Арсений',
				'Артём',
				'Артемий',
				'Артур',
				'Борис',
				'Вадим',
				'Валерий',
				'Василий',
				'Виктор',
				'Виталий',
				'Владимир',
				'Владислав',
				'Всеволод',
				'Вячеслав',
				'Геннадий',
				'Георгий',
				'Глеб',
				'Григорий',
				'Даниил',
				'Данил',
				'Данила',
				'Денис',
				'Дмитрий',
				'Евгений',
				'Егор',
				'Игорь',
				'Иван',
				'Илья',
				'Кирилл',
				'Константин',
				'Лев',
				'Леонид',
				'Максим',
				'Матвей',
				'Марк',
				'Михаил',
				'Никита',
				'Николай',
				'Олег',
				'Павел',
				'Пётр',
				'Роман',
				'Руслан',
				'Станислав',
				'Семён',
				'Сергей',
				'Тимофей',
				'Фёдор',
				'Юрий'
			])[floor(random() * 55)::int + 1]
		ELSE
			(ARRAY[
				'Александра',
				'Алёна',
				'Алина',
				'Алиса',
				'Алла',
				'Анастасия',
				'Ангелина',
				'Анжела',
				'Анна',
				'Антонина',
				'Анфиса',
				'Валентина',
				'Валерия',
				'Варвара',
				'Василиса',
				'Вера',
				'Вероника',
				'Виктория',
				'Галина',
				'Дарья',
				'Диана',
				'Ева',
				'Евгения',
				'Евдокия',
				'Екатерина',
				'Елена',
				'Елизавета',
				'Жанна',
				'Зинаида',
				'Инна',
				'Ирина',
				'Карина',
				'Кира',
				'Кристина',
				'Ксения',
				'Лариса',
				'Лидия',
				'Любовь',
				'Людмила',
				'Маргарита',
				'Марина',
				'Мария',
				'Милана',
				'Надежда',
				'Наталия',
				'Наталья',
				'Нина',
				'Оксана',
				'Ольга',
				'Полина',
				'Раиса',
				'Светлана',
				'София',
				'Софья',
				'Таисия',
				'Тамара',
				'Татьяна',
				'Ульяна',
				'Юлия',
				'Яна'
			])[floor(random() * 60)::int + 1]
	END AS first_name,
	CASE
		WHEN random_value < 0.5 THEN
			(ARRAY[
				'Смирнов',
				'Иванов',
				'Кузнецов',
				'Попов',
				'Соколов',
				'Лебедев',
				'Козлов',
				'Новиков',
				'Морозов',
				'Петров',
				'Волков',
				'Соловьёв',
				'Васильев',
				'Зайцев',
				'Павлов',
				'Семёнов',
				'Голубев',
				'Виноградов',
				'Богданов',
				'Воробьёв',
				'Фёдоров',
				'Михайлов',
				'Беляев',
				'Тарасов',
				'Белов',
				'Комаров',
				'Орлов',
				'Киселёв',
				'Макаров',
				'Андреев'
			])[floor(random() * 30)::int + 1]
		ELSE
			(ARRAY[
				'Смирнова',
				'Иванова',
				'Кузнецова',
				'Попова',
				'Соколова',
				'Лебедева',
				'Козлова',
				'Новикова',
				'Морозова',
				'Петрова',
				'Волкова',
				'Соловьёва',
				'Васильева',
				'Зайцева',
				'Павлова',
				'Семёнова',
				'Голубева',
				'Виноградова',
				'Богданова',
				'Воробьёва',
				'Фёдорова',
				'Михайлова',
				'Беляева',
				'Тарасова',
				'Белова',
				'Комарова',
				'Орлова',
				'Киселёва',
				'Макарова',
				'Андреева'
			])[floor(random() * 30)::int + 1]
	END AS last_name,
	CASE 
		WHEN random_value < 0.5 THEN  
			'male'::gender_type
		ELSE  
			'female'::gender_type
	END AS gender,
	'phone_number_here'
FROM users_test_data;
	
-- Сгенерировать данные о регионах
INSERT INTO areas(area_name)
VALUES (unnest(ARRAY[
        'Москва',
        'Санкт-Петербург',
        'Новосибирск',
        'Екатеринбург',
        'Казань',
        'Красноярск',
        'Нижний Новгород',
        'Челябинск',
        'Уфа',
        'Самара'
    ])
);

-- Сгенерировать данные о группах специализаций и специализациях
INSERT INTO specialization_groups(specialization_group_id, specialization_group_name)
VALUES(1, 'Информационные технологии');

INSERT INTO specializations(specialization_id, specialization_group_id, specialization_name)
SELECT
    generate_series(1, 26),
    1,
    unnest(ARRAY[
        'BI-аналитик, аналитик данных',
        'DevOps-инженер',
        'Аналитик',
        'Арт-директор', 
        'Креативный директор',
        'Бизнес-аналитик',
        'Гейм-дизайнер',
        'Дата-сайентист',
        'Дизайнер, художник',
        'Директор по информационным технологиям (CIO)',
        'Менеджер продукта',
        'Методолог',
        'Программист, разработчик',
        'Продуктовый аналитик',
        'Руководитель группы разработки',
        'Руководитель отдела аналитики',
        'Руководитель проектов',
        'Сетевой инженер',
        'Системный администратор',
        'Системный аналитик',
        'Системный инженер',
        'Специалист по информационной безопасности',
        'Специалист технической поддержки',
        'Тестировщик',
        'Технический директор (CTO)',
        'Технический писатель'
    ]);

-- Сгенерировать данные о вакансиях
WITH primary_keys_min_max_values(
    min_employer_id,
    max_employer_id,
    min_area_id,
    max_area_id,
    min_specialization_id,
    max_specialization_id
) AS (
    SELECT
        (SELECT min(employer_id) FROM employers) AS min_employer_id,
        (SELECT max(employer_id) FROM employers) AS max_employer_id,
        (SELECT min(area_id) FROM areas) AS min_area_id,
        (SELECT max(area_id) FROM areas) AS max_area_id,
        (SELECT min(specialization_id) FROM specializations) AS min_specialization_id,
        (SELECT max(specialization_id) FROM specializations) AS max_specialization_id
),
vacancies_test_data(
    vacancy_id,
    employer_id,
	area_id,
    specialization_id,
	required_experience,
	salary_from,
	salary_delta,
	payment_frequency,
	publication_date
) AS (
    SELECT
        generate_series(1, 10000) AS vacancy_id,
        floor(random() * (max_employer_id - min_employer_id))::int + min_employer_id AS employer_id,
        floor(random() * (max_area_id - min_area_id))::int + min_area_id AS area_id,
        floor(random() * (max_specialization_id - min_specialization_id))::int + min_specialization_id AS specialization_id,
        (ARRAY[
            'no'::required_experience_type, 
            'from_1_to_3'::required_experience_type, 
            'from_3_to_6'::required_experience_type, 
            'more_than_6'::required_experience_type
        ])[floor(random() * 4)::int + 1] AS required_experience,
        round((random() * 300000)::int, -3) AS salary_from,
        round((random() * 20000)::int, -3) + 10000 AS salary_delta,
        (ARRAY[
            'daily'::payment_frequency_type,
            'weekly'::payment_frequency_type,
            'twice_a_month'::payment_frequency_type,
            'monthly'::payment_frequency_type,
            'for_a_project'::payment_frequency_type
        ])[floor(random() * 5)::int + 1] AS payment_frequency,
        now() - (random() * INTERVAL '3 years') AS publication_date
    FROM primary_keys_min_max_values
)
INSERT INTO vacancies(
    vacancy_id,
    employer_id,
	area_id,
    specialization_id,
	title,
	description,
	required_experience,
	salary_from,
	salary_to,
	payment_frequency,
	publication_date
)
SELECT     
    vacancy_id,
    employer_id,
	area_id,
    specialization_id,
    'title_here',
    'description_here',
	required_experience,
	salary_from,
	salary_from + salary_delta,
	payment_frequency,
	publication_date
FROM vacancies_test_data;

-- Сгенерировать данные о резюме
WITH primary_keys_min_max_values(
    min_user_id,
    max_user_id,
    min_area_id,
    max_area_id,
    min_specialization_id,
    max_specialization_id
) AS (
    SELECT
        (SELECT min(user_id) FROM users) AS min_user_id,
        (SELECT max(user_id) FROM users) AS max_user_id,
        (SELECT min(area_id) FROM areas) AS min_area_id,
        (SELECT max(area_id) FROM areas) AS max_area_id,
        (SELECT min(specialization_id) FROM specializations) AS min_specialization_id,
        (SELECT max(specialization_id) FROM specializations) AS max_specialization_id
),
vacancies_test_data(
	resume_id,
	user_id,
	area_id,
	specialization_id,
	experience,
	salary_from,
	publication_date
) AS (
    SELECT
        generate_series(1, 100000) AS resume_id,
        floor(random() * (max_user_id - min_user_id))::int + 1 + min_user_id AS user_id,
        floor(random() * (max_area_id - min_area_id))::int + 1 + min_area_id AS area_id,
        floor(random() * (max_specialization_id - min_specialization_id))::int + 1 + min_specialization_id AS specialization_id,
        round(random() * 10)::int AS experience,
        round((random() * 300000)::int, -4) AS salary_from,
        now() - (random() * INTERVAL '3 years') AS publication_date
    FROM primary_keys_min_max_values
)
INSERT INTO resumes(
    resume_id,
    user_id,
	area_id,
    specialization_id,
	title,
	description,
	experience,
	salary_from,
	publication_date
)
SELECT     
    resume_id,
    user_id,
	area_id,
    specialization_id,
    'title_here',
    'description_here',
	experience,
	salary_from,
	publication_date
FROM vacancies_test_data;

-- Сгенерировать данные об откликах
WITH responses_test_data(
    resume_id,
    vacancy_id,
    publication_date 
) AS (
    SELECT 
        r.resume_id AS resume_id, 
        v.vacancy_id AS vacancy_id, 
        r.publication_date AS publication_date
    FROM resumes AS r
    INNER JOIN vacancies AS v ON 
        v.area_id = r.area_id
        AND v.specialization_id = r.specialization_id
        AND v.salary_from >= r.salary_from
        AND (
            v.required_experience = 'no'::required_experience_type
            OR v.required_experience = 'from_1_to_3'::required_experience_type AND r.experience >= 1
            OR v.required_experience = 'from_3_to_6'::required_experience_type AND r.experience >= 3
            OR v.required_experience = 'more_than_6'::required_experience_type AND r.experience >= 6
        )
        AND v.publication_date <= r.publication_date
)
INSERT INTO responses(
    resume_id,
    vacancy_id,
    covering_letter,
    response_date
)
SELECT
    resume_id,
    vacancy_id,
    'covering_letter_here',
    publication_date + random() * (now() - publication_date)
FROM responses_test_data;