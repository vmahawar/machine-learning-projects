# Heart Disease Prediction Using Decision Tree and Hyperparameter Tuning

This repository focuses on predicting the likelihood of heart disease using Decision Tree models, incorporating hyperparameter tuning to optimize performance. It highlights insights into feature importance, parameter selection, and learnings derived from practical applications of data science tools and libraries like Scikit-learn, Pandas, and Matplotlib.

![Heart Disease Prediction Using Decision Tree and Hyperparameter Tuning](./heart-disease-prediction-dt-hyperparameter-tuning.png)

---

## 🎯 Purpose

The purpose of this project is to:

- Build an accurate predictive model for heart disease classification using Decision Tree algorithms.
- Explore and apply hyperparameter tuning techniques to optimize model performance and balance underfitting and overfitting.
- Gain insights into the significance of various features influencing heart disease prediction through feature importance analysis.
- Develop skills in model evaluation, parameter selection, and visual interpretation of Decision Tree structures.

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

## 📊 Jupyter Notebook

Explore the complete analysis and model building process for predicting Heart Disease using Decision Tree models and Hyperparameter TUning in the following notebook:

- [heart-disease-prediction-dt-hyperparameter-tuning.ipynb](./heart-disease-prediction-dt-hyperparameter-tuning.ipynb))

---

## 🛠️ Tools and Libraries Used

This project leverages the following tools and libraries:

- **Pandas**: For data manipulation and preprocessing.
- **Scikit-learn**: For building, training, and tuning the Decision Tree model.
- **Matplotlib & Seaborn**: For creating visualizations to explore feature relationships and distributions.
- **Jupyter Notebook**: For developing and presenting the project interactively.

---

## 🌟 Key Learnings

1. **Feature Importance**:
   - Analyzed the significance of features like `age`, `sex`, and `cholestrol` using the `feature_importances_` attribute from the Decision Tree model.

2. **Hyperparameter Tuning**:
   - Experimented with various hyperparameters to optimize the Decision Tree, including:
     - `max_depth`: To control the depth of the tree.
     - `min_samples_split`: To specify the minimum number of samples required to split an internal node.
     - `min_samples_leaf`: To define the minimum number of samples at a leaf node.
   - Utilized `Grid Search` and `Randomized Search` for finding the best combination of parameters.

3. **Model Evaluation**:
   - Evaluated the performance of the Decision Tree model using classification metrics such as Accuracy, Precision, Recall, and F1 Score.
   - Assessed the effects of hyperparameter tuning on model performance to improve classification results.

4. **Visualization**:
   - Created visualizations to interpret the Decision Tree hierarchy and splits.
   - Used confusion matrices, scatter plots, and histograms for insights into data patterns and model predictions.

---

## 📜 License

This project is licensed under the **MIT License**, allowing free usage for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)