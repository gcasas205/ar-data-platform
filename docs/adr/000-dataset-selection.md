# ADR-000: Choosing the public dataset for the source database

- Status: proposed
- Date: 2026-11-23

## Context

The platform replicates an operational database into a lakehouse with CDC. To exercise CDC for real, the source data must change over time: inserts, **updates** and **deletes**, not only new rows appended at the end.

Requirements:

- Real, public Argentine data with an open license. No company data.
- Entities with a stable business key that change over time (a price changes, a record is closed or removed).
- Small enough to run on a laptop (M1, 16 GB RAM): a few million rows at most, or a sample.
- Updated often enough that a change simulator can be checked against real behavior.

## Options considered

1. **BCRA time series (exchange rates, reserves)**
   - Pros: clean, well-documented, has an API (useful later for phase 2).
   - Cons: append-only. A new value per day and almost no corrections, so there is nothing for a MERGE to update or delete. Fails the main requirement.
2. **Fuel prices at the pump (Secretaría de Energía, datos.gob.ar)**
   - Pros: one row per station and product, prices change often, stations open and close. Natural business key (station + product). Moderate size.
   - Cons: to check: update frequency and whether historical snapshots are available.
3. **Precios Claros / SEPA retail prices (datos.gob.ar)**
   - Pros: very realistic CDC case: ~70k products across thousands of stores, prices change daily, products appear and disappear. Daily files per weekday.
   - Cons: each daily file is several GB, so it needs a sample (one province or one chain). Schema documented in a PDF annex.

## Decision

_To be written by me after inspecting options 2 and 3: download one file of each, check row counts, keys, and how many rows change between two days._

## Consequences

_To be written._

## What would make me change my mind

_To be written._
