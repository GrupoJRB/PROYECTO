# Inventario Maestro de Documentación y Artefactos — TRAVELINK 📚

Este documento es el catálogo maestro y punto único de referencia de todos los activos de documentación, especificaciones de ingeniería, planes de prueba, análisis de seguridad, procedimientos de despliegue y evidencias técnicas del proyecto **TRAVELINK**.

---

## 1. Documentación Raíz e Infraestructura

| Activo / Ruta | Tipo | Descripción | Estado |
|---|---|---|:---:|
| [`README.md`](../README.md) | Manual | Presentación del proyecto, stack técnico, instalación y ejecución local | Implementado / Verificado |
| [`Dockerfile`](../Dockerfile) | Infraestructura | Construcción multi-stage (Maven Temurin 21 + JRE Eclipse Temurin 21) | Implementado / Verificado |
| [`docker-compose.yml`](../docker-compose.yml) | Orquestación | Servicios locales `travelink-db` y `travelink-app` en loopback | Implementado / Verificado |
| [`.env.example`](../.env.example) | Configuración | Plantilla de variables de entorno para base de datos y credenciales | Implementado / Verificado |
| [`.trivyignore`](../.trivyignore) | Seguridad SCA | 9 excepciones justificadas de CVEs críticos (vencimiento `exp:2027-06-30`) | Implementado / Verificado |
| [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) | DevSecOps CI | Pipeline de integración continua: build, tests, SCA Trivy y DAST ZAP | Implementado / Verificado |
| [`.github/workflows/deploy.yml`](../.github/workflows/deploy.yml) | CD Pipeline | Pipeline de empaquetado y validación de contenedores de producción | Implementado / Verificado |

---

## 2. Base de Datos y Datos Sintéticos (`sql/`)

| Archivo / Ruta | Tipo | Contenido y Propósito | Estado |
|---|---|---|:---:|
| [`sql/travelink_schema.sql`](../sql/travelink_schema.sql) | DDL | Definición de las 18 tablas relacionales del sistema TRAVELINK | Producción / Verificado |
| [`sql/datos_minimos.sql`](../sql/datos_minimos.sql) | DML Inicial | Roles del sistema y cuenta administrativa inicial | Producción / Verificado |
| [`sql/seed_pruebas.sql`](../sql/seed_pruebas.sql) | DML Sintético | 4 usuarios de prueba (hashes BCrypt reales), tours 100/101 y reservas 500/501 | Implementado / Verificado |

---

## 3. Arquitectura del Sistema (`docs/arquitectura/`)

| Documento | Descripción | Estado |
|---|---|:---:|
| [`docs/arquitectura/README.md`](arquitectura/README.md) | Índice de arquitectura y componentes del sistema | Implementado |
| [`docs/arquitectura/ARQUITECTURA.md`](arquitectura/ARQUITECTURA.md) | Especificación arquitectural MVC, capas, dualidad JPA/JDBC, catálogo `pom.xml` | Implementado |

---

## 4. Ingeniería de Software (`docs/ingenieria/`)

