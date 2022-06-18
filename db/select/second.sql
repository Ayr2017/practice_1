SELECT DISTINCT CONCAT(LEAST(b1_name, b2_name))                                   as name_1,
                CONCAT(GREATEST(b1_name, b2_name))                                as name_2,
                COUNT(bhg1_genre_id)                                              as genres_count,
                GROUP_CONCAT(DISTINCT g_name ORDER BY g_name DESC SEPARATOR ', ') as genres_name
FROM (SELECT bhg1.book_id  as bhg1_book_id,
             bhg2.book_id  as bhg2_book_id,
             bhg1.genre_id as bhg1_genre_id,
             b1.name       as b1_name,
             b2.name       as b2_name,
             g.name        as g_name,
             bhg2.genre_id
      FROM books_has_genres bhg1
               JOIN books_has_genres bhg2 ON bhg1.book_id != bhg2.book_id AND bhg1.genre_id = bhg2.genre_id
JOIN books b1
      ON b1.id = bhg1.book_id
          JOIN books b2 ON b2.id = bhg2.book_id
          JOIN genres g ON g.id = bhg2.genre_id) s1

GROUP BY bhg1_book_id, bhg2_book_id
HAVING genres_count >= 7;