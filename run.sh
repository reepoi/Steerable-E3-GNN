#!/bin/bash

experiment=$1

if [[ $experiment == "charge" ]]; then
    echo "running nbody (charged particles)..."
    # model: SEGNN
    # dataset: nbody (charged particles)
    # epochs: 10,000 (page 27, last sentence of paragraph under step three)
    # lr (learning rate): 1e-4 (page 27, last sentence of paragraph under step three)
    # weight_decay: 1e-8 (page 27, last sentence of paragraph under step three)
    # batch_size: 100 (page 27, last sentence of paragraph under step three)
    # max_samples: 3000 (parameter in Table C.2)
    # lmax_h (max order of steerable feature vectors): 1 (page 27, first sentence of paragraph under step three: l_f = 1)
    # lmax_attr (max order of steerable attribute vectors): 1 (page 27, first sentence of paragraph under step three: l_a = 1)
    # layers: 4 (page 27, step two)
    # hidden_features: 64 (page 27, step three: "maps to a vector of 64 scalar (type-0; order 0) features")
    # subspace_type: weightbalanced (???)
    # norm: none (page 27, second to last paragraph, second to last sentence)
    python3 main.py \
        --model=segnn \
        --dataset=nbody \
        --epochs=10000 \
        --lr=1e-4 \
        --weight_decay=1e-8 \
        --batch_size=100 \
        --max_samples=3000 \
        --lmax_h=1 \
        --lmax_attr=1 \
        --layers=4 \
        --hidden_features=64 \
        --subspace_type=weightbalanced \
        --norm=none \
        --gpu=0 \
        --log=true
elif [[ $experiment == "gravity" ]]; then
    echo "running nbody (gravity)..."
    # Many parameters are copied from charge (see page 29, last paragraph, last sentence)
    # model: SEGNN
    # dataset: nbody (gravity)
    # epochs: 250 (page 29, second paragraph, second to last sentence)
    # lr (learning rate): 1e-4 (page 27, last sentence of paragraph under step three)
    # weight_decay: 1e-8 (page 27, last sentence of paragraph under step three)
    # batch_size: 100 (page 27, last sentence of paragraph under step three)
    # max_samples: 10000 (parameter in Table C.2; ??? and number of training trajectories? ???)
    # lmax_h (max order of steerable feature vectors): 1 (page 27, first sentence of paragraph under step three: l_f = 1)
    # lmax_attr (max order of steerable attribute vectors): 1 (page 27, first sentence of paragraph under step three: l_a = 1)
    # layers: 4 (page 27, step two)
    # hidden_features: 64 (page 27, step three: "maps to a vector of 64 scalar (type-0; order 0) features")
    # subspace_type: weightbalanced (???)
    # norm: none (page 27, second to last paragraph, second to last sentence)
    # neighbors: 6 (??? default in main.py)
    python3 main.py \
        --model=segnn \
        --dataset=gravity \
        --epochs=250 \
        --lr=1e-4 \
        --weight_decay=1e-8 \
        --max_samples=10000 \
        --lmax_h=1 \
        --lmax_attr=1 \
        --layers=4 \
        --hidden_features=64 \
        --subspace_type=weightbalanced \
        --norm=none \
        --batch_size=100 \
        --neighbours=6 \
        --gpu=0 \
        --target=pos \
        --log=true
elif [[ $experiment == "qm9" ]]; then
    echo "running qm9..."
    echo "experiment settings not yet verified from the paper!"
    exit 1
else
    echo "usage: run.sh EXPERIMENT"
    echo "EXPERIMENT    available experiments are 'charge', 'gravity', and 'qm9'"
    exit 1
fi

