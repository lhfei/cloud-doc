

```shell
git clone --progress https://github.com/monologg/JointBERT.git
```





```shell
virtualenv JointBERT

cd JointBERT
```



```shell
pip install -r requirements.txt
```



```shell
pip install tqdm numpy
```





```shell
python3 main.py --task atis \
                  --model_type bert \
                  --model_dir atis_model \
                  --do_train --do_eval
```





```shell
python3 main.py --task train \
                  --model_type bert \
                  --model_dir train_model \
                  --do_train --do_eval
```

