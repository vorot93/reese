CREATE DOMAIN group_id AS UUID;
CREATE DOMAIN user_id  AS UUID;

CREATE TYPE permission AS ENUM (
    'create',
    'edit',
    'edit_semi_protected',
    'edit_protected',
    'block'
);

CREATE TYPE login_provider AS ENUM (
    'email',
    'facebook'
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
    user_id  user_id  NOT NULL REFERENCES users (id),
    group_id group_id NOT NULL REFERENCES groups (id),

    PRIMARY KEY (user_id, group_id)
);

CREATE TABLE user_logins (
    user_id  user_id        NOT NULL REFERENCES users (id),
    provider login_provider NOT NULL,
    data     VARCHAR        NOT NULL,

    PRIMARY KEY (user_id, provider)
);
