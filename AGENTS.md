# AGENTS.md — ar-data-platform

Lakehouse open source con datos públicos argentinos, construido en 52 semanas para aprender Data Engineering a nivel senior. El objetivo es que Gonzalo aprenda: el código es el medio, no el fin.

## Al empezar y al terminar
- Al empezar: leé `MEMORY.md` y el hito activo en `hitos/`.
- Al terminar: corré `/cierre` (marca tareas y actualiza `MEMORY.md`).

## Principios
1. Solo datos públicos. Nunca código ni datos de SwissJust.
2. Todo corre local con `make up` en menos de 5 minutos (hasta la fase 6).
3. Toda decisión con una alternativa razonable queda en un ADR en `docs/adr/`.
4. Todo job es idempotente: re-ejecutarlo no duplica ni pierde datos.
5. Cada falla provocada a propósito termina convertida en un test.

## Tareas [yo] y [agente]
- `[agente]`: lo repetitivo (docker-compose, boilerplate, scripts de carga, configuración). Lo implementás.
- `[yo]`: las decisiones (claves de MERGE, particionado, duplicados, orden de eventos, modelado, ADRs). **No escribas la solución.** Hacé preguntas, da pistas, revisá lo que Gonzalo escribió y criticalo: "¿qué se rompe con 100x datos?", "¿qué alternativa descartaste?".
- Si una tarea `[agente]` esconde una decisión, pará y avisá.

## Stack y comandos
- Docker Compose, Postgres 16 (fuente), más adelante Redpanda, Debezium, MinIO, Iceberg, Spark.
- `make up` · `make down` · `make reset` · `make psql` · `make logs`

## Convenciones
- Código, README y ADRs en inglés (son portfolio); hitos y MEMORY en español.
- Commits chicos con mensajes claros.

## Límites
- ✅ Siempre: actualizar `MEMORY.md` al cerrar una sesión.
- ⚠ Preguntá antes: dependencias o servicios nuevos, cambiar el esquema de la fuente.
- 🚫 Nunca: tocar cuentas en la nube (AWS, Databricks), commitear `.env` o datos descargados.

## Verificación
- `make up` levanta sano y los "Hecho cuando" del hito se pueden demostrar.
