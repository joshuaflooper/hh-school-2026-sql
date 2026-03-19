SELECT
    area_id,
    round(avg(salary_from), 2) AS avg_salary_from,
    round(avg(salary_to), 2) AS avg_salary_to,
    round(avg(coalesce((salary_from + salary_to) / 2.0, salary_from, salary_to)), 2) AS avg_avg_salary_from_to
FROM vacancies
GROUP BY area_id 
ORDER BY area_id
