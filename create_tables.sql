CREATE TYPE required_experience_type AS ENUM ('no', 'from_1_to_3', 'from_3_to_6', 'more_than_6');

CREATE TYPE payment_frequency_type AS ENUM (
	'daily',
	'weekly',
	'twice_a_month',
	'monthly',
	'for_a_project'
);

CREATE TYPE work_schedule_type AS ENUM (
	'6/1', '5/2', '4/3', '4/2', '3/3', '3/2', '2/2', '2/1', '1/3', '1/2', '4/4',
	'flexible',
	'on_weekends',
	'other'
);

CREATE TYPE working_hours_type AS ENUM (
	'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '24', 
	'by_agreement', 
	'other'
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
	keywords text[],
	description text NOT NULL,
	required_experience required_experience_type NOT NULL,
	salary_from integer,
	salary_to integer,
	payment_frequency payment_frequency_type NOT NULL,
	work_schedule work_schedule_type[] NOT NULL,
	working_hours working_hours_type[] NOT NULL,
	publication_date date DEFAULT now()
);

CREATE TABLE resumes (
	resume_id serial PRIMARY KEY,
	user_id integer NOT NULL REFERENCES users(user_id),
	area_id integer NOT NULL REFERENCES areas(area_id),
	specialization_id integer NOT NULL REFERENCES specializations(specialization_id),
	title text NOT NULL,
	keywords text[] NOT NULL,
	description text NOT NULL,
	experience integer NOT NULL,
	salary_from integer,
	salary_to integer,
	work_schedule work_schedule_type,
	working_hours working_hours_type,
	publication_date date DEFAULT now()
);

CREATE TABLE responses (
	response_id serial PRIMARY KEY, 
	user_id integer NOT NULL,
	vacancy_id integer NOT NULL,
	covering_letter text,
	response_date date DEFAULT now()
);
