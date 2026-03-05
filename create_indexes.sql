-- Создать индекс по столбцу area_id для таблицы vacancies
CREATE INDEX idx_vacancy_area_id
ON vacancies(area_id);

-- Создать индекс по столбцу vacancy_id для таблицы response
CREATE INDEX idx_response_vacancy_id
ON responses(vacancy_id);
