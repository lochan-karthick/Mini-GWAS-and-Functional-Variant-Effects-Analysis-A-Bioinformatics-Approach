#loading libraries:
library(qqman)
library(ggplot2)
library(reshape2)
library(data.table)

#for dichotomous

#for missingness in dichotomous chr1:
imiss_dichotomous_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr1/dichotomous_missing/missing_output.imiss", header = TRUE)
head(imiss_dichotomous_chr1)
hist(imiss_dichotomous_chr1$F_MISS, breaks = 20, col = "skyblue",
     main = "Distribution of Individual Missingness",
     xlab = "Proportion of Missing Genotypes")

lmiss_dichotomous_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr1/dichotomous_missing/missing_output.lmiss", header = TRUE)
head(lmiss_dichotomous_chr1)
hist(lmiss_dichotomous_chr1$F_MISS, breaks = 20, col = "salmon",
     main = "Distribution of SNP Missingness",
     xlab = "Proportion of Missing Genotypes per SNP")

#for hardy in dichotomous chr1:
hwe_dichotomous_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr1/dichotomous_hwe/hardy_output_chr1.hwe", header = TRUE)
head(hwe_dichotomous_chr1)
hist(hwe_dichotomous_chr1$P, breaks = 50, col = "orchid",
     main = "Distribution of HWE p-values",
     xlab = "HWE p-value")

#for missingness in dichotomous chr2:
imiss_dichotomous_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr2/dichotomous_missing/missing_output_chr2.imiss", header = TRUE)
head(imiss_dichotomous_chr2)
hist(imiss_dichotomous_chr2$F_MISS, breaks = 20, col = "skyblue",
     main = "Distribution of Individual Missingness",
     xlab = "Proportion of Missing Genotypes")

lmiss_dichotomous_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr2/dichotomous_missing/missing_output_chr2.lmiss", header = TRUE)
head(lmiss_dichotomous_chr2)
hist(lmiss_dichotomous_chr2$F_MISS, breaks = 20, col = "salmon",
     main = "Distribution of SNP Missingness",
     xlab = "Proportion of Missing Genotypes per SNP")

#for hardy in dichotomous chr2:
hwe_dichotomous_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr2/dichotomous_hwe/hardy_output_chr2.hwe", header = TRUE)
head(hwe_dichotomous_chr2)
hist(hwe_dichotomous_chr2$P, breaks = 50, col = "orchid",
     main = "Distribution of HWE p-values",
     xlab = "HWE p-value")



#for quantitative

#for missingness in quantitative chr1:
imiss_quantitative_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr1/quantitative_missing/missing_output_chr1.imiss", header = TRUE)
head(imiss_quantitative_chr1)
hist(imiss_quantitative_chr1$F_MISS, breaks = 20, col = "skyblue",
     main = "Distribution of Individual Missingness",
     xlab = "Proportion of Missing Genotypes")

lmiss_quantitative_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr1/quantitative_missing/missing_output_chr1.lmiss", header = TRUE)
head(lmiss_quantitative_chr1)
hist(lmiss_quantitative_chr1$F_MISS, breaks = 20, col = "salmon",
     main = "Distribution of SNP Missingness",
     xlab = "Proportion of Missing Genotypes per SNP")

#for hardy in quantitative chr1:
hwe_quantitative_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr1/quantitative_hwe/hardy_output_chr1.hwe", header = TRUE)
head(hwe_quantitative_chr1)
hist(hwe_quantitative_chr1$P, breaks = 50, col = "orchid",
     main = "Distribution of HWE p-values",
     xlab = "HWE p-value")

#for missingness in quantitative chr2:
imiss_quantitative_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr2/quantitative_missing/missing_output_chr2.imiss", header = TRUE)
head(imiss_quantitative_chr2)
hist(imiss_quantitative_chr2$F_MISS, breaks = 20, col = "skyblue",
     main = "Distribution of Individual Missingness",
     xlab = "Proportion of Missing Genotypes")

lmiss_quantitative_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr2/quantitative_missing/missing_output_chr2.lmiss", header = TRUE)
head(lmiss_quantitative_chr2)
hist(lmiss_quantitative_chr2$F_MISS, breaks = 20, col = "salmon",
     main = "Distribution of SNP Missingness",
     xlab = "Proportion of Missing Genotypes per SNP")

#for hardy in quantitative chr2:
hwe_quantitative_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr2/quantitative_hwe/hardy_output_chr2.hwe", header = TRUE)
head(hwe_quantitative_chr2)
hist(hwe_quantitative_chr2$P, breaks = 50, col = "orchid",
     main = "Distribution of HWE p-values",
     xlab = "HWE p-value")


#working with dichotomous gwas results:

#For chr1:

#loading the table
gwas_dichotomous_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr1/dichotomous_gwas/gwas_results_chr1.assoc.logistic",
                                   header = TRUE)

