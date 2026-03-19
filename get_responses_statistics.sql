WITH filtered_responses AS (
    SELECT r.response_id, v.vacancy_id, v.title
    FROM responses AS r
    INNER JOIN vacancies AS v ON v.vacancy_id = r.vacancy_id
    WHERE r.response_date - v.publication_date BETWEEN 0 AND 7
),
grouped_vacancies AS (
    SELECT vacancy_id, title, count(response_id) 
    FROM filtered_responses
    GROUP BY vacancy_id, title
)
SELECT vacancy_id, title, count
FROM grouped_vacancies
WHERE count >= 5;