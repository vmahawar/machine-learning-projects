# Home Loan Default Prediction Using Logistic Regression

This repository focuses on predicting the likelihood of home loan defaults using Logistic Regression. It highlights insights into data preprocessing, feature engineering, model evaluation, and learnings derived from practical applications of machine learning tools and libraries like Scikit-learn, Pandas, and Matplotlib.

![Home Loan Default Prediction Using Logistic Regression](home-loan-default-prediction-logistic-regression.png)

---

## 🎯 Purpose

The purpose of this project is to:
- Build a robust predictive model for identifying potential home loan defaults.
- Analyze the factors that influence loan repayment behavior.
- Enhance skills in logistic regression implementation, data preprocessing, and evaluation metrics.

---

## 📂 Dataset

### **Home Loan Dataset**
- **Description**: This dataset includes information about loan applications, such as loan amount, interest rate, employment details, income, and loan status.
- **Use Cases**: Binary classification tasks, financial risk analysis, exploratory data analysis, and feature engineering.
- **Data Dictionary**:
  - **id**: Unique identifier for each loan application.
  - **loan_amnt**: Loan amount requested by the applicant (numerical).
  - **funded_amnt**: Amount of loan funded (numerical).
  - **int_rate**: Interest rate on the loan (percentage).
  - **installment**: Monthly installment amount (numerical).
  - **emp_length**: Length of the applicant's employment (e.g., `<1 year`, `10+ years`).
  - **annual_inc**: Applicant's annual income (numerical).
  - **loan_status**: Target variable (`Fully Paid`, `Charged Off`).

- **File Reference**: [home-loan.csv](https://github.com/vmahawar/data-science-datasets-collection/raw/main/home-loan.csv)
  ```python
  import pandas as pd

  # URL for the dataset
  url = 'https://github.com/vmahawar/data-science-datasets-collection/raw/main/home-loan.csv'

  # Load the dataset
  df = pd.read_csv(url)

  # Print the first 5 rows to verify
  print(df.head())
 ```

---

## 📊 Jupyter Notebook

Explore the complete analysis and model-building process for predicting home loan defaults using Logistic Regression in the following notebook:

- [home-loan-default-prediction-logistic-regression.ipynb](./home-loan-default-prediction-logistic-regression.ipynb)

---

## 🛠️ Tools and Libraries Used

This project leverages the following tools and libraries:

- **Pandas**: For data manipulation and preprocessing.
- **Scikit-learn**: For building, training, and evaluating Logistic Regression models.
- **Matplotlib & Seaborn**: For creating visualizations to explore data distributions and feature relationships.
- **Jupyter Notebook**: For interactive development and presentation of the project.

---

## 🌟 Key Learnings

1. **Data Preprocessing**:
   - Handled missing values and categorical variables.
   - Scaled numerical features for improved model performance.

2. **Feature Engineering**:
   - Extracted meaningful insights from features like `int_rate` and `loan_amnt`.
   - Created new features to enhance model prediction capabilities.

3. **Model Building**:
   - Used **One-vs-Rest (OvR)** and **One-vs-One (OvO)** strategies to handle multi-class classification:
     - **One-vs-Rest (OvR)**: Built individual logistic regression models for each class, treating it as a binary classification problem against all other classes.
       - **Mathematics**: For class \( c \), predicted probability \( P(c|x) \) was computed as:
         \[
         P(c|x) = \frac{1}{1 + e^{-(\beta_0 + \sum_{i=1}^n \beta_i x_i)}}
         \]
     - **One-vs-One (OvO)**: Built pairwise logistic regression models between every pair of classes, resulting in \( \binom{k}{2} \) models for \( k \) classes.
       - **Mathematics**: Compared probabilities between pairs and selected the class with the highest votes.
   - Implemented and compared the performance of both methods.

4. **Model Evaluation**:
   - Evaluated model performance using metrics like Accuracy, Precision, Recall, F1-Score, and ROC-AUC.
   - Learned to interpret logistic regression coefficients for feature importance.

5. **Visualization**:
   - Developed visualizations to understand data trends and the impact of features on loan default prediction.

6. **Mathematical Insights**:
   - Understood the underlying mathematical formulation of logistic regression:
     - Logistic function:
       \[
       \sigma(z) = \frac{1}{1 + e^{-z}}
       \]
       where \( z = \beta_0 + \sum_{i=1}^n \beta_i x_i \).
     - Log-loss function for optimization:
       \[
       J(\theta) = -\frac{1}{m} \sum_{i=1}^m \left[ y_i \log(h_\theta(x_i)) + (1 - y_i) \log(1 - h_\theta(x_i)) \right]
       \]

---

## 📜 License

This project is licensed under the **MIT License**, allowing free use for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)






