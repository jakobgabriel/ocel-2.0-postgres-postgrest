#!/bin/bash

psql -U ${POSTGRES_USER} <<-END
    CREATE ROLE ${DB_AUTHN_ROLE} noinherit login password '${DB_AUTHN_PASSWORD}';
    grant ${DB_ANON_ROLE} to ${DB_AUTHN_ROLE};
END
