-- Script para configurar RebeccaGest no PostgreSQL
-- Executar como: psql -U postgres -f setup_rebeccagest.sql

-- Criar utilizador rebeccagest
CREATE USER rebeccagest WITH PASSWORD 'rebeccagest123';
ALTER USER rebeccagest CREATEDB;
ALTER USER rebeccagest CREATEROLE;

-- Criar base de dados demo
CREATE DATABASE rebeccagest_demo OWNER rebeccagest;

-- Conceder permissões
GRANT ALL PRIVILEGES ON DATABASE rebeccagest_demo TO rebeccagest;

-- Mostrar resultado
\du rebeccagest
\l rebeccagest_demo
