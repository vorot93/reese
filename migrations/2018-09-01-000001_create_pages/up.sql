CREATE DOMAIN page_id AS UUID;
CREATE DOMAIN revision_id AS UUID;

CREATE TABLE pages (
    id UUID NOT NULL,
    name VARCHAR NOT NULL,
    deleted BOOLEAN NOT NULL,

    PRIMARY KEY (id)
);
CREATE UNIQUE INDEX page_name ON pages (name) WHERE deleted = 'false';

CREATE TABLE page_revisions (
    id        revision_id NOT NULL,
    page      page_id NOT NULL REFERENCES pages (id),
    committer user_id NOT NULL REFERENCES users (id),

    PRIMARY KEY (id)
);
