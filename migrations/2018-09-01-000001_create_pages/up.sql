CREATE DOMAIN page_id AS UUID;
CREATE DOMAIN revision_id AS UUID;

CREATE TABLE pages (
    id      page_id NOT NULL DEFAULT uuid_generate_v4(),
    deleted BOOLEAN NOT NULL DEFAULT 'false',
    name    VARCHAR NOT NULL,

    PRIMARY KEY (id)
);
CREATE UNIQUE INDEX page_name ON pages (name) WHERE deleted = 'false';

CREATE TABLE page_revisions (
    id         revision_id NOT NULL,
    deleted    BOOLEAN     NOT NULL DEFAULT 'false',
    page       page_id     NOT NULL REFERENCES pages (id),
    committer  user_id     NOT NULL REFERENCES users (id),
    updated_at TIMESTAMP   NOT NULL,

    PRIMARY KEY (id)
);
