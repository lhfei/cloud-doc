

> requirement.txt

```ini
records
stanza
corenlp
SQLAlchemy=1.3.24
records=0.5.3
```



> list

```shell
pip list

Package            Version
------------------ -------
Babel              2.9.1
docopt             0.6.2
et-xmlfile         1.1.0
greenlet           1.1.2
importlib-metadata 4.8.3
jdcal              1.4.1
openpyxl           2.4.11
pip                21.3.1
pytz               2021.3
records            0.5.3
setuptools         59.6.0
SQLAlchemy         1.3.24
tablib             3.1.0
tabulate           0.8.9
tqdm               4.62.3
typing_extensions  4.0.1
wheel              0.37.1
zipp               3.6.0
```



### Build

```shell
git clone https://github.com/salesforce/WikiSQL
cd WikiSQL
pip install -r requirements.txt

tar xvjf data.tar.bz2

bunzip2 -f test/example.pred.dev.jsonl.bz2
```



> dev

```shell
python evaluate.py data/dev.jsonl data/dev.db test/example.pred.dev.jsonl
```

Output:

```ini
100%|███████████████████████████████████████████████████████████████████████████████████████████████████████████████| 8421/8421 [00:07<00:00, 1077.19it/s]
{
  "ex_accuracy": 0.5380596128725804,
  "lf_accuracy": 0.45208407552547203
}
```





> test

```shell
python evaluate.py data/test.jsonl data/test.db test/example.pred.dev.jsonl
```

Output:

```ini
python evaluate.py data/test.jsonl data/test.db test/example.pred.dev.jsonl
 53%|██████████████████████████████████████████████████████████▊                                                    | 8421/15878 [00:10<00:09, 778.32it/s]
{
  "ex_accuracy": 0.006887543047144045,
  "lf_accuracy": 0.0
}
```

