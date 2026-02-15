#!/usr/bin/env powershell
# Script para rodar RebeccaGest

Write-Host "================================" -ForegroundColor Cyan
Write-Host "  RebeccaGest Server" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Ativar ambiente virtual
Write-Host "[1/3] Ativando ambiente virtual..." -ForegroundColor Yellow
& .venv\Scripts\Activate.ps1

# Verificar compatibilidade
Write-Host "[2/3] Verificando dependências..." -ForegroundColor Yellow
$pyExe = ".venv\Scripts\python.exe"
& $pyExe -c "import odoo; print('✓ RebeccaGest OK')" 2>&1

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao importar RebeccaGest!" -ForegroundColor Red
    exit 1
}

Write-Host "[3/3] Iniciando servidor..." -ForegroundColor Yellow
Write-Host ""
Write-Host "📍 Aceder a: http://localhost:8069" -ForegroundColor Cyan
Write-Host "Pressione CTRL+C para parar" -ForegroundColor Gray
Write-Host ""

# Rodar servidor
& $pyExe odoo-bin --http-port=8069 --addons-path=addons
