# Country Clustering on Socio-Economic Factors

This repository demonstrates how to use clustering techniques to analyze socio-economic and health-related indicators across countries. By leveraging data science tools and methodologies, the project aims to group countries based on similarities in various development metrics, providing insights into global disparities and patterns.

![Country Clustering on Socio-Economic Factors](country-clustering-on-socio-economic-factor.png)

---

## 🎯 Purpose

The objectives of this project are to:
- Understand global socio-economic and health disparities using clustering.
- Group countries with similar indicators to identify patterns and trends.
- Provide insights for policy-making and targeted developmental programs.
- Practice and enhance clustering techniques using real-world data.

---

## 📂 Dataset

### **Country Dataset**
- **Description**: This dataset contains various socio-economic and health-related metrics for countries worldwide, including child mortality, trade statistics, health expenditure, income levels, inflation, life expectancy, fertility rates, and GDP.
- **Use Cases**: 
  - Exploring correlations between economic indicators and health outcomes.
  - Predictive modeling for development indices.
  - Clustering countries based on socio-economic factors.
  - Trend analysis of economic growth and health expenditure.
  - Visualizing global economic and health disparities.

- **Data Dictionary**:  
  - **country**: Name of the country (categorical).  
  - **child_mort**: Child mortality rate, deaths per 1000 live births (numerical).  
  - **exports**: Exports as a percentage of GDP (numerical).  
  - **health**: Health expenditure as a percentage of GDP (numerical).  
  - **imports**: Imports as a percentage of GDP (numerical).  
  - **income**: Per capita income in USD (numerical).  
  - **inflation**: Inflation rate, annual percentage (numerical).  
  - **life_expec**: Life expectancy in years (numerical).  
  - **total_fer**: Total fertility rate, average number of children per woman (numerical).  
  - **gdpp**: GDP per capita in USD (numerical).

- **File Reference**: [country-data.csv](https://github.com/vmahawar/data-science-datasets-collection/raw/main/country-data.csv)

  ```python
  import pandas as pd

  # URL for the dataset
  url = 'https://github.com/vmahawar/data-science-datasets-collection/raw/main/country-data.csv'

  # Load the dataset
  df = pd.read_csv(url)

  # Print the first 5 rows to verify
  print(df.head())
  ```
---

## 📊 Jupyter Notebook

The notebook documents the entire clustering process, including:
- Data exploration and preprocessing.
- Implementation of clustering algorithms like K-Means or Hierarchical Clustering.
- Evaluation of cluster quality and visualization of clusters.

Access the notebook here: [country-clustering-on-socio-economic-factor.ipynb](./country-clustering-on-socio-economic-factor.ipynb)

---

## 🛠️ Tools and Libraries Used

This project utilizes the following:
- **Pandas**: For data manipulation and preprocessing.
- **Scikit-learn**: For implementing clustering algorithms.
- **Matplotlib & Seaborn**: For creating visualizations and understanding data distributions.
- **Jupyter Notebook**: For interactive development and presentation.

---

## 🌟 Key Learnings

1. **Clustering Analysis**:
   - Gained insights into grouping countries with similar socio-economic profiles.
   - Explored the use of clustering to identify outliers or unique patterns.

2. **Feature Engineering**:
   - Processed and normalized data for better clustering performance.
   - Identified the importance of selecting appropriate features.

3. **Visualization**:
   - Used scatter plots, dendrograms, and cluster maps to interpret results.
   - Enhanced understanding of global patterns through effective visualizations.

---

## 📜 License

This project is licensed under the **MIT License**, allowing free use for educational and non-commercial purposes.

---

## 🌐 Connect with Me

If you'd like to connect, collaborate, or provide feedback, feel free to reach out:

- **LinkedIn**: [Vijay Mahawar](https://www.linkedin.com/in/vijay-mahawar)
- **GitHub**: [vmahawar](https://github.com/vmahawar)
