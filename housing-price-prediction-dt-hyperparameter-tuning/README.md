# Housing Price Prediction Using Decision Tree and Hyperparameter Tuning

This repository focuses on predicting housing prices using Decision Tree models. It highlights insights into feature importance, hyperparameter tuning, and learnings derived from practical applications of data science tools and libraries like Scikit-learn, Pandas, and Matplotlib.

![Housing Price Prediction Using Decision Tree and Hyperparameter Tuning](housing-price-prediction-dt-hyperparameter-tuning.png)

---

## 🎯 Purpose

The purpose of this project is to:

- Build an accurate predictive model for housing price estimation using Decision Tree regression.
- Explore and apply hyperparameter tuning techniques to optimize model performance and balance underfitting and overfitting.
- Gain insights into the significance of various features influencing housing prices through feature importance analysis.
- Develop skills in model evaluation, parameter selection, and visual interpretation of Decision Tree structures.

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

- [housing-price-prediction-dt-hyperparameter-tuning.ipynb](./housing-price-prediction-dt-hyperparameter-tuning.ipynb)

---

## 🛠️ Tools and Libraries Used

This project leverages the following tools and libraries:

- **Pandas**: For data manipulation and preprocessing.
- **Scikit-learn**: For building, training, and tuning the Decision Tree model.
- **Matplotlib & Seaborn**: For data visualization to explore feature relationships and distributions.
- **Jupyter Notebook**: For interactive development and presentation of the project.

---

## 🌟 Key Learnings

1. **Feature Importance**:
   - Analyzed the importance of features like `area`, `bedrooms`, and `stories` using `feature_importances_` from the Decision Tree model.

2. **Hyperparameter Tuning**:
   - Experimented with various hyperparameters such as:
     - `max_depth`: To control the depth of the tree.
     - `min_samples_split`: To specify the minimum number of samples required to split an internal node.
     - `min_samples_leaf`: To define the minimum number of samples at a leaf node.
   - Used Grid Search and Randomized Search for optimal parameter selection.

3. **Model Evaluation**:
   - Evaluated model performance using metrics like R-squared, Mean Absolute Error (MAE), and Root Mean Squared Error (RMSE).
   - Observed the impact of hyperparameter tuning on reducing overfitting and improving accuracy.

4. **Visualization**:
   - Developed visualizations to understand the Decision Tree splits and hierarchy.
   - Created scatter plots, histograms, and pair plots for data insights.

---

## 📜 License

This project is licensed under the **MIT License**, allowing free usage for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)