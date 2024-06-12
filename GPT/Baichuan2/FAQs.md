>RuntimeError: "addmm_impl_cpu_" not implemented for 'Half'

```shell
```



> AttributeError: 'BaichuanTokenizer' object has no attribute 'sp_model'

```shell
```



> AttributeError: 'list' object has no attribute 'as_dict'

```shell
pip install bitsandbytes==0.41.1
```





> ValueError: [Tokenizer](https://so.csdn.net/so/search?q=Tokenizer&spm=1001.2101.3001.7020) class XXXTokenizer does not exist or is not
> currently imported.

```shell
AutoTokenizer.from_pretrained和AutoModelForCausalLM.from_pretrained参数中加上trust_remote_code=True
```





> ValueError: The current `device_map` had weights offloaded to the disk. Please provide an `offload_folder` for them. Alternatively, make sure you have `safetensors` installed if the model you are using offers the weights in this format.

```ini
AutoModelForCausalLM.from_pretrained的参数中加上offload_folder="offload_folder"，
```





> Xformers is not installed correctly. If you want to use memory_efficient_attention to accelerate training use the following command to install Xformers

```shell
pip install xformers
```

