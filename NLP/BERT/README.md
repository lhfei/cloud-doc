一，运行环境
需要下载两个包，然后解压，但要记住位置，后面要使用到。
1）Bert下载地址：https://github.com/google-research/bert，选择Clone or download；
2）预训练数据（pre-training）：Bert-base Chinese，下载地址：https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip，如果做英文分类，请下载对应的包；
3）TensorFlow的版本必须大于1.11.0
4）非必须，如果您使用的是Anaconda，想使用GPU加速（显卡在1060 6G以上），配置Tesnflow-gpu 非常简单，只需一句代码：conda create -n gpu_env tensorflow-gpu,能够完成所有环境的安装；

二，代码修改
需要对bert里的run_classifier.py文件进行修改，有2处：
1）添加我们自己的类，此类与已有的类并列即可；标签可以根据需要自定义，这里我自定义了三个；

```python
class MyTaskProcessor(DataProcessor):
  """Processor for my task-news classification """
  def __init__(self):
    self.labels = ['体育', '财经', '房产']
  def get_train_examples(self, data_dir):
    return self._create_examples(
      self._read_tsv(os.path.join(data_dir, 'train.tsv')), 'train')

  def get_dev_examples(self, data_dir):
    return self._create_examples(
      self._read_tsv(os.path.join(data_dir, 'val.tsv')), 'val')

  def get_test_examples(self, data_dir):
    return self._create_examples(
      self._read_tsv(os.path.join(data_dir, 'test.tsv')), 'test')

  def get_labels(self):
    return self.labels

  def _create_examples(self, lines, set_type):
    """create examples for the training and val sets"""
    examples = []
    for (i, line) in enumerate(lines):
      guid = '%s-%s' %(set_type, i)
      text_a = tokenization.convert_to_unicode(line[1])
      label = tokenization.convert_to_unicode(line[0])
      examples.append(InputExample(guid=guid, text_a=text_a, label=label))
    return examples
```



2）继续在该文件中进行修改，添加我们刚刚创建的类，具体如下：

```python
def main(_):
  tf.logging.set_verbosity(tf.logging.INFO)

  processors = {
      "cola": ColaProcessor,
      "mnli": MnliProcessor,
      "mrpc": MrpcProcessor,
      "xnli": XnliProcessor,
      "mytask": MyTaskProcessor,
  }
```

​	

三，数据准备
晚上上述两步之后，离成功不远了。
1）数据的第一列是标签，第二列是文本数据。注意，两者之间必须用Tab隔开，否则需要修改读取方法;
2）新建一个文件夹，记住位置，里面放三个文件，分别是 train.tsv，test.tsv，val.tsv， .txt 的文件可以直接修改成 .tsv，同时注意格式为无BOM的utf-8格式；数据下载，请关注公众号小城公社，输入您的邮箱即可。
3）新建一个文件夹，专门放置模型的输出
至此，已经有四个文件夹了，请记住位置，后面需要。

四，配置训练脚本
里面的路径都是绝对路径，以我的为例，input文件夹放的训练、验证、测试数据集；out放的是模型输出；chinese放的中文预训练数据；bert-base放的是bert。如果您的显存不够大，可以把max_seq_length和train_batch_size修改小一点。

非常重要的是，在具体使用时将下面的命令行变成一行，每一行用空格隔开，复制，然后在Anaconda对应的环境中打开Terminal，然后粘贴，回车，即可运行

```shell
python googlebert\bert-base\run_classifier.py
--task_name=mytask
--do_train=true
--do_eval=true 
--data_dir=C:\Users\qct20\A_Python_Code\googlebert\input\
--vocab_file=C:\Users\qct20\A_Python_Code\googlebert\chinese\vocab.txt
--bert_config_file=C:\Users\qct20\A_Python_Code\googlebert\chinese\bert_config.json
--init_checkpoint=C:\Users\qct20\A_Python_Code\googlebert\chinese\bert_model.ckpt 
--max_seq_length=128
--train_batch_size=8
--learning_rate=2e-5
--num_train_epochs=3.0
--output_dir=C:\Users\qct20\A_Python_Code\googlebert\out
```


五，配置预测脚本
预测与训练的配置稍有不同，最大的不同是，init_checkpoint的路径为模型的输出，这点非常重要，具体如下。最后运行的操作同上，在输出文件夹out中会有关于每个测试的类别预测概率，注意查看。

```shell
python googlebert\bert-base\run_classifier.py
--task_name=mytask
--do_predict=true
--data_dir=C:\Users\qct20\A_Python_Code\googlebert\input
--vocab_file=C:\Users\qct20\A_Python_Code\googlebert\chinese\vocab.txt
--bert_config_file=C:\Users\qct20\A_Python_Code\googlebert\chinese\bert_config.json
--init_checkpoint=C:\Users\qct20\A_Python_Code\googlebert\out
--max_seq_length=128
--output_dir=C:\Users\qct20\A_Python_Code\googlebert\out
```



