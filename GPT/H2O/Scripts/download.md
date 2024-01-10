

### Files

1. chinese-alpaca-2-13b-16k

   ```ini
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/config.json
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/generation_config.json
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/pytorch_model-00001-of-00003.bin
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/pytorch_model-00002-of-00003.bin
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/pytorch_model-00003-of-00003.bin
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/pytorch_model.bin.index.json
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/special_tokens_map.json
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/tokenizer.model
   https://huggingface.co/ziqingyang/chinese-alpaca-2-13b-16k/resolve/main/tokenizer_config.json
   ```

   

2. ...

3. ...

```shell
#!/bin/bash

for file in `cat files.txt`:
do
  echo "pripare to download file: $file"
  
  wget $file > dw.log 2>&1 & 
  PID=$!
  echo $PID > ${JOB_HOME}/pid

  echo "file: $file done"
done
```