| Módulo | Documento | Descripción | Estado |
|---|---|---|:---:|
| **General** | [`docs/ingenieria/README.md`](ingenieria/README.md) | Índice consolidado de artefactos de ingeniería de software | Implementado |
| **Procesos** | [`docs/ingenieria/procesos/PROCESOS_NEGOCIO.md`](ingenieria/procesos/PROCESOS_NEGOCIO.md) | Flujos funcionales de reservas, comisiones (15%), aprobación de agencias y tours | Implementado |
| **Procesos** | [`docs/ingenieria/procesos/DIAGRAMAS_PROCESOS.md`](ingenieria/procesos/DIAGRAMAS_PROCESOS.md) | Diagramas de flujo y secuencia Mermaid de los procesos reales del código | Implementado |
| **Diseño** | [`docs/ingenieria/diseno/DISENO_SISTEMA.md`](ingenieria/diseno/DISENO_SISTEMA.md) | Patrones arquitecturales y capas del sistema | Implementado |
| **Diseño** | [`docs/ingenieria/diseno/PATRONES.md`](ingenieria/diseno/PATRONES.md) | Implementación de DTO, DAO vs Repository, MVC y principios SOLID con clases reales | Implementado |
| **Diseño** | [`docs/ingenieria/diseno/DIAGRAMA_CLASES.md`](ingenieria/diseno/DIAGRAMA_CLASES.md) | Diagramas de clases orientados a objetos (entidades, DTOs, servicios, repos, controladores) | Implementado |
| **Base de Datos** | [`docs/ingenieria/base-datos/MODELO_DATOS.md`](ingenieria/base-datos/MODELO_DATOS.md) | Esquema relacional de tablas, llaves foráneas y reglas de integridad | Implementado |
| **Base de Datos** | [`docs/ingenieria/base-datos/MODELO_LOGICO_FISICO.md`](ingenieria/base-datos/MODELO_LOGICO_FISICO.md) | Diagrama Entidad-Relación (erDiagram Mermaid), modelo lógico y modelo físico con índices | Implementado |
| **Base de Datos** | [`docs/ingenieria/base-datos/DICCIONARIO_DATOS.md`](ingenieria/base-datos/DICCIONARIO_DATOS.md) | Diccionario de datos exhaustivo de las 18 tablas con tipos, nulos, PK/FK y descripciones | Implementado |
| **UX / UI** | [`docs/ingenieria/ux-ui/GUIA_ESTILOS_UX.md`](ingenieria/ux-ui/GUIA_ESTILOS_UX.md) | Arquitectura frontend desacoplada (HTML5/CSS3/Vanilla JS), pantallas y accesibilidad | Implementado |
| **UX / UI** | [`docs/ingenieria/ux-ui/PROTOTIPOS.md`](ingenieria/ux-ui/PROTOTIPOS.md) | Inventario de las 34 páginas HTML por rol, componentes clave, endpoints y capturas | Implementado |
| **Reportes** | [`docs/ingenieria/reportes/ESPECIFICACION_REPORTES.md`](ingenieria/reportes/ESPECIFICACION_REPORTES.md) | Generación PDF (OpenPDF) y carga masiva/exportación Excel (Apache POI) | Implementado |
| **Reportes** | [`docs/ingenieria/reportes/MODELO_REPORTES.md`](ingenieria/reportes/MODELO_REPORTES.md) | Columnas por reporte, streaming SXSSFWorkbook, nomenclatura y flujos de ficheros | Implementado |
| **Código Fuente** | [`docs/ingenieria/codigo-fuente/ESTRUCTURA_CODIGO.md`](ingenieria/codigo-fuente/ESTRUCTURA_CODIGO.md) | Mapeo de paquetes `com.travelink.*`, controladores, entidades, servicios y DAOs | Implementado |
| **Código Fuente** | [`docs/ingenieria/codigo-fuente/RECURSOS_CODIGO.md`](ingenieria/codigo-fuente/RECURSOS_CODIGO.md) | Árbol de paquetes, justificación dependencias pom.xml, perfiles properties y logback | Implementado |

---

## 5. Auditoría y Seguridad del Software (`docs/seguridad/`)

