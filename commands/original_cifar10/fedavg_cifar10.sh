#!/bin/sh

# FedAvg experiments in Figure 4, 9 of (McMahan et al., 2016)
## IID split
CUDA_VISIBLE_DEVICES=2 python3 main.py \
    --exp_name FedAvg_CIFAR10_CNN_IID --seed 42 --device cuda \
    --dataset TinyImageNet \
    --split_type iid --test_fraction 0 \
    --model_name ResNet18 --resize 64 --randhf 0.5 --randjit 0.5 --hidden_size 64 \
    --algorithm fedavg --eval_fraction 1 --eval_type both --eval_every 10 --eval_metrics acc1 acc5 \
    --K 100 --R 5000 --E 5 --C 0.1 --B 50 --beta 0 \
    --optimizer SGD --lr 0.01 --lr_decay 0.999 --lr_decay_step 1 --criterion CrossEntropyLoss

# ## Pathological Non-IID split
# python3 main.py \
#     --exp_name FedAvg_CIFAR10_CNN_Patho --seed 42 --device cuda \
#     --dataset CIFAR10 \
#     --split_type patho --test_fraction 0 \
#     --model_name TwoCNN --resize 24 --randhf 0.5 --randjit 0.5 --hidden_size 32 \
#     --algorithm fedavg --eval_type both --eval_every 1 --eval_metrics acc1 acc5 \
#     --K 100 --R 5000 --E 5 --C 0.1 --B 50 --beta 0 \
#     --optimizer SGD --lr 0.01 --lr_decay 0.9999 --lr_decay_step 1 --criterion CrossEntropyLoss
