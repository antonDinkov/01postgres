-- Заявката бърка във мета данни на системната таблица pg_indexes, която съдържа информация за индексите в базата данни. Тя извлича името на таблицата, името на индекса и дефиницията на индекса за всички индекси в схемата 'public'. Резултатите са сортирани по име на таблица и име на индекс в нарастващ ред.

SELECT tablename, indexname, indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename ASC, indexname ASC;