| Módulo | Documento | Descripción | Estado |
|---|---|---|:---:|
| **Índice** | [`docs/seguridad/README.md`](seguridad/README.md) | Índice general del módulo de seguridad | Implementado |
| **Plan Maestro** | [`docs/seguridad/01-plan/PLAN_PRUEBAS_SEGURIDAD.md`](seguridad/01-plan/PLAN_PRUEBAS_SEGURIDAD.md) | Estrategia, alcance, 8 criterios de rúbrica, cronograma S1-S6 y matriz RACI | Implementado |
| **SAST** | [`docs/seguridad/02-analisis/ANALISIS_ESTATICO.md`](seguridad/02-analisis/ANALISIS_ESTATICO.md) | Inspección estática de código fuente y configuraciones de Spring Security | Implementado |
| **Seguridad Java** | [`docs/seguridad/02-analisis/CONSIDERACIONES_SEGURIDAD_JAVA.md`](seguridad/02-analisis/CONSIDERACIONES_SEGURIDAD_JAVA.md) | Resumen de SecurityConfig (BCrypt, CSRF, CORS, RBAC, sesiones) vinculado a H-01..H-09 y CVEs | Implementado |
| **Superficie** | [`docs/seguridad/02-analisis/mapa-endpoints.md`](seguridad/02-analisis/mapa-endpoints.md) | Inventario de 56 endpoints, métodos HTTP, handlers y roles requeridos | Implementado |
| **SCA** | [`docs/seguridad/02-analisis/tabla-dependencias-cve.md`](seguridad/02-analisis/tabla-dependencias-cve.md) | Catálogo de 179 CVEs y estado de remediación tras Spring Boot 3.3.13 | Implementado |
| **ZAP Triaje** | [`docs/seguridad/02-analisis/VALIDACION_FALSOS_POSITIVOS.md`](seguridad/02-analisis/VALIDACION_FALSOS_POSITIVOS.md) | Triaje de las 16 alertas ZAP (TP/FP/Info) con 3 validaciones HTTP manuales | Implementado |
| **Fuzzing** | [`docs/seguridad/02-analisis/INFORME_FUZZING_RESILIENCIA.md`](seguridad/02-analisis/INFORME_FUZZING_RESILIENCIA.md) | Análisis de resiliencia FFUF: 5 respuestas HTTP 500 y ruta con status 0 | Implementado |
| **Hallazgos** | [`docs/seguridad/03-hallazgos/`](seguridad/03-hallazgos/) | Fichas técnicas individuales H-01 a H-09 con severidades CVSS | Implementado |
| **PoCs** | [`docs/seguridad/04-poc/`](seguridad/04-poc/) | 9 guías de explotación técnica reproducibles con evidencias reales | Implementado |
| **Informe Final** | [`docs/seguridad/05-informe/INFORME_FINAL.md`](seguridad/05-informe/INFORME_FINAL.md) | Reporte ejecutivo consolidado, carga JMeter y plan de remediación | Implementado |
| **Rúbrica** | [`docs/seguridad/05-informe/CHECKLIST_RUBRICA.md`](seguridad/05-informe/CHECKLIST_RUBRICA.md) | Matriz oficial contra los 8 criterios de evaluación académica (105/100 pts) | Implementado |
| **Cuentas** | [`docs/seguridad/05-informe/CUENTAS_PRUEBA.md`](seguridad/05-informe/CUENTAS_PRUEBA.md) | Credenciales sintéticas y roles del seed local de pruebas | Implementado |
| **Sustentación** | [`docs/seguridad/05-informe/PRESENTACION_BREVE.md`](seguridad/05-informe/PRESENTACION_BREVE.md) | Guion de defensa técnica de 10 diapositivas para exposición | Implementado |

---

## 6. Aseguramiento de Calidad y Pruebas (`docs/pruebas-software/` y `pruebas/`)

| Activo / Ruta | Tipo | Descripción | Estado |
|---|---|---|:---:|
| [`docs/pruebas-software/README.md`](pruebas-software/README.md) | Índice | Índice del módulo de pruebas de software | Implementado |
| [`docs/pruebas-software/ESTRATEGIA_PRUEBAS.md`](pruebas-software/ESTRATEGIA_PRUEBAS.md) | Estrategia | Pirámide de pruebas, 20 unitarias (JUnit 5/Mockito), Testcontainers y JaCoCo | Implementado |
| [`pruebas/README.md`](../pruebas/README.md) | Manual | Manual operativo de pruebas, acceso `app` vs `localhost` y orden de ejecución | Implementado |
| [`pruebas/entorno/reset-db.ps1`](../pruebas/entorno/reset-db.ps1) / [`.sh`](../pruebas/entorno/reset-db.sh) | Entorno | Reinicio controlado de contenedores y volúmenes Docker | Implementado |
| [`pruebas/entorno/seed.ps1`](../pruebas/entorno/seed.ps1) / [`.sh`](../pruebas/entorno/seed.sh) | Entorno | Carga de datos sintéticos de prueba | Implementado |
| [`pruebas/seguridad/scripts/`](../pruebas/seguridad/scripts/) | Scripts | Scripts de escaneo (SCA, Nmap, Nikto, ZAP, FFUF, SQLMap) | Implementado |
| [`pruebas/rendimiento/scripts/`](../pruebas/rendimiento/scripts/) | Scripts | Automatización de pruebas de carga con Apache JMeter (100, 300, 500 hilos) | Implementado |
| [`pruebas/evidencias/`](../pruebas/evidencias/) | Evidencias | Reportes generados (Dependency-Check, FFUF, JMeter, Nmap, Nikto, SQLMap, ZAP) | Implementado |
| [`pruebas/evidencias/integracion-testcontainers.txt`](../pruebas/evidencias/integracion-testcontainers.txt) | Evidencia | Salida de ejecución JUnit 5 de `ReservaPersistenciaIntegracionTest` con Docker | Implementado |

---

## 7. Control de Versiones (`docs/control-versiones/`)

| Documento | Descripción | Estado |
|---|---|:---:|
| [`docs/control-versiones/README.md`](control-versiones/README.md) | Índice de políticas de control de versiones | Implementado |
| [`docs/control-versiones/FLUJO_GIT.md`](control-versiones/FLUJO_GIT.md) | Estrategia de ramas (GitFlow/Trunk), commits semánticos y reglas de protección | Implementado |

