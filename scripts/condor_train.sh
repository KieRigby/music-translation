#!/usr/bin/env bash
cd ~/FYP/

# Define locations to tools in environment 
conda=../miniconda3/bin/conda
python=../miniconda3/envs/fyp-condor/bin/python
pip=../miniconda3/envs/fyp-condor/bin/pip

cd ../

CODE=src
DATA=../flute-audio-preprocessed/

EXP=flute_19apr
export MASTER_PORT=29500

$python ${CODE}/train.py \
    --data ${DATA} \
    --batch-size 4 \
    --lr-decay 0.995 \
    --epoch-len 1000 \
    --num-workers 5 \
    --lr 1e-3 \
    --seq-len 12000 \
    --d-lambda 1e-2 \
    --expName ${EXP} \
    --latent-d 64 \
    --layers 14 \
    --blocks 4 \
    --data-aug \
    --grad-clip 1 \
    --per-epoch \
    --epochs 100 \
    --checkpoint ~/FYP/codebase/checkpoints/${EXP}/lastmodel_60_rank_0.pth
