#!/usr/bin/env bash
export FLAGS_enable_parallel_graph=1
export FLAGS_sync_nccl_allreduce=1
export CUDA_VISIBLE_DEVICES=3
export FLAGS_fraction_of_gpu_memory_to_use=0.95
TASK_NAME='simnet'
TEST_DATA_PATH=./data/ecom
VOCAB_PATH=./data/term2id.dict
CKPT_PATH=./model_files
TEST_RESULT_PATH=./evaluate/ecom_test_result
TASK_MODE='pairwise'
CONFIG_PATH=./config/bow_pairwise.json
INIT_CHECKPOINT=./model_files/simnet_bow_pairwise_pretrained_model/bow_pairwise

cd ..

python ./run_classifier.py \
    --task_name ${TASK_NAME} \
    --use_cuda false \
    --do_test True \
    --verbose_result True \
    --batch_size 128 \
    --test_data_dir ${TEST_DATA_PATH} \
    --test_result_path ${TEST_RESULT_PATH} \
    --config_path ${CONFIG_PATH} \
    --vocab_path ${VOCAB_PATH} \
    --task_mode ${TASK_MODE} \
    --init_checkpoint ${INIT_CHECKPOINT}
