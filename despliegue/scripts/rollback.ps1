<#
.SYNOPSIS
    Script de rollback para el entorno de producción de TRAVELINK.
.DESCRIPTION
    Detiene la versión fallida, restaura la imagen previa si existe y reinicia el servicio de aplicación.
#>
param (
    [string]$ComposeFile = "$PSScriptRoot\..\docker\docker-compose.prod.yml"
)

$ErrorActionPreference = "Stop"
Write-Host "=== [TRAVELINK] Iniciando Procedimiento de Rollback ===" -ForegroundColor Yellow

if (-not (Test-Path $ComposeFile)) {
    Write-Error "[ERROR] No se encuentra el archivo $ComposeFile"
}

Write-Host "--> Deteniendo contenedor de aplicacion fallido..." -ForegroundColor Yellow
docker compose -f $ComposeFile stop app

$prevImage = docker images -q travelink-app:previous 2>$null
if ($prevImage) {
    Write-Host "--> Restaurando imagen previa (travelink-app:previous)..." -ForegroundColor Green
    docker tag travelink-app:previous travelink-app:prod
}
else {
    Write-Host "[AVISO] No se encontro etiqueta 'travelink-app:previous'. Reiniciando contenedor..." -ForegroundColor DarkYellow
}

Write-Host "--> Reiniciando servicios con imagen restaurada..." -ForegroundColor Yellow
docker compose -f $ComposeFile up -d app

Start-Sleep -Seconds 10
docker compose -f $ComposeFile ps app
Write-Host "=== [OK] Procedimiento de Rollback finalizado ===" -ForegroundColor Green
