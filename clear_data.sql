-- Очистить таблицу групп специализаций -> специализаций -> вакансий & резюме -> откликов
TRUNCATE TABLE specialization_groups CASCADE;
ALTER SEQUENCE public.specialization_groups_specialization_group_id_seq RESTART WITH 1;

-- Очистить таблицу регионов -> вакансий & резюме -> откликов
TRUNCATE TABLE areas CASCADE;
ALTER SEQUENCE public.areas_area_id_seq RESTART WITH 1;

-- Очистить таблицу пользователей -> резюме -> откликов
TRUNCATE TABLE users CASCADE;
ALTER SEQUENCE public.users_user_id_seq RESTART WITH 1;

-- Очистить таблицу работодателей -> вакансий -> откликов
TRUNCATE TABLE employers CASCADE;
ALTER SEQUENCE public.employers_employer_id_seq RESTART WITH 1;

-- Очистить таблицу резюме -> откликов
TRUNCATE TABLE resumes CASCADE;
ALTER SEQUENCE public.resumes_resume_id_seq RESTART WITH 1;

-- Очистить таблицу вакансий -> откликов
TRUNCATE TABLE vacancies CASCADE;
ALTER SEQUENCE public.vacancies_vacancy_id_seq RESTART WITH 1;

-- Очистить таблицу откликов
TRUNCATE TABLE responses CASCADE;
ALTER SEQUENCE public.responses_response_id_seq RESTART WITH 1;