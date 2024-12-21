# Heart Disease Prediction Using Decision Tree

This repository focuses on predicting heart disease outcomes using Decision Tree models. It showcases key insights, comparisons of feature importance, and learnings derived from practical applications of data science tools and libraries such as Scikit-learn, Pandas, and Matplotlib.

![Heart Disease Prediction Using Decision Tree](heart-disease-prediction-dt.png)

---

## 🎯 Purpose

The goal of this project is to:
- Build a robust predictive model for heart disease detection.
- Understand the role of different features in influencing predictions.
- Enhance knowledge and skills in decision tree implementation, visualization, and analysis.

---

## 📂 Dataset

### **Heart Disease Dataset**
- **Description**: Contains medical data used to predict the likelihood of heart disease in a patient.
- **Use Cases**: Classification, predictive modeling, and exploratory data analysis.
- **Data Dictionary**:
  - **Age**: Age of the patient.
  - **Sex**: Gender of the patient (1 = male, 0 = female).
  - **Chest Pain Type**: Type of chest pain experienced (e.g., typical angina, atypical angina).
  - **Resting Blood Pressure**: Blood pressure at rest.
  - **Cholesterol**: Serum cholesterol levels in mg/dl.
  - **Max Heart Rate Achieved**: Maximum heart rate achieved during exercise.
  - **Target**: Diagnosis of heart disease (1 = disease, 0 = no disease).
- **File Reference**: [heart_disease.csv](https://github.com/vmahawar/data-science-datasets-collection/raw/main/heart_disease.csv)
  ```python
  import pandas as pd
  url = 'https://github.com/vmahawar/data-science-datasets-collection/raw/main/heart_disease.csv'
  df = pd.read_csv(url)
  print(df.head())
  ```

  ---

  ## Jupyter Notebook

The analysis and model building process for heart disease prediction using Decision Tree models can be found in the following notebook:

- [heart-disease-prediction.ipynb](./heart-disease-prediction.ipynb)

---

## Tools and Libraries Used

The project leverages the following tools and libraries:

- **Pandas**: For data manipulation, preprocessing, and exploratory data analysis.
- **Matplotlib & Seaborn**: For creating data visualizations to understand feature relationships.
- **Scikit-learn**: For building, training, and visualizing the Decision Tree model.
- **Jupyter Notebook**: For interactive coding and presenting the analysis.

---

## Key Learnings

1. **Feature Importance**:
   - Learned how attributes like age, cholesterol levels, and resting blood pressure influence heart disease predictions.
   - Utilized `feature_importances_` from Scikit-learn to identify impactful features.

2. **Hyperparameter Tuning**:
   - Explored the effects of hyperparameters such as `max_depth` and `criterion` (e.g., Gini, Entropy) on the Decision Tree's accuracy and interpretability.

3. **Model Evaluation**:
   - Applied metrics such as accuracy, precision, recall, and F1-score to evaluate the model's performance.
   - Learned to balance overfitting and underfitting by pruning the decision tree.

4. **Visualization**:
   - Created tree visualizations to understand decision splits and the hierarchy of features.
   - Improved skills in visualizing relationships between features and target variables using pair plots, histograms, and scatter plots.

---

## License

This project is licensed under the **MIT License**, allowing free use for educational and non-commercial purposes.

---

## Connect with Me

If you'd like to connect, collaborate, or share feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)