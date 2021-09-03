#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=0-04:00:00

# input files
file1="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R1_001_AT.fastq.gz"
file2="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R2_001_AT.fastq.gz"
file3="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R1_001_AT.fastq.gz"
file4="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R2_001_AT.fastq.gz"

# output files to contain kept reads
o1_k="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R1_001_AT_Trk.fastq.gz"
o2_k="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R2_001_AT_Trk.fastq.gz"
o3_k="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R1_001_AT_Trk.fastq.gz"
o4_k="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R2_001_AT_Trk.fastq.gz"

# output files to contain orphaned reads
o1_o="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R1_001_AT_Tro.fastq.gz"
o2_o="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/10_2G_both_S8_L008_R2_001_AT_Tro.fastq.gz"
o3_o="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R1_001_AT_Tro.fastq.gz"
o4_o="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/31_4F_fox_S22_L008_R2_001_AT_Tro.fastq.gz"

conda activate QAA

/usr/bin/time -v trimmomatic PE \
-threads 8 $file3 $file4 $o3_k $o3_o $o4_k $o4_o \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:5:15 \
MINLEN:35

/usr/bin/time -v trimmomatic PE \
-threads 8 $file1 $file2 $o1_k $o1_o $o2_k $o2_o \
LEADING:3 \
TRAILING:3 \
SLIDINGWINDOW:5:15 \
MINLEN:35
