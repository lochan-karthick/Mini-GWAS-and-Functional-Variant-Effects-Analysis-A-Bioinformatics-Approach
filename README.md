This repository contains scripts for performing Genome-Wide Association Studies (GWAS) and Linkage Disequilibrium (LD) analysis on genotype data. The scripts are designed to analyze both dichotomous (binary) and quantitative phenotypes, with the ability to apply data filtering based on Hardy-Weinberg Equilibrium (HWE) and missingness results before running GWAS and LD analysis.

Prerequisites
Before running the scripts, make sure you have the following tools installed:

PLINK: A popular tool for GWAS and related genetic analyses.

Installation: PLINK 1.90

R: Used for p-value adjustment and plotting.

Installation: R Project

Required R Packages:

qqman: For plotting Manhattan plots.

ggplot2: For additional visualization if needed.

File Structure
gwas_ld_analysis.sh: Bash script that runs GWAS for dichotomous and quantitative phenotypes and performs Linkage Disequilibrium (LD) analysis. It also adjusts p-values using the Bonferroni method.

filtered_data_hwe: Genotype data file that has been filtered for HWE and missingness (used as input for GWAS and LD analysis).

pheno_data: Phenotype data file (used for both dichotomous and quantitative analysis).

output/: Directory for storing analysis results, including GWAS results and LD blocks.

Usage
1. Prepare Data Files
Genotype data: Ensure you have your genotype data in PLINK binary format (.bed, .bim, .fam files).

Phenotype data: Prepare a phenotype file with the appropriate data for dichotomous or quantitative analysis.

2. Run the Script
After preparing your data files, you can run the analysis by executing the bash script gwas_ld_analysis.sh.

3. Output Files
The script generates the following output files in the output/ directory:

GWAS results:

gwas_dichotomous.assoc: GWAS results for the dichotomous phenotype.

gwas_quantitative.assoc: GWAS results for the quantitative phenotype.

gwas_dichotomous_adjusted.txt: GWAS results with p-value correction using the Bonferroni method.

LD analysis results:

ld_results.blocks: Linkage disequilibrium blocks for the filtered genotype data.

4. Post-Processing
Once the script has completed:

You can check the GWAS results for significant SNPs.

The LD analysis will identify linked SNPs and their respective blocks.

For visualization, use R to generate plots (e.g., Manhattan plots, QQ plots) to interpret the GWAS results.
