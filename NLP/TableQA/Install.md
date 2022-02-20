

### Install



#### jointbert_env

```shell
conda create -n jointbert_env python=3.8
conda activate jointbert_env
pip install -r jointbert_requirements.txt
```



#### snorkel_env

```shell
conda create -n snorkel_env python=3.8
conda activate snorkel_env
bash snorkel_install.sh
```



#### topic_env

```shell
conda create -n topic_env python=3.8
conda activate topic_env
bash topic_install.sh
```

```shell
pip install --no-use-pep517
```







> condition_trainer.py

```python
train_path = "../TableQA/train"
val_path = "../TableQA/val"

jointbert_path = "../JointBERT"
```



> tableQA_single_table.py

```python
```



>