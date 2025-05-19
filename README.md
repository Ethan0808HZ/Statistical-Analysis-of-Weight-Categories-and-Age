# Statistical-Analysis-of-Weight-Categories-and-Age

This project investigates the relationship between obesity categories and age distribution using statistical modeling techniques in R. The dataset used includes synthetic and real health data with multiple obesity classifications.

---

##  Project Objectives

- Reclassify detailed obesity levels into four analytical groups.
- Explore whether age differs significantly across these obesity groups.
- Apply statistical modeling and diagnostics to ensure model robustness.
- Visualize post-hoc test results to highlight significant group differences.

---

##  Dataset

**Filename**: `ObesityDataSet_raw_and_data_sinthetic.csv`  
**Source**: UCI Machine Learning Repository / Kaggle  
**Features used**:
- `Age`: Continuous variable
- `NObeyesdad`: Original obesity classification (multi-category)
- Additional variables are available but not used in this project

---

## 🔧 Dependencies

This project was built in R. Install the following packages before running:

```r
install.packages(c("dplyr", "caret"))

