# Hito 001 — Fuente operacional (semanas 1-2)

Estado: en curso

## Objetivo
Una base Postgres con un dataset público real que cambia todos los días, para que el CDC del hito 002 tenga altas, bajas y modificaciones de verdad.

## Hecho cuando
- RF-1: EL SISTEMA levanta con `make up` en menos de 5 minutos en una Mac M1.
- RF-2: CUANDO se hace la carga inicial, EL SISTEMA guarda cada entidad una sola vez por su clave de negocio.
- RF-3: CUANDO corre el simulador, EL SISTEMA genera altas, bajas y modificaciones, cada una con su `updated_at`.
- RF-4: SI el simulador se corre dos veces con la misma semilla, ENTONCES EL SISTEMA produce exactamente los mismos cambios.

## Tareas
- [x] T1 [agente] docker-compose con Postgres 16, `wal_level=logical` y Makefile.
- [ ] T2 [yo] ADR-000: bajar un archivo de combustibles y uno de SEPA, medir cuántas filas cambian entre dos días y decidir.
- [ ] T3 [yo] Diseñar la tabla fuente: columnas, tipos y clave de negocio.
- [ ] T4 [agente] Script de descarga y carga inicial del dataset elegido.
- [ ] T5 [yo] Reglas del simulador: qué porcentaje cambia por día, qué se borra y qué entra nuevo.
- [ ] T6 [agente] Implementar el simulador según las reglas de T5, con semilla.
- [ ] T7 [yo] Demostrar RF-1 a RF-4 y anotar qué aprendiste.

## Qué aprendí / qué se rompió
- (completar al cerrar el hito)