---

## 8. Despliegue y Operaciones (`docs/despliegue/` y `despliegue/`)

| Activo / Ruta | Tipo | Descripción | Estado |
|---|---|---|:---:|
| [`docs/despliegue/README.md`](despliegue/README.md) | Índice | Índice de guías operativas de despliegue | Implementado |
| [`docs/despliegue/PLAN_DESPLIEGUE.md`](despliegue/PLAN_DESPLIEGUE.md) | Plan Maestro | Plan según Sesión 15: fundamentos, JAR/WAR, Nginx TLS, Docker prod, JVM tuning, rollback | Implementado |
| [`docs/despliegue/GUIA_DESPLIEGUE.md`](despliegue/GUIA_DESPLIEGUE.md) | Guía Operativa | Procedimiento de despliegue continuo, docker-compose prod, systemd y rollback | Implementado |
| [`despliegue/README.md`](../despliegue/README.md) | Infraestructura | Especificación de la carpeta ejecutable de despliegue | Implementado |
| [`despliegue/docker/docker-compose.prod.yml`](../despliegue/docker/docker-compose.prod.yml) | Orquestación | Configuración multicontenedor de producción con Nginx perimetral | Implementado |
| [`despliegue/servidor/nginx/travelink.conf`](../despliegue/servidor/nginx/travelink.conf) | Servidor Web | Proxy inverso HTTPS con terminación TLS, HSTS, CSP y hardening OWASP | Implementado |
| [`despliegue/servidor/travelink.service`](../despliegue/servidor/travelink.service) | Servicio OS | Archivo de unidad systemd para ejecución standalone del JAR en Linux con sandboxing | Implementado |
| [`despliegue/servidor/setup-servidor.sh`](../despliegue/servidor/setup-servidor.sh) | Scripts | Aprovisionamiento automatizado de servidor Linux (Java 21, UFW, Nginx) | Implementado |
| [`despliegue/scripts/deploy.sh`](../despliegue/scripts/deploy.sh) / [`.ps1`](../despliegue/scripts/deploy.ps1) | Scripts | Automatización de despliegue, healthcheck y smoke test HTTP | Implementado |
| [`despliegue/scripts/rollback.sh`](../despliegue/scripts/rollback.sh) / [`.ps1`](../despliegue/scripts/rollback.ps1) | Scripts | Procedimiento automatizado de reversión a versión anterior estable o tag | Implementado |
| [`despliegue/maven/build.sh`](../despliegue/maven/build.sh) / [`.ps1`](../despliegue/maven/build.ps1) | Scripts | Empaquetado de producción y verificación de checksum SHA-256 | Implementado |
| [`despliegue/maven/settings.xml.example`](../despliegue/maven/settings.xml.example) | Configuración | Plantilla corporativa de repositorios Maven y credenciales desacopladas | Implementado |
| [`despliegue/evidencias/antes/despliegue-local-3.3.13.txt`](../despliegue/evidencias/antes/despliegue-local-3.3.13.txt) | Evidencia | Evidencia histórica de despliegue local inicial con Spring Boot 3.3.13 | Implementado |
| [`despliegue/evidencias/cabeceras-despues-tls.txt`](../despliegue/evidencias/cabeceras-despues-tls.txt) | Evidencia | Cabeceras HTTP reales emitidas por Nginx con TLS, HSTS y CSP | Implementado |
| [`despliegue/evidencias/comparativa-cabeceras-antes-despues.txt`](../despliegue/evidencias/comparativa-cabeceras-antes-despues.txt) | Evidencia | Matriz comparativa de seguridad perimetral antes vs después del despliegue | Implementado |
| [`despliegue/evidencias/prueba-rollback.txt`](../despliegue/evidencias/prueba-rollback.txt) | Evidencia | Ejecución real y verificación de convergencia del script de rollback | Implementado |

---

## 9. Exposición y Sustentación (`docs/exposicion/`)

| Documento | Descripción | Estado |
|---|---|:---:|
| [`docs/exposicion/README.md`](exposicion/README.md) | Índice de materiales de presentación académica | Implementado |
| [`docs/exposicion/GUIA_EXPOSICION.md`](exposicion/GUIA_EXPOSICION.md) | Guía metodológica de defensa, tiempos por sección, demostración en vivo y preguntas | Implementado |
