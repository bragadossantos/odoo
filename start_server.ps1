#!/usr/bin/env powershell
# Script para rodar RebeccaGest com suporte a PostgreSQL

param(
    [string]$db = "rebeccagest_demo",
    [int]$port = 8069,
    [switch]$init = $false
)

Write-Host "================================" -ForegroundColor Cyan
Write-Host "  RebeccaGest Server" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Verificar PostgreSQL
Write-Host "[1/4] Verificando PostgreSQL..." -ForegroundColor Yellow
$psPath = Get-Item "C:\Program Files\PostgreSQL\18\bin\psql.exe" -ErrorAction SilentlyContinue
if ($psPath) {
    $version = & $psPath.FullName --version 2>&1
    Write-Host "✓ $version"
} else {
    Write-Host "❌ PostgreSQL não encontrado!" -ForegroundColor Red
    exit 1
}

# Ativar ambiente virtual
Write-Host "[2/4] Ativando ambiente virtual..." -ForegroundColor Yellow
& .venv\Scripts\Activate.ps1

# Verificar RebeccaGest
Write-Host "[3/4] Verificando RebeccaGest..." -ForegroundColor Yellow
$pyExe = ".venv\Scripts\python.exe"
try {
    & $pyExe -c "import odoo; print('✓ RebeccaGest OK')" 2>&1 | Out-Null
} catch {
    Write-Host "❌ Erro ao verificar RebeccaGest!" -ForegroundColor Red
    exit 1
}

Write-Host "[4/4] Iniciando servidor..." -ForegroundColor Yellow
Write-Host ""
Write-Host "📍 Aceder a: http://localhost:$port" -ForegroundColor Cyan
Write-Host "📦 Base de dados: $db" -ForegroundColor Cyan
Write-Host "Pressione CTRL+C para parar" -ForegroundColor Gray
Write-Host ""

# Rodar servidor
$args = @("odoo-bin", "--http-port=$port", "--addons-path=addons", "-d", $db)
if ($init) {
    $args += "--init=base"
}

& $pyExe @args
