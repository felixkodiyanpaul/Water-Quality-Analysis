# Model Card: Water Quality Classification Model

## Model Description

This model is a Random Forest Classifier that predicts 
the water quality class of Lithuanian lakes based on 
physicochemical measurements. It classifies lake water 
into three categories: Good, Moderate, and Poor. The 
model uses 11 environmental features including water 
temperature, pH, dissolved oxygen, and nutrient indicators.

The algorithm is RandomForestClassifier from scikit-learn 
with 100 decision trees and maximum depth of 10. Balanced 
class weights were used to handle the unequal distribution 
of water quality classes. The model is saved as 
water_quality_model.pkl using joblib.

This model was developed as part of a FAIR Data Science 
experiment at TU Wien using open environmental monitoring 
data from Lithuania. It demonstrates how machine learning 
can be applied to water quality classification using 
routine monitoring data.

## Intended Use

This model is intended for academic research and 
educational demonstration of FAIR data science practices 
applied to environmental water quality monitoring. It can 
classify water quality status of Lithuanian lakes based on 
routine physicochemical measurements. The model is suitable 
for exploratory analysis and as a baseline for more advanced 
water quality prediction systems.

The model was developed for the TU Wien Data Stewardship 
course (194.045, 2026S) as part of a group project. 
Researchers working with similar lake monitoring datasets 
from the Baltic region may find it useful as a starting 
point for comparative analysis. Any use should acknowledge 
the limitations described below.

Environmental monitoring agencies may use this model as 
a screening tool to identify lakes that may require closer 
inspection. However, all results should be verified by 
qualified environmental scientists before any action is 
taken. The model is not a replacement for official 
monitoring procedures.

## Out-of-Scope Uses

This model should not be used for official regulatory water 
quality assessments or environmental compliance monitoring 
without further validation. The model was trained only on 
Lithuanian lake data and may not work well for lakes in 
other geographic regions. It should not be used to make 
decisions that directly affect public health or 
environmental policy without expert review.

The model does not account for seasonal variation, 
long-term trends, or spatial relationships between 
monitoring stations. It is not suitable for real-time 
monitoring or for predicting water quality in rivers, 
streams, or coastal waters. Use outside Lithuanian 
freshwater lake monitoring data is not recommended 
without retraining on local data.

The model also does not incorporate biological water 
quality indicators such as phytoplankton or macrophyte 
assessments that are required under the EU Water 
Framework Directive. Therefore it cannot be used as a 
complete WFD ecological status assessment tool.

## Training Data

The model was trained on the National Lakes Monitoring 
Data published by Aplinkos apsaugos agentūra and 
distributed via the European Union Open Data Portal.

- **Source:** https://data.europa.eu/data/datasets/https-data-gov-lt-datasets-2055-?locale=en
- **Publisher:** Aplinkos apsaugos agentūra
- **License:** Open Data Licence of Lithuania
- **Records:** 1,935 total — 1,548 training (80%) / 387 test (20%)
- **DOI:** 10.70124/0c7z5-7vm19

The dataset contains physicochemical measurements from 
307 Lithuanian lakes sampled between 2017 and 2022 at 
386 monitoring stations. The target variable quality_class 
was derived from EU Water Framework Directive ecological 
status thresholds. The class distribution is imbalanced: 
Good (78%), Moderate (19%), Poor (3%).

Class imbalance was addressed by using class_weight 
balanced during model training. The dataset was split 
into 80% training and 20% test using stratified sampling 
to preserve the class distribution. No data augmentation 
or synthetic sampling techniques were applied.

## Evaluation Results

The model was evaluated on a held-out test set of 358 
samples using stratified splitting. The results show 
strong overall performance but limited performance on 
the minority Poor class due to very few training examples.

### Overall Metrics

| Metric    | Score  |
|-----------|--------|
| Accuracy  | 0.9190 |
| Precision | 0.9090 |
| Recall    | 0.9190 |
| F1 Score  | 0.9106 |

### Per-Class Metrics

| Class    | Precision | Recall | F1-Score | Support |
|----------|-----------|--------|----------|---------|
| Good     | 0.95      | 0.98   | 0.96     | 280     |
| Moderate | 0.80      | 0.77   | 0.79     | 69      |
| Poor     | 0.50      | 0.11   | 0.18     | 9       |

The model performs well overall with 91.9% accuracy. 
Performance on the Poor class is limited due to only 
9 test samples in that class. The weighted F1 score of 
0.9106 reflects the class imbalance in the dataset.

## Limitations

The model has very limited performance on the Poor water 
quality class with F1 score of only 0.18 due to severe 
class imbalance. Only 3% of samples belong to this class 
which means the model may miss lakes that are actually 
in poor condition. This is the most critical prediction 
for environmental management.

The model uses only 11 physicochemical features and does 
not incorporate biological indicators required by the EU 
Water Framework Directive. The model was trained on data 
from 2017 to 2022 and may not reflect current conditions 
due to climate change or land use changes. Heavy metals 
and pesticide columns were excluded due to 98-99% 
missing values.

The model was trained and evaluated only on Lithuanian 
lake data and geographic transferability to other regions 
is unknown. The quality class labels were derived from 
threshold-based rules applied to measured parameters and 
may not perfectly align with expert ecological assessments. 
Regular retraining with updated monitoring data is 
recommended.

## Ethical Considerations

This model was developed using publicly available open 
data and does not involve any personal or sensitive 
information. The dataset contains only environmental 
measurements and raises no direct ethical concerns 
regarding individual privacy. All data was obtained from 
an official government monitoring programme.

The model could be misused if applied to make regulatory 
decisions without proper expert validation. The known 
bias towards the Good class means decisions based solely 
on this model could lead to under-reporting of 
environmental degradation. Users are strongly advised 
to treat model outputs as indicative only.

The training data publisher Aplinkos apsaugos agentūra 
is acknowledged as the original data owner. The model 
was developed for academic purposes only and all outputs 
are shared under open licences to promote reproducibility 
and transparency.

## Licence

The model artefact water_quality_model.pkl is released 
under the Creative Commons Attribution 4.0 International 
licence (CC BY 4.0). Users are free to share and adapt 
the model for any purpose provided appropriate credit 
is given to the original authors. The licence is 
consistent with the open data licence of the training 
dataset.

See the repository LICENSE file for the full licence text. 
The source code used to train the model is available in 
the GitHub repository under the MIT licence. Both the 
model and code are freely available for academic and 
commercial use with attribution.

---

*Written by Anusree Rajeevan (Owner A)*  
*TU Wien Data Stewardship course 194.045, 2026S*  
*Last updated: 2026-05-28*
