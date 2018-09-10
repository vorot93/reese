CREATE DOMAIN group_id AS UUID;
CREATE DOMAIN user_id  AS UUID;

CREATE TYPE permission AS ENUM (
    'create',
    'edit',
    'edit_semi_protected',
    'edit_protected',
    'block'
);

CREATE TABLE groups (
    id   group_id NOT NULL,
    name VARCHAR  NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE group_permissions (
    group_id   group_id   NOT NULL REFERENCES groups (id),
    permission permission NOT NULL,

    PRIMARY KEY (group_id, permission)
);

CREATE TABLE users (
    id   user_id NOT NULL,
    name VARCHAR NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE user_groups (
    wiki_user  user_id  NOT NULL REFERENCES users (id),
    wiki_group group_id NOT NULL REFERENCES groups (id),

    PRIMARY KEY (wiki_user, wiki_group)
);
