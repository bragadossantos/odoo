@echo off
REM Script para configurar RebeccaGest no PostgreSQL
REM Executar como administrador

setlocal enabledelayedexpansion

set PSQL="C:\Program Files\PostgreSQL\18\bin\psql.exe"
set PGPASSWORD=

REM Tentar diferentes formas de autenticação
echo.
echo Tentando criar utilizador rebeccagest...
echo.

REM Método 1: Sem password (trust local)
echo Método 1: Sem password local...
%PSQL% -U postgres -c "CREATE USER rebeccagest WITH PASSWORD 'rebeccagest';" 2>nul
if !ERRORLEVEL! EQU 0 (
    echo OK - Utilizador criado
    goto alter_user
)

REM Método 2: Com senha padrão
echo Método 2: Com senha postgres...
set PGPASSWORD=postgres
%PSQL% -U postgres -h 127.0.0.1 -c "CREATE USER rebeccagest WITH PASSWORD 'rebeccagest';" 2>nul
if !ERRORLEVEL! EQU 0 (
    echo OK - Utilizador criado
    goto alter_user
)

REM Método 3: Sem host (socket local)
echo Método 3: Via socket local...
set PGPASSWORD=
%PSQL% -U postgres -c "CREATE USER rebeccagest WITH PASSWORD 'rebeccagest';" 2>nul
if !ERRORLEVEL! EQU 0 (
    echo OK - Utilizador criado
    goto alter_user
)

echo ERRO: Não foi possível criar utilizador
exit /b 1

:alter_user
echo.
echo Configurando permissões...
%PSQL% -U postgres -c "ALTER USER rebeccagest CREATEDB;" 2>nul
%PSQL% -U postgres -c "CREATE DATABASE rebeccagest_demo OWNER rebeccagest;" 2>nul
%PSQL% -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE rebeccagest_demo TO rebeccagest;" 2>nul

echo.
echo ✓ Configuração concluída
echo.
echo Listando utilizadores e bases de dados:
%PSQL% -U postgres -c "\du rebeccagest"
%PSQL% -U postgres -c "\l rebeccagest_demo"

endlocal
