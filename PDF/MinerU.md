

### Centos 8

#### Gcc

```shell
yum install gcc-toolset-9

scl enable gcc-toolset-9 bash
```



#### OpenCV

```shell
pip uninstall opencv-contrib-python opencv-python opencv-python-headless


pip install opencv-contrib-python-headless
pip install pycocotools
```





#### Detectron2

```shell
# install it from a local clone:
git clone https://github.com/facebookresearch/detectron2.git
python -m pip install -e detectron2
```







```shell
magic-pdf pdf-command --pdf "data/pdf/600519_20240403_W0YD.pdf" --inside_model true  --output ./tmp
```

