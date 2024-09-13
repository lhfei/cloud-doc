

### Prepared

```shell
pip install opencv-contrib-python-headless
pip install pycocotools

pip install yacs
pip install torch
pip install setuptools
```



#### Detectron2

```shell
# install it from a local clone:
git clone https://github.com/facebookresearch/detectron2.git
python -m pip install -e detectron2
```



### Models

```shell
git clone https://www.modelscope.cn/wanderkid/PDF-Extract-Kit.git
```





### Modify Configurations for CPU Inference

`PDF-Extract-Kit/configs/model_configs.yaml:L2`

```
device: cpu
```

`PDF-Extract-Kit/modules/layoutlmv3/layoutlmv3_base_inference.yaml:L72`

```
DEVICE: cpu
```



### Useage

```shell
python pdf_extract.py --pdf assets/examples/600017_20061016_2.pdf
```

