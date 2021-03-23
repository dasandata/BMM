#!/bin/bash

#PBS -N test-bowtie2
#PBS -l walltime=10:00:00
#PBS -l select=1:ncpus=8:mem=2gb
#PBS -j oe
#PBS -m bae
#PBS -S /bin/bash



module  purge
module  load ohpc

cd $PBS_O_WORKDIR

PROJECT=PBS_job_out_bio 
DATA_DIR="$PWD/$PROJECT/$USER/"$PROJECT"_DATA_"$PBS_JOBID
RESULT_DIR="$PWD/$PROJECT/"$USER"_RESULTS_"$PBS_JOBID

EXAMPLE_REF="/data/program/bowtie2-2.2.4-gnu7/example/reference"
EXAMPLE_INDEX="/data/program/bowtie2-2.2.4-gnu7/example/index"
EXAMPLE_READ="/data/program/bowtie2-2.2.4-gnu7/example/reads"
 

mkdir -p $DATA_DIR $RESULT_DIR

cp $EXAMPLE_REF/lambda_virus.fa $DATA_DIR
cp $EXAMPLE_READ/reads_1.fq $DATA_DIR
cp $EXAMPLE_READ/reads_2.fq $DATA_DIR

cd $DATA_DIR

module load bowtie2 samtools bcftools  htslib sratoolkit STAR/2.6.1c  

bowtie2-build lambda_virus.fa lambda_virus
bowtie2 -p 4 -x lambda_virus -1 reads_1.fq -2 reads_2.fq -S bio.sam
samtools view -bhS bio.sam -o bio.bam

cat $0 >> $RESULT_DIR/README_script_$JOB_ID.txt

qstat $PBS_JOBID -ans

