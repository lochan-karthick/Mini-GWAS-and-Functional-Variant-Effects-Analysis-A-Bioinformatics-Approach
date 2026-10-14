
# GWAS, LD and Functional Variant Analysis

This repository contains shell and R scripts for performing genome-wide association studies (GWAS) and linkage disequilibrium (LD) analysis using PLINK and R. The project examines both dichotomous (binary) and quantitative phenotypes using simulated genetic data.

## Overview

The workflow involves assessing genotype missingness and Hardy-Weinberg equilibrium (HWE), performing association analyses for binary and continuous phenotypes, and using R to explore and visualise the resulting outputs.

## Scripts

| Script | Description |
|---|---|
| `hwe_missingness_analysis.sh` | Performs HWE and genotype missingness analyses using PLINK. |
| `gwas_ld_analysis.sh` | Contains the GWAS and LD analysis workflow for genetic data. |
| `IDCGV_GWAS_Analysis_and_Plotting.R` | Reads PLINK outputs, examines quality control and association results, and generates visualisations. |

## Results

The repository contains PLINK output files organised into separate folders for dichotomous and quantitative phenotypes.

| Folder | Contents |
|---|---|
| `dichotomous_gwas/` | GWAS association results for binary phenotypes. |
| `quantitative_gwas/` | GWAS association results for quantitative phenotypes. |
| `dichotomous_hwe/` | Hardy-Weinberg equilibrium results for binary phenotype analyses. |
| `quantitative_hwe/` | Hardy-Weinberg equilibrium results for quantitative phenotype analyses. |
| `dichotomous_missing/` | Individual-level and variant-level missingness results. |
| `quantitative_missing/` | Individual-level and variant-level missingness results. |

## Requirements

- **PLINK 1.9** for genotype quality control, GWAS, and LD analysis.
- **R** for statistical analysis and visualisation.
- Required R packages include `ggplot2`, `qqman`, and `data.table`.

## Data

The project uses simulated genotype and phenotype data to demonstrate GWAS and LD analysis. The original input datasets are not included in this repository.


## Functional Variant Analysis

As a separate component of the project, an illustrative functional analysis was carried out using the Ensembl Variant Effect Predictor (VEP). Two previously studied variants in the NOD2 gene, associated with Crohn's disease susceptibility, were examined to understand their potential effects on protein function.

| Variant | Consequence | Analysis |
|---|---|---|
| `rs2066844` (R702W) | Missense variant | Evaluated using SIFT, PolyPhen-2 and CADD predictions. |
| `rs2066847` (1007fs) | Frameshift variant | Examined for its predicted loss-of-function consequence. |

Because the GWAS used simulated data, NOD2 was considered as an illustrative candidate gene rather than a locus identified from the GWAS results.

This analysis was performed through the Ensembl VEP web interface and was not part of the automated PLINK and R workflow.

