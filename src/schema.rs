table! {
    group_permissions (group_id, permission) {
        group_id -> Uuid,
        permission -> Permission,
    }
}

table! {
    groups (id) {
        id -> Uuid,
        name -> Varchar,
    }
}

table! {
    page_revisions (id) {
        id -> Uuid,
        deleted -> Bool,
        page -> Uuid,
        committer -> Uuid,
        updated_at -> Timestamp,
    }
}

table! {
    pages (id) {
        id -> Uuid,
        deleted -> Bool,
        name -> Varchar,
    }
}

table! {
    user_groups (user_id, group_id) {
        user_id -> Uuid,
        group_id -> Uuid,
    }
}

table! {
    user_logins (user_id, provider) {
        user_id -> Uuid,
        provider -> Login_provider,
        data -> Varchar,
    }
}

table! {
    users (id) {
        id -> Uuid,
        name -> Varchar,
    }
}

joinable!(group_permissions -> groups (group_id));
joinable!(page_revisions -> pages (page));
joinable!(page_revisions -> users (committer));
joinable!(user_groups -> groups (group_id));
joinable!(user_groups -> users (user_id));
joinable!(user_logins -> users (user_id));

allow_tables_to_appear_in_same_query!(
    group_permissions,
    groups,
    page_revisions,
    pages,
    user_groups,
    user_logins,
    users,
);
