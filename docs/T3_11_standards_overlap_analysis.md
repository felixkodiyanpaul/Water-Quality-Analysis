# T3.11 – Metadata Standards Overlap and Complementarity Analysis

**Owner:** C (Felix Antony Kodiyan Paul)  
**Project:** Water Quality Analysis Using National Lake Monitoring Data  
**Standards analysed:** RO-Crate, CodeMeta, FAIR4ML, Croissant, Model Card

---

## 1. Introduction

This analysis examines the overlap and complementarity between the five metadata standards applied in this project. For each pair of standards, we identify: (a) fields that appear in both, (b) fields unique to each standard, and (c) any conflicts or inconsistencies encountered. The goal is to understand how these standards relate to each other and whether maintaining multiple standards simultaneously creates redundancy or inconsistency.

---

## 2. Overview of Standards Used

| Standard | Purpose | Scope | Format |
|----------|---------|-------|--------|
| **RO-Crate** | Research object packaging and provenance | Entire experiment (data, code, models, outputs, relationships) | JSON-LD |
| **CodeMeta** | Software citation and discovery metadata | Source code / software only | JSON-LD |
| **FAIR4ML** | FAIR metadata for machine learning models | ML model only | JSON-LD / YAML |
| **Croissant** | Dataset description for ML use | Input dataset only | JSON-LD |
| **Model Card** | Human-readable model documentation | ML model only | Markdown |

---

## 3. Pairwise Overlap Analysis

### 3.1 RO-Crate vs CodeMeta

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | `name`, `description`, `author` / `creator`, `license`, `version`, `datePublished`, `url`, `identifier` |
| **(b) Unique to RO-Crate** | `hasPart`, `mentions`, `conformsTo`, `contentSize`, `encodingFormat`, `about` (links all artefacts together), `spatialCoverage` |
| **(b) Unique to CodeMeta** | `softwareRequirements`, `runtimePlatform`, `programmingLanguage`, `codeRepository`, `softwareSuggestions`, `buildInstructions`, `contIntegration` |
| **(c) Conflicts** | `author` vs `creator`: RO-Crate uses `author`, CodeMeta uses `creator` for the same concept. Both reference Schema.org Person but with different property names, requiring duplication with slightly different keys. |

**Discussion:** RO-Crate provides a container that can reference a CodeMeta file as one of its parts, so the two standards are largely complementary rather than conflicting. The main redundancy is in basic bibliographic fields (name, description, license, author/creator) which must be maintained consistently in both files.

---

### 3.2 RO-Crate vs FAIR4ML

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | `name`, `description`, `author` / `creator`, `license`, `datePublished`, `identifier`, `version` |
| **(b) Unique to RO-Crate** | `hasPart`, `conformsTo`, `encodingFormat`, `contentSize`, full provenance graph linking all artefacts |
| **(b) Unique to FAIR4ML** | `ml:hasHyperparameter`, `ml:hasTrainingDataset`, `ml:hasEvaluationMetric`, `ml:intendedUse`, `ml:limitations`, `ml:algorithmName`, `ml:frameworkVersion` |
| **(c) Conflicts** | No direct conflicts. However, both reference the training dataset — RO-Crate via `wasGeneratedBy` / `used`, FAIR4ML via `ml:hasTrainingDataset`. These must point to the same DOI to remain consistent. |

**Discussion:** FAIR4ML extends the model description well beyond what RO-Crate captures. RO-Crate records that a model exists and its provenance; FAIR4ML records the technical details of how it was built and what it can do. The T3.11 requirement to reference the FAIR4ML file from within the RO-Crate ensures these two standards are linked rather than duplicated.

---

### 3.3 RO-Crate vs Croissant

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | `name`, `description`, `license`, `url`, `creator`, `datePublished`, `distribution` |
| **(b) Unique to RO-Crate** | Full provenance graph, links to code and model, `conformsTo`, relationship types (`hasPart`, `mentions`) |
| **(b) Unique to Croissant** | `cr:field` (column-level schema), `cr:dataType`, `cr:source`, `cr:recordSet`, unit URIs per field (QUDT), `cr:fileObject` with format details |
| **(c) Conflicts** | `distribution` is present in both but structured differently. RO-Crate uses `distribution` as a simple download URL reference; Croissant uses `distribution` as a rich object describing format, encoding, and content length. Maintaining both requires careful alignment of download URLs and format descriptions. |

**Discussion:** Croissant provides column-level schema information that RO-Crate does not. RO-Crate treats the dataset as a black-box entity with provenance; Croissant describes its internal structure field by field. They are strongly complementary for a dataset-heavy project like this one.

---

