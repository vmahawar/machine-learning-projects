# Housing Price Prediction Using Decision Tree

This repository focuses on predicting housing prices using Decision Tree models. It highlights insights into feature importance, hyperparameter tuning, and learnings derived from practical applications of data science tools and libraries like Scikit-learn, Pandas, and Matplotlib.

![Housing Price Prediction Using Decision Tree](housing-price-prediction-dt.png)

---

## 🎯 Purpose

The purpose of this project is to:
- Build a robust predictive model for housing price estimation.
- Understand the role of various features in influencing housing prices.
- Enhance skills in decision tree implementation, visualization, and evaluation.

---

## 📂 Dataset

### **Housing Prices Dataset**
- **Description**: This dataset includes features affecting housing prices, such as lot area, building quality, and construction year.
- **Use Cases**: Regression tasks, feature engineering, and exploratory data analysis.
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

Explore the complete analysis and model building process for predicting housing prices using Decision Tree models in the following notebook:

- [housing-price-prediction-dt.ipynb](./housing-price-prediction-dt.ipynb)

---

## 🛠️ Tools and Libraries Used

This project leverages the following tools and libraries:

- **Pandas**: For data manipulation and preprocessing.
- **Scikit-learn**: For building, training, and visualizing Decision Tree models.
- **Matplotlib & Seaborn**: For creating visualizations to explore feature relationships and data distributions.
- **Jupyter Notebook**: For interactive development and presentation of the project.

---

## 🌟 Key Learnings

1. **Feature Importance**:
   - Identified key features like `Lot Area` and `Overall Quality` that influence housing prices.
   - Used `feature_importances_` from Scikit-learn to rank features by significance.

2. **Decision Tree Tuning**:
   - Experimented with parameters such as `max_depth` and `min_samples_split` to optimize model accuracy and control overfitting.

3. **Evaluation Metrics**:
   - Evaluated model performance using metrics like Mean Absolute Error (MAE), Root Mean Squared Error (RMSE), and R² Score.
   - Learned to interpret the trade-offs between underfitting and overfitting.

4. **Visualization**:
   - Developed visualizations to interpret Decision Tree splits and the hierarchy of features.
   - Enhanced data understanding through scatter plots, histograms, and pair plots.

---

## 📜 License

This project is licensed under the **MIT License**, allowing free use for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)

