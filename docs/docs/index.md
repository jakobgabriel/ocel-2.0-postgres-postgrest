# Introduction

## Overview
This Docker Compose configuration sets up a service stack for Ocel 2.0, which includes a Postgres database, a PostgREST API and Swagger UI for API documentation.

## Prerequisites
- Docker and Docker Compose need to be installed on your machine.
- Environment variables must be set in your `.env` file or in your environment before running the compose file. Make sure that you have a look into the `.env.example` file.

## Services

### `postgrest-db`
- A Postgres database running on Alpine for a minimal footprint.

### `postgrest`
- A PostgREST server to serve a REST API from the Postgres database.

### `swagger`
- Swagger UI for testing and documenting the PostgREST API.


## Environment Variables Table

| Variable            | Description                                    | Required | Default Value           | Notes                                  |
|---------------------|------------------------------------------------|----------|-------------------------|----------------------------------------|
| `POSTGRES_USER`     | Username for the Postgres database             | Yes      | `postgres`              | Set this in your `.env` file           |
| `POSTGRES_PASSWORD` | Password for the Postgres user                 | Yes      | `postgres`              | Set this in your `.env` file           |
| `POSTGRES_DB`       | Database name to be used                       | Yes      | `ocelv2`                | Set this in your `.env` file           |
| `DB_ANON_ROLE`      | Anonymous role for PostgREST                   | Yes      | `anon`                  | Set this in your `.env` file           |
| `DB_SCHEMA`         | Database schema to be exposed by PostgREST     | Yes      | `public, api`           | Set this in your `.env` file           |

## Running the Stack

To run the stack, navigate to the directory containing your `docker-compose.yml` and execute: `docker-compose up -d`

## Accessing the Services

PostgREST API: Accessible at http://localhost:3000.

Swagger UI: Accessible at http://localhost:8080.

Postgres Database: Accessible on host's port 5432.

## Stopping the Stack

To stop and remove the services, execute: `docker-compose down`

## Security Notes

Remember to replace the placeholder values with secure passwords and secrets before deployment, and handle your credentials securely, especially in a production environment.

## Generate tbls docs

Generate database documentation with [tbls](https://github.com/k1LoW/tbls): 
`tbls doc postgres://postgres:postgres@127.0.0.1:5432/ocelv2?sslmode=disable`