### 3.4 RO-Crate vs Model Card

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | Model name, description, author, license, training dataset reference, evaluation metrics |
| **(b) Unique to RO-Crate** | Machine-readable provenance, formal relationship types, JSON-LD context, links to all other artefacts |
| **(b) Unique to Model Card** | Intended use (narrative), out-of-scope uses, ethical considerations, limitations (narrative), caveats and recommendations — all in free-text human-readable form |
| **(c) Conflicts** | Evaluation metrics appear in both but in different formats. RO-Crate references a metrics file; Model Card contains a Markdown table. If the numbers differ due to a manual update in one place but not the other, this creates an inconsistency. |

**Discussion:** Model Card is human-readable documentation while RO-Crate is machine-readable provenance. They serve different audiences and are genuinely complementary. The risk of inconsistency in evaluation metric values must be managed carefully — one source of truth (the evaluation output file) should be the reference for both.

---

### 3.5 CodeMeta vs FAIR4ML

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | `name`, `version`, `author` / `creator`, `license`, `description`, `url` |
| **(b) Unique to CodeMeta** | `programmingLanguage`, `runtimePlatform`, `softwareRequirements` (dependencies), `codeRepository`, `buildInstructions` |
| **(b) Unique to FAIR4ML** | `ml:hasHyperparameter`, `ml:hasTrainingDataset`, `ml:hasEvaluationMetric`, `ml:intendedUse`, `ml:limitations`, `ml:algorithmName` |
| **(c) Conflicts** | CodeMeta describes the software (training script), FAIR4ML describes the trained model artefact. They overlap in basic metadata but describe fundamentally different things. No direct conflicts, but `version` can be ambiguous — it refers to the code version in CodeMeta and the model version in FAIR4ML. |

**Discussion:** These two standards have minimal genuine overlap because they target different artefacts. CodeMeta targets the source code; FAIR4ML targets the model file. The shared fields (name, version, author) happen to be the same values but describe different artefacts.

---

### 3.6 CodeMeta vs Croissant

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | `name`, `description`, `license`, `creator`, `url` |
| **(b) Unique to CodeMeta** | All software-specific fields: `softwareRequirements`, `programmingLanguage`, `runtimePlatform`, `codeRepository` |
| **(b) Unique to Croissant** | All dataset-specific fields: `cr:field`, `cr:dataType`, `cr:recordSet`, unit URIs, `distribution` with format details |
| **(c) Conflicts** | None. These two standards describe completely different artefacts (code vs dataset) and barely overlap beyond generic bibliographic metadata. |

**Discussion:** CodeMeta and Croissant are complementary with almost no overlap beyond basic Dublin Core-style fields. They should be maintained independently with no risk of conflict.

---

### 3.7 CodeMeta vs Model Card

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | Author name, license, version, description |
| **(b) Unique to CodeMeta** | `softwareRequirements`, `programmingLanguage`, `runtimePlatform`, `codeRepository`, dependency list with versions |
| **(b) Unique to Model Card** | Intended use, out-of-scope uses, ethical considerations, limitations, evaluation results table, training data description |
| **(c) Conflicts** | None. Model Card is a Markdown document; CodeMeta is a JSON-LD file. They serve completely different purposes and audiences. |

**Discussion:** These two standards do not overlap meaningfully. CodeMeta enables software citation; Model Card enables model governance and transparency. They can be maintained independently.

---

### 3.8 FAIR4ML vs Croissant

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | Reference to the dataset (by URL or DOI), license, description of data fields used |
| **(b) Unique to FAIR4ML** | Model hyperparameters, evaluation metrics, intended use, limitations, algorithm name, framework version |
| **(b) Unique to Croissant** | Column-level field schema, data types, unit URIs (QUDT), file distribution details, record set structure |
| **(c) Conflicts** | FAIR4ML references the training dataset by DOI; Croissant describes that same dataset's internal structure. If the DOI in FAIR4ML does not match the dataset described by the Croissant record, this creates a traceability gap. Both must reference the same dataset consistently. |

**Discussion:** FAIR4ML and Croissant are strongly complementary — Croissant describes the input dataset in detail, and FAIR4ML references that dataset when documenting the model that was trained on it. Together they form a complete input-to-model provenance chain.

---

### 3.9 FAIR4ML vs Model Card

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | Model name, algorithm, hyperparameters, evaluation metrics (accuracy, precision, recall, F1), training dataset reference, intended use, limitations, license |
| **(b) Unique to FAIR4ML** | Machine-readable JSON-LD structure, formal ontology references, `ml:` namespace properties, framework version |
| **(b) Unique to Model Card** | Out-of-scope uses, ethical considerations, caveats and recommendations — all in narrative free-text format |
| **(c) Conflicts** | **This is the most significant overlap in the project.** Both FAIR4ML and Model Card capture: algorithm name, hyperparameters, evaluation metrics, training dataset, intended use, and limitations. Any update to evaluation metrics must be applied to both files simultaneously or inconsistencies will arise. The metric values in this project (accuracy=0.9190, precision=0.9090, recall=0.9190, F1=0.9106) must be identical in both documents. |

