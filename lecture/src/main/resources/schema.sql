drop table if exists test.reserve_lecture;
drop table if exists test.lecture;
drop table if exists test.lecture_detail;
drop table if exists test.lecture_reserved_count;

create table if not exists test.reserve_lecture
(
    id bigint not null generated by default as identity,
    user_id bigint not null,
    lecture_detail_id bigint not null,
    created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp not null
);

create table if not exists test.lecture
(
    id bigint not null generated by default as identity,
    name varchar(255) not null,
    created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp not null
);

create table if not exists test.lecture_detail
(
    id bigint not null generated by default as identity,
    lecture_id bigint not null,
    starts_at timestamp not null,
    created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp not null
);

create table if not exists test.lecture_reserved_count
(
    id bigint not null generated by default as identity,
    lecture_detail_id bigint not null,
    count bigint not null default 0,
    created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp not null
);

create unique index reserve_lecture_unique_idx on test.reserve_lecture(user_id, lecture_detail_id);