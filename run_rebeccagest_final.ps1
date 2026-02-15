#!/usr/bin/env powershell
# Script para rodar RebeccaGest de forma segura

param(
    [string]$db = "rebeccagest_demo",
    [int]$port = 8069
)

Write-Host "======================================" -ForegroundColor Green
Write-Host "    RebeccaGest - Setup e Execução" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green
Write-Host ""

# Verificar PostgreSQL
Write-Host "[1/4] Verificando PostgreSQL..." -ForegroundColor Yellow
$psPath = "C:\Program Files\PostgreSQL\18\bin\psql.exe"
if (!(Test-Path $psPath)) {
    Write-Host "❌ PostgreSQL não encontrado!" -ForegroundColor Red
    exit 1
}
Write-Host "✓ PostgreSQL encontrado" -ForegroundColor Green

# Dropá-lo e recriá-lo se existir
Write-Host "[2/4] Preparando base de dados..." -ForegroundColor Yellow
$env:PGPASSWORD = "221103"
$dropdb = "C:\Program Files\PostgreSQL\18\bin\dropdb.exe"
$createdb = "C:\Program Files\PostgreSQL\18\bin\createdb.exe"

# Remover BD antiga
& $dropdb -U postgres -h localhost $db 2>$null
Write-Host "✓ BD anterior removida (se existia)"

# Criar nova BD
$env:PGPASSWORD = "rebeccagest123"
& $createdb -U rebeccagest -h localhost $db 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ BD criada com sucesso"
} else {
    Write-Host "❌ Erro ao criar BD"
    exit 1
}

# Inicializar
Write-Host "[3/4] Inicializando módulo base..." -ForegroundColor Yellow
$pyExe = ".venv\Scripts\python.exe"
& $pyExe odoo-bin -d $db --db_user=rebeccagest --db_password=rebeccagest123 --db_host=localhost --init=base --without-demo=all --stop-after-init 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Módulo base inicializado"
} else {
    Write-Host "⚠ Erro durante inicialização (continuando...)"
}

# Iniciar servidor
Write-Host "[4/4] Iniciando servidor HTTP..." -ForegroundColor Yellow
Write-Host ""
Write-Host "📍 Aceder a: http://localhost:$port" -ForegroundColor Cyan
Write-Host "📦 Base de dados: $db" -ForegroundColor Cyan
Write-Host "👤 Utilizador: admin@example.com" -ForegroundColor Cyan
Write-Host "🔐 Senha: admin" -ForegroundColor Cyan
Write-Host ""
Write-Host "Pressione CTRL+C para parar o servidor" -ForegroundColor Gray
Write-Host ""

& $pyExe odoo-bin --http-port=$port --addons-path=addons -d $db --db_user=rebeccagest --db_password=rebeccagest123 --db_host=localhost