**Discussion:** FAIR4ML and Model Card are the most redundant pair in this project. FAIR4ML provides a machine-readable version of what the Model Card expresses in human-readable Markdown. In practice, the Model Card should be treated as the human-facing summary and FAIR4ML as the machine-readable equivalent, with both derived from the same authoritative evaluation output file to prevent divergence.

---

### 3.10 Croissant vs Model Card

| Category | Fields |
|----------|--------|
| **(a) Fields in both** | Training data description, dataset name, license |
| **(b) Unique to Croissant** | Column-level field schema, data types, unit URIs, file distribution, record set structure |
| **(b) Unique to Model Card** | Model description, evaluation results, intended use, ethical considerations, out-of-scope uses, limitations |
| **(c) Conflicts** | The dataset name and license referenced in the Model Card's "Training Data" section must match the dataset described in the Croissant record. If different dataset versions are referenced, this creates inconsistency. |

**Discussion:** Croissant and Model Card overlap only on the dataset reference. Croissant describes the dataset in full detail; Model Card mentions the dataset briefly in the context of model documentation. They are largely independent and complementary.

---

## 4. Summary Table

| Pair | Overlap level | Main shared fields | Key conflict / risk |
|------|--------------|-------------------|-------------------|
| RO-Crate vs CodeMeta | Medium | name, description, author/creator, license, version | `author` vs `creator` naming |
| RO-Crate vs FAIR4ML | Low–Medium | name, description, license, identifier | Training dataset DOI must match |
| RO-Crate vs Croissant | Medium | name, description, license, distribution | `distribution` structured differently |
| RO-Crate vs Model Card | Low | name, description, author, metrics | Metric values must stay in sync |
| CodeMeta vs FAIR4ML | Low | name, version, author, license | `version` is ambiguous (code vs model) |
| CodeMeta vs Croissant | Very low | name, description, license, creator | None |
| CodeMeta vs Model Card | Very low | author, license, version, description | None |
| FAIR4ML vs Croissant | Low | Dataset reference, license | Dataset DOI must be consistent |
| **FAIR4ML vs Model Card** | **High** | **Algorithm, hyperparameters, metrics, intended use, limitations** | **Metric values must be identical in both** |
| Croissant vs Model Card | Very low | Dataset name, license | Dataset version must match |

---

## 5. Discussion and Conclusions

### Key findings

**Most redundant pair:** FAIR4ML and Model Card share the largest number of fields — algorithm name, hyperparameters, all evaluation metrics, training dataset reference, intended use, and limitations. In this project, the evaluation metrics (accuracy=0.9190, precision=0.9090, recall=0.9190, F1=0.9106) appear in both documents and must be kept identical. We treat the evaluation output from the notebook as the single source of truth for these values.

**Most complementary pair:** Croissant and FAIR4ML together form a complete data-to-model provenance chain. Croissant describes the input dataset column by column (including QUDT unit URIs from T2.3), and FAIR4ML references that dataset when describing the model trained on it. Neither standard alone provides this full picture.

**Role of RO-Crate:** RO-Crate acts as the top-level container that references all other standards. It does not replace any of them but provides the glue that connects them — referencing the CodeMeta file, the FAIR4ML file, the Croissant record, and the Model Card as parts of a single research object.

### Practical implications

Maintaining five metadata standards simultaneously creates a significant maintenance burden. The main risk is inconsistency — particularly in evaluation metric values and dataset DOIs, which appear in multiple standards. To mitigate this, we recommend:

1. Treating the notebook evaluation output as the single source of truth for all metric values.
2. Using a single canonical DOI for the training dataset across all standards.
3. Updating FAIR4ML and Model Card together whenever model evaluation is rerun.

### Standards coverage of FAIR principles

| FAIR aspect | Primary standard(s) |
|-------------|-------------------|
| Findable — persistent identifier | RO-Crate (DOI), Zenodo |
| Findable — rich metadata | Croissant, CodeMeta, FAIR4ML |
| Accessible — open licence | All five (license field) |
| Interoperable — ontology references | Croissant (QUDT units), FAIR4ML (ml: namespace) |
| Reusable — provenance | RO-Crate, FAIR4ML, Model Card |
| Reusable — usage conditions | Model Card (intended use, limitations) |
