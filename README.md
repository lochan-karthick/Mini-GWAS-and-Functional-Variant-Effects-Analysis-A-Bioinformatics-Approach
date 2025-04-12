GWAS and LD Analysis
This repository contains scripts to perform Genome-Wide Association Studies (GWAS) and Linkage Disequilibrium (LD) analysis on genetic data. The analysis covers both dichotomous (binary) and quantitative phenotypes. The script applies filtering based on Hardy-Weinberg Equilibrium (HWE) and missingness results before running the main analyses.

Prerequisites
PLINK: A tool for running GWAS and LD analysis.
(Install PLINK 1.90 from PLINK)

R: Used for p-value adjustment and plotting.
(Install R from R Project)

Make sure to install the necessary R packages:

qqman: For plotting Manhattan plots.

ggplot2: For other visualizations.

Files
gwas_ld_analysis.sh: The main script for running GWAS and LD analysis.

filtered_data_hwe: Genotype data file after HWE and missingness filtering.

pheno_data: The phenotype data for analysis.

output/: The folder where analysis results will be saved.

Data Description
Genotype Data (genotype_data)
Format: PLINK binary format (.bed, .bim, .fam files).

Content: This dataset includes SNP data across simulated individuals. Each row corresponds to an individual, and each column represents a SNP. This data is used as input for both GWAS and LD analysis.

Phenotype Data (pheno_data)
Format: Tab-delimited text file (.txt or .csv).

Content: The phenotype file contains phenotype information for each individual in the genotype dataset. The phenotype can be:

Dichotomous (binary): E.g., 0 for control, 1 for disease.

Quantitative (continuous): E.g., measurements like height, weight, etc.

Simulated Data
The genotype and phenotype data used in this analysis is simulated. The data has been generated for the purpose of demonstrating and testing the GWAS and LD analysis pipeline, and may not reflect real biological data.

Data Preprocessing
HWE Test: SNPs that fail the Hardy-Weinberg equilibrium (p < 1e-6) are excluded.

Missingness Filtering: SNPs with >5% missing data and individuals with >10% missing genotypes are removed.

Data Considerations
Ensure that your dataset has a sufficiently large sample size to detect meaningful associations.

Consider the potential for population stratification in your dataset, which may require additional adjustment.

How to Run
Ensure that your genotype and phenotype data files are ready and in the correct format.

Make the script executable and run it:

For cluster systems, use the provided job submission command.

For local execution, simply run the script.

Output
GWAS Results: The script generates raw GWAS results for both dichotomous and quantitative phenotypes. It also produces Bonferroni-adjusted results for multiple testing correction.

LD Results: The analysis identifies and saves the LD blocks for the SNPs.

