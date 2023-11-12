# Introduction

## Overview
This Docker Compose configuration sets up a service stack for Ocel 2.0, which includes a Postgres database, a PostgREST API, Swagger UI for API documentation, and pgAdmin for database management (commented out by default).

## Prerequisites
- Docker and Docker Compose need to be installed on your machine.
- Environment variables must be set in your `.env` file or in your environment before running the compose file.

## Services

### `postgrest-db`
- A Postgres database running on Alpine for a minimal footprint.

### `postgrest`
- A PostgREST server to serve a REST API from the Postgres database.

### `swagger`
- Swagger UI for testing and documenting the PostgREST API.

### `pgadmin` 
- Note: currently not deployed
- A web administration interface for the Postgres database.

## Environment Variables Table

| Variable            | Description                                    | Required | Default Value           | Notes                                  |
|---------------------|------------------------------------------------|----------|-------------------------|----------------------------------------|
| `POSTGRES_USER`     | Username for the Postgres database             | Yes      | `postgres`              | Set this in your `.env` file           |
| `POSTGRES_PASSWORD` | Password for the Postgres user                 | Yes      | `postgres`              | Set this in your `.env` file           |
| `POSTGRES_DB`       | Database name to be used                       | Yes      | `ocelv2`                | Set this in your `.env` file           |
| `DB_ANON_ROLE`      | Anonymous role for PostgREST                   | Yes      | `anon`                  | Set this in your `.env` file           |
| `DB_AUTHN_ROLE`     | Authentication role for PostgREST              | Yes      | `authenticator`         | Set this in your `.env` file           |
| `DB_AUTHN_PASSWORD` | Password for the PostgREST authentication role | Yes      | `authenticator`         | Set this in your `.env` file           |
| `DB_SCHEMA`         | Database schema to be exposed by PostgREST     | Yes      | `public, api`           | Set this in your `.env` file           |
| `DB_SCHEMAS`        | Schemas to be exposed to REST clients          | No       | `public, api`           | Optional, set this in your `.env` file |
| `DB_CONFIG`         | Enables in-database configuration              | No       | `true`                  | Optional, set this in your `.env` file |
| `DB_CHANNEL`        | Notification channel for PostgREST             | No       | `pgrst`                 | Optional, set this in your `.env` file |
| `API_URL`           | API URL for Swagger UI to access               | No       | `http://localhost:3000` | Set this if you're using Swagger UI    |

## Running the Stack

To run the stack, navigate to the directory containing your `docker-compose.yml` and execute: `docker-compose up -d`

## Accessing the Services

PostgREST API: Accessible at http://localhost:3000.

Swagger UI: Accessible at http://localhost:8080.

Postgres Database: Accessible on host's port 7032.

## Stopping the Stack

To stop and remove the services, execute: `docker-compose down`

## Security Notes

Remember to replace the placeholder values with secure passwords and secrets before deployment, and handle your credentials securely, especially in a production environment.

## Generate tbls docs

Generate database documentation with [tbls](https://github.com/k1LoW/tbls): 
`tbls doc postgres://postgres:postgres@127.0.0.1:7032/ocelv2?sslmode=disable`