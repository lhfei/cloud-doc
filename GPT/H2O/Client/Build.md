### [Prerequisites](https://github.com/h2oai/h2ogpt/tree/main/client#prerequisites)

- Python 3.8+

If you don't have Python 3.8 in your system, you can use [Conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html).

```shell
conda create -n h2ogpt_client_build -y
conda activate h2ogpt_client_build
conda install python=3.8 -y
```



### [Setup](https://github.com/h2oai/h2ogpt/tree/main/client#setup)

ℹ️ [Poetry](https://python-poetry.org/) is used as the build tool.

```shell
rm -rf client/.poetry/
make -C client setup
```



### [Build](https://github.com/h2oai/h2ogpt/tree/main/client#build)

```shell
make -C client build
```



Distribution wheel file can be found in the `client/dist` directory. This wheel can be installed in the primary h2oGPT environment or any other environment, e.g.

```shell
pip install client/dist/h2ogpt_client-*-py3-none-any.whl
```



## [Usage](https://github.com/h2oai/h2ogpt/tree/main/client#usage)

```shell
from h2ogpt_client import Client

client = Client("http://0.0.0.0:7860")

# Text completion
text_completion = client.text_completion.create()
response = await text_completion.complete("Hello world")
# Text completion: synchronous
response = text_completion.complete_sync("Hello world")

# Chat completion
chat_completion = client.chat_completion.create()
reply = await chat_completion.chat("Hey!")
print(reply["user"])  # prints user prompt, i.e. "Hey!"
print(reply["gpt"])   # prints reply from h2oGPT
chat_history = chat_completion.chat_history()
# Chat completion: synchronous
reply = chat_completion.chat_sync("Hey!")
```



⚠️ **Note**: Client APIs are still evolving. Hence, APIs can be changed without prior warnings.

## [Development Guide](https://github.com/h2oai/h2ogpt/tree/main/client#development-guide)

### [Test](https://github.com/h2oai/h2ogpt/tree/main/client#test)

In an h2oGPT environment with the client installed, can run tests that test client and server.

### [Test with h2oGPT env](https://github.com/h2oai/h2ogpt/tree/main/client#test-with-h2ogpt-env)

1. Install test dependencies of the Client into the h2oGPT Python environment.

```shell
make -C client setup_test
```



1. Run the tests with h2oGPT.

```shell
pytest client/tests/
```



#### [Test with an existing h2oGPT server](https://github.com/h2oai/h2ogpt/tree/main/client#test-with-an-existing-h2ogpt-server)

If you already have a running h2oGPT server, then set the `H2OGPT_SERVER` environment variable to use it for testing.

```shell
make H2OGPT_SERVER="http://0.0.0.0:7860" -C client test
```