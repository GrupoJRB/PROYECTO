# Inventario de Documentación y Artefactos de Seguridad — TRAVELINK

Este documento registra el catálogo maestro de activos, scripts, guías de prueba de concepto (PoCs), fichas de hallazgos, reportes de escaneo, métricas de carga y archivos de configuración estructurados tras la reorganización técnica del proyecto **TRAVELINK**.

---

## 1. Infraestructura y Entorno Docker Reproducible

| Archivo / Ruta | Tipo | Descripción | Estado |
|---|---|---|:---:|
| [`Dockerfile`](../../Dockerfile) | Configuración | Build multi-stage (Maven Temurin 21 + JRE Eclipse Temurin 21) | Implementado / Verificado |
| [`docker-compose.yml`](../../docker-compose.yml) | Orquestación | Servicios `travelink-db` (MySQL 8.0) y `travelink-app` vinculados a loopback `127.0.0.1` | Implementado / Verificado |
| [`.dockerignore`](../../.dockerignore) | Configuración | Exclusión de `.env`, `.git`, `docs/`, `target/`, preservando `./mvnw` y `.mvn/` | Implementado / Verificado |
| [`.gitignore`](../../.gitignore) | Git Hardening | Bloqueo de secretos (`.env*`), volcados de BD (`*.dump`), artefactos pesados (`*.jtl`, reportes HTML masivos) | Implementado / Verificado |
| [`.trivyignore`](../../.trivyignore) | Excepciones SCA | Excepciones documentadas y justificadas de CVEs sin parche disponible en upstream | Implementado / Verificado |
| [`pruebas/entorno/reset-db.ps1`](../../pruebas/entorno/reset-db.ps1) | Script PowerShell | Limpieza y reinicio controlado de volúmenes con guard de seguridad | Implementado / Verificado |
| [`pruebas/entorno/reset-db.sh`](../../pruebas/entorno/reset-db.sh) | Script Bash | Equivalente en Bash para reinicio del entorno Docker | Implementado / Verificado |
| [`pruebas/entorno/seed.ps1`](../../pruebas/entorno/seed.ps1) | Script PowerShell | Re-ejecución del script sintético de pruebas sobre la BD local | Implementado / Verificado |
| [`pruebas/entorno/seed.sh`](../../pruebas/entorno/seed.sh) | Script Bash | Equivalente en Bash para inyección de datos de prueba | Implementado / Verificado |

---

## 2. Bases de Datos y Datos Sintéticos de Prueba

| Archivo / Ruta | Tipo | Contenido y Propósito | Estado |
|---|---|---|:---:|
| [`sql/travelink_schema.sql`](../../sql/travelink_schema.sql) | DDL | Definición de las 18 tablas relacionales del proyecto TRAVELINK | Producción / Verificado |
| [`sql/datos_minimos.sql`](../../sql/datos_minimos.sql) | DML Inicial | 3 roles del sistema y usuario admin inicial | Producción / Verificado |
| [`sql/seed_pruebas.sql`](../../sql/seed_pruebas.sql) | DML Sintético | 4 usuarios de prueba (hashes BCrypt reales), tours 100/101 y reservas 500/501 | Implementado / Verificado |
| [`docs/seguridad/05-informe/CUENTAS_PRUEBA.md`](05-informe/CUENTAS_PRUEBA.md) | Documentación | Credenciales sintéticas de prueba, roles asignados y hashes generados | Implementado / Verificado |

---

## 3. Módulo de Pruebas y Scripts de Automatización (`pruebas/`)

