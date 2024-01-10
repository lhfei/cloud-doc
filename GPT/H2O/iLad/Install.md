



### Required

```shell
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt install -y gcc-11
sudo apt install -y g++-11
```



### Start

```shell
python generate.py --base_model='/export/app_workspaces/LLama/chinese-alpaca-2-13b' --prompt_type=llama2
```





> start.sh

```shell
#!/bin/bash

JOB_HOME="."
SERV_NAME="GPT Chat Server"
OUT_LOG="chat.log"

function startJob() {
    echo "prepare to start ..."
    cd ${JOB_HOME}
    conda activate ilad-gpt
    python generate.py --base_model='/export/app_workspaces/LLama/chinese-alpaca-2-13b' --prompt_type=llama2 > ${JOB_HOME}/${OUT_LOG} 2>&1 &
    PID=$!
    echo $PID > ${JOB_HOME}/pid
    echo "${SERV_NAME} is started as pid $! ."
}

if [ -f "${JOB_HOME}/pid" ]
then
    PID=`cat ${JOB_HOME}/pid`
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

