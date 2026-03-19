CREATE TYPE required_experience_type AS ENUM ('no', 'from_1_to_3', 'from_3_to_6', 'more_than_6');

CREATE TYPE payment_frequency_type AS ENUM (
	'daily',
	'weekly',
	'twice_a_month',
	'monthly',
	'for_a_project'
);

CREATE TYPE gender_type AS ENUM ('male', 'female');

CREATE TABLE employers (
	employer_id serial PRIMARY KEY,
	organization_name text NOT NULL,
	phone_number text NOT NULL
);

CREATE TABLE users (
	user_id serial PRIMARY KEY, 
	first_name text NOT NULL,
	last_name text NOT NULL,
	gender gender_type NOT NULL,
	phone_number text NOT NULL
);

CREATE TABLE areas (
	area_id serial PRIMARY KEY,
	area_name text NOT NULL unique
);

CREATE TABLE specialization_groups (
	specialization_group_id serial PRIMARY KEY,
	specialization_group_name text NOT NULL unique
);

CREATE TABLE specializations (
	specialization_id serial PRIMARY KEY,
	specialization_group_id integer NOT NULL REFERENCES specialization_groups(specialization_group_id),
	specialization_name text NOT NULL
);

CREATE TABLE vacancies (
    vacancy_id serial PRIMARY KEY,
    employer_id integer NOT NULL REFERENCES employers(employer_id),
	area_id integer NOT NULL REFERENCES areas(area_id),
    specialization_id integer NOT NULL REFERENCES specializations(specialization_id),
	title text NOT NULL,
	description text NOT NULL,
	required_experience required_experience_type NOT NULL,
	salary_from integer,
	salary_to integer,
	payment_frequency payment_frequency_type NOT NULL,
	publication_date date DEFAULT CURRENT_DATE
);

CREATE TABLE resumes (
	resume_id serial PRIMARY KEY,
	user_id integer NOT NULL REFERENCES users(user_id),
	area_id integer NOT NULL REFERENCES areas(area_id),
	specialization_id integer NOT NULL REFERENCES specializations(specialization_id),
	title text NOT NULL,
	description text NOT NULL,
	experience integer NOT NULL,
	salary_from integer,
	publication_date date DEFAULT CURRENT_DATE
);

CREATE TABLE responses (
	response_id serial PRIMARY KEY, 
	resume_id integer NOT NULL REFERENCES resumes(resume_id),
	vacancy_id integer NOT NULL REFERENCES vacancies(vacancy_id),
	covering_letter text,
	response_date date DEFAULT CURRENT_DATE
);
