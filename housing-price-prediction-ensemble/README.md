# Housing Price Prediction: Ensemble Stacking Regressor and Regression Models

A comprehensive case study on predicting housing prices using the Stacking Regressor from `sklearn.ensemble` alongside individual regression models such as linear regression, k-nearest neighbors (KNN) regressor, and decision tree regressor. The project focuses on leveraging ensemble learning techniques and statistical modeling for effective prediction.

![Housing Price Prediction Using Ensemble](housing-price-prediction-ensemble.png)

---

## 🎯 Purpose

The purpose of this project is to:
- Build an accurate predictive model for housing price estimation using ensemble techniques.
- Understand the contribution of various features to housing prices.
- Enhance skills in regression modeling, ensemble learning, and performance evaluation.

---

## 📂 Dataset

### **Housing Prices Dataset**
- **Description**: This dataset contains features influencing housing prices, providing a foundation for regression and machine learning tasks.
- **Use Cases**: Predictive modeling, feature engineering, and exploratory data analysis.
- **Data Dictionary**:
   - **price**: Description not provided yet. (Data Type: int64)
   - **area**: Description not provided yet. (Data Type: int64)
   - **bedrooms**: Description not provided yet. (Data Type: int64)
   - **bathrooms**: Description not provided yet. (Data Type: int64)
   - **stories**: Description not provided yet. (Data Type: int64)
   - **mainroad**: Description not provided yet. (Data Type: object)
   - **guestroom**: Description not provided yet. (Data Type: object)
   - **basement**: Description not provided yet. (Data Type: object)
   - **hotwaterheating**: Description not provided yet. (Data Type: object)
   - **airconditioning**: Description not provided yet. (Data Type: object)
   - **parking**: Description not provided yet. (Data Type: int64)
   - **prefarea**: Description not provided yet. (Data Type: object)
   - **furnishingstatus**: Description not provided yet. (Data Type: object)
- **File Reference**: [housing_prices.csv](https://github.com/vmahawar/data-science-datasets-collection/raw/main/housing_prices.csv)
  ```python
  import pandas as pd
  url = 'https://github.com/vmahawar/data-science-datasets-collection/raw/main/housing_prices.csv'
  df = pd.read_csv(url)
  print(df.head())
  ```

 ---

## 📊 Jupyter Notebook

Explore the complete analysis and model building process for predicting housing prices using Ensemble in the following notebook:

- [housing-price-prediction-ensemble.ipynb](./housing-price-prediction-ensemle.ipynb)

---

---

## 🛠️ Tools and Libraries Used

This project leverages the following tools and libraries:

- **Pandas**: For data manipulation and preprocessing.
- **Numpy**: For numerical computations.
- **Scikit-learn**: For building regression models and implementing the Stacking Regressor.
- **Matplotlib & Seaborn**: For data visualization to explore feature relationships and data distributions.
- **Statsmodels**: For statistical analysis and calculating R-squared scores.
- **Jupyter Notebook**: For developing and presenting the project in an interactive environment.

---

## 🌟 Key Learnings

1. **Feature Significance**:
   - Analyzed the influence of features such as `area`, `bedrooms`, and `stories` on housing prices.
   - Utilized visualizations and statistical methods to highlight significant predictors.

2. **Model Performance**:
   - Compared the performance of individual models, including Linear Regression, K-Nearest Neighbors (KNN), and Decision Tree Regressors.
   - Observed improved accuracy by combining models through the Stacking Regressor.

3. **Evaluation Metrics**:
   - Assessed model quality using the R-squared metric to explain variance in housing prices.
   - Used the OLS module from `statsmodels` for detailed statistical insights.

4. **Ensemble Techniques**:
   - Highlighted how the Stacking Regressor combines the strengths of multiple models to achieve better predictive performance.

---

## 📜 License

This project is licensed under the **MIT License**, permitting free usage for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)

