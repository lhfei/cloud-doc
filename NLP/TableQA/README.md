## TableQA

Querying natural language on tabular data is a common task for practical application, typically, for data with mixture of numerical and categories. This project is a unsupervised tableQA attempts on chinese tabular data and databaseQA mainly on finance data.

### Built With

- [JointBERT](https://github.com/monologg/JointBERT)
- [Snorkel](https://github.com/snorkel-team/snorkel)
- [Bertopic](https://github.com/MaartenGr/BERTopic)
- [sqlite-utils](https://github.com/simonw/sqlite-utils)

## Getting Started

### Installation

[Snorkel](https://github.com/snorkel-team/snorkel) and [Bertopic](https://github.com/MaartenGr/BERTopic) may have some dependency conflict. Recommend use three different visual environments provide by [conda](https://docs.conda.io/en/latest/) to distinguish [JointBERT](https://github.com/monologg/JointBERT) [Snorkel](https://github.com/snorkel-team/snorkel) [Bertopic](https://github.com/MaartenGr/BERTopic) respectively.

- conda

```shell
conda create -n jointbert_env python=3.8
conda activate jointbert_env
pip install -r jointbert_requirements.txt

conda create -n snorkel_env python=3.8
conda activate snorkel_env
bash snorkel_install.sh

conda create -n topic_env python=3.8
conda activate topic_env
bash topic_install.sh
```

Before use notebooks and scripts, type conda activate statement to init specific env. Following is the different file and their env mapping.

(jointbert_env)
[condition_trainer.py](https://github.com/svjack/tableQA-Chinese/blob/main/script/condition_trainer.py)
[tableQA_single_table.py](https://github.com/svjack/tableQA-Chinese/blob/main/script/tableQA_single_table.py)
[tableqa-single-valid.ipynb](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/tableqa-single-valid.ipynb)
[fine-tune-on-finance.ipynb](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/fine-tune-on-finance.ipynb)

(snorkel_env)
[finance_dictionary_construction.py](https://github.com/svjack/tableQA-Chinese/blob/main/script/finance_dictionary_construct.py)
[agg-classifier.ipynb](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/agg-classifier.ipynb)
[tableqa_finance_unsupervised.py](https://github.com/svjack/tableQA-Chinese/blob/main/script/tableqa_finance_unsupervised.py)

(topic_env)
[tableqa_search.py](https://github.com/svjack/tableQA-Chinese/blob/main/script/tableqa_search.py)



# **Full Usage**

           With all train process.

## tableQA Usage

#### [1. Download chinese tableqa Data from github](https://github.com/ZhuiyiTechnology/TableQA)

#### [2. Download JointBERT project](https://github.com/monologg/JointBERT)

#### [3. Train condition extractor with JointBERT on tableqa data](https://github.com/svjack/tableQA-Chinese/blob/main/script/condition_trainer.py)

            Don’t forget to config train_path and jointbert_path in the code.

#### [4. Use tableQA_single_table.py in tableqa-single-valid to perform tableQA on single table data](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/tableqa-single-valid.ipynb)

## databaseQA Usage

#### [5. Run finance_dictionary_construct to build finance dictionary for databaseQA](https://github.com/svjack/tableQA-Chinese/blob/main/script/finance_dictionary_construct.py)

#### [6. Build finance profile for databaseQA](https://github.com/svjack/tableQA-Chinese/blob/main/script/tableqa_search.py)

#### [7. Use Snorkel to filter out financial tables from tableqa dataset](https://github.com/svjack/tableQA-Chinese/blob/main/script/tableqa_finance_unsupervised.py)

#### [8. Perform databaseQA on financial database (a collection of financial tables)](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/fine-tune-on-finance.ipynb)



# **Simple Usage**

This is the recommend way to use this project, because the financial dictionary build by call api from [ownthink](https://github.com/ownthink/KnowledgeGraphData).

If the api not stable or some random state change for [Bertopic](https://github.com/MaartenGr/BERTopic) , All may have bad effect on finance profile for databaseQA.
So i recommend use the following data.tar.gz in the [Google Drive](https://drive.google.com/drive/folders/19NcYWybSBi_44zfcbtstLXk5rB_SymJt?usp=sharing) at least.

And with data.tar.gz you only need install (jointbert_env) to explore tableQA and databaseQA.

Download pre-trained model and data from [Google Drive](https://drive.google.com/drive/folders/19NcYWybSBi_44zfcbtstLXk5rB_SymJt?usp=sharing)
This share path contain three file :
**1 bert.tar.gz** ([JointBERT](https://github.com/monologg/JointBERT) trained model)
**2 conds.tar.gz** ([JointBERT](https://github.com/monologg/JointBERT) friendly dataset)
**3 data.tar.gz** ([Bertopic](https://github.com/MaartenGr/BERTopic) and [Snorkel](https://github.com/snorkel-team/snorkel) produce data for perform databaseQA)

Unzip them into root path of this project and config them into above Full Usage files.
You can simply find where to config by search unzipped fiile name in the notebooks and scripts.

## tableQA Usage

#### [1. Download chinese tableqa Data from github](https://github.com/ZhuiyiTechnology/TableQA)

#### [2. Download JointBERT project](https://github.com/monologg/JointBERT)

#### [3. Use tableQA_single_table.py in tableqa-single-valid to perform tableQA on single table data](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/tableqa-single-valid.ipynb)

[![avatar](https://github.com/svjack/tableQA-Chinese/raw/main/IMG_0900.jpeg)](https://github.com/svjack/tableQA-Chinese/blob/main/IMG_0900.jpeg)

## databaseQA Usage

#### [4. Perform databaseQA on financial database (a collection of financial tables)](https://github.com/svjack/tableQA-Chinese/blob/main/notebook/fine-tune-on-finance.ipynb)

[![avatar](https://github.com/svjack/tableQA-Chinese/raw/main/IMG_0901.jpeg)](https://github.com/svjack/tableQA-Chinese/blob/main/IMG_0901.jpeg)

[![avatar](https://github.com/svjack/tableQA-Chinese/raw/main/IMG_0907.jpeg)](https://github.com/svjack/tableQA-Chinese/blob/main/IMG_0907.jpeg)

[![avatar](https://github.com/svjack/tableQA-Chinese/raw/main/IMG_0904.jpeg)](https://github.com/svjack/tableQA-Chinese/blob/main/IMG_0904.jpeg)



# [Design Construction](https://github.com/svjack/tableQA-Chinese/blob/main/tableQA_construction.md)

# [API Documentation](https://github.com/svjack/tableQA-Chinese/blob/main/tableQA_api_documentation.md)

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

svjack - [svjackbt@gmail.com](mailto:svjackbt@gmail.com)

Project Link:https://github.com/svjack/tableQA-Chinese

## Acknowledgements

- [tableQA](https://github.com/abhijithneilabraham/tableQA)
- [vectorbt](https://github.com/polakowo/vectorbt)
- [zvt](https://github.com/zvtvz/zvt)
- [JointBERT](https://github.com/monologg/JointBERT)
- [Snorkel](https://github.com/snorkel-team/snorkel)
- [Bertopic](https://github.com/MaartenGr/BERTopic)
- [sqlite-utils](https://github.com/simonw/sqlite-utils)
- [bm25](https://github.com/dorianbrown/rank_bm25)
- [TableQA](https://github.com/ZhuiyiTechnology/TableQA)
- [ownthink](https://github.com/ownthink/KnowledgeGraphData)
- [Sentence Transformers](https://github.com/UKPLab/sentence-transformers)
- [EasyNMT](https://github.com/UKPLab/EasyNMT)
- [PyArrowExpressionCastToolkit](https://github.com/svjack/PyArrowExpressionCastToolkit)
- [Sbert-ChineseExample](https://github.com/svjack/Sbert-ChineseExample)



```shell
```

