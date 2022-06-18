create table books
(
    id            int auto_increment
        primary key,
    name          varchar(100)  null,
    cover_type_id int           not null,
    circulation   int default 0 null,
    constraint cover_type_fk
        foreign key (cover_type_id) references cover_types (id)
);

