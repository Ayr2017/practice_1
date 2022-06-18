create table books_has_genres
(
    book_id  int not null,
    genre_id int not null,
    constraint books_has_genres_pk
        unique (book_id, genre_id),
    constraint book_id
        foreign key (book_id) references books (id),
    constraint genre_id
        foreign key (genre_id) references genres (id)
);

