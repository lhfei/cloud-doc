



```shell
python interact.py --model_checkpoint ../CDial-GPT_LCCC-large --min_length 10 --max_length 2000


python interact.py --model_checkpoint D:\Workspaces\GPT\CDial-GPT_LCCC-large --min_length 10 --max_length 2000



python infer.py --model_checkpoint ../CDial-GPT_LCCC-large --datapath data/STC_test.json --out_path STC_result.txt
```



Train

> GPU

```shell
python -m torch.distributed.launch --nproc_per_node=4 train.py --pretrained --model_checkpoint ../CDial-GPT_LCCC-large --data_path data/tax_train.json --scheduler linear  # 以分布式的方式在4块GPU上训练
```



> CPU

```shell
python train.py --pretrained --model_checkpoint ../CDial-GPT_LCCC-large --train_path data/tax_train.json --scheduler linear
```


