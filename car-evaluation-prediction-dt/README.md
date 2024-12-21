## Car Evaluation Using Decision Tree

This project uses Decision Tree models to evaluate car acceptability based on various features like safety, maintenance cost, and capacity. The repository provides insights into feature importance, hyperparameter tuning, and decision-making processes using Scikit-learn, Pandas, and visualization libraries.

![Car Evaluation Using Decision Tree](car-evaluation-prediction-dt.png)

---

### 🎯 Purpose

The purpose of this project is to:
- Predict car acceptability based on attributes such as safety, maintenance cost, and capacity.
- Analyze feature importance to understand the impact of each attribute on predictions.
- Enhance skills in building, tuning, and visualizing Decision Tree models.

---

### 📂 Dataset

#### **Car Evaluation Dataset**
- **Description**: Contains data about car evaluations focusing on various attributes like safety, maintenance costs, and capacity.
- **Use Cases**: Classification tasks, feature importance analysis, and decision-making modeling.
- **Data Dictionary**:
  - **Buying**: Buying price (values: vhigh, high, med, low).
  - **Maint**: Maintenance cost (values: vhigh, high, med, low).
  - **Doors**: Number of doors (values: 2, 3, 4, 5more).
  - **Persons**: Capacity in terms of persons to carry (values: 2, 4, more).
  - **Lug_boot**: Size of luggage boot (values: small, med, big).
  - **Safety**: Estimated safety of the car (values: low, med, high).
  - **Class**: Overall evaluation of the car (values: unacc, acc, good, vgood).
- **File Reference**: [car_evaluation.csv](https://github.com/vmahawar/data-science-datasets-collection/raw/main/car_evaluation.csv)
  ```python
  import pandas as pd
  url = 'https://github.com/vmahawar/data-science-datasets-collection/raw/main/car_evaluation.csv'
  df = pd.read_csv(url)
  print(df.head())
  ```

  ---

  ## Jupyter Notebook

The analysis and model building process for car evaluation prediction using Decision Tree models can be found in the following notebook:

- [car-evaluation-prediction.ipynb](./car-evaluation-prediction-dt.ipynb)

---

---

### 🛠️ Tools and Libraries Used

The following tools and libraries were utilized in this project:

- **Pandas**: For data manipulation, cleaning, and preprocessing.
- **Scikit-learn**: For building, training, and visualizing Decision Tree models.
- **Matplotlib & Seaborn**: For creating visualizations to explore feature relationships and data distributions.
- **Jupyter Notebook**: For interactive development and presentation of the project workflow.

---

### 🌟 Key Learnings

1. **Feature Importance**:
   - Gained insights into how attributes like safety and maintenance cost influence car evaluation.
   - Used `feature_importances_` from Scikit-learn to identify key features driving predictions.

2. **Decision Tree Tuning**:
   - Learned how hyperparameters such as `max_depth`, `min_samples_split`, and `criterion` (e.g., Gini, Entropy) impact the model's accuracy and interpretability.

3. **Evaluation Metrics**:
   - Explored metrics such as accuracy, precision, recall, and F1-score to assess model performance.
   - Focused on achieving a balance between overfitting and underfitting by tuning model complexity.

4. **Visualization**:
   - Developed skills in visualizing Decision Trees and understanding their splits.
   - Enhanced the ability to represent categorical data relationships through pair plots, heatmaps, and other visualizations.

---

### 📜 License

This project is licensed under the **MIT License**. You are free to use the code and data for educational and non-commercial purposes.

---

### 🌐 Connect with Me

If you'd like to collaborate, provide feedback, or explore similar projects, feel free to connect:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)