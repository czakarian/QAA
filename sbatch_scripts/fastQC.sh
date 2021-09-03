#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --nodes=1
#SBATCH --time=0-04:00:00

# input files
file1="/projects/bgmp/shared/2017_sequencing/demultiplexed/10_2G_both_S8_L008_R1_001.fastq.gz"
file2="/projects/bgmp/shared/2017_sequencing/demultiplexed/10_2G_both_S8_L008_R2_001.fastq.gz"
file3="/projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R1_001.fastq.gz"
file4="/projects/bgmp/shared/2017_sequencing/demultiplexed/31_4F_fox_S22_L008_R2_001.fastq.gz"

# output dir
d="/projects/bgmp/czakari2/bioinformatics/Bi623/ass/QAA/fastQC_output"

mkdir $d

conda activate bgmp_py39
module load fastqc/0.11.5

/usr/bin/time -v fastqc $file1 $file2 $file3 $file4 -o $d
