

```ini
INFO:transformers.configuration_utils:loading configuration file ../CDial-GPT_LCCC-large/config.json
INFO:transformers.configuration_utils:Model config {
  "afn": "gelu",
  "attn_pdrop": 0.1,
  "embd_pdrop": 0.1,
  "finetuning_task": null,
  "id2label": {
    "0": "LABEL_0",
    "1": "LABEL_1"
  },
  "initializer_range": 0.02,
  "is_decoder": false,
  "label2id": {
    "LABEL_0": 0,
    "LABEL_1": 1
  },
  "layer_norm_epsilon": 1e-05,
  "n_ctx": 512,
  "n_embd": 768,
  "n_head": 12,
  "n_layer": 12,
  "n_positions": 513,
  "n_special": 0,
  "num_labels": 2,
  "output_attentions": false,
  "output_hidden_states": false,
  "output_past": true,
  "predict_special_tokens": true,
  "pruned_heads": {},
  "resid_pdrop": 0.1,
  "summary_activation": null,
  "summary_first_dropout": 0.1,
  "summary_proj_to_labels": true,
  "summary_type": "cls_index",
  "summary_use_proj": true,
  "torchscript": false,
  "use_bfloat16": false,
  "vocab_size": 13088
}

INFO:transformers.modeling_utils:loading weights file ../CDial-GPT_LCCC-large/pytorch_model.bin
Traceback (most recent call last):
  File "train.py", line 237, in <module>
    train()
  File "train.py", line 110, in train
    model.to(args.device)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/nn/modules/module.py", line 989, in to
    return self._apply(convert)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/nn/modules/module.py", line 641, in _apply
    module._apply(fn)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/nn/modules/module.py", line 641, in _apply
    module._apply(fn)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/nn/modules/module.py", line 664, in _apply
    param_applied = fn(param)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/nn/modules/module.py", line 987, in convert
    return t.to(device, dtype if t.is_floating_point() or t.is_complex() else None, non_blocking)
torch.cuda.OutOfMemoryError: CUDA out of memory. Tried to allocate 40.00 MiB (GPU 0; 15.78 GiB total capacity; 0 bytes already allocated; 5.94 MiB free; 0 bytes reserved in total by PyTorch) If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.  See documentation for Memory Management and PYTORCH_CUDA_ALLOC_CONF
Traceback (most recent call last):
  File "train.py", line 237, in <module>
    train()
  File "train.py", line 116, in train
    train_loader, val_loader, train_sampler, valid_sampler = loader_class(args, tokenizer, logger)
  File "/export/app_workspaces/CDial-GPT/od/inputters/inputter.py", line 48, in build_dataloaders
    train_dataset, valid_dataset = WBDataset(datasets["train"], tokenizer), WBDataset(datasets["valid"], tokenizer)
KeyError: 'valid'
Traceback (most recent call last):
  File "train.py", line 237, in <module>
    train()
  File "train.py", line 116, in train
    train_loader, val_loader, train_sampler, valid_sampler = loader_class(args, tokenizer, logger)
  File "/export/app_workspaces/CDial-GPT/od/inputters/inputter.py", line 48, in build_dataloaders
    train_dataset, valid_dataset = WBDataset(datasets["train"], tokenizer), WBDataset(datasets["valid"], tokenizer)
KeyError: 'valid'
Traceback (most recent call last):
  File "train.py", line 237, in <module>
    train()
  File "train.py", line 116, in train
    train_loader, val_loader, train_sampler, valid_sampler = loader_class(args, tokenizer, logger)
  File "/export/app_workspaces/CDial-GPT/od/inputters/inputter.py", line 48, in build_dataloaders
    train_dataset, valid_dataset = WBDataset(datasets["train"], tokenizer), WBDataset(datasets["valid"], tokenizer)
KeyError: 'valid'
ERROR:torch.distributed.elastic.multiprocessing.api:failed (exitcode: 1) local_rank: 0 (pid: 2823) of binary: /root/miniconda3/envs/myconda/bin/python
Traceback (most recent call last):
  File "/root/miniconda3/envs/myconda/lib/python3.8/runpy.py", line 194, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/root/miniconda3/envs/myconda/lib/python3.8/runpy.py", line 87, in _run_code
    exec(code, run_globals)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/distributed/launch.py", line 195, in <module>
    main()
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/distributed/launch.py", line 191, in main
    launch(args)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/distributed/launch.py", line 176, in launch
    run(args)
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/distributed/run.py", line 753, in run
    elastic_launch(
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/distributed/launcher/api.py", line 132, in __call__
    return launch_agent(self._config, self._entrypoint, list(args))
  File "/root/miniconda3/envs/myconda/lib/python3.8/site-packages/torch/distributed/launcher/api.py", line 246, in launch_agent
    raise ChildFailedError(
torch.distributed.elastic.multiprocessing.errors.ChildFailedError: 
============================================================
train.py FAILED
------------------------------------------------------------
Failures:
[1]:
  time      : 2023-03-20_03:58:00
  host      : qKQBdr
  rank      : 1 (local_rank: 1)
  exitcode  : 1 (pid: 2824)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
[2]:
  time      : 2023-03-20_03:58:00
  host      : qKQBdr
  rank      : 2 (local_rank: 2)
  exitcode  : 1 (pid: 2825)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
[3]:
  time      : 2023-03-20_03:58:00
  host      : qKQBdr
  rank      : 3 (local_rank: 3)
  exitcode  : 1 (pid: 2826)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
------------------------------------------------------------
Root Cause (first observed failure):
[0]:
  time      : 2023-03-20_03:58:00
  host      : qKQBdr
  rank      : 0 (local_rank: 0)
  exitcode  : 1 (pid: 2823)
  error_file: <N/A>
  traceback : To enable traceback see: https://pytorch.org/docs/stable/elastic/errors.html
============================================================
```

