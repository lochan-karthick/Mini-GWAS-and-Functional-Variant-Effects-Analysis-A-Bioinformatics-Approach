#!/bin/sh

#PBS -l walltime=1:00:00
#PBS -l cput=1:00:00
#PBS -l nodes=1:centos7:ppn=1
#PBS -m abe
#PBS -q bioinf-stud
#PBS -M 3046323R@student.gla.ac.uk

#Seting up directories and files
DATA_DIR="/path/to/data"
OUTPUT_DIR="/path/to/output"
PHENO_FILE="/path/to/pheno_data"
GENO_FILE="/path/to/filtered_data_hwe" #Use filtered data after HWE and missingness
LOG_FILE="$OUTPUT_DIR/analysis_log.txt"

#Function to run GWAS for a dichotomous phenotype
run_gwas_dichotomous() {
    echo "Running GWAS for dichotomous phenotype" >> $LOG_FILE
    plink --bfile $GENO_FILE --assoc --pheno $PHENO_FILE --out $OUTPUT_DIR/gwas_dichotomous
    echo "GWAS for dichotomous phenotype completed" >> $LOG_FILE
}

#Function to run GWAS for a quantitative phenotype
run_gwas_quantitative() {
    echo "Running GWAS for quantitative phenotype" >> $LOG_FILE
    plink --bfile $GENO_FILE --assoc --pheno $PHENO_FILE --out $OUTPUT_DIR/gwas_quantitative
    echo "GWAS for quantitative phenotype completed" >> $LOG_FILE
}

#Function to adjust for multiple testing using Bonferroni correction
adjust_for_multiple_testing() {
    echo "Adjusting p-values for multiple testing" >> $LOG_FILE
    Rscript -e "results <- read.table('$OUTPUT_DIR/gwas_dichotomous.assoc', header = TRUE); results\$p <- p.adjust(results\$P, method = 'bonferroni'); write.table(results, '$OUTPUT_DIR/gwas_dichotomous_adjusted.txt', row.names = FALSE, quote = FALSE)" 
    echo "Multiple testing correction completed" >> $LOG_FILE
}

#Function to run Linkage Disequilibrium (LD) analysis for SNPs
run_ld_analysis() {
    echo "Running LD analysis" >> $LOG_FILE
    plink --bfile $GENO_FILE --blocks --out $OUTPUT_DIR/ld_results
    echo "LD analysis completed" >> $LOG_FILE
}

#Main script execution
echo "Starting GWAS and LD analysis at $(date)" > $LOG_FILE

#Run GWAS for dichotomous and quantitative phenotypes
run_gwas_dichotomous
run_gwas_quantitative

#Apply multiple testing correction for GWAS results
adjust_for_multiple_testing

#Run LD analysis after GWAS
run_ld_analysis

echo "GWAS and LD analysis completed at $(date)" >> $LOG_FILE
