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
Format: PLINK binary format (files: .bed, .bim, .fam).

Contains genetic data for individuals, with SNPs as features.

Phenotype Data (pheno_data)
Format: Tab-delimited text file.

Includes individual IDs and corresponding phenotype values.

Dichotomous traits (e.g., disease vs. control).

Quantitative traits (e.g., height, weight).

Preprocessing
SNPs that fail the HWE test (p < 1e-6) and those with high missingness (>5% for SNPs, >10% for individuals) are removed before running the analysis.

How to Run
Ensure that your genotype and phenotype data files are ready and in the correct format.

Make the script executable and run it:

For cluster systems, use the provided job submission command.

For local execution, simply run the script.

Output
GWAS Results: The script generates raw GWAS results for both dichotomous and quantitative phenotypes. It also produces Bonferroni-adjusted results for multiple testing correction.

LD Results: The analysis identifies and saves the LD blocks for the SNPs.

