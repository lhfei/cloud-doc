### Transformer

1. checkout `transformer`

   ```shell
   git clone https://github.com/huggingface/transformers.git
   ```

   

2. checkout `LLaMa` model

   ```shell
   git lfs install
   git clone https://huggingface.co/ziqingyang/chinese-alpaca-lora-13b
   ```

   ```shell
   git lfs install
   git clone https://huggingface.co/huggyllama/llama-7b
   ```

   ```ini
   ./
   ├── 7B
   │   ├── config.json
   │   ├── generation_config.json
   │   ├── LICENSE
   │   ├── model-00001-of-00002.safetensors
   │   ├── model-00002-of-00002.safetensors
   │   ├── model.safetensors.index.json
   │   ├── pytorch_model-00001-of-00002.bin
   │   ├── pytorch_model-00002-of-00002.bin
   │   ├── pytorch_model.bin.index.json
   │   ├── README.md
   │   ├── special_tokens_map.json
   │   ├── tokenizer_config.json
   │   └── tokenizer.json
   └── tokenizer.model
   ```

   There is a problem with the above operation, and no solution has been found yet.

   

   ```shell
   cd Chinese-LLaMA-Alpaca
   
   python ./scripts/merge_llama_with_chinese_lora_low_mem.py \
       --base_model '../llama-7b-hf-transformers-4.29' \
       --lora_model '../chinese-alpaca-lora-7b' \
       --output_type pth \
       --output_dir ../alpaca-7b-combined
   ```

   ```ini
   ls -ahl alpaca-7b-combined/
   total 13G
   drwxr-xr-x  2 root root 4.0K Jun 23 00:01 .
   drwxr-xr-x 15 root root 4.0K Jun 22 23:55 ..
   -rw-r--r--  1 root root  13G Jun 23 00:01 consolidated.00.pth
   -rw-r--r--  1 root root  101 Jun 22 23:58 params.json
   -rw-r--r--  1 root root   96 Jun 22 23:58 special_tokens_map.json
   -rw-r--r--  1 root root  727 Jun 22 23:58 tokenizer_config.json
   -rw-r--r--  1 root root 741K Jun 22 23:58 tokenizer.model
   ```

   

   > check sha256sum

   ```shell
   sha256sum alpaca-7b-combined/consolidated.*.pth
   ```

   

   ```ini
   fbfccc91183169842aac8d093379f0a449b5a26c5ee7a298baf0d556f1499b90  alpaca-7b-combined/consolidated.00.pth
   ```

   

   

3. Convert `LLaMa` to `HF`

   Adjust the file directory structure in the `alpaca-7b-combined` folder:

   

   ```shell
   cd alpaca-7b-combined
   mkdir 7B
   mv ./* 7B/
   mv 7B/tokenizer.model ./
   ```

   then verify it:

   ```ini
   tree ./
   ./
   ├── 7B
   │   ├── consolidated.00.pth
   │   ├── params.json
   │   ├── special_tokens_map.json
   │   └── tokenizer_config.json
   └── tokenizer.model
   ```

   

   ```shell
   cd transformers
   
   python src/transformers/models/llama/convert_llama_weights_to_hf.py \
       --input_dir ../alpaca-7b-combined \
       --model_size 7B \
       --output_dir ../alpaca-7b-combined-hf
   ```

   

   and the log as below:

   ```ini
   Fetching all parameters from the checkpoint at ../alpaca-7b-combined/7B.
   Loading the checkpoint in a Llama model.
   Loading checkpoint shards: 100%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 33/33 [01:00<00:00,  1.84s/it]
   Saving in the Transformers format.
   Saving a LlamaTokenizerFast to ../alpaca-7b-combined-hf.
   
   ```

   

   check result:

   ```shell
   cd ../alpaca-7b-combined-hf & du -ah ./
   
   744K    ./tokenizer.model
   28K     ./pytorch_model.bin.index.json
   9.3G    ./pytorch_model-00001-of-00002.bin
   4.0K    ./generation_config.json
   3.6G    ./pytorch_model-00002-of-00002.bin
   4.0K    ./special_tokens_map.json
   4.0K    ./tokenizer_config.json
   2.2M    ./tokenizer.json
   4.0K    ./config.json
   13G     .
   ```

   

4. Merge LoRA

   ```shell
   cd Chinese-LLaMA-Alpaca
   
   python scripts/merge_llama_with_chinese_lora.py \
       --base_model ../alpaca-7b-combined-hf \
       --lora_model ../chinese-alpaca-plus-lora-7b \
       --output_type pth \
       --output_dir ../alpaca-7b-combined-hf-lora 
   ```

   

   and the log as below:

   ```ini
   Base model: ../alpaca-7b-combined-hf
   LoRA model(s) ['../chinese-alpaca-lora-7b']:
   Loading checkpoint shards: 100%|███████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 2/2 [00:44<00:00, 22.14s/it]
   Peft version: 0.3.0
   Loading LoRA for 7B model
   Loading LoRA ../chinese-alpaca-lora-7b...
   base_model vocab size: 49954
   tokenizer vocab size: 49954
   Loading LoRA weights
   Merging with merge_and_unload...
   Saving to pth format...
   Saving shard 1 of 1 into ..alpaca-7b-combined-hf-lora/consolidated.00.pth
   ```

   

   ```ini
   Base model: ../alpaca-7b-combined-hf
   LoRA model(s) ['../chinese-alpaca-plus-lora-7b']:
   Loading checkpoint shards: 100%|███████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 2/2 [00:57<00:00, 28.96s/it]
   Peft version: 0.3.0
   Loading LoRA for 7B model
   Loading LoRA ../chinese-alpaca-plus-lora-7b...
   base_model vocab size: 49954
   tokenizer vocab size: 49954
   Loading LoRA weights
   Merging with merge_and_unload...
   Saving to pth format...
   Saving shard 1 of 1 into ../alpaca-7b-combined-hf-lora/consolidated.00.pth
   ```

   

   

   ```ini
   du -ah alpaca-7b-combined-hf-lora
   744K    alpaca-7b-combined-hf-lora/tokenizer.model
   13G     alpaca-7b-combined-hf-lora/consolidated.00.pth
   4.0K    alpaca-7b-combined-hf-lora/special_tokens_map.json
   4.0K    alpaca-7b-combined-hf-lora/tokenizer_config.json
   4.0K    alpaca-7b-combined-hf-lora/params.json
   13G     alpaca-7b-combined-hf-lora
   ```

   

   ```shell
   sha256sum alpaca-7b-combined-hf-lora/consolidated.00.pth 
   ```

   ```ini
   c1f68f21ab30c10e06d0f0eac833c8f4f4a5870925ff2639a2b4cf793735afb9  alpaca-7b-combined-hf-lora/consolidated.00.pth
   ```

   

   

3. 

4. ...

5. ...

6. ...

7. ...

8. ...

9. ...



```shell
cd Chinese-LLaMA-Alpaca/scripts/langchain

python langchain_qa.py \
  --embedding_path /export/app_workspaces/LLaMa/text2vec-large-chinese \
  --model_path /export/app_workspaces/LLaMa/alpaca-7b-combined-hf-lora \
  --file_path doc.txt \
  --chain_type refine
```

```shell
cd Chinese-LLaMA-Alpaca/scripts/langchain

python langchain_qa.py \
  --embedding_path /export/app_workspaces/LLaMa/text2vec-large-chinese \
  --model_path /export/app_workspaces/LLaMa/chinese-alpaca-plus-7b-hf \
  --file_path doc.txt \
  --chain_type refine
```

