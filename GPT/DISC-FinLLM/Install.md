

### Set Baichuan2 

> DISC-FinLLM/config.json

```json
{
  "_from_model_config": true,
  "_name_or_path": "/export/.xhs/Baichuan2-13B-Chat",
  "architectures": [
    "BaichuanForCausalLM"
  ],
  "auto_map": {
    "AutoConfig": "configuration_baichuan.BaichuanConfig",
    "AutoModel": "modeling_baichuan.BaichuanForCausalLM",
    "AutoModelForCausalLM": "/export/.xhs/Baichuan2-13B-Chat--modeling_baichuan.BaichuanForCausalLM"
  },
  "bos_token_id": 1,
  "eos_token_id": 2,
  "hidden_act": "silu",
  "hidden_size": 5120,
  "initializer_range": 0.02,
  "intermediate_size": 13696,
  "model_max_length": 4096,
  "model_type": "baichuan",
  "num_attention_heads": 40,
  "num_hidden_layers": 40,
  "pad_token_id": 0,
  "rms_norm_eps": 1e-06,
  "tie_word_embeddings": false,
  "torch_dtype": "float16",
  "transformers_version": "4.33.2",
  "use_cache": false,
  "vocab_size": 64000
}
```

