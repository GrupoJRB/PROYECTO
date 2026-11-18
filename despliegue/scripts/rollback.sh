#!/usr/bin/env bash
# ==============================================================================
# Script de Rollback de Producción - TRAVELINK
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
COMPOSE_FILE="${PROJECT_ROOT}/despliegue/docker/docker-compose.prod.yml"

echo "=== [TRAVELINK] Iniciando Procedimiento de Rollback ==="

if [ ! -f "${COMPOSE_FILE}" ]; then
    echo "[ERROR] No se encuentra el archivo ${COMPOSE_FILE}" >&2
    exit 1
fi

echo "--> Deteniendo contenedor de aplicacion fallido..."
docker compose -f "${COMPOSE_FILE}" stop app

# Revertir a imagen previa etiquetada como :previous o :rollback si existe
if docker image inspect travelink-app:previous >/dev/null 2>&1; then
    echo "--> Restaurando imagen previa (travelink-app:previous)..."
    docker tag travelink-app:previous travelink-app:prod
else
    echo "[AVISO] No se encontró etiqueta 'travelink-app:previous'. Reiniciando contenedor con configuración previa estable..."
fi

echo "--> Reiniciando servicios con imagen restaurada..."
docker compose -f "${COMPOSE_FILE}" up -d app

echo "--> Verificando restauración de servicio..."
sleep 10
docker compose -f "${COMPOSE_FILE}" ps app

echo "=== [OK] Procedimiento de Rollback finalizado ==="
