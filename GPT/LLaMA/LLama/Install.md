Inference of [LLaMA](https://arxiv.org/abs/2302.13971) model in pure C/C++

**Hot topics:**

- [Add GPU support to ggml](https://github.com/ggerganov/llama.cpp/discussions/915)
- [Roadmap Apr 2023](https://github.com/ggerganov/llama.cpp/discussions/784)

## Description

The main goal is to run the model using 4-bit quantization on a MacBook

- Plain C/C++ implementation without dependencies
- Apple silicon first-class citizen - optimized via ARM NEON and Accelerate framework
- AVX2 support for x86 architectures
- Mixed F16 / F32 precision
- 4-bit quantization support
- Runs on the CPU

This was [hacked in an evening](https://github.com/ggerganov/llama.cpp/issues/33#issuecomment-1465108022) - I have no idea if it works correctly. Please do not make conclusions about the models based on the results from this implementation. For all I know, it can be completely wrong. This project is for educational purposes. New features will probably be added mostly through community contributions.

**Supported platforms:**

-  Mac OS
-  Linux
-  Windows (via CMake)
-  Docker

**Supported models:**

-  LLaMA 🦙
-  [Alpaca](https://github.com/ggerganov/llama.cpp#instruction-mode-with-alpaca)
-  [GPT4All](https://github.com/ggerganov/llama.cpp#using-gpt4all)
-  [Chinese LLaMA / Alpaca](https://github.com/ymcui/Chinese-LLaMA-Alpaca)
-  [Vigogne (French)](https://github.com/bofenghuang/vigogne)
-  [Vicuna](https://github.com/ggerganov/llama.cpp/discussions/643#discussioncomment-5533894)
-  [Koala](https://bair.berkeley.edu/blog/2023/04/03/koala/)

**Bindings:**

- Python: [abetlen/llama-cpp-python](https://github.com/abetlen/llama-cpp-python)
- Go: [go-skynet/go-llama.cpp](https://github.com/go-skynet/go-llama.cpp)
- Node.js: [hlhr202/llama-node](https://github.com/hlhr202/llama-node)

**UI:**

- [nat/openplayground](https://github.com/nat/openplayground)
- [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui)

------

Here is a typical run using LLaMA-7B:

```
make -j && ./main -m ./models/7B/ggml-model-q4_0.bin -p "Building a website can be done in 10 simple steps:" -n 512
I llama.cpp build info:
I UNAME_S:  Darwin
I UNAME_P:  arm
I UNAME_M:  arm64
I CFLAGS:   -I.              -O3 -DNDEBUG -std=c11   -fPIC -pthread -DGGML_USE_ACCELERATE
I CXXFLAGS: -I. -I./examples -O3 -DNDEBUG -std=c++11 -fPIC -pthread
I LDFLAGS:   -framework Accelerate
I CC:       Apple clang version 14.0.0 (clang-1400.0.29.202)
I CXX:      Apple clang version 14.0.0 (clang-1400.0.29.202)

make: Nothing to be done for `default'.
main: seed = 1678486056
llama_model_load: loading model from './models/7B/ggml-model-q4_0.bin' - please wait ...
llama_model_load: n_vocab = 32000
llama_model_load: n_ctx   = 512
llama_model_load: n_embd  = 4096
llama_model_load: n_mult  = 256
llama_model_load: n_head  = 32
llama_model_load: n_layer = 32
llama_model_load: n_rot   = 128
llama_model_load: f16     = 2
llama_model_load: n_ff    = 11008
llama_model_load: ggml ctx size = 4529.34 MB
llama_model_load: memory_size =   512.00 MB, n_mem = 16384
llama_model_load: .................................... done
llama_model_load: model size =  4017.27 MB / num tensors = 291

main: prompt: 'Building a website can be done in 10 simple steps:'
main: number of tokens in prompt = 15
     1 -> ''
  8893 -> 'Build'
   292 -> 'ing'
   263 -> ' a'
  4700 -> ' website'
   508 -> ' can'
   367 -> ' be'
  2309 -> ' done'
   297 -> ' in'
 29871 -> ' '
 29896 -> '1'
 29900 -> '0'
  2560 -> ' simple'
  6576 -> ' steps'
 29901 -> ':'

sampling parameters: temp = 0.800000, top_k = 40, top_p = 0.950000


Building a website can be done in 10 simple steps:
1) Select a domain name and web hosting plan
2) Complete a sitemap
3) List your products
4) Write product descriptions
5) Create a user account
6) Build the template
7) Start building the website
8) Advertise the website
9) Provide email support
10) Submit the website to search engines
A website is a collection of web pages that are formatted with HTML. HTML is the code that defines what the website looks like and how it behaves.
The HTML code is formatted into a template or a format. Once this is done, it is displayed on the user's browser.
The web pages are stored in a web server. The web server is also called a host. When the website is accessed, it is retrieved from the server and displayed on the user's computer.
A website is known as a website when it is hosted. This means that it is displayed on a host. The host is usually a web server.
A website can be displayed on different browsers. The browsers are basically the software that renders the website on the user's screen.
A website can also be viewed on different devices such as desktops, tablets and smartphones.
Hence, to have a website displayed on a browser, the website must be hosted.
A domain name is an address of a website. It is the name of the website.
The website is known as a website when it is hosted. This means that it is displayed on a host. The host is usually a web server.
A website can be displayed on different browsers. The browsers are basically the software that renders the website on the user’s screen.
A website can also be viewed on different devices such as desktops, tablets and smartphones. Hence, to have a website displayed on a browser, the website must be hosted.
A domain name is an address of a website. It is the name of the website.
A website is an address of a website. It is a collection of web pages that are formatted with HTML. HTML is the code that defines what the website looks like and how it behaves.
The HTML code is formatted into a template or a format. Once this is done, it is displayed on the user’s browser.
A website is known as a website when it is hosted

main: mem per token = 14434244 bytes
main:     load time =  1332.48 ms
main:   sample time =  1081.40 ms
main:  predict time = 31378.77 ms / 61.41 ms per token
main:    total time = 34036.74 ms
```

And here is another demo of running both LLaMA-7B and [whisper.cpp](https://github.com/ggerganov/whisper.cpp) on a single M1 Pro MacBook:

<details open="" class="details-reset border rounded-2" style="box-sizing: border-box; display: block; border: var(--primer-borderWidth-thin, 1px) solid var(--color-border-default)  !important; border-radius: var(--primer-borderRadius-medium, 6px)  !important; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary class="px-3 py-2" style="box-sizing: border-box; display: list-item; cursor: pointer; padding-top: var(--base-size-8, 8px)  !important; padding-bottom: var(--base-size-8, 8px)  !important; padding-right: var(--base-size-16, 16px)  !important; padding-left: var(--base-size-16, 16px)  !important; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-device-camera-video"><path d="M16 3.75v8.5a.75.75 0 0 1-1.136.643L11 10.575v.675A1.75 1.75 0 0 1 9.25 13h-7.5A1.75 1.75 0 0 1 0 11.25v-6.5C0 3.784.784 3 1.75 3h7.5c.966 0 1.75.784 1.75 1.75v.675l3.864-2.318A.75.75 0 0 1 16 3.75Zm-6.5 1a.25.25 0 0 0-.25-.25h-7.5a.25.25 0 0 0-.25.25v6.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-6.5ZM11 8.825l3.5 2.1v-5.85l-3.5 2.1Z"></path></svg><span>&nbsp;</span><span aria-label="Video description whisper-llama-lq.mp4" class="m-1" style="box-sizing: border-box; margin: var(--base-size-4, 4px)  !important;">whisper-llama-lq.mp4</span><span>&nbsp;</span><span class="dropdown-caret" style="box-sizing: border-box; border-bottom-color: rgba(0, 0, 0, 0); border-left-color: rgba(0, 0, 0, 0); border-right-color: rgba(0, 0, 0, 0); border-style: solid; border-width: var(--primer-borderWidth-thicker, 4px) var(--primer-borderWidth-thicker, 4px) 0; content: &quot;&quot;; display: inline-block; height: 0px; vertical-align: middle; width: 0px;"></span></summary><video src="https://user-images.githubusercontent.com/1991296/224442907-7693d4be-acaa-4e01-8b4f-add84093ffff.mp4" data-canonical-src="https://user-images.githubusercontent.com/1991296/224442907-7693d4be-acaa-4e01-8b4f-add84093ffff.mp4" controls="controls" muted="muted" class="d-block rounded-bottom-2 border-top width-fit" style="box-sizing: border-box; display: block !important; border-top: var(--primer-borderWidth-thin, 1px) solid var(--color-border-default)  !important; border-bottom-right-radius: var(--primer-borderRadius-medium, 6px)  !important; border-bottom-left-radius: var(--primer-borderRadius-medium, 6px)  !important; max-width: 100%; max-height: 640px; min-height: 200px;"></video></details>

## Usage

Here are the step for the LLaMA-7B model.

### Get the Code

```
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
```

### Build

Note: For Windows, CMake or Zig can be used.

1. Use `make`

   ```
   make
   ```

2. Use CMake

   ```
   mkdir build
   cd build
   cmake ..
   cmake --build . --config Release
   ```

3. Use Zig

   ```
   zig build -Drelease-fast
   ```

### Prepare Data & Run

```
# obtain the original LLaMA model weights and place them in ./models
ls ./models
65B 30B 13B 7B tokenizer_checklist.chk tokenizer.model

# install Python dependencies
python3 -m pip install -r requirements.txt

# convert the 7B model to ggml FP16 format
python3 convert.py models/7B/

# quantize the model to 4-bits (using method 2 = q4_0)
./quantize ./models/7B/ggml-model-f16.bin ./models/7B/ggml-model-q4_0.bin 2

# run the inference
./main -m ./models/7B/ggml-model-q4_0.bin -n 128
```

When running the larger models, make sure you have enough disk space to store all the intermediate files.

### Memory/Disk Requirements

As the models are currently fully loaded into memory, you will need adequate disk space to save them and sufficient RAM to load them. At the moment, memory and disk requirements are the same.

| model | original size | quantized size (4-bit) |
| ----- | ------------- | ---------------------- |
| 7B    | 13 GB         | 3.9 GB                 |
| 13B   | 24 GB         | 7.8 GB                 |
| 30B   | 60 GB         | 19.5 GB                |
| 65B   | 120 GB        | 38.5 GB                |

### Interactive mode

If you want a more ChatGPT-like experience, you can run in interactive mode by passing `-i` as a parameter. In this mode, you can always interrupt generation by pressing Ctrl+C and enter one or more lines of text which will be converted into tokens and appended to the current context. You can also specify a *reverse prompt* with the parameter `-r "reverse prompt string"`. This will result in user input being prompted whenever the exact tokens of the reverse prompt string are encountered in the generation. A typical use is to use a prompt which makes LLaMa emulate a chat between multiple users, say Alice and Bob, and pass `-r "Alice:"`.

Here is an example few-shot interaction, invoked with the command

```
# default arguments using 7B model
./examples/chat.sh

# advanced chat with 13B model
./examples/chat-13B.sh

# custom arguments using 13B model
./main -m ./models/13B/ggml-model-q4_0.bin -n 256 --repeat_penalty 1.0 --color -i -r "User:" -f prompts/chat-with-bob.txt
```

Note the use of `--color` to distinguish between user input and generated text.

[![image](https://user-images.githubusercontent.com/1991296/224575029-2af3c7dc-5a65-4f64-a6bb-517a532aea38.png)](https://user-images.githubusercontent.com/1991296/224575029-2af3c7dc-5a65-4f64-a6bb-517a532aea38.png)

### Instruction mode with Alpaca

1. First, download the `ggml` Alpaca model into the `./models` folder
2. Run the `main` tool like this:

```
./examples/alpaca.sh
```

Sample run:

```
== Running in interactive mode. ==
 - Press Ctrl+C to interject at any time.
 - Press Return to return control to LLaMa.
 - If you want to submit another line, end your input in '\'.

 Below is an instruction that describes a task. Write a response that appropriately completes the request.

> How many letters are there in the English alphabet?
There 26 letters in the English Alphabet
> What is the most common way of transportation in Amsterdam?
The majority (54%) are using public transit. This includes buses, trams and metros with over 100 lines throughout the city which make it very accessible for tourists to navigate around town as well as locals who commute by tram or metro on a daily basis
> List 5 words that start with "ca".
cadaver, cauliflower, cabbage (vegetable), catalpa (tree) and Cailleach.
>
```

### Using [GPT4All](https://github.com/nomic-ai/gpt4all)

- Obtain the `gpt4all-lora-quantized.bin` model

- It is distributed in the old `ggml` format which is now obsoleted

- You have to convert it to the new format using [./convert-gpt4all-to-ggml.py](https://github.com/ggerganov/llama.cpp/blob/master/convert-gpt4all-to-ggml.py). You may also need to convert the model from the old format to the new format with [./migrate-ggml-2023-03-30-pr613.py](https://github.com/ggerganov/llama.cpp/blob/master/migrate-ggml-2023-03-30-pr613.py):

  ```
  python3 convert-gpt4all-to-ggml.py models/gpt4all-7B/gpt4all-lora-quantized.bin ./models/tokenizer.model
  python3 migrate-ggml-2023-03-30-pr613.py models/gpt4all-7B/gpt4all-lora-quantized.bin models/gpt4all-7B/gpt4all-lora-quantized-new.bin
  ```

- You can now use the newly generated `gpt4all-lora-quantized-new.bin` model in exactly the same way as all other models

- The original model is saved in the same folder with a suffix `.orig`

### Obtaining and verifying the Facebook LLaMA original model and Stanford Alpaca model data

- **Under no circumstances share IPFS, magnet links, or any other links to model downloads anywhere in this respository, including in issues, discussions or pull requests. They will be immediately deleted.**

- The LLaMA models are officially distributed by Facebook and will **never** be provided through this repository.

- Refer to [Facebook's LLaMA repository](https://github.com/facebookresearch/llama/pull/73/files) if you need to request access to the model data.

- Please verify the [sha256 checksums](https://github.com/ggerganov/llama.cpp/blob/master/SHA256SUMS) of all downloaded model files to confirm that you have the correct model data files before creating an issue relating to your model files.

- The following command will verify if you have all possible latest files in your self-installed `./models` subdirectory:

  `sha256sum --ignore-missing -c SHA256SUMS` on Linux

  or

  `shasum -a 256 --ignore-missing -c SHA256SUMS` on macOS

- If your issue is with model generation quality then please at least scan the following links and papers to understand the limitations of LLaMA models. This is especially important when choosing an appropriate model size and appreciating both the significant and subtle differences between LLaMA models and ChatGPT:

  - LLaMA:
    - [Introducing LLaMA: A foundational, 65-billion-parameter large language model](https://ai.facebook.com/blog/large-language-model-llama-meta-ai/)
    - [LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/abs/2302.13971)
  - GPT-3
    - [Language Models are Few-Shot Learners](https://arxiv.org/abs/2005.14165)
  - GPT-3.5 / InstructGPT / ChatGPT:
    - [Aligning language models to follow instructions](https://openai.com/research/instruction-following)
    - [Training language models to follow instructions with human feedback](https://arxiv.org/abs/2203.02155)

### Perplexity (Measuring model quality)

You can use the `perplexity` example to measure perplexity over the given prompt. For more background, see https://huggingface.co/docs/transformers/perplexity. However, in general, lower perplexity is better for LLMs.

#### Latest measurements

The latest perplexity scores for the various model sizes and quantizations are being tracked in [discussion #406](https://github.com/ggerganov/llama.cpp/discussions/406). `llama.cpp` is measuring very well compared to the baseline implementations. Quantization has a small negative impact to quality, but, as you can see, running 13B at q4_0 beats the 7B f16 model by a significant amount.

All measurements are done against wikitext2 test dataset (https://paperswithcode.com/dataset/wikitext-2), with default options (512 length context). Note that the changing the context length will have a significant impact on perplexity (longer context = better perplexity).

```
Perplexity - model options
5.5985 - 13B, q4_0
5.9565 - 7B, f16
6.3001 - 7B, q4_1
6.5949 - 7B, q4_0
6.5995 - 7B, q4_0, --memory_f16
```

#### How to run

1. Download/extract: https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-2-raw-v1.zip?ref=salesforce-research
2. Run `./perplexity -m models/7B/ggml-model-q4_0.bin -f wiki.test.raw`
3. Output:

```
perplexity : calculating perplexity over 655 chunks
24.43 seconds per pass - ETA 4.45 hours
[1]4.5970,[2]5.1807,[3]6.0382,...
```

And after 4.45 hours, you will have the final perplexity.

### Android

You can easily run `llama.cpp` on Android device with [termux](https://termux.dev/). First, obtain the [Android NDK](https://developer.android.com/ndk) and then build with CMake:

```
$ mkdir build-android
$ cd build-android
$ export NDK=<your_ndk_directory>
$ cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-23 -DCMAKE_C_FLAGS=-march=armv8.4a+dotprod ..
$ make
```

Install [termux](https://termux.dev/) on your device and run `termux-setup-storage` to get access to your SD card. Finally, copy the `llama` binary and the model files to your device storage. Here is a demo of an interactive session running on Pixel 5 phone:

<details open="" class="details-reset border rounded-2" style="box-sizing: border-box; display: block; border: var(--primer-borderWidth-thin, 1px) solid var(--color-border-default)  !important; border-radius: var(--primer-borderRadius-medium, 6px)  !important; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary class="px-3 py-2" style="box-sizing: border-box; display: list-item; cursor: pointer; padding-top: var(--base-size-8, 8px)  !important; padding-bottom: var(--base-size-8, 8px)  !important; padding-right: var(--base-size-16, 16px)  !important; padding-left: var(--base-size-16, 16px)  !important; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-device-camera-video"><path d="M16 3.75v8.5a.75.75 0 0 1-1.136.643L11 10.575v.675A1.75 1.75 0 0 1 9.25 13h-7.5A1.75 1.75 0 0 1 0 11.25v-6.5C0 3.784.784 3 1.75 3h7.5c.966 0 1.75.784 1.75 1.75v.675l3.864-2.318A.75.75 0 0 1 16 3.75Zm-6.5 1a.25.25 0 0 0-.25-.25h-7.5a.25.25 0 0 0-.25.25v6.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-6.5ZM11 8.825l3.5 2.1v-5.85l-3.5 2.1Z"></path></svg><span>&nbsp;</span><span aria-label="Video description llama-interactive2.mp4" class="m-1" style="box-sizing: border-box; margin: var(--base-size-4, 4px)  !important;">llama-interactive2.mp4</span><span>&nbsp;</span><span class="dropdown-caret" style="box-sizing: border-box; border-bottom-color: rgba(0, 0, 0, 0); border-left-color: rgba(0, 0, 0, 0); border-right-color: rgba(0, 0, 0, 0); border-style: solid; border-width: var(--primer-borderWidth-thicker, 4px) var(--primer-borderWidth-thicker, 4px) 0; content: &quot;&quot;; display: inline-block; height: 0px; vertical-align: middle; width: 0px;"></span></summary><video src="https://user-images.githubusercontent.com/271616/225014776-1d567049-ad71-4ef2-b050-55b0b3b9274c.mp4" data-canonical-src="https://user-images.githubusercontent.com/271616/225014776-1d567049-ad71-4ef2-b050-55b0b3b9274c.mp4" controls="controls" muted="muted" class="d-block rounded-bottom-2 border-top width-fit" style="box-sizing: border-box; display: block !important; border-top: var(--primer-borderWidth-thin, 1px) solid var(--color-border-default)  !important; border-bottom-right-radius: var(--primer-borderRadius-medium, 6px)  !important; border-bottom-left-radius: var(--primer-borderRadius-medium, 6px)  !important; max-width: 100%; max-height: 640px; min-height: 200px;"></video></details>

### Docker

#### Prerequisites

- Docker must be installed and running on your system.
- Create a folder to store big models & intermediate files (in ex. im using /llama/models)

#### Images

We have two Docker images available for this project:

1. `ghcr.io/ggerganov/llama.cpp:full`: This image includes both the main executable file and the tools to convert LLaMA models into ggml and convert into 4-bit quantization.
2. `ghcr.io/ggerganov/llama.cpp:light`: This image only includes the main executable file.

#### Usage

The easiest way to download the models, convert them to ggml and optimize them is with the --all-in-one command which includes the full docker image.

Replace `/path/to/models` below with the actual path where you downloaded the models.

```
docker run -v /path/to/models:/models ghcr.io/ggerganov/llama.cpp:full --all-in-one "/models/" 7B
```

On complete, you are ready to play!

```
docker run -v /path/to/models:/models ghcr.io/ggerganov/llama.cpp:full --run -m /models/7B/ggml-model-q4_0.bin -p "Building a website can be done in 10 simple steps:" -n 512
```

or with light image:

```
docker run -v /path/to/models:/models ghcr.io/ggerganov/llama.cpp:light -m /models/7B/ggml-model-q4_0.bin -p "Building a website can be done in 10 simple steps:" -n 512
```

### Contributing

- Contributors can open PRs
- Collaborators can push to branches in the `llama.cpp` repo and merge PRs into the `master` branch
- Collaborators will be invited based on contributions
- Any help with managing issues and PRs is very appreciated!
- Make sure to read this: [Inference at the edge](https://github.com/ggerganov/llama.cpp/discussions/205)
- A bit of backstory for those who are interested: [Changelog podcast](https://changelog.com/podcast/532)

### Coding guidelines

- Avoid adding third-party dependencies, extra files, extra headers, etc.
- Always consider cross-compatibility with other operating systems and architectures
- Avoid fancy looking modern STL constructs, use basic `for` loops, avoid templates, keep it simple
- There are no strict rules for the code style, but try to follow the patterns in the code (indentation, spaces, etc.). Vertical alignment makes things more readable and easier to batch edit
- Clean-up any trailing whitespaces, use 4 spaces indentation, brackets on same line, `void * ptr`, `int & a`
- See [good first issues](https://github.com/ggerganov/llama.cpp/issues?q=is%3Aissue+is%3Aopen+label%3A"good+first+issue") for tasks suitable for first contributions

### Docs

- [GGML tips & tricks](https://github.com/ggerganov/llama.cpp/wiki/GGML-Tips-&-Tricks)