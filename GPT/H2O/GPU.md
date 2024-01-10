



Required

```shell
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt install -y gcc-11
sudo apt install -y g++-11
```



### Start

```shell
python generate.py --base_model='/mnt/app_workspaces/chinese-llama-2-7b' --prompt_type=llama2
```



```shell
python generate.py --base_model='/mnt/app_workspaces/chinese-alpaca-2-7b' --prompt_type=llama2 -langchain_mode='ECarData' --user_path='/mnt/gpt_kb/ecar'
```





```shell
python generate.py --base_model='/mnt/app_workspaces/chinese-alpaca-2-13b' --prompt_type=llama2 -langchain_mode='ECarData' --user_path='/mnt/gpt_kb/ecar'
```



```shell
python generate.py --base_model='/export/app_workspaces/LLama/chinese-alpaca-2-13b' --prompt_type=llama2
```



python generate.py --base_model='/root/autodl-tmp/app_workspaces/LLama/Llama2-Chinese-13b-Chat' --prompt_type=llama2

python generate.py --base_model='/root/autodl-tmp/app_workspaces/LLama2/chinese-alpaca-2-13b-16k' --prompt_type=llama2



```shell
python generate.py --base_model=llama --prompt_type=llama2 --model_path_llama=/root/autodl-tmp/MODULES/Atom-7B-Chat --max_seq_len=4096

./bin/python generate.py --base_model='/root/autodl-tmp/MODULES/Atom-7B-Chat' --prompt_type=llama2  --max_seq_len=4096

./bin/python generate.py --base_model='/root/autodl-tmp/MODULES/Llama2-Chinese-13b-Chat' --prompt_type=llama2  --max_seq_len=4096


./bin/python generate.py --base_model='/root/autodl-tmp/MODULES/Llama2-Chinese-7b-Chat' --prompt_type=llama2  --max_seq_len=4096


```

