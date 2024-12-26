# Housing Price Prediction using Random Forest

This repository focuses on predicting housing prices using the **Random Forest Regressor** from `sklearn.ensemble`. The project highlights insights into feature importance, hyperparameter tuning, and leveraging ensemble learning techniques for accurate predictions.

![Housing Price Prediction Using Random Forest](housing-price-prediction-rf.png)

---

## 🎯 Purpose

The purpose of this project is to:
- Build a robust predictive model for housing price estimation using Random Forest.
- Understand the contribution of various features to housing prices.
- Enhance skills in ensemble modeling, feature importance analysis, and performance evaluation.

---

## 📂 Dataset

### **Housing Prices Dataset**
- **Description**: This dataset contains features influencing housing prices, such as area, number of rooms, and other amenities.
- **Use Cases**: Predictive modeling, feature engineering, and exploratory data analysis.
- **Data Dictionary**:
  - **price**: Selling price of the house in dollars. (Data Type: int64)
  - **area**: Total area of the property in square feet. (Data Type: int64)
  - **bedrooms**: Number of bedrooms in the property. (Data Type: int64)
  - **bathrooms**: Number of bathrooms in the property. (Data Type: int64)
  - **stories**: Number of floors in the house. (Data Type: int64)
  - **mainroad**: Whether the house is located on the main road (Yes/No). (Data Type: object)
  - **guestroom**: Availability of a guestroom (Yes/No). (Data Type: object)
  - **basement**: Presence of a basement (Yes/No). (Data Type: object)
  - **hotwaterheating**: Availability of hot water heating (Yes/No). (Data Type: object)
  - **airconditioning**: Availability of air conditioning (Yes/No). (Data Type: object)
  - **parking**: Number of parking spaces available. (Data Type: int64)
  - **prefarea**: Whether the house is located in a preferred area (Yes/No). (Data Type: object)
  - **furnishingstatus**: Level of furnishing (Fully, Semi, Unfurnished). (Data Type: object)
- **File Reference**: [housing_prices.csv](https://github.com/vmahawar/data-science-datasets-collection/raw/main/housing_prices.csv)
  ```python
  import pandas as pd
  url = 'https://github.com/vmahawar/data-science-datasets-collection/raw/main/housing_prices.csv'
  df = pd.read_csv(url)
  print(df.head())
  ```

 ---

## 📊 Jupyter Notebook

Explore the complete analysis and model building process for predicting housing prices using Random Forest Regressor in the following notebook:

- [housing-price-prediction-random-forest.ipynb](./housing-price-prediction-random-forest.ipynb)

---

## 🛠️ Tools and Libraries Used

This project leverages the following tools and libraries:

- **Pandas**: For data manipulation and preprocessing.
- **Numpy**: For numerical computations.
- **Scikit-learn**: For building and training the Random Forest Regressor.
- **Matplotlib & Seaborn**: For data visualization to explore feature relationships and data distributions.
- **Jupyter Notebook**: For developing and presenting the project interactively.

---

## 🌟 Key Learnings

1. **Feature Importance**:
   - Analyzed feature significance using `feature_importances_` from the Random Forest Regressor.
   - Highlighted key features like `area`, `bedrooms`, and `stories` that strongly influence housing prices.

2. **Hyperparameter Tuning**:
   - Experimented with parameters such as `n_estimators`, `max_depth`, and `min_samples_split` to optimize model performance.
   - Observed the impact of different parameter settings on prediction accuracy.

3. **Evaluation Metrics**:
   - Assessed model performance using metrics such as R-squared and Mean Absolute Error (MAE).
   - Compared predictions with actual housing prices to evaluate accuracy.

4. **Random Forest Capabilities**:
   - Demonstrated the strength of Random Forest in handling complex feature interactions and reducing overfitting through ensemble decision trees.

---

## 📜 License

This project is licensed under the **MIT License**, allowing free usage for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)
