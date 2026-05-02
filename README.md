# 🧬 Isoform Switch Dashboard (Shiny App)

## 🔬 Project Overview
This project is an interactive Shiny dashboard for exploring **isoform switching** patterns in gene expression data. It enables visualization of transcript-level changes across biological conditions to better understand alternative splicing events.

---

## 🧠 Biological Motivation
Genes can produce multiple transcript isoforms through alternative splicing.  
Changes in the relative usage of these isoforms (isoform switching) can:

- Alter protein function
- Affect disease mechanisms
- Influence cellular response to conditions

This project helps explore these changes at an isoform level.

---

## 📊 Key Features
- Interactive exploration of isoform expression data
- Calculation of Isoform Fraction (IF)
- Condition-wise comparison of gene isoforms
- Visualizations using ggplot2
- Simple and responsive Shiny interface

---

## ⚙️ Methodology

### 1. Data Processing
Expression values are grouped by gene and condition.

### 2. Isoform Fraction (IF)
For each isoform:

\[
IF = \frac{expression}{\sum expression\ of\ all\ isoforms\ in\ a\ gene}
\]

### 3. Visualization
- Bar plots / line plots (depending on UI)
- Condition-based comparison

---

## 🛠 Tech Stack
- R
- Shiny
- dplyr
- ggplot2

---

## 📁 Project Structure
- `app.R` → Main Shiny application
- `mock_isoform_switch_data.csv` → Sample dataset
- `IsoformSwitchAnalyzeR_shiny_dashboard.Rmd` → Analysis report
- `.gitignore` → Excludes system files

---

## 🚀 Live Application
Try the dashboard here:  
👉 https://riyaggarwal30.shinyapps.io/isoform-switch-dashboard/

---
## 📸 Dashboard Preview
![Dashboard Screenshot](screenshot.png)

## ▶️ How to Run Locally
```r
shiny::runApp()