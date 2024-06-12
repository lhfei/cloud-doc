

### 对话API



#### 1 有choices, dataset 为空

> Resuest

```shell
curl -X 'POST' \
  'http://dataos-21:8200/api/v1/gpt/v2/chat/solid' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "question": "5月29日贵州茅台股东大会上，对于在传统和创新两个方向的平衡，张德芹回应投资者表示，“创新如果能为茅台赋能，我们都会去做。创新一定是基于坚守茅台本质的底线之上，但是我们一定要创新，茅台一直在努力。",
  "scenario": "string",
  "answer": "string"
}'
```



> Response

```json
{
    "created": 1717690206,
    "choices": [
        {
            "index": 0,
            "finish_reason": "stop",
            "message": {
                "role": "assistant",
                "content": "1. 上市公司：贵州茅台\n2. 负面影响：没有提到任何关于贵州茅台存在负面影响的情况。\n3. 分析原因：贵州茅台通过保持传统优势，同时积极探索创新发展，为企业注入新的活力，这种平衡态度值得肯定。同时，该公司也表达了对于创新的重要性的认识，有望推动企业进一步发展。因此，可以认为贵州茅台并未受到负面影响，而是在寻求合理的平衡点，以实现可持续增长。"
            }
        }
    ],
    "object": "chat.completion",
    "usage": {
        "prompt_tokens": 191,
        "completion_tokens": 127,
        "total_tokens": 318
    },
    "final_out": "",
    "dataset": [
        {}
    ]
}
```



#### 2 有dataset , choices为空

>  Request

```shell
curl -X 'POST' \
  'http://dataos-21:8200/api/v1/gpt/v2/chat/solid' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -d '{
  "question": "看看最近一周的舆情情况， 按发布平台分组",
  "scenario": "string",
  "answer": "string"
}'
```



> Response

```json
{
    "created": 1717692471,
    "choices": [
        {
            "index": 0,
            "finish_reason": "stop",
            "message": {
                "role": "assistant",
                "content": "第一：无法确定具体上市公司，因为文中并未提及。\n\n第二：没有明确指出是否存在负面影响，只是在介绍最近的一周舆情情况。\n\n第三：因为文中的主要目的是介绍最近一周的舆情情况，而不是针对特定上市公司或评估其负面影响，因此难以得知其中是否涉及到某个上市公司的情况。"
            }
        }
    ],
    "object": "chat.completion",
    "usage": {
        "prompt_tokens": 128,
        "completion_tokens": 90,
        "total_tokens": 218
    },
    "final_out": "",
    "dataset": [
        {
            "rows": [
                [
                    "和讯网",
                    60
                ],
                [
                    "股吧",
                    32
                ],
                [
                    "东方财富",
                    27
                ],
                [
                    "今日头条",
                    20
                ],
                [
                    "新华网",
                    11
                ],
                [
                    "中国新闻网",
                    7
                ]
            ],
            "cols": [
                {
                    "display_name": "发布平台",
                    "source": "native",
                    "field_ref": [
                        "field",
                        "发布平台",
                        {
                            "base-type": "type/Text"
                        }
                    ],
                    "name": "发布平台",
                    "base_type": "type/Text",
                    "effective_type": "type/Text"
                },
                {
                    "display_name": "总计",
                    "source": "native",
                    "field_ref": [
                        "field",
                        "总计",
                        {
                            "base-type": "type/BigInteger"
                        }
                    ],
                    "name": "总计",
                    "base_type": "type/BigInteger",
                    "effective_type": "type/BigInteger"
                }
            ],
            "results_timezone": "Asia/Shanghai",
            "requested_timezone": "Asia/Shanghai",
            "results_metadata": {
                "columns": [
                    {
                        "display_name": "发布平台",
                        "field_ref": [
                            "field",
                            "发布平台",
                            {
                                "base-type": "type/Text"
                            }
                        ],
                        "name": "发布平台",
                        "base_type": "type/Text",
                        "effective_type": "type/Text",
                        "fingerprint": {
                            "global": {
                                "distinct-count": 4,
                                "nil%": 0
                            },
                            "type": {
                                "type/Text": {
                                    "percent-json": 0,
                                    "percent-url": 0,
                                    "percent-email": 0,
                                    "percent-state": 0,
                                    "average-length": 3.5
                                }
                            }
                        }
                    },
                    {
                        "display_name": "总计",
                        "field_ref": [
                            "field",
                            "总计",
                            {
                                "base-type": "type/BigInteger"
                            }
                        ],
                        "name": "总计",
                        "base_type": "type/BigInteger",
                        "effective_type": "type/BigInteger",
                        "fingerprint": {
                            "global": {
                                "distinct-count": 6,
                                "nil%": 0
                            },
                            "type": {
                                "type/Number": {
                                    "min": 7,
                                    "q1": 11,
                                    "q3": 32,
                                    "max": 60,
                                    "sd": 19.0516840900396,
                                    "avg": 26.1666666666667
                                }
                            }
                        }
                    }
                ]
            }
        }
    ],
    "successful": true
}
```

