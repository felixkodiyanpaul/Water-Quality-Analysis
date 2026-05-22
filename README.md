# Water-quality-analysis-fair-ml
FAIR Data Science experiment project

## Project Overview

This project implements a FAIR Data Science workflow to analyse environmental water quality indicators using an open dataset from the European Open Data Portal.

The experiment includes:
- data preprocessing  
- exploratory data analysis  
- machine learning modelling  
- publication of artefacts with FAIR-compliant metadata  

---

## Dataset description

This experiment uses the **National Lakes Monitoring Data**, published by Aplinkos apsaugos agentūra (Environmental Protection Agency of Lithuania) and distributed via the European Union Open Data Portal.

- **Source:**  
  https://data.europa.eu/data/datasets/https-data-gov-lt-datasets-2055-?locale=en  

- **Publisher:**  
  Aplinkos apsaugos agentūra  

- **Licence:**  
  Open Data Licence of Lithuania (reuse permitted)  

- **Format:**  
  CSV  

- **Records:**  
  1,935  

- **Variables:**  
  116  

- **Accessed:**  
  2026-05-06  

---

### Key attributes

- temperature (°c)  
- ph  
- dissolved oxygen (mg/l)  
- conductivity (µs/cm)  
- nitrates (mg/l)  
- phosphates (mg/l)  
- ammonium (mg/l)  
- chemical oxygen demand (cod)  
- biochemical oxygen demand (bod)  
- transparency (cm)  
- sampling date (yyyy-mm-dd)  
- sampling location id  

---

### Dataset usage

The dataset is used to:
- build predictive models  
- analyse environmental patterns  
- demonstrate FAIR data management practices  

Planned FAIR tools:
- DBRepo  
- RO-Crate  
- Croissant  
- FAIR4ML  

---


### Folder structure

- **data/** → Input datasets (raw and processed)  
- **src/** → Source code and scripts  
- **outputs/** → Generated outputs (figures, models, results)  
- **docs/** → Documentation and reports  
- **configs/** → Configuration files  

---


This structure will be expanded during WP2–WP3 as metadata, DBRepo integration, and reimplementation steps are added.

---

## File organisation

This repository follows a structured organisation and a consistent file naming convention to ensure clarity, reproducibility, and maintainability.

---

### Naming conventions

#### 1. Input datasets (data/raw/ and data/processed/)

Format:  
`<source>_<dataset-name>_<version>.<extension>`

Example:  
`gov_lt_lakewater_v1.csv`

---

#### 2. Output files (outputs/)

Figures:  
`fig_<description>_<date>.png`  

Example:  
`fig_correlation_matrix_2026-05-06.png`

Models:  
`model_<algorithm>_<dataset>_<version>.pkl`  

Example:  
`model_randomforest_lakewater_v1.pkl`

Predictions:  
`pred_<model>_<dataset>_<version>.csv`

Example:  
`pred_randomforest_lakewater_v1.csv`

---

#### 3. Scripts (src/)

Format:  
`<step-number>_<description>.py`

Examples:  
`01_preprocessing.py`  
`02_training.py`

---

#### 4. Configuration files (configs/)

Format:  
`config_<purpose>.yaml`

Example:  
`config_training.yaml`

---

### General rules

- use lowercase only  
- use underscores (_) instead of spaces  
- include version numbers  
- use iso date format: yyyy-mm-dd  

---

### Consistency statement

This naming convention is applied consistently across all files in the repository and will be maintained throughout the project.

---

## Objectives

- analyse water quality indicators  
- perform data preprocessing and cleaning  
- build predictive models  
- generate insights and visualisations  
- publish artefacts with FAIR metadata  

---

## Tools

- python (pandas, scikit-learn, matplotlib)  
- jupyter notebook / vs code  

---

## Status

Initial project setup completed (WP1).  

## Database (DBRepo)

The input data is stored in DBRepo as a relational database 
in Third Normal Form (3NF) with 4 tables:

- **lake** — 346 unique lakes with region
- **sampling_station** — 355 monitoring stations
- **sampling_event** — 1,935 sampling visits
- **water_quality_measurement** — 1,935 measurement rows

DBRepo URL: https://test.dbrepo.tuwien.ac.at/database/13457a52-37f9-48d4-a078-6865e8d35981/table

Source dataset: National Lakes Monitoring Data  
Publisher: Aplinkos apsaugos agentūra  
Source: https://data.europa.eu  
License: Open Data Licence of Lithuania  
Schema: see data/schema.sql  
ER Diagram: see docs/er_diagram.png  
Notebook: see src/T2_1_schema(1).ipynb
