## 目录

- [模型下载](https://github.com/ydli-ai/Chinese-ChatLLaMA#模型下载)
- [快速开始](https://github.com/ydli-ai/Chinese-ChatLLaMA#快速开始)
- [CPU本地部署](https://github.com/ydli-ai/Chinese-ChatLLaMA#CPU本地部署)
- [模型训练](https://github.com/ydli-ai/Chinese-ChatLLaMA#模型训练)
- [生成示例](https://github.com/ydli-ai/Chinese-ChatLLaMA#生成示例)
- [局限性](https://github.com/ydli-ai/Chinese-ChatLLaMA#局限性)
- [中文预训练/指令数据集](https://github.com/ydli-ai/Chinese-ChatLLaMA#中文预训练/指令数据集)
- [交流和问题反馈](https://github.com/ydli-ai/Chinese-ChatLLaMA#交流和问题反馈)
- [TODO-List](https://github.com/ydli-ai/Chinese-ChatLLaMA#todo-list)
- [License](https://github.com/ydli-ai/Chinese-ChatLLaMA#License)
- [Contributors](https://github.com/ydli-ai/Chinese-ChatLLaMA#Contributors)

## 模型下载

**使用须知** ⚠️

模型权重基于 [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html) 协议，仅供研究使用，不能用于商业目的。 请确认在已[获得许可](https://docs.google.com/forms/d/e/1FAIpQLSfqNECQnMkycAp2jP4Z9TFX0cGR4uf7b_fBxjY_OjhJILlKGA/viewform?usp=send_form)的前提下使用本仓库中的模型。

**7B**：[基础模型 LLaMA_zh](https://github.com/ydli-ai/Chinese-ChatLLaMA/blob/main) ｜ [对话模型 ChatLLaMA🔥](https://huggingface.co/P01son/ChatLLaMA-zh-7B) ｜ [int4量化版本 ChatLLaMA](https://huggingface.co/P01son/ChatLLaMA-zh-7B-int4)
**13B**：预计 ~~4月11日~~ 4月20日公开
**33B**：基础模型预计4月20日公开
**65B**：规划中

模型仍在迭代中，每周更新一次新版模型权重。

## 快速开始

安装依赖，建议使用环境: py3.8.12 cuda11.2.2 cudnn8.1.1.33-1 nccl2.10.3 deepspeed0.8.3 torch1.9.0

下载预训练 ChatLLaMA 权重，使用 TencentPretrain 进行对话：

```
git lfs install
git clone https://huggingface.co/P01son/ChatLLaMA-zh-7B
git clone https://github.com/Tencent/TencentPretrain.git

cd TencentPretrain 
vi beginning.txt  #编辑用户输入，例如"上海有什么好玩的地方？"

# 修改 utils/constants.py 文件L4，将 special_tokens_map.json 改为 llama_special_tokens_map.json

#将项目中的 generate_chatllama.py 复制到 scripts/

python3 scripts/generate_chatllama.py --load_model_path ../ChatLLaMA-zh-7B/ChatLLaMA_7B.bin --spm_model_path ../ChatLLaMA-zh-7B/tokenizer.model \
                               --test_path beginning.txt --prediction_path generated_sentence.txt \
                               --config_path models/llama/7b_config.json --seq_length 256
```

## CPU本地部署

将int4量化后的模型权重部署在本地使用CPU推理。

```
git lfs install
git clone https://github.com/ggerganov/llama.cpp.git
git clone https://huggingface.co/P01son/ChatLLaMA-zh-7B-int4

cd llama.cpp
make
./main -m ../ChatLLaMA-zh-7B-int4/chatllama-ggml-q4_0.bin -p "北京有什么好玩的地方？\n" -n 256
```

## 模型训练

### 中文增量预训练

以 7B 模型为例，首先下载[预训练LLaMA权重](https://huggingface.co/decapoda-research/llama-7b-hf)，转换到TencentPretrain格式：

```
python3 scripts/convert_llama_from_huggingface_to_tencentpretrain.py --input_model_path $LLaMA_HF_PATH \
                       --output_model_path  models/llama-7b.bin --type 7B
```

下载[中文预训练语料](https://github.com/ydli-ai/Chinese-ChatLLaMA/blob/main/corpus/README.md)， 预处理：

```
python3 preprocess.py --corpus_path $CORPUS_PATH --spm_model_path $LLaMA_PATH/tokenizer.model \
                      --dataset_path $OUTPUT_DATASET_PATH --data_processor lm --seq_length 512
```

预训练：

```
deepspeed pretrain.py --deepspeed --deepspeed_config models/deepspeed_config.json \
                      --pretrained_model_path models/llama-7b.bin \
                      --dataset_path $OUTPUT_DATASET_PATH --spm_model_path $LLaMA_PATH/tokenizer.model \
                      --config_path models/llama/7b_config.json \
                      --output_model_path models/llama_zh_7b \
                      --world_size 8 --data_processor lm \
                      --total_steps 300000 --save_checkpoint_steps 5000 --batch_size 24
```

### 中文指令学习

构建[指令数据集](https://github.com/ydli-ai/Chinese-ChatLLaMA/blob/main/instructions/README.md)并预处理：

```
python3 preprocess.py --corpus_path $INSTRUCTION_PATH --spm_model_path $LLaMA_PATH/tokenizer.model \
                      --dataset_path $OUTPUT_DATASET_PATH --data_processor alpaca --seq_length 512
```

指令微调：

```
deepspeed pretrain.py --deepspeed --deepspeed_config models/deepspeed_config.json \
                      --pretrained_model_path models/llama_zh_7b.bin \
                      --dataset_path $OUTPUT_DATASET_PATH --spm_model_path $LLaMA_PATH/tokenizer.model \
                      --config_path models/llama/7b_config.json \
                      --output_model_path models/chatllama_7b \
                      --world_size 8 --data_processor lm \
                      --total_steps 20000 --save_checkpoint_steps 2000 --batch_size 24
```

## 生成示例

<details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;"><b style="box-sizing: border-box; font-weight: var(--base-text-weight-semibold, 600);">推荐/问答</b></summary></details>

<details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;"><b style="box-sizing: border-box; font-weight: var(--base-text-weight-semibold, 600);">机器翻译</b></summary></details>

<details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;"><b style="box-sizing: border-box; font-weight: var(--base-text-weight-semibold, 600);">数学/代码</b></summary></details>

<details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;"><b style="box-sizing: border-box; font-weight: var(--base-text-weight-semibold, 600);">机器写作</b></summary></details>

<details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;"><b style="box-sizing: border-box; font-weight: var(--base-text-weight-semibold, 600);">与 ChatGPT 对比</b></summary></details>

## 局限性

ChatLLaMA 完全基于社区开放语料训练，内容未经人工修正。受限于模型和训练数据规模，ChatLLaMA 的语言能力较弱， 在多轮对话、逻辑推理、知识问答等场景具有明显缺陷，也可能产生带有偏见或有害内容。