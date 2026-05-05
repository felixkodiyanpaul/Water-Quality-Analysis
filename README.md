# fair-ml-experiment
FAIR Data Science experiment project

## File organisation

This repository follows a structured organisation and consistent file naming convention to ensure clarity, reproducibility, and maintainability.

### Folder structure

- data/        → Input datasets (raw and processed)
- src/         → Source code and scripts
- outputs/     → Generated outputs (figures, models, results)
- docs/        → Documentation and reports
- configs/     → Configuration files

---

### Naming conventions

#### 1. Input datasets (data/)

Format:
<source>_<dataset-name>_<version>.<extension>

Example:
kaggle_housing_v1.csv

---

#### 2. Output files (outputs/)

Figures:
fig_<description>_<date>.png

Example:
fig_accuracy_2026-05-05.png

Model artefacts:
model_<algorithm>_<dataset>_<version>.pkl

Example:
model_randomforest_housing_v1.pkl

---

#### 3. Scripts (src/)

Format:
<step-number>_<description>.py

Example:
01_data_preprocessing.py
02_model_training.py

---

#### 4. Configuration files (configs/)

Format:
config_<purpose>.yaml

Example:
config_training.yaml

---

### General rules

- Use lowercase letters only
- Use underscores (_) instead of spaces
- Include version numbers where applicable
- Use ISO date format: YYYY-MM-DD
