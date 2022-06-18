SELECT books.id,
       books.name,
       ct.name,
       GROUP_CONCAT(genres.name) as genres_names,
       COUNT(genres.name)        as genres_count,
       books.circulation
FROM books
         JOIN books_has_genres bhg on books.id = bhg.book_id
         JOIN genres ON genres.id = bhg.genre_id
         JOIN cover_types ct on books.cover_type_id = ct.id
GROUP BY books.id
HAVING genres_count > 3
   AND books.circulation > 1000;