| Archivo / Script | Tipo | Parámetros y Funcionalidad | Evidencia Generada |
|---|---|---|---|
| [`pruebas/README.md`](../../pruebas/README.md) | Manual | Guía integral de ejecución, acceso `app` vs `localhost` y orden de pruebas | N/A |
| [`pruebas/seguridad/scripts/sca-dependency-check.ps1`](../../pruebas/seguridad/scripts/sca-dependency-check.ps1) / [`.sh`](../../pruebas/seguridad/scripts/sca-dependency-check.sh) | SCA | Análisis SCA con OWASP Dependency-Check (v10.0.4) | `pruebas/evidencias/dependency-check/` |
| [`pruebas/seguridad/scripts/recon-nmap.ps1`](../../pruebas/seguridad/scripts/recon-nmap.ps1) / [`.sh`](../../pruebas/seguridad/scripts/recon-nmap.sh) | Reconocimiento | Escaneo de servicios en puertos 8080 y 3307 | `pruebas/evidencias/nmap/nmap-recon.txt` |
| [`pruebas/seguridad/scripts/recon-nikto.ps1`](../../pruebas/seguridad/scripts/recon-nikto.ps1) / [`.sh`](../../pruebas/seguridad/scripts/recon-nikto.sh) | Reconocimiento | Fingerprinting web HTTP con Nikto | `pruebas/evidencias/nikto/nikto-output.txt` |
| [`pruebas/seguridad/scripts/zap-scan.ps1`](../../pruebas/seguridad/scripts/zap-scan.ps1) / [`.sh`](../../pruebas/seguridad/scripts/zap-scan.sh) | DAST | Escaneo dinámico automatizado OWASP ZAP Baseline en Docker | `pruebas/evidencias/zap/` |
| [`pruebas/seguridad/scripts/fuzz-ffuf.ps1`](../../pruebas/seguridad/scripts/fuzz-ffuf.ps1) / [`.sh`](../../pruebas/seguridad/scripts/fuzz-ffuf.sh) | Fuzzing | Fuzzing de 56 endpoints sobre diccionario | `pruebas/evidencias/ffuf/ffuf-result.json` |
| [`pruebas/seguridad/scripts/sqlmap-test.ps1`](../../pruebas/seguridad/scripts/sqlmap-test.ps1) / [`.sh`](../../pruebas/seguridad/scripts/sqlmap-test.sh) | SQLi Audit | Inyección SQL controlada (`--level=1 --risk=1 --batch`) | `pruebas/evidencias/sqlmap/sqlmap-results.txt` |
| [`pruebas/rendimiento/scripts/jmeter-load.ps1`](../../pruebas/rendimiento/scripts/jmeter-load.ps1) / [`.sh`](../../pruebas/rendimiento/scripts/jmeter-load.sh) | Rendimiento | Pruebas de carga concurrente (100, 300, 500 hilos) | `pruebas/evidencias/jmeter/` |
| [`pruebas/seguridad/wordlists/api-endpoints.txt`](../../pruebas/seguridad/wordlists/api-endpoints.txt) | Wordlist | Diccionario de 56 rutas y recursos REST evaluados | N/A |
| [`pruebas/seguridad/config/zap.yaml`](../../pruebas/seguridad/config/zap.yaml) | Configuración | Reglas de escaneo ZAP Baseline | N/A |
| [`pruebas/seguridad/payloads/calificar.json`](../../pruebas/seguridad/payloads/calificar.json) | Payload | Carga JSON para validación de CSRF/XSS en PoC-03 | N/A |
| [`pruebas/rendimiento/travelink.jmx`](../../pruebas/rendimiento/travelink.jmx) | Plan JMeter | Plan de pruebas no-GUI multiescenario para Apache JMeter | N/A |
| [`pruebas/evidencias/testcontainers-reserva-test.txt`](../../pruebas/evidencias/testcontainers-reserva-test.txt) | Pruebas Integración | Salida de ejecución JUnit 5 de `ReservaPersistenciaIntegracionTest` (Testcontainers) | `pruebas/evidencias/testcontainers-reserva-test.txt` |

---

## 4. Guías de Pruebas de Concepto (PoCs Validadas)

