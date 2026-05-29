# T4.5 – Comparison of Initial and Final DMP

**Project:** Water Quality Analysis Using National Lake Monitoring Data  
**Group:** 11  
**Date:** 2026-05-29

---

## 1. Overview

This document compares the initial Data Management Plan (DMP) submitted at the start of the project with the final DMP produced at the conclusion of WP4. Each group member submitted an individual initial DMP before any practical work had begun. After careful consideration, the group agreed to use Joel Varghese Johnson's initial DMP and dataset as the basis for the project. The final DMP reflects the actual data management practices implemented across WP2 and WP3 by all four group members.

**Initial DMP DOIs:**
- Joel Varghese Johnson: `10.70124/79xy8-7g132` ← selected as the basis for the project
- Anusree Rajeevan: `10.70124/fk38n-ar646`
- Ashwin Varughese Mathew: `10.70124/5yx14-hcy71`
- Felix Antony Kodiyan Paul: `10.70124/5pjn4-a6s28`

**Final DMP:** Produced collaboratively by all 4 group members in DAMAP using the FWF template (WP4, T4.1–T4.4)

---

## 2. Changes and Differences

### 2.1 Data Description

**Initial DMP:**  
The initial DMP described the dataset at a high level — a CSV file of Lithuanian lake water quality measurements obtained from the European Open Data Portal. Dataset structure, volume, and provenance were described only approximately, as the data had not yet been fully explored.

**Final DMP:**  
The final DMP provides precise dataset details: 1,935 records, 116 variables, structured into a 3NF relational schema in DBRepo with 4 tables (lake, sampling_station, sampling_event, water_quality_measurement). The dataset is no longer accessed via a local CSV file but exclusively via the DBRepo REST API, following FAIR principles. Three datasets are documented: the input data (R1), the trained model (P1), and the generated outputs (P2).

### 2.2 Data Storage and Backup

**Initial DMP:**  
The initial DMP planned to store data locally and on GitHub, with no specific mention of institutional repositories or persistent identifiers.

**Final DMP:**  
The final DMP documents the actual storage infrastructure used: GitHub for version-controlled code (with semantic versioning v1.0, v2.0, v3.0), Zenodo for archival (DOI: `10.5281/zenodo.20444106`), DBRepo for structured relational data, and TU Wien Research Data Repository (TUWRD) for long-term preservation of model and output deposits. All datasets have persistent DOIs assigned.

### 2.3 Metadata and Documentation

**Initial DMP:**  
The initial DMP mentioned basic metadata such as README files and variable descriptions, without specifying any formal metadata standards.

**Final DMP:**  
The final DMP documents a comprehensive set of metadata standards actually implemented: RO-Crate (`ro-crate-metadata.json`), CodeMeta (`codemeta.json`), FAIR4ML (`fair4ml.json`), Croissant (`croissant.json`), Model Card (`docs/model-card.md`), and CITATION.cff. All TUWRD deposits include full DataCite metadata with ORCIDs, licences, and cross-referenced DOIs.

### 2.4 Data Access and Licensing

**Initial DMP:**  
The initial DMP proposed open access for all data but did not specify concrete licences for different types of artefacts.

**Final DMP:**  
The final DMP documents three distinct licences actually applied: CC BY 4.0 for input data (inherited from the original publisher), MIT for code and software, and CC BY 4.0 for generated outputs. These are documented in the LICENSE file, README, and all deposit records.

### 2.5 Repositories and Preservation

**Initial DMP:**  
The initial DMP mentioned the TU Wien Research Data Repository as a possible storage location but did not specify retention periods or persistent identifiers.

**Final DMP:**  
The final DMP documents TU Wien Research Data Repository as the primary long-term preservation repository for both P1 (model, DOI: `10.70124/0c7z5-7vm19`) and P2 (generated outputs, DOI: `10.70124/htsbq-tkj76`). A minimum retention period of 10 years is specified, in line with TUWRD's institutional policy for research data deposits.

### 2.6 Contributors and Responsibilities

**Initial DMP:**  
The initial DMP was an individual submission by Joel Varghese Johnson as sole principal investigator, with no mention of collaborators.

**Final DMP:**  
The final DMP documents all 4 group members as equal contributors with ORCIDs, institutional affiliations, email addresses, and roles (all listed as Researcher). Felix Antony Kodiyan Paul is listed as the designated contact person for data management as the DAMAP account holder, but all data management responsibilities were shared equally across the group throughout WP2, WP3, and WP4.

### 2.7 Ethical and Legal Aspects

**Initial DMP:**  
The initial DMP noted no ethical issues and confirmed the data was publicly available under open access, with no GDPR concerns.

**Final DMP:**  
The final DMP confirms the same — no personal data, no sensitive data, no ethical issues, and no legal restrictions. Intellectual property rights are explicitly documented: all 4 group members hold equal rights, and data is publicly available under open licences (MIT and CC BY 4.0).

---

## 3. Summary of Key Improvements

| Aspect | Initial DMP | Final DMP |
|---|---|---|
| Dataset description | High-level, approximate | Precise — 1,935 records, 116 variables, 3NF schema |
| Data access method | Local CSV file | DBRepo REST API exclusively |
| Storage | Local + GitHub | GitHub + DBRepo + Zenodo + TUWRD |
| Persistent identifiers | None | DOIs for all datasets and software |
| Metadata standards | README only | RO-Crate, CodeMeta, FAIR4ML, Croissant, Model Card, CITATION.cff |
| Licences | Unspecified open access | MIT (code), CC BY 4.0 (data and outputs) |
| Long-term preservation | Not specified | TUWRD, 10-year retention per institutional policy |
| Contributors | Individual (Joel only) | All 4 members with ORCIDs, equal responsibilities |

---

## 4. Conclusion

The final DMP reflects substantial improvements over the initial plan. The project evolved from a loosely defined individual data management approach into a fully FAIR-compliant collaborative open science pipeline. Key improvements include the adoption of a structured relational database (DBRepo), comprehensive machine-readable metadata in five standards, persistent identifiers for all artefacts, and long-term preservation on institutional repositories. The initial DMP served as a planning document and starting point, while the final DMP accurately captures what was collectively implemented by all four group members.