#understanding table struct:
str(gwas_dichotomous_chr1)
head(gwas_dichotomous_chr1)

#filtering
significant_hits_dichot_chr1 = subset(gwas_dichotomous_chr1, P < 5e-8)

#printing the number of sig hits and the sig hits:
cat("Number of genome-wide sig hits:", nrow(significant_hits_dichot_chr1),"\n" )
print(significant_hits_dichot_chr1)

#saving the sig hits in a table:
write.table(significant_hits_dichot_chr1, "dichot_chr1_sig_hits_adjusted.txt", 
            row.names = TRUE, 
            quote = FALSE, 
            sep = "t")

#plotting manhattan and qq:

qq(gwas_dichotomous_chr1$P, main = "Plot for GWAS RESULTS dichotomous chr1")
manhattan(gwas_dichotomous_chr1, chr = "CHR", bp = "BP", p = "P", snp = "SNP",
          main = "Manhattan Plot for GWAS Results (dichot_Chromosome 1)",
          genomewideline = -log10(5e-8), suggestiveline = -log10(1e-5))


#For chr2:

#loading the table
gwas_dichotomous_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/dichotomous_chr2/dichotomous_gwas/gwas_results_chr2.assoc.logistic",
                                   header = TRUE)

#understanding table struct:
str(gwas_dichotomous_chr2)
head(gwas_dichotomous_chr2)

#filtering
significant_hits_dichot_chr2 = subset(gwas_dichotomous_chr2, P < 5e-8)

#printing the number of sig hits and the sig hits:
cat("Number of genome-wide sig hits:", nrow(significant_hits_dichot_chr2),"\n" )
print(significant_hits_dichot_chr2)

#saving the sig hits in a table:
write.table(significant_hits_dichot_chr2, "dichot_chr2_sig_hits_adjusted.txt", 
            row.names = TRUE, 
            quote = FALSE, 
            sep = "t")

#plotting manhattan and qq:

qq(gwas_dichotomous_chr2$P, main = "Plot for GWAS RESULTS dichotomous chr2")
manhattan(gwas_dichotomous_chr2, chr = "CHR", bp = "BP", p = "P", snp = "SNP",
          main = "Manhattan Plot for GWAS Results (dichot_Chromosome 2)",
          genomewideline = -log10(5e-8), suggestiveline = -log10(1e-5))



#working with quantitative gwas results:

#For chr1:

#loading the table
gwas_quantitative_chr1 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr1/quantitative_gwas/gwas_results_chr1.assoc.linear",
                                   header = TRUE)

#understanding table struct:
str(gwas_quantitative_chr1)
head(gwas_quantitative_chr1)

#filtering
significant_hits_quant_chr1 = subset(gwas_quantitative_chr1, P < 5e-8)

#printing the number of sig hits and the sig hits:
cat("Number of genome-wide sig hits:", nrow(significant_hits_quant_chr1),"\n" )
print(significant_hits_quant_chr1)

#saving the sig hits in a table:
write.table(significant_hits_quant_chr1, "quant_chr1_sig_hits_adjusted.txt", 
            row.names = TRUE, 
            quote = FALSE, 
            sep = "t")

#plotting manhattan and qq:

qq(gwas_quantitative_chr1$P, main = "Plot for GWAS RESULTS quantitative chr1")
manhattan(gwas_quantitative_chr1, chr = "CHR", bp = "BP", p = "P", snp = "SNP",
          main = "Manhattan Plot for GWAS Results (quant_Chromosome 1)",
          genomewideline = -log10(5e-8), suggestiveline = -log10(1e-5))


#For chr2:

#loading the table
gwas_quantitative_chr2 = read.table("/Users/lochan.karthick/Desktop/IDCGV_assessment/IDCGV_assessment/quantitative_chr2/quantitative_gwas/gwas_results_chr2.assoc.linear",
                                   header = TRUE)

#understanding table struct:
str(gwas_quantitative_chr2)
head(gwas_quantitative_chr2)

#filtering
significant_hits_quant_chr2 = subset(gwas_quantitative_chr2, P < 5e-8)

#printing the number of sig hits and the sig hits:
cat("Number of genome-wide sig hits:", nrow(significant_hits_quant_chr2),"\n" )
print(significant_hits_quant_chr2)

#saving the sig hits in a table:
write.table(significant_hits_quant_chr2, "quant_chr2_sig_hits_adjusted.txt", 
            row.names = TRUE, 
            quote = FALSE, 
            sep = "t")

#plotting manhattan and qq:

qq(gwas_quantitative_chr2$P, main = "Plot for GWAS RESULTS quantitative chr2")
manhattan(gwas_quantitative_chr2, chr = "CHR", bp = "BP", p = "P", snp = "SNP",
          main = "Manhattan Plot for GWAS Results (quant_Chromosome 2)",
          genomewideline = -log10(5e-8), suggestiveline = -log10(1e-5))



