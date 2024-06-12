#!/bin/bash
#SBATCH --ntasks-per-node=16


srun --exclusive --ntasks 1 -t 5-0 Rscript main.R &  

wait 