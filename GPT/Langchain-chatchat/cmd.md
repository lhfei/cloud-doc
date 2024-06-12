

```shell
python startup.py --help
```



```ini
usage: startup.py [-h] [-a] [--all-api] [--llm-api] [-o] [-m] [-n MODEL_NAME [MODEL_NAME ...]] [-c CONTROLLER_ADDRESS] [--api] [-p] [-w] [-q] [-i]

options:
  -h, --help            show this help message and exit
  -a, --all-webui       run fastchat's controller/openai_api/model_worker servers, run api.py and webui.py
  --all-api             run fastchat's controller/openai_api/model_worker servers, run api.py
  --llm-api             run fastchat's controller/openai_api/model_worker servers
  -o, --openai-api      run fastchat's controller/openai_api servers
  -m, --model-worker    run fastchat's model_worker server with specified model name. specify --model-name if not using default LLM_MODELS
  -n MODEL_NAME [MODEL_NAME ...], --model-name MODEL_NAME [MODEL_NAME ...]
                        specify model name for model worker. add addition names with space seperated to start multiple model workers.
  -c CONTROLLER_ADDRESS, --controller CONTROLLER_ADDRESS
                        specify controller address the worker is registered to. default is FSCHAT_CONTROLLER
  --api                 run api.py server
  -p, --api-worker      run online model api such as zhipuai
  -w, --webui           run webui.py server
  -q, --quiet           减少fastchat服务log信息
  -i, --lite            以Lite模式运行：仅支持在线API的LLM对话、搜索引擎对话
```



> start API

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="GPT API"
OUT_LOG="chat.log"
F_PID="pid"


function startJob() {
    echo "prepare to start ..."
    python startup.py --all-api > ${JOB_HOME}/${OUT_LOG} 2>&1 &
    PID=$!
    echo $PID > ${JOB_HOME}/${F_PID}
    echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/${F_PID}" ]
then
    PID=`cat ${JOB_HOME}/${F_PID}`
    if ps -p $PID > /dev/null
    then
        echo "${SERV_NAME} is running as pid is $PID, stop it first"
        exit 1
    else
        startJob
        exit 0
    fi
else
    startJob
    exit 0
fi
```



> start WebUI

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="GPT API"
OUT_LOG="chat.log"
F_PID="pid"


function startJob() {
    echo "prepare to start ..."
    streamlit run webui.py --server.fileWatcherType none > ${JOB_HOME}/${OUT_LOG} 2>&1 &
    PID=$!
    echo $PID > ${JOB_HOME}/${F_PID}
    echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/${F_PID}" ]
then
    PID=`cat ${JOB_HOME}/${F_PID}`
    if ps -p $PID > /dev/null
    then
        echo "${SERV_NAME} is running as pid is $PID, stop it first"
        exit 1
    else
        startJob
        exit 0
    fi
else
    startJob
    exit 0
fi
```

