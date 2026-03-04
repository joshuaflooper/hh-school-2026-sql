(WITH formatted_date_resumes(resume_id, month, year) AS (
    SELECT 
        resume_id,
        extract(month FROM publication_date) AS month,
        extract(year FROM publication_date) AS year
    FROM resumes
)
SELECT 'resumes' AS type, month, year, count(resume_id)
FROM formatted_date_resumes
GROUP BY month, year
ORDER BY count DESC
LIMIT 1)
UNION
(WITH formatted_date_vacancies(vacancy_id, month, year) AS (
    SELECT 
        vacancy_id,
        extract(month FROM publication_date) AS month,
        extract(year FROM publication_date) AS year
    FROM vacancies
)
SELECT 'vacancies' AS type, month, year, count(vacancy_id)
FROM formatted_date_vacancies
GROUP BY month, year
ORDER BY count DESC
LIMIT 1);