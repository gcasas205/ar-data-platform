# MEMORY.md — ar-data-platform

Memoria entre sesiones. Máximo ~50 líneas: resumí o borrá lo que ya no aporte. Nada de claves ni datos personales.

## Dónde estoy
- Fase 1 · Fundamentos, semana 1 (desde el 23/11/2026).
- Hito activo: `hitos/001-fuente-operacional.md`.
- Próximo paso: T2, elegir el dataset (ADR-000).

## Estado actual
- Postgres 16 en Docker con `wal_level=logical`, listo para Debezium. Falta probar `make up` en la Mac.
- README y ADR-000 en borrador.

## Decisiones (y por qué)
- Postgres como fuente en vez de MySQL: Debezium sobre el WAL es el caso más documentado y el contraste con DMS/binlog de SwissJust sirve para entrevistas.
- BCRA descartado como fuente CDC: es append-only, no tiene updates ni deletes (ver ADR-000).

## Aprendizajes y errores a evitar
- (vacío por ahora)

## Pendientes fuera del hito
- (vacío por ahora)
