CREATE DOMAIN page_id AS UUID;
CREATE DOMAIN revision_id AS UUID;

CREATE TABLE pages (
    id UUID NOT NULL,
    name VARCHAR NOT NULL,
    deleted BOOLEAN NOT NULL,

    CONSTRAINT page_name UNIQUE (name),
    PRIMARY KEY (id)
);

CREATE TABLE page_revisions (
    id        revision_id NOT NULL,
    page      page_id NOT NULL REFERENCES pages (id),
    wiki_user user_id NOT NULL,


    PRIMARY KEY (id)
);
