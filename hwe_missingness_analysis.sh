#!/bin/sh

#PBS -l walltime=1:00:00
#PBS -l cput=1:00:00
#PBS -l nodes=1:centos7:ppn=1
#PBS -m abe
#PBS -q bioinf-stud
#PBS -M 3046323R@student.gla.ac.uk

# Set up directories and files
DATA_DIR="/path/to/data"
OUTPUT_DIR="/path/to/output"
GENO_FILE="/path/to/genotype_data"
LOG_FILE="$OUTPUT_DIR/analysis_log.txt"

# Function to run Hardy-Weinberg Equilibrium test for SNPs
run_hwe() {
    echo "Running HWE for 100 SNPs" >> $LOG_FILE
    plink --bfile $GENO_FILE --hwe 1e-6 --out $OUTPUT_DIR/hwe_results
    echo "HWE test completed. Check the results in $OUTPUT_DIR/hwe_results.hwe" >> $LOG_FILE
}

# Function to run Missingness analysis for SNPs and individuals
run_missingness() {
    echo "Running Missingness analysis" >> $LOG_FILE
    plink --bfile $GENO_FILE --missing --out $OUTPUT_DIR/missingness_results
    echo "Missingness analysis completed. Check the results in $OUTPUT_DIR/missingness_results.imiss and missingness_results.lmiss" >> $LOG_FILE
}

# Main script execution
echo "Starting HWE and Missingness analysis at $(date)" > $LOG_FILE

# Run HWE and Missingness analysis
run_hwe
run_missingness

echo "HWE and Missingness analysis completed at $(date)" >> $LOG_FILE
