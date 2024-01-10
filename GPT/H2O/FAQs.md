



1

```ini
CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.
```

```shell
source activate
```



2 [Error sudo: add-apt-repository: command not found](https://askubuntu.com/questions/593433/error-sudo-add-apt-repository-command-not-found)

**Run**: 

```she
 sudo apt-get update
```

**Then** 

```shell
sudo apt install software-properties-common -y
```

**Now**, you can use  `sudo add-apt-repository`



3 AttributeError: module 'lib' has no attribute 'X509_V_FLAG_CB_ISSUER_CHECK'

```shell
pip install pyopenssl --upgrade
```





4 max_split_size_mb to avoid fragmentation

torch.cuda.OutOfMemoryError: CUDA out of memory. Tried to allocate 136.00 MiB (GPU 0; 23.65 GiB total capacity; 23.06 GiB already allocated; 102.06 MiB free; 23.10 GiB reserved in total by PyTorch) If reserved memory is >> allocated memory try setting max_split_size_mb to avoid fragmentation.  See documentation for Memory Management and PYTORCH_CUDA_ALLOC_CONF

```shell
export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:32
```



> AttributeError: 'Llama' object has no attribute 'ctx'

upgrade `llama-cpp-python` version.

```shell
pip install --upgrade llama-cpp-python
```



> ImportError: cannot import name 'tracing_enabled' from 'langchain_core.tracers.context'

```shell
```



> ImportError: cannot import name 'VALID_TASKS' from 'langchain.llms.huggingface_pipeline'

```ini
# src/gpt_langchain.py

# replace 'from langchain.llms.huggingface_pipeline import VALID_TASKS' 
# to 
# 'from langchain.llms.huggingface_pipeline import HuggingFacePipeline'

```

