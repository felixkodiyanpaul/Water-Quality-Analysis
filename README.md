# Water Quality Analysis Using National Lake Monitoring Data

[![DOI](https://zenodo.org/badge/1229862090.svg)](https://doi.org/10.5281/zenodo.20432272)

## Abstract

This project analyses physicochemical water quality measurements from Lithuanian lakes using machine learning. A Random Forest classifier is trained to predict water quality class (Good / Moderate / Poor) based on 11 core physicochemical indicators including water temperature, pH, dissolved oxygen, electrical conductivity, biochemical oxygen demand, water transparency, chlorophyll-a, nitrate nitrogen, total nitrogen, total phosphorus, and alkalinity. The dataset is the National Lakes Monitoring Data published by Aplinkos apsaugos agentūra and obtained from the European Open Data Portal. The experiment is fully reproducible from the DBRepo REST API — no local data files are required.

---

## Table of Contents

- [Repository Structure](#repository-structure)
- [File Organisation](#file-organisation)
- [Requirements and Installation](#requirements-and-installation)
- [Reproduction Instructions](#reproduction-instructions)
- [Inputs and Outputs](#inputs-and-outputs)
- [Data Infrastructure](#data-infrastructure)
- [Licences](#licences)
- [Contributors](#contributors)
- [Citation](#citation)

---

## Repository Structure

```
Water-Quality-Analysis/
├── data/                        # Raw and cleaned input data
│   └── Lakes_Monitoring.csv     # Original dataset (source: data.europa.eu)
├── notebooks/                   # Jupyter notebooks
│   ├── T2_1_schema.ipynb        # DBRepo schema creation (Owner A)
│   ├── T2_2_semantic_mapping.ipynb  # Ontology mapping (Owner B)
│   ├── T2_3_unit_mapping.ipynb  # Unit of measurement mapping (Owner C)
│   ├── T2_4_views.ipynb         # DBRepo view definitions (Owner D)
│   ├── T2_5_load_verify.ipynb   # Data loading and verification (Owner C)
│   ├── experiment_csv_version.ipynb     # Original ML experiment (CSV)
│   └── T2_6_dbrepo_api_version.ipynb    # Reimplemented ML experiment (DBRepo API)
├── outputs/                     # Generated outputs
│   ├── water_quality_model.pkl  # Trained Random Forest model
│   ├── label_encoder.pkl        # Label encoder for target variable
│   ├── confusion_matrix_csv.png # Confusion matrix (CSV version)
│   └── confusion_matrix_api.png # Confusion matrix (API version)
├── docs/                        # Documentation and metadata
│   ├── model-card.md            # Model Card (Owner A)
│   ├── T3_11_standards_overlap_analysis.md  # Standards analysis (Owner C)
│   ├── unit_mapping_T2_3.md     # Unit mapping reference table
│   └── validation/              # RO-Crate validation output
├── ro-crate-metadata.json       # RO-Crate research object metadata
├── codemeta.json                # CodeMeta software metadata
├── CITATION.cff                 # Citation metadata (added after T3.8)
├── LICENSE                      # MIT License (software)
└── README.md                    # This file
```

---

## File Organisation

The following naming convention is applied consistently across all project files:

| Category | Convention | Example |
|----------|-----------|---------|
| **Input datasets** | `<DatasetName>_<Version>.csv` | `Lakes_Monitoring.csv` |
| **Notebooks** | `<TaskID>_<description>.ipynb` | `T2_3_unit_mapping.ipynb` |
| **Output figures** | `<figure_type>_<version>.png` | `confusion_matrix_csv.png` |
| **Model artefacts** | `<model_name>_model.pkl` | `water_quality_model.pkl` |
| **Config/metadata** | lowercase with underscores | `ro-crate-metadata.json` |
| **Documentation** | `<TaskID>_<description>.md` | `T3_11_standards_overlap_analysis.md` |

All file names use lowercase letters, underscores instead of spaces, and no special characters.

---

## Requirements and Installation

### Prerequisites

- Python 3.10 or higher
- pip package manager

### Installation

**Step 1** — Clone the repository:
```bash
git clone https://github.com/felixkodiyanpaul/Water-Quality-Analysis.git
cd Water-Quality-Analysis
```

**Step 2** — Install required Python packages:
```bash
pip install -r requirements.txt
```

Or install manually:
```bash
pip install pandas numpy scikit-learn matplotlib seaborn joblib requests dbrepo==1.13.3
```

### Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| pandas | ≥2.0.0 | Data manipulation |
| numpy | ≥1.24.0 | Numerical computing |
| scikit-learn | ≥1.3.0 | Machine learning |
| matplotlib | ≥3.7.0 | Visualisation |
| seaborn | ≥0.12.0 | Statistical plots |
| joblib | ≥1.3.0 | Model serialisation |
| requests | ≥2.31.0 | HTTP API calls |
| dbrepo | ==1.13.3 | DBRepo REST API client |

---

## Reproduction Instructions

### Option A — Run from DBRepo API (recommended)

This is the fully FAIR-compliant version. No local data files needed.

**Step 1** — Ensure you have a DBRepo account at `https://test.dbrepo.tuwien.ac.at`

**Step 2** — Open `notebooks/T2_6_dbrepo_api_version.ipynb` in Jupyter or VS Code

**Step 3** — Run Cell 0 (install libraries)

**Step 4** — Run Cell 1 (connect to DBRepo) — enter your DBRepo password when prompted

**Step 5** — Run Cells 2–10 in order

**Step 6** — The trained model will be saved to `outputs/water_quality_model.pkl`

**Step 7** — Evaluation results are printed in Cell 7 and compared with the CSV version in Cell 8

### Option B — Run from local CSV

**Step 1** — Place `Lakes_Monitoring.csv` in the `data/` folder

**Step 2** — Open `notebooks/experiment_csv_version.ipynb`

**Step 3** — Update the CSV path in Cell 3 if needed:
```python
df = pd.read_csv("data/Lakes_Monitoring.csv")
```

**Step 4** — Run all cells from top to bottom (Kernel → Restart & Run All)

**Step 5** — Outputs are saved to the `outputs/` folder

### Expected results

| Metric | Value |
|--------|-------|
| Accuracy | 0.9190 |
| Precision (weighted) | 0.9090 |
| Recall (weighted) | 0.9190 |
| F1 Score (weighted) | 0.9106 |

Both Option A and Option B produce identical results (verified in T2.6 Cell 8).

---

## Inputs and Outputs

### Input Dataset

| Property | Value |
|----------|-------|
| Name | National Lakes Monitoring Data |
| Publisher | Aplinkos apsaugos agentūra (Lithuanian Environmental Protection Agency) |
| Source | https://data.europa.eu |
| Format | CSV |
| Rows | 1,935 |
| Columns | 116 |
| Licence | Creative Commons Attribution 4.0 (CC BY 4.0) |
| DBRepo Database ID | `13457a52-37f9-48d4-a078-6865e8d35981` |
| DBRepo URL | https://test.dbrepo.tuwien.ac.at |

### DBRepo Views (for ML pipeline)

| View name | Purpose |
|-----------|---------|
| `core_water_quality_features` | Core physicochemical features used in the ML model |
| `eutrophication_risk_indicators` | Nutrients and chlorophyll for eutrophication risk classification |
| `heavy_metal_pollution_features` | Heavy metal concentrations for pollution analysis |
| `nutrient_pollution_features` | Nitrogen and phosphorus indicators for classification |

### DBRepo API

| Property | Value |
|----------|-------|
| Base URL | `https://test.dbrepo.tuwien.ac.at` |
| Authentication | HTTP Basic Auth (username + password) |
| Main endpoint | `/api/v1/database/{database_id}/table/{table_id}/data` |
| View endpoint | `/api/v1/database/{database_id}/view/{view_id}/data` |

### Outputs

| File | Description |
|------|-------------|
| `outputs/water_quality_model.pkl` | Trained Random Forest classifier |
| `outputs/label_encoder.pkl` | Sklearn LabelEncoder for target classes |
| `outputs/confusion_matrix_csv.png` | Confusion matrix from CSV version |
| `outputs/confusion_matrix_api.png` | Confusion matrix from DBRepo API version |

---

## Data Infrastructure

The input data is stored in a normalised relational database in DBRepo following a 3NF schema with 4 tables:

1. **lake** — unique lakes with administrative region
2. **sampling_station** — monitoring stations with coordinates and lake FK
3. **sampling_event** — one row per station per sampling date
4. **water_quality_measurement** — all 105 physicochemical measurements per event

All numeric attributes are mapped to ontological unit concepts (T2.3):
- **SI Digital Framework** for temperature (°C) and length (m)
- **QUDT** for concentration (mg/L, µg/L), conductivity (µS/cm), and pH

All attributes are mapped to semantic concepts using domain ontologies (T2.2).

---

## Licences

This project involves three categories of artefacts, each with a separate licence:

### Input Data
**Licence:** Creative Commons Attribution 4.0 International (CC BY 4.0)  
The original dataset is published by Aplinkos apsaugos agentūra via the European Open Data Portal under CC BY 4.0. This licence permits reuse, redistribution, and adaptation provided that appropriate credit is given to the original publisher. The ShareAlike clause does **not** apply (CC BY 4.0, not CC BY-SA), so derived outputs are not required to use the same licence.

### Software / Code
**Licence:** MIT License — see [LICENSE](LICENSE)  
The MIT licence was chosen because it is permissive, widely recognised, and compatible with the CC BY 4.0 licence of the input data. It allows anyone to use, modify, and distribute the code with minimal restrictions.

### Produced / Output Data
**Licence:** Creative Commons Attribution 4.0 International (CC BY 4.0)  
All generated outputs (trained models, evaluation figures, prediction results) are released under CC BY 4.0. This is compatible with the input data licence and ensures outputs remain openly reusable with attribution.

---

## Contributors

| Role | Name | ORCID | Student ID | Email |
|------|------|-------|-----------|-------|
| Owner A | Anusree Rajeevan | [0009-0006-9044-3017](https://orcid.org/0009-0006-9044-3017) | 12534814 | e12534814@student.tuwien.ac.at |
| Owner B | Joel Varghese Johnson | [0009-0007-0154-9707](https://orcid.org/0009-0007-0154-9707) | 12534758 | e12534758@student.tuwien.ac.at |
| Owner C | Felix Antony Kodiyan Paul | [0009-0001-2323-0517](https://orcid.org/0009-0001-2323-0517) | 12436485 | e12436485@student.tuwien.ac.at |
| Owner D | Ashwin Varughese Mathew | [0009-0002-1797-1869](https://orcid.org/0009-0002-1797-1869) | 12538359 | e12538359@student.tuwien.ac.at |

All contributors are affiliated with **TU Wien**, Vienna, Austria.  
Course: 194.045 Data Stewardship (2026S)

---

## Citation

If you use this work, please cite it as:

> Rajeevan, A., Johnson, J.V., Kodiyan Paul, F.A., Varughese Mathew, A. (2026). *Water Quality Analysis Using National Lake Monitoring Data*. Zenodo. https://doi.org/10.5281/zenodo.20444106

[![DOI](https://zenodo.org/badge/1229862090.svg)](https://doi.org/10.5281/zenodo.20444106)

---

## Related Resources

| Resource | Link |
|----------|------|
| DBRepo Database | https://test.dbrepo.tuwien.ac.at |
| TU Wien Research Data Repository | https://test.researchdata.tuwien.ac.at |
| Original Dataset | https://data.europa.eu |
| DaSt-2026-final Community | https://test.researchdata.tuwien.ac.at/communities/dast-2026-final |
