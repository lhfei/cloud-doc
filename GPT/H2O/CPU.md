## CPU Details

Details that do not depend upon whether you are running on CPU for Linux, Windows, or macOS.



#### Required

##### 1 GCC

```shell
sudo yum install -y centos-release-scl
sudo yum install -y devtoolset-11-gcc*
scl enable devtoolset-11 bash
```

##### 2 Llama cpp

```shell
pip install llama-cpp-python
```



### LLaMa.cpp 

Default llama.cpp model is LLaMa2 GPTQ model from TheBloke:

* Run LLaMa.cpp LLaMa2 model:

    With documents in `user_path` folder, run:
   ```bash
   # if don't have wget, download to repo folder using below link
   wget https://huggingface.co/TheBloke/Llama-2-7b-Chat-GGUF/resolve/main/llama-2-7b-chat.Q6_K.gguf
   python generate.py --base_model='llama' --prompt_type=llama2 --score_model=None --langchain_mode='UserData' --user_path=user_path
   ```

For another llama.cpp model:

* Choose from [TheBloke](https://huggingface.co/TheBloke), then with documents in `user_path` folder, run:
  ```bash
   python generate.py --base_model=llama --model_path_llama=https://huggingface.co/TheBloke/Llama-2-7b-Chat-GGUF/resolve/main/llama-2-7b-chat.Q6_K.gguf --score_model=None --langchain_mode='UserData' --user_path=user_path
  ```
  For `llama.cpp` based models on CPU, for computers with low system RAM or slow CPUs, we recommend running:
  ```bash
   python generate.py --base_model=llama --model_path_llama=https://huggingface.co/TheBloke/Llama-2-7b-Chat-GGUF/resolve/main/llama-2-7b-chat.Q6_K.gguf --llamacpp_dict="{'use_mlock':False,'n_batch':256}" --max_seq_len=512 --score_model=None --langchain_mode='UserData' --user_path=user_path
  ```

### GPT4ALL

* Choose Model from GPT4All Model explorer [GPT4All-J compatible model](https://gpt4all.io/index.html). One does not need to download manually, the GPT4ALL package will download at runtime and put it into `.cache` like Hugging Face would.

* With documents in `user_path` folder, run:
  ```bash
   python generate.py --base_model=gptj --model_path_gptj=ggml-gpt4all-j-v1.3-groovy.bin --score_model=None --langchain_mode='UserData' --user_path=user_path
  ```
  or
  ```bash
   python generate.py --base_model=gpt4all_llama --model_name_gpt4all_llama=ggml-wizardLM-7B.q4_2.bin --score_model=None --langchain_mode='UserData' --user_path=user_path
  ```
   However, `gpjt` model often gives [no output](FAQ.md#gpt4all-not-producing-output), even outside h2oGPT.  See [GPT4All](https://github.com/nomic-ai/gpt4all) for details on installation instructions if you encounter any issues.

### Low-memory

For more information about low-memory recommendations, see [Low Memory](FAQ.md#low-memory-mode).




### Start

```shell
python generate.py --base_model='/export/app_workspaces/LLaMa/chinese-alpaca-2-7b' --prompt_type=llama2
```



```shell
python generate.py --base_model='/export/app_workspaces/LLaMa/chinese-llama-2-7b' --prompt_type=llama2
```



```shell
python generate.py --base_model='/export/app_workspaces/MODELS/Baichuan2-7B-Chat' --prompt_type=llama2
```



```shell
python generate.py --base_model='/export/app_workspaces/LLaMa/Llama2-Chinese-7b-Chat' --prompt_type=llama2

python generate.py --base_model='llama' --prompt_type=llama2 --model_path_llama='/export/app_workspaces/LLaMa/Llama2-Chinese-7b-Chat' --max_seq_len=4096

```





```shell
python generate.py --base_model='/export/app_workspaces/MODELS/Llama2-Chinese-13b-Chat-4bit' --prompt_type=llama2

python generate.py --base_model=llama --prompt_type=llama2 --model_path_llama=/export/app_workspaces/MODELS/Llama2-Chinese-13b-Chat-4bit/gptq_model-4bit-128g.bin

python generate.py --base_model=/export/app_workspaces/MODELS/Llama2-Chinese-13b-Chat-4bit --prompt_type=llama2 --max_seq_len=4096

python generate.py --base_model=llama --prompt_type=llama2 --model_path_llama=/export/app_workspaces/MODELS/Baichuan2-7B-Chat


```







```shell
python generate.py --base_model='/export/MODELS/Chinese-Llama-2-7b' --prompt_type=llama2
```

```shell
python generate.py --base_model=llama --model_path_llama="/export/MODELS/llama-2-7b-chat.Q6_K.gguf" --score_model=None --langchain_mode='UserData' --user_path=user_path
```





```shell
python generate.py --base_model=TheBloke/Mistral-7B-Instruct-v0.2-GGUF --prompt_type=mistral --max_seq_len=4096

python generate.py --base_model='/export/MODELS/Chinese-Mistral-7B-Instruct-v0.1' --prompt_type=mistral --max_seq_len=4096
```



#### Offline

> LLama3

```shell
TRANSFORMERS_OFFLINE=1 python generate.py --base_model=llama --model_path_llama="/export/MODELS/Llama3-Chinese-8B-Instruct" --hf_embedding_model="/export/MODELS/bge-large-zh-v1.5" --prompt_type=llama2 --gradio_offline_level=2 --share=False --add_disk_models_to_ui=False
```

```shell
TRANSFORMERS_OFFLINE=1 python generate.py --base_model=llama --model_path_llama="/export/MODELS/Llama3-Chinese-8B-Instruct" --tokenizer_base_model="/export/MODELS/Llama3-Chinese-8B-Instruct"t --max_seq_len=8192 --gradio_offline_level=2 --share=False --add_disk_models_to_ui=False
```





```shell
TRANSFORMERS_OFFLINE=1 python generate.py --base_model=llama --model_path_llama="/export/MODELS/zephyr-7b-beta.Q5_K_M.gguf" --prompt_type=zephyr --hf_embedding_model="/export/MODELS/all-MiniLM-L6-v2" --gradio_offline_level=2 --share=False --add_disk_models_to_ui=False
```



> OK

```shell
TRANSFORMERS_OFFLINE=1 python generate.py --base_model=llama --model_path_llama="/export/MODELS/llama-2-7b-chat.Q6_K.gguf" --hf_embedding_model="/export/MODELS/bge-large-zh-v1.5" --prompt_type=llama2 --gradio_offline_level=2 --share=False --add_disk_models_to_ui=False
```



```shell
TRANSFORMERS_OFFLINE=1 python generate.py --base_model='/export/MODELS/Chinese-Mistral-7B-Instruct-v0.1' --prompt_type=mistral --max_seq_len=4096 --hf_embedding_model="/export/MODELS/bge-large-zh-v1.5"  --gradio_offline_level=2 --share=False --add_disk_models_to_ui=False
```



> OK

```shell
TRANSFORMERS_OFFLINE=1 python generate.py --base_model='/export/MODELS/Chinese-Llama-2-7b' --prompt_type=llama2 --max_seq_len=4096 --hf_embedding_model="/export/MODELS/bge-large-zh-v1.5"  --gradio_offline_level=2 --share=False --add_disk_models_to_ui=False
```