| Guía PoC | Vulnerabilidad Técnica Evaluada | Recurso / Vector | Estado |
|---|---|---|:---:|
| [`04-poc/PoC-01-IDOR.md`](04-poc/PoC-01-IDOR.md) | Insecure Direct Object References | `/api/obtener_reservas?idUsuario=100` (Reserva #500) | Validada |
| [`04-poc/PoC-02-XSS.md`](04-poc/PoC-02-XSS.md) | Stored Cross-Site Scripting | Inyección en comentario de tour #100 y renderizado | Validada |
| [`04-poc/PoC-03-CSRF.md`](04-poc/PoC-03-CSRF.md) | Exención Masiva de CSRF | Mutación de estado en `/api/calificar` sin token | Validada |
| [`04-poc/PoC-04-CORS.md`](04-poc/PoC-04-CORS.md) | CORS Permisivo con Credenciales | Petición preflight `OPTIONS` con origen arbitrario | Validada |
| [`04-poc/PoC-05-Admin-Plaintext.md`](04-poc/PoC-05-Admin-Plaintext.md) | Credencial de Admin en Texto Plano | Login administrativo con clave predeterminada del seed | Validada |
| [`04-poc/PoC-06-Headers.md`](04-poc/PoC-06-Headers.md) | Ausencia de Cabeceras Defensivas HTTP | Verificación de `X-Frame-Options`, CSP y Cache-Control | Validada |
| [`04-poc/PoC-07-Password-Bypass.md`](04-poc/PoC-07-Password-Bypass.md) | Puerta Trasera (Backdoor) en Autenticación | Bypass con credenciales estáticas en controlador | Validada |
| [`04-poc/PoC-08-BOLA-Cancelacion.md`](04-poc/PoC-08-BOLA-Cancelacion.md) | Broken Object Level Authorization (BOLA) | Cancelación no autorizada de reserva ajena #500 | Validada |
| [`04-poc/PoC-09-Escalamiento-Rutas-Duales.md`](04-poc/PoC-09-Escalamiento-Rutas-Duales.md) | Escalamiento de Privilegios por Rutas Duales | Invocación de `/api/usuarios` sin rol de administrador | Validada |

---

## 5. Fichas Técnicas de Hallazgos Individuales

| ID | Título del Hallazgo | Severidad | Archivo de Especificación |
|---|---|:---:|---|
| **H-01** | Fuga Masiva de Datos e IDOR en Consulta de Reservas | **CRÍTICO** | [`03-hallazgos/H-01-IDOR.md`](03-hallazgos/H-01-IDOR.md) |
| **H-02** | Cross-Site Scripting Almacenado (Stored XSS) en Reseñas | **ALTO** | [`03-hallazgos/H-02-XSS.md`](03-hallazgos/H-02-XSS.md) |
| **H-03** | Desactivación Masiva de Protección CSRF en Endpoints Transaccionales | **MEDIO** | [`03-hallazgos/H-03-CSRF.md`](03-hallazgos/H-03-CSRF.md) |
| **H-04** | Configuración CORS Excesivamente Permisiva con Credenciales | **ALTO** | [`03-hallazgos/H-04-CORS.md`](03-hallazgos/H-04-CORS.md) |
| **H-05** | Credencial de Administrador en Texto Plano en Seed Inicial | **ALTO** | [`03-hallazgos/H-05-Admin-Plaintext.md`](03-hallazgos/H-05-Admin-Plaintext.md) |
| **H-06** | Ausencia de Cabeceras Defensivas HTTP y Cache-Control Desactivado | **MEDIO** | [`03-hallazgos/H-06-Headers.md`](03-hallazgos/H-06-Headers.md) |
| **H-07** | Puerta Trasera (Backdoor) en Verificación de Contraseñas | **CRÍTICO** | [`03-hallazgos/H-07-Password-Bypass.md`](03-hallazgos/H-07-Password-Bypass.md) |
| **H-08** | Broken Object Level Authorization (BOLA) en Cancelación de Reserva | **CRÍTICO** | [`03-hallazgos/H-08-BOLA-Cancelacion.md`](03-hallazgos/H-08-BOLA-Cancelacion.md) |
| **H-09** | Escalamiento de Privilegios por Rutas Duales sin Prefijo `/api/admin/` | **CRÍTICO** | [`03-hallazgos/H-09-Escalamiento-Rutas-Duales.md`](03-hallazgos/H-09-Escalamiento-Rutas-Duales.md) |

---

## 6. Documentos Maestros de Análisis, Rendimiento e Informes

| Documento | Descripción | Estado |
|---|---|:---:|
| [`01-plan/PLAN_PRUEBAS_SEGURIDAD.md`](01-plan/PLAN_PRUEBAS_SEGURIDAD.md) | Plan maestro: objetivos, alcance, herramientas, mapeo a 8 criterios, cronograma S1-S6 y RACI | Completado |
| [`02-analisis/ANALISIS_ESTATICO.md`](02-analisis/ANALISIS_ESTATICO.md) | Informe SAST detallado de código fuente Java y configuraciones Spring | Completado |
| [`02-analisis/mapa-endpoints.md`](02-analisis/mapa-endpoints.md) | Mapeo integral de 56 endpoints, métodos HTTP, handlers y niveles RBAC | Completado |
| [`02-analisis/tabla-dependencias-cve.md`](02-analisis/tabla-dependencias-cve.md) | Tabla exhaustiva de dependencias vulnerables y CVEs analizados | Completado |
| [`02-analisis/VALIDACION_FALSOS_POSITIVOS.md`](02-analisis/VALIDACION_FALSOS_POSITIVOS.md) | Triaje de las 16 alertas ZAP (TP/FP/Info) con 3 confirmaciones HTTP manuales | Completado |
| [`02-analisis/INFORME_FUZZING_RESILIENCIA.md`](02-analisis/INFORME_FUZZING_RESILIENCIA.md) | Análisis de resiliencia FFUF: reproducción y causas de 5 errores 500 y status 0 | Completado |
| [`05-informe/INFORME_FINAL.md`](05-informe/INFORME_FINAL.md) | Informe ejecutivo y técnico consolidado con resultados de carga y remediación | Completado |
| [`05-informe/CHECKLIST_RUBRICA.md`](05-informe/CHECKLIST_RUBRICA.md) | Matriz de cumplimiento contra los 8 criterios de la rúbrica oficial (105/100 pts) | Completado |
| [`05-informe/PRESENTACION_BREVE.md`](05-informe/PRESENTACION_BREVE.md) | Guion de sustentación técnica de 10 diapositivas para evaluador | Completado |
