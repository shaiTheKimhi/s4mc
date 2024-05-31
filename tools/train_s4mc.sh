#!/bin/bash

now=$(date +"%Y%m%d_%H%M%S")
config=configs/pascal.yaml
labeled_id_path=partitions/pascal/1464/labeled.txt
unlabeled_id_path=partitions/pascal/1464/unlabeled.txt
save_path=exp/pascal/1464/s4mc
mkdir -p $save_path
s4mc=1
fixmatch=0
python -m torch.distributed.launch --nproc_per_node=$1 --master_addr=localhost --master_port=$2 s4mc.py --config=$config --labeled-id-path $labeled_id_path --unlabeled-id-path $unlabeled_id_path --save-path $save_path --port $2 2>&1 --s4mc $s4mc --fixmatch $fixmatch | tee $save_path/$now.txt
