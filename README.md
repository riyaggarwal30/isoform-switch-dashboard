# 🧬 Isoform Switch Explorer

> An interactive R Shiny dashboard for visualizing transcript-level isoform switching events across biological conditions — built to support alternative splicing research and functional genomics analysis.

[![Live App](https://img.shields.io/badge/🚀%20Live%20App-shinyapps.io-blue?style=flat-square)](https://riyaggarwal30.shinyapps.io/isoform-switch-dashboard/)
[![R](https://img.shields.io/badge/R-%3E%3D4.0-276DC3?style=flat-square&logo=r)](https://www.r-project.org/)
[![Shiny](https://img.shields.io/badge/Shiny-interactive-ff4b6e?style=flat-square)](https://shiny.posit.co/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## 📌 Overview

Genes produce multiple transcript isoforms through **alternative splicing**. When the relative usage of these isoforms shifts between conditions — a phenomenon known as **isoform switching** — it can fundamentally alter protein function, drive disease mechanisms, and modulate cellular behaviour.

This dashboard enables researchers to:
- **Upload** transcript-level expression data (CSV format)
- **Visualise** isoform fraction changes across conditions interactively
- **Annotate** isoforms with functional domain and CDS length information
- **Compare** isoform composition per gene in both line and bar chart views

---

## 🖥️ Live Demo

Try the deployed dashboard here: **[https://riyaggarwal30.shinyapps.io/isoform-switch-dashboard/](https://riyaggarwal30.shinyapps.io/isoform-switch-dashboard/)**

---

## ✨ Key Features

| Feature | Description |
|:--|:--|
| 🔬 **Switch Plot** | Line plot showing isoform fraction (IF) trajectories across conditions per gene |
| 📊 **Composition Plot** | Stacked bar chart displaying isoform usage proportions |
| 🧾 **Functional Annotation** | Table of protein domains and CDS lengths per isoform |
| 📝 **Summary Panel** | Concise text summary of switching events for the selected gene |
| 🎛️ **Gene Selector** | Dropdown to interactively explore any gene in the dataset |

---

## ⚙️ Methodology

### Isoform Fraction (IF) Calculation

For a gene $G$ with $n$ isoforms, the **Isoform Fraction** for isoform $i$ in a given condition is:

$$IF_i = \frac{E_i}{\displaystyle\sum_{j=1}^{n} E_j}$$

where $E$ is the expression value (TPM or FPKM). This normalises expression within each gene, making cross-condition comparisons of isoform usage directly interpretable.

### Workflow

1. **Input** — User uploads a `.csv` with gene, isoform, condition, and expression columns
2. **Processing** — IF is computed per gene per condition using `dplyr`
3. **Visualisation** — Interactive plots rendered via `ggplot2` in a reactive Shiny UI
4. **Annotation** — Functional metadata (protein domains, CDS length) merged and displayed per isoform

---

## 📂 Data Format

The dashboard expects a `.csv` file with the following structure:

| Column | Type | Description |
|:--|:--|:--|
| `gene` | Character | Parent gene identifier (e.g., `TP53`, `BRCA1`) |
| `isoform` | Character | Transcript identifier (e.g., `TP53_1`) |
| `condition` | Character | Experimental group (e.g., `control`, `disease`) |
| `expression` | Numeric | Quantified abundance (TPM or FPKM) |
| `IF` | Numeric | Pre-computed isoform fraction (optional if computed upstream) |

A mock dataset (`mock_isoform_switch_data.csv`) covering TP53, BRCA1, and EGFR is included for testing.

---

## 🗂️ Project Structure

```
isoform-switch-dashboard/
├── app.R                                    # Main Shiny application (UI + server)
├── mock_isoform_switch_data.csv             # Sample dataset (TP53, BRCA1, EGFR)
├── IsoformSwitchAnalyzeR_shiny_dashboard.Rmd  # Extended analysis report (R Markdown)
└── README.md
```

---

## 🚀 Run Locally

### Prerequisites

Install R (≥ 4.0) and the required packages:

```r
install.packages(c("shiny", "ggplot2", "dplyr", "tidyr", "shinythemes"))
```

### Launch

```r
# From the project directory
shiny::runApp()
```

Or open `app.R` in RStudio and click **Run App**.

---

## 🛠️ Tech Stack

- **R** — Core language
- **Shiny** — Reactive web application framework
- **ggplot2** — Data visualisation
- **dplyr** — Data manipulation and transformation
- **R Markdown** — Supplementary analysis report

---

## 🧪 Example Genes (Mock Data)

| Gene | Isoforms | Notable Switch |
|:--|:--|:--|
| `TP53` | TP53_1, TP53_2, TP53_3 | TP53_1 drops from 77% → 23% in disease |
| `BRCA1` | BRCA1_1, BRCA1_2 | BRCA1_2 rises from 33% → 83% in disease |
| `EGFR` | EGFR_1, EGFR_2, EGFR_3 | EGFR_2 dominant isoform in disease condition |

---

## 🔭 Future Improvements

- [ ] File upload UI (dynamic data input)
- [ ] Statistical significance testing for isoform switches (e.g., DEXSeq integration)
- [ ] Download plots as PNG/SVG
- [ ] Integration with real IsoformSwitchAnalyzeR output format
- [ ] Multi-gene comparison view

---

## 👩‍💻 Author

**Riya Aggarwal**  
[GitHub](https://github.com/riyaggarwal30) · [shinyapps.io](https://riyaggarwal30.shinyapps.io/isoform-switch-dashboard/)