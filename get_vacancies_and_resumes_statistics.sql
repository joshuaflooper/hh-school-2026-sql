(WITH formatted_date_vacancies(vacancy_id, date) AS (
    SELECT 
        vacancy_id,
        date_trunc('month', publication_date)
    FROM vacancies
)
SELECT 'vacancies' AS type, to_char(date, 'MM.YYYY') AS month, count(vacancy_id)
FROM formatted_date_vacancies
GROUP BY date
ORDER BY count DESC
LIMIT 1)
UNION ALL
(WITH formatted_date_resumes(resume_id, date) AS (
    SELECT 
        resume_id,
        date_trunc('month', publication_date)
    FROM resumes
)
SELECT 'resumes' AS type, to_char(date, 'MM.YYYY') AS month, count(resume_id)
FROM formatted_date_resumes
GROUP BY date
ORDER BY count DESC
LIMIT 1);