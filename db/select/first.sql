SELECT books.id,
       books.name,
       ct.name as cover_type,
       GROUP_CONCAT(genres.name) as genres_names,
       COUNT(genres.name)        as genres_count,
       circulation
FROM books
         JOIN books_has_genres bhg on books.id = bhg.book_id
         JOIN genres ON genres.id = bhg.genre_id
         JOIN cover_types ct on books.cover_type_id = ct.id
WHERE books.cover_type_id = 1
GROUP BY books.id, circulation
HAVING genres_count > 3
   AND circulation > 1000;