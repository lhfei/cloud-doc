## Usage



### Prepared

GCC

```shell
scl enable devtoolset-11 bash
```





Here are the end-to-end binary build and model conversion steps for most supported models.

### Get the Code



```
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp
```



### Build



In order to build llama.cpp you have four different options.

- Using `make`:

  - On Linux or MacOS:

    ```
    make
    ```

    

  - On Windows:

    1. Download the latest fortran version of [w64devkit](https://github.com/skeeto/w64devkit/releases).

    2. Extract `w64devkit` on your pc.

    3. Run `w64devkit.exe`.

    4. Use the `cd` command to reach the `llama.cpp` folder.

    5. From here you can run:

       ```
       make
       ```

       

  - Notes:

    - For faster compilation, add the `-j` argument to run multiple jobs in parallel. For example, `make -j 8` will run 8 jobs in parallel.
    - For faster repeated compilation, install [ccache](https://ccache.dev/).
    - For debug builds, run `make LLAMA_DEBUG=1`

- Using `CMake`:

  ```
  cmake -B build
  cmake --build build --config Release
  ```

  

  **Notes**:

  - For faster compilation, add the `-j` argument to run multiple jobs in parallel. For example, `cmake --build build --config Release -j 8` will run 8 jobs in parallel.

  - For faster repeated compilation, install [ccache](https://ccache.dev/).

  - For debug builds, there are two cases:

    1. Single-config generators (e.g. default = `Unix Makefiles`; note that they just ignore the `--config` flag):

    ```
    cmake -B build -DCMAKE_BUILD_TYPE=Debug
    cmake --build build
    ```

    

    1. Multi-config generators (`-G` param set to Visual Studio, XCode...):

    ```
    cmake -B build -G "Xcode"
    cmake --build build --config Debug
    ```

    

- Using `Zig` (version 0.11 or later):

  Building for optimization levels and CPU features can be accomplished using standard build arguments, for example AVX2, FMA, F16C, it's also possible to cross compile for other operating systems and architectures:

  ```
  zig build -Doptimize=ReleaseFast -Dtarget=x86_64-windows-gnu -Dcpu=x86_64+avx2+fma+f16c
  ```

  

  The `zig targets` command will give you valid options to use.

- Using `gmake` (FreeBSD):

  1. Install and activate [DRM in FreeBSD](https://wiki.freebsd.org/Graphics)

  2. Add your user to **video** group

  3. Install compilation dependencies.

     ```
     sudo pkg install gmake automake autoconf pkgconf llvm15 clinfo clover \
         opencl clblast openblas
     
     gmake CC=/usr/local/bin/clang15 CXX=/usr/local/bin/clang++15 -j4
     ```

     

  **Notes:** With this packages you can build llama.cpp with OPENBLAS and CLBLAST support for use OpenCL GPU acceleration in FreeBSD. Please read the instructions for use and activate this options in this document below.

### Homebrew



On Mac and Linux, the homebrew package manager can be used via

```
brew install llama.cpp
```



The formula is automatically updated with new `llama.cpp` releases. More info: [#7668](https://github.com/ggerganov/llama.cpp/discussions/7668)

### Metal Build



On MacOS, Metal is enabled by default. Using Metal makes the computation run on the GPU. To disable the Metal build at compile time use the `LLAMA_NO_METAL=1` flag or the `LLAMA_METAL=OFF` cmake option.

When built with Metal support, you can explicitly disable GPU inference with the `--n-gpu-layers|-ngl 0` command-line argument.

### BLAS Build



Building the program with BLAS support may lead to some performance improvements in prompt processing using batch sizes higher than 32 (the default is 512). Support with CPU-only BLAS implementations doesn't affect the normal generation performance. We may see generation performance improvements with GPU-involved BLAS implementations, e.g. cuBLAS, hipBLAS and CLBlast. There are currently several different BLAS implementations available for build and use:

- #### Accelerate Framework:

  

  This is only available on Mac PCs and it's enabled by default. You can just build using the normal instructions.

- #### OpenBLAS:

  

  This provides BLAS acceleration using only the CPU. Make sure to have OpenBLAS installed on your machine.

  - Using `make`:

    - On Linux:

      ```
      make LLAMA_OPENBLAS=1
      ```

      

    - On Windows:

      1. Download the latest fortran version of [w64devkit](https://github.com/skeeto/w64devkit/releases).

      2. Download the latest version of [OpenBLAS for Windows](https://github.com/xianyi/OpenBLAS/releases).

      3. Extract `w64devkit` on your pc.

      4. From the OpenBLAS zip that you just downloaded copy `libopenblas.a`, located inside the `lib` folder, inside `w64devkit\x86_64-w64-mingw32\lib`.

      5. From the same OpenBLAS zip copy the content of the `include` folder inside `w64devkit\x86_64-w64-mingw32\include`.

      6. Run `w64devkit.exe`.

      7. Use the `cd` command to reach the `llama.cpp` folder.

      8. From here you can run:

         ```
         make LLAMA_OPENBLAS=1
         ```

         

  - Using `CMake` on Linux:

    ```
    cmake -B build -DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=OpenBLAS
    cmake --build build --config Release
    ```

    

- #### BLIS

  

  Check [BLIS.md](https://github.com/ggerganov/llama.cpp/blob/master/docs/BLIS.md) for more information.

- #### SYCL

  

  SYCL is a higher-level programming model to improve programming productivity on various hardware accelerators.

  llama.cpp based on SYCL is used to **support Intel GPU** (Data Center Max series, Flex series, Arc series, Built-in GPU and iGPU).

  For detailed info, please refer to [llama.cpp for SYCL](https://github.com/ggerganov/llama.cpp/blob/master/README-sycl.md).

- #### Intel oneMKL

  

  Building through oneAPI compilers will make avx_vnni instruction set available for intel processors that do not support avx512 and avx512_vnni. Please note that this build config **does not support Intel GPU**. For Intel GPU support, please refer to [llama.cpp for SYCL](https://github.com/ggerganov/llama.cpp/blob/master/README-sycl.md).

  - Using manual oneAPI installation: By default, `LLAMA_BLAS_VENDOR` is set to `Generic`, so if you already sourced intel environment script and assign `-DLLAMA_BLAS=ON` in cmake, the mkl version of Blas will automatically been selected. Otherwise please install oneAPI and follow the below steps:

    ```
    source /opt/intel/oneapi/setvars.sh # You can skip this step if  in oneapi-basekit docker image, only required for manual installation
    cmake -B build -DLLAMA_BLAS=ON -DLLAMA_BLAS_VENDOR=Intel10_64lp -DCMAKE_C_COMPILER=icx -DCMAKE_CXX_COMPILER=icpx -DLLAMA_NATIVE=ON
    cmake --build build --config Release
    ```

    

  - Using oneAPI docker image: If you do not want to source the environment vars and install oneAPI manually, you can also build the code using intel docker container: [oneAPI-basekit](https://hub.docker.com/r/intel/oneapi-basekit). Then, you can use the commands given above.

  Check [Optimizing and Running LLaMA2 on Intel® CPU](https://www.intel.com/content/www/us/en/content-details/791610/optimizing-and-running-llama2-on-intel-cpu.html) for more information.

- #### CUDA

  

  This provides GPU acceleration using the CUDA cores of your Nvidia GPU. Make sure to have the CUDA toolkit installed. You can download it from your Linux distro's package manager (e.g. `apt install nvidia-cuda-toolkit`) or from here: [CUDA Toolkit](https://developer.nvidia.com/cuda-downloads).

  For Jetson user, if you have Jetson Orin, you can try this: [Offical Support](https://www.jetson-ai-lab.com/tutorial_text-generation.html). If you are using an old model(nano/TX2), need some additional operations before compiling.

  - Using `make`:

    ```
    make LLAMA_CUDA=1
    ```

    

  - Using `CMake`:

    ```
    cmake -B build -DLLAMA_CUDA=ON
    cmake --build build --config Release
    ```

    

  The environment variable [`CUDA_VISIBLE_DEVICES`](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#env-vars) can be used to specify which GPU(s) will be used. The following compilation options are also available to tweak performance:

  | Option                         | Legal values           | Default | Description                                                  |
  | ------------------------------ | ---------------------- | ------- | ------------------------------------------------------------ |
  | LLAMA_CUDA_FORCE_DMMV          | Boolean                | false   | Force the use of dequantization + matrix vector multiplication kernels instead of using kernels that do matrix vector multiplication on quantized data. By default the decision is made based on compute capability (MMVQ for 6.1/Pascal/GTX 1000 or higher). Does not affect k-quants. |
  | LLAMA_CUDA_DMMV_X              | Positive integer >= 32 | 32      | Number of values in x direction processed by the CUDA dequantization + matrix vector multiplication kernel per iteration. Increasing this value can improve performance on fast GPUs. Power of 2 heavily recommended. Does not affect k-quants. |
  | LLAMA_CUDA_MMV_Y               | Positive integer       | 1       | Block size in y direction for the CUDA mul mat vec kernels. Increasing this value can improve performance on fast GPUs. Power of 2 recommended. |
  | LLAMA_CUDA_FORCE_MMQ           | Boolean                | false   | Force the use of dequantization + matrix multiplication kernels instead of leveraging Math libraries. |
  | LLAMA_CUDA_F16                 | Boolean                | false   | If enabled, use half-precision floating point arithmetic for the CUDA dequantization + mul mat vec kernels and for the q4_1 and q5_1 matrix matrix multiplication kernels. Can improve performance on relatively recent GPUs. |
  | LLAMA_CUDA_KQUANTS_ITER        | 1 or 2                 | 2       | Number of values processed per iteration and per CUDA thread for Q2_K and Q6_K quantization formats. Setting this value to 1 can improve performance for slow GPUs. |
  | LLAMA_CUDA_PEER_MAX_BATCH_SIZE | Positive integer       | 128     | Maximum batch size for which to enable peer access between multiple GPUs. Peer access requires either Linux or NVLink. When using NVLink enabling peer access for larger batch sizes is potentially beneficial. |
  | LLAMA_CUDA_FA_ALL_QUANTS       | Boolean                | false   | Compile support for all KV cache quantization type (combinations) for the FlashAttention CUDA kernels. More fine-grained control over KV cache size but compilation takes much longer. |

- #### hipBLAS

  

  This provides BLAS acceleration on HIP-supported AMD GPUs. Make sure to have ROCm installed. You can download it from your Linux distro's package manager or from here: [ROCm Quick Start (Linux)](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html#rocm-install-quick).

  - Using `make`:

    ```
    make LLAMA_HIPBLAS=1
    ```

    

  - Using `CMake` for Linux (assuming a gfx1030-compatible AMD GPU):

    ```
    HIPCXX="$(hipconfig -l)/clang" HIP_PATH="$(hipconfig -R)" \
        cmake -S . -B build -DLLAMA_HIPBLAS=ON -DAMDGPU_TARGETS=gfx1030 -DCMAKE_BUILD_TYPE=Release \
        && cmake --build build --config Release -- -j 16
    ```

    

    On Linux it is also possible to use unified memory architecture (UMA) to share main memory between the CPU and integrated GPU by setting `-DLLAMA_HIP_UMA=ON`. However, this hurts performance for non-integrated GPUs (but enables working with integrated GPUs).

    Note that if you get the following error:

    ```
    clang: error: cannot find ROCm device library; provide its path via '--rocm-path' or '--rocm-device-lib-path', or pass '-nogpulib' to build without ROCm device library
    ```

    

    Try searching for a directory under `HIP_PATH` that contains the file `oclc_abi_version_400.bc`. Then, add the following to the start of the command: `HIP_DEVICE_LIB_PATH=<directory-you-just-found>`, so something like:

    ```
    HIPCXX="$(hipconfig -l)/clang" HIP_PATH="$(hipconfig -p)" \
    HIP_DEVICE_LIB_PATH=<directory-you-just-found> \
        cmake -S . -B build -DLLAMA_HIPBLAS=ON -DAMDGPU_TARGETS=gfx1030 -DCMAKE_BUILD_TYPE=Release \
        && cmake --build build -- -j 16
    ```

    

  - Using `make` (example for target gfx1030, build with 16 CPU threads):

    ```
    make -j16 LLAMA_HIPBLAS=1 LLAMA_HIP_UMA=1 AMDGPU_TARGETS=gfx1030
    ```

    

  - Using `CMake` for Windows (using x64 Native Tools Command Prompt for VS, and assuming a gfx1100-compatible AMD GPU):

    ```
    set PATH=%HIP_PATH%\bin;%PATH%
    cmake -S . -B build -G Ninja -DAMDGPU_TARGETS=gfx1100 -DLLAMA_HIPBLAS=ON -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release
    cmake --build build
    ```

    

    Make sure that `AMDGPU_TARGETS` is set to the GPU arch you want to compile for. The above example uses `gfx1100` that corresponds to Radeon RX 7900XTX/XT/GRE. You can find a list of targets [here](https://llvm.org/docs/AMDGPUUsage.html#processors) Find your gpu version string by matching the most significant version information from `rocminfo | grep gfx | head -1 | awk '{print $2}'` with the list of processors, e.g. `gfx1035` maps to `gfx1030`.

  The environment variable [`HIP_VISIBLE_DEVICES`](https://rocm.docs.amd.com/en/latest/understand/gpu_isolation.html#hip-visible-devices) can be used to specify which GPU(s) will be used. If your GPU is not officially supported you can use the environment variable [`HSA_OVERRIDE_GFX_VERSION`] set to a similar GPU, for example 10.3.0 on RDNA2 (e.g. gfx1030, gfx1031, or gfx1035) or 11.0.0 on RDNA3. The following compilation options are also available to tweak performance (yes, they refer to CUDA, not HIP, because it uses the same code as the cuBLAS version above):

  | Option                  | Legal values           | Default | Description                                                  |
  | ----------------------- | ---------------------- | ------- | ------------------------------------------------------------ |
  | LLAMA_CUDA_DMMV_X       | Positive integer >= 32 | 32      | Number of values in x direction processed by the HIP dequantization + matrix vector multiplication kernel per iteration. Increasing this value can improve performance on fast GPUs. Power of 2 heavily recommended. Does not affect k-quants. |
  | LLAMA_CUDA_MMV_Y        | Positive integer       | 1       | Block size in y direction for the HIP mul mat vec kernels. Increasing this value can improve performance on fast GPUs. Power of 2 recommended. Does not affect k-quants. |
  | LLAMA_CUDA_KQUANTS_ITER | 1 or 2                 | 2       | Number of values processed per iteration and per HIP thread for Q2_K and Q6_K quantization formats. Setting this value to 1 can improve performance for slow GPUs. |

- #### CLBlast

  

  OpenCL acceleration is provided by the matrix multiplication kernels from the [CLBlast](https://github.com/CNugteren/CLBlast) project and custom kernels for ggml that can generate tokens on the GPU.

  You will need the [OpenCL SDK](https://github.com/KhronosGroup/OpenCL-SDK).

  - For Ubuntu, Debian, and Fedora the packages `opencl-headers`, `ocl-icd` may be needed.

  - For Windows, a pre-built SDK is available on the [OpenCL Releases](https://github.com/KhronosGroup/OpenCL-SDK/releases) page.

  - <details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;">Installing the OpenCL SDK from source</summary><div class="highlight highlight-source-shell notranslate position-relative overflow-auto" dir="auto" style="box-sizing: border-box; position: relative !important; overflow: auto !important; display: flex; margin-bottom: var(--base-size-16); justify-content: space-between; background-color: var(--bgColor-muted, var(--color-canvas-subtle));"><pre style="box-sizing: border-box; font-family: var(--fontStack-monospace, ui-monospace, SFMono-Regular, SF Mono, Menlo, Consolas, Liberation Mono, monospace); font-size: 13.6px; margin-top: 0px; margin-bottom: 0px; overflow-wrap: normal; padding: 16px; overflow: auto; line-height: 1.45; color: var(--fgColor-default, var(--color-fg-default)); background-color: var(--bgColor-muted, var(--color-canvas-subtle)); border-radius: 6px; word-break: normal; min-height: 52px;"><span class="pl-c1" style="box-sizing: border-box; color: var(--color-prettylights-syntax-constant);"></span></pre><div class="zeroclipboard-container" style="box-sizing: border-box; display: block; animation: auto ease 0s 1 normal none running none;"><clipboard-copy aria-label="Copy" class="ClipboardButton btn btn-invisible js-clipboard-copy m-2 p-0 tooltipped-no-delay d-flex flex-justify-center flex-items-center" data-copy-feedback="Copied!" data-tooltip-direction="w" value="git clone --recurse-submodules https://github.com/KhronosGroup/OpenCL-SDK.git
    cd OpenCL-SDK
    cmake -B build -DBUILD_DOCS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DBUILD_TESTING=OFF \
      -DOPENCL_SDK_BUILD_SAMPLES=OFF \
      -DOPENCL_SDK_TEST_SAMPLES=OFF
    cmake --build build
    cmake --install build --prefix /some/path" tabindex="0" role="button" style="box-sizing: border-box; position: relative; display: flex !important; padding: 0px !important; font-size: 14px; font-weight: var(--base-text-weight-medium, 500); line-height: 20px; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--fgColor-accent, var(--color-accent-fg)); background-color: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; justify-content: center !important; align-items: center !important; margin: var(--base-size-8, 8px) !important; width: var(--control-small-size, 28px); height: var(--control-small-size, 28px);"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"></path><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"></path></svg></clipboard-copy></div></div></details>

  ##### Installing CLBlast

  

  Pre-built CLBlast binaries may be found on the [CLBlast Releases](https://github.com/CNugteren/CLBlast/releases) page. For Unix variants, it may also be found in your operating system's packages.

  Linux packaging: Fedora Linux:

  ```
  sudo dnf install clblast
  ```

  

  Alternatively, they may be built from source.

  - <details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;">Windows:</summary><div class="highlight highlight-source-batchfile notranslate position-relative overflow-auto" dir="auto" style="box-sizing: border-box; position: relative !important; overflow: auto !important; display: flex; margin-bottom: var(--base-size-16); justify-content: space-between; background-color: var(--bgColor-muted, var(--color-canvas-subtle));"><pre style="box-sizing: border-box; font-family: var(--fontStack-monospace, ui-monospace, SFMono-Regular, SF Mono, Menlo, Consolas, Liberation Mono, monospace); font-size: 13.6px; margin-top: 0px; margin-bottom: 0px; overflow-wrap: normal; padding: 16px; overflow: auto; line-height: 1.45; color: var(--fgColor-default, var(--color-fg-default)); background-color: var(--bgColor-muted, var(--color-canvas-subtle)); border-radius: 6px; word-break: normal; min-height: 52px;"><span class="pl-k" style="box-sizing: border-box; color: var(--color-prettylights-syntax-keyword);"></span><span class="pl-smi" style="box-sizing: border-box; color: var(--color-prettylights-syntax-storage-modifier-import);"></span><span class="pl-k" style="box-sizing: border-box; color: var(--color-prettylights-syntax-keyword);"></span><span class="pl-s" style="box-sizing: border-box; color: var(--color-prettylights-syntax-string);"><span class="pl-pds" style="box-sizing: border-box; color: var(--color-prettylights-syntax-string);"></span><span class="pl-pds" style="box-sizing: border-box; color: var(--color-prettylights-syntax-string);"></span></span><span class="pl-k" style="box-sizing: border-box; color: var(--color-prettylights-syntax-keyword);"></span><span class="pl-smi" style="box-sizing: border-box; color: var(--color-prettylights-syntax-storage-modifier-import);"></span><span class="pl-s" style="box-sizing: border-box; color: var(--color-prettylights-syntax-string);"><span class="pl-pds" style="box-sizing: border-box; color: var(--color-prettylights-syntax-string);"></span><span class="pl-pds" style="box-sizing: border-box; color: var(--color-prettylights-syntax-string);"></span></span></pre><div class="zeroclipboard-container" style="box-sizing: border-box; display: block; animation: auto ease 0s 1 normal none running none;"><clipboard-copy aria-label="Copy" class="ClipboardButton btn btn-invisible js-clipboard-copy m-2 p-0 tooltipped-no-delay d-flex flex-justify-center flex-items-center" data-copy-feedback="Copied!" data-tooltip-direction="w" value="set OPENCL_SDK_ROOT=&quot;C:/OpenCL-SDK-v2023.04.17-Win-x64&quot;
    git clone https://github.com/CNugteren/CLBlast.git
    cd CLBlast
    cmake -B build -DBUILD_SHARED_LIBS=OFF -DOVERRIDE_MSVC_FLAGS_TO_MT=OFF -DTUNERS=OFF -DOPENCL_ROOT=%OPENCL_SDK_ROOT% -G &quot;Visual Studio 17 2022&quot; -A x64
    cmake --build build --config Release
    cmake --install build --prefix C:/CLBlast" tabindex="0" role="button" style="box-sizing: border-box; position: relative; display: flex !important; padding: 0px !important; font-size: 14px; font-weight: var(--base-text-weight-medium, 500); line-height: 20px; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--fgColor-accent, var(--color-accent-fg)); background-color: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; justify-content: center !important; align-items: center !important; margin: var(--base-size-8, 8px) !important; width: var(--control-small-size, 28px); height: var(--control-small-size, 28px);"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"></path><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"></path></svg></clipboard-copy></div></div></details>

  - <details style="box-sizing: border-box; display: block; margin-top: 0px; margin-bottom: 16px;"><summary style="box-sizing: border-box; display: list-item; cursor: pointer;">Unix:</summary><div class="highlight highlight-source-shell notranslate position-relative overflow-auto" dir="auto" style="box-sizing: border-box; position: relative !important; overflow: auto !important; display: flex; margin-bottom: var(--base-size-16); justify-content: space-between; background-color: var(--bgColor-muted, var(--color-canvas-subtle));"><pre style="box-sizing: border-box; font-family: var(--fontStack-monospace, ui-monospace, SFMono-Regular, SF Mono, Menlo, Consolas, Liberation Mono, monospace); font-size: 13.6px; margin-top: 0px; margin-bottom: 0px; overflow-wrap: normal; padding: 16px; overflow: auto; line-height: 1.45; color: var(--fgColor-default, var(--color-fg-default)); background-color: var(--bgColor-muted, var(--color-canvas-subtle)); border-radius: 6px; word-break: normal; min-height: 52px;"><span class="pl-c1" style="box-sizing: border-box; color: var(--color-prettylights-syntax-constant);"></span></pre><div class="zeroclipboard-container" style="box-sizing: border-box; display: block; animation: auto ease 0s 1 normal none running none;"><clipboard-copy aria-label="Copy" class="ClipboardButton btn btn-invisible js-clipboard-copy m-2 p-0 tooltipped-no-delay d-flex flex-justify-center flex-items-center" data-copy-feedback="Copied!" data-tooltip-direction="w" value="git clone https://github.com/CNugteren/CLBlast.git
    cd CLBlast
    cmake -B build -DBUILD_SHARED_LIBS=OFF -DTUNERS=OFF
    cmake --build build --config Release
    cmake --install build --prefix /some/path" tabindex="0" role="button" style="box-sizing: border-box; position: relative; display: flex !important; padding: 0px !important; font-size: 14px; font-weight: var(--base-text-weight-medium, 500); line-height: 20px; white-space: nowrap; vertical-align: middle; cursor: pointer; user-select: none; border: 0px; border-radius: 6px; appearance: none; color: var(--fgColor-accent, var(--color-accent-fg)); background-color: transparent; box-shadow: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color; justify-content: center !important; align-items: center !important; margin: var(--base-size-8, 8px) !important; width: var(--control-small-size, 28px); height: var(--control-small-size, 28px);"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-copy js-clipboard-copy-icon"><path d="M0 6.75C0 5.784.784 5 1.75 5h1.5a.75.75 0 0 1 0 1.5h-1.5a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-1.5a.75.75 0 0 1 1.5 0v1.5A1.75 1.75 0 0 1 9.25 16h-7.5A1.75 1.75 0 0 1 0 14.25Z"></path><path d="M5 1.75C5 .784 5.784 0 6.75 0h7.5C15.216 0 16 .784 16 1.75v7.5A1.75 1.75 0 0 1 14.25 11h-7.5A1.75 1.75 0 0 1 5 9.25Zm1.75-.25a.25.25 0 0 0-.25.25v7.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-7.5a.25.25 0 0 0-.25-.25Z"></path></svg></clipboard-copy></div></div></details>

  ##### Building Llama with CLBlast

  

  - Build with make:

    ```
    make LLAMA_CLBLAST=1
    ```

    

  - CMake (Unix):

    ```
    cmake -B build -DLLAMA_CLBLAST=ON -DCLBlast_DIR=/some/path
    cmake --build build --config Release
    ```

    

  - CMake (Windows):

    ```
    set CL_BLAST_CMAKE_PKG="C:/CLBlast/lib/cmake/CLBlast"
    git clone https://github.com/ggerganov/llama.cpp
    cd llama.cpp
    cmake -B build -DBUILD_SHARED_LIBS=OFF -DLLAMA_CLBLAST=ON -DCMAKE_PREFIX_PATH=%CL_BLAST_CMAKE_PKG% -G "Visual Studio 17 2022" -A x64
    cmake --build build --config Release
    cmake --install build --prefix C:/LlamaCPP
    ```

    

  ##### Running Llama with CLBlast

  

  The CLBlast build supports `--gpu-layers|-ngl` like the CUDA version does.

  To select the correct platform (driver) and device (GPU), you can use the environment variables `GGML_OPENCL_PLATFORM` and `GGML_OPENCL_DEVICE`. The selection can be a number (starting from 0) or a text string to search:

  ```
  GGML_OPENCL_PLATFORM=1 ./main ...
  GGML_OPENCL_DEVICE=2 ./main ...
  GGML_OPENCL_PLATFORM=Intel ./main ...
  GGML_OPENCL_PLATFORM=AMD GGML_OPENCL_DEVICE=1 ./main ...
  ```

  

  The default behavior is to find the first GPU device, but when it is an integrated GPU on a laptop, for instance, the selectors are useful. Using the variables it is possible to select a CPU-based driver as well, if so desired.

  You can get a list of platforms and devices from the `clinfo -l` command, etc.

- #### Vulkan

  

  **With docker**:

  You don't need to install Vulkan SDK. It will be installed inside the container.

  ```
  # Build the image
  docker build -t llama-cpp-vulkan -f .devops/main-vulkan.Dockerfile .
  
  # Then, use it:
  docker run -it --rm -v "$(pwd):/app:Z" --device /dev/dri/renderD128:/dev/dri/renderD128 --device /dev/dri/card1:/dev/dri/card1 llama-cpp-vulkan -m "/app/models/YOUR_MODEL_FILE" -p "Building a website can be done in 10 simple steps:" -n 400 -e -ngl 33
  ```

  

  **Without docker**:

  Firstly, you need to make sure you have installed [Vulkan SDK](https://vulkan.lunarg.com/doc/view/latest/linux/getting_started_ubuntu.html)

  For example, on Ubuntu 22.04 (jammy), use the command below:

  ```
  wget -qO - https://packages.lunarg.com/lunarg-signing-key-pub.asc | apt-key add -
  wget -qO /etc/apt/sources.list.d/lunarg-vulkan-jammy.list https://packages.lunarg.com/vulkan/lunarg-vulkan-jammy.list
  apt update -y
  apt-get install -y vulkan-sdk
  # To verify the installation, use the command below:
  vulkaninfo
  ```

  

  Alternatively your package manager might be able to provide the appropiate libraries. For example for Ubuntu 22.04 you can install `libvulkan-dev` instead.

  Then, build llama.cpp using the cmake command below:

  ```
  cmake -B build -DLLAMA_VULKAN=1
  cmake --build build --config Release
  # Test the output binary (with "-ngl 33" to offload all layers to GPU)
  ./bin/main -m "PATH_TO_MODEL" -p "Hi you how are you" -n 50 -e -ngl 33 -t 4
  
  # You should see in the output, ggml_vulkan detected your GPU. For example:
  # ggml_vulkan: Using Intel(R) Graphics (ADL GT2) | uma: 1 | fp16: 1 | warp size: 32
  ```

  

### Prepare and Quantize



Note

You can use the [GGUF-my-repo](https://huggingface.co/spaces/ggml-org/gguf-my-repo) space on Hugging Face to quantise your model weights without any setup too. It is synced from `llama.cpp` main every 6 hours.

To obtain the official LLaMA 2 weights please see the [Obtaining and using the Facebook LLaMA 2 model](https://github.com/ggerganov/llama.cpp#obtaining-and-using-the-facebook-llama-2-model) section. There is also a large selection of pre-quantized `gguf` models available on Hugging Face.

Note: `convert.py` has been moved to `examples/convert-legacy-llama.py` and shouldn't be used for anything other than `Llama/Llama2/Mistral` models and their derievatives. It does not support LLaMA 3, you can use `convert-hf-to-gguf.py` with LLaMA 3 downloaded from Hugging Face.

```
# obtain the official LLaMA model weights and place them in ./models
ls ./models
llama-2-7b tokenizer_checklist.chk tokenizer.model
# [Optional] for models using BPE tokenizers
ls ./models
<folder containing weights and tokenizer json> vocab.json
# [Optional] for PyTorch .bin models like Mistral-7B
ls ./models
<folder containing weights and tokenizer json>

# install Python dependencies
python3 -m pip install -r requirements.txt

# convert the model to ggml FP16 format
python3 convert-hf-to-gguf.py models/mymodel/

# [Optional] for models using BPE tokenizers
python convert-hf-to-gguf.py models/mymodel/ --vocab-type bpe

# quantize the model to 4-bits (using Q4_K_M method)
./quantize ./models/mymodel/ggml-model-f16.gguf ./models/mymodel/ggml-model-Q4_K_M.gguf Q4_K_M

# update the gguf filetype to current version if older version is now unsupported
./quantize ./models/mymodel/ggml-model-Q4_K_M.gguf ./models/mymodel/ggml-model-Q4_K_M-v2.gguf COPY
```



### Run the quantized model



```
# start inference on a gguf model
./main -m ./models/mymodel/ggml-model-Q4_K_M.gguf -n 128
```



When running the larger models, make sure you have enough disk space to store all the intermediate files.

### Running on Windows with prebuilt binaries



You will find prebuilt Windows binaries on the release page.

Simply download and extract the latest zip package of choice: (e.g. `llama-b1380-bin-win-avx2-x64.zip`)

From the unzipped folder, open a terminal/cmd window here and place a pre-converted `.gguf` model file. Test out the main example like so:

```
.\main -m llama-2-7b.Q4_0.gguf -n 128
```



### Memory/Disk Requirements



As the models are currently fully loaded into memory, you will need adequate disk space to save them and sufficient RAM to load them. At the moment, memory and disk requirements are the same.

| Model | Original size | Quantized size (Q4_0) |
| ----- | ------------- | --------------------- |
| 7B    | 13 GB         | 3.9 GB                |
| 13B   | 24 GB         | 7.8 GB                |
| 30B   | 60 GB         | 19.5 GB               |
| 65B   | 120 GB        | 38.5 GB               |

### Quantization



Several quantization methods are supported. They differ in the resulting model disk size and inference speed.

*(outdated)*

| Model | Measure      | F16    | Q4_0   | Q4_1   | Q5_0   | Q5_1   | Q8_0   |
| ----- | ------------ | ------ | ------ | ------ | ------ | ------ | ------ |
| 7B    | perplexity   | 5.9066 | 6.1565 | 6.0912 | 5.9862 | 5.9481 | 5.9070 |
| 7B    | file size    | 13.0G  | 3.5G   | 3.9G   | 4.3G   | 4.7G   | 6.7G   |
| 7B    | ms/tok @ 4th | 127    | 55     | 54     | 76     | 83     | 72     |
| 7B    | ms/tok @ 8th | 122    | 43     | 45     | 52     | 56     | 67     |
| 7B    | bits/weight  | 16.0   | 4.5    | 5.0    | 5.5    | 6.0    | 8.5    |
| 13B   | perplexity   | 5.2543 | 5.3860 | 5.3608 | 5.2856 | 5.2706 | 5.2548 |
| 13B   | file size    | 25.0G  | 6.8G   | 7.6G   | 8.3G   | 9.1G   | 13G    |
| 13B   | ms/tok @ 4th | -      | 103    | 105    | 148    | 160    | 131    |
| 13B   | ms/tok @ 8th | -      | 73     | 82     | 98     | 105    | 128    |
| 13B   | bits/weight  | 16.0   | 4.5    | 5.0    | 5.5    | 6.0    | 8.5    |

- [k-quants](https://github.com/ggerganov/llama.cpp/pull/1684)
- recent k-quants improvements and new i-quants
  - [#2707](https://github.com/ggerganov/llama.cpp/pull/2707)
  - [#2807](https://github.com/ggerganov/llama.cpp/pull/2807)
  - [#4773 - 2-bit i-quants (inference)](https://github.com/ggerganov/llama.cpp/pull/4773)
  - [#4856 - 2-bit i-quants (inference)](https://github.com/ggerganov/llama.cpp/pull/4856)
  - [#4861 - importance matrix](https://github.com/ggerganov/llama.cpp/pull/4861)
  - [#4872 - MoE models](https://github.com/ggerganov/llama.cpp/pull/4872)
  - [#4897 - 2-bit quantization](https://github.com/ggerganov/llama.cpp/pull/4897)
  - [#4930 - imatrix for all k-quants](https://github.com/ggerganov/llama.cpp/pull/4930)
  - [#4951 - imatrix on the GPU](https://github.com/ggerganov/llama.cpp/pull/4957)
  - [#4969 - imatrix for legacy quants](https://github.com/ggerganov/llama.cpp/pull/4969)
  - [#4996 - k-qunats tuning](https://github.com/ggerganov/llama.cpp/pull/4996)
  - [#5060 - Q3_K_XS](https://github.com/ggerganov/llama.cpp/pull/5060)
  - [#5196 - 3-bit i-quants](https://github.com/ggerganov/llama.cpp/pull/5196)
  - [quantization tuning](https://github.com/ggerganov/llama.cpp/pull/5320), [another one](https://github.com/ggerganov/llama.cpp/pull/5334), and [another one](https://github.com/ggerganov/llama.cpp/pull/5361)

### Perplexity (measuring model quality)



You can use the `perplexity` example to measure perplexity over a given prompt (lower perplexity is better). For more information, see https://huggingface.co/docs/transformers/perplexity.

The perplexity measurements in table above are done against the `wikitext2` test dataset (https://paperswithcode.com/dataset/wikitext-2), with context length of 512. The time per token is measured on a MacBook M1 Pro 32GB RAM using 4 and 8 threads.

#### How to run



1. Download/extract: https://huggingface.co/datasets/ggml-org/ci/resolve/main/wikitext-2-raw-v1.zip
2. Run `./perplexity -m models/7B/ggml-model-q4_0.gguf -f wiki.test.raw`
3. Output:

```
perplexity : calculating perplexity over 655 chunks
24.43 seconds per pass - ETA 4.45 hours
[1]4.5970,[2]5.1807,[3]6.0382,...
```



And after 4.45 hours, you will have the final perplexity.

### Interactive mode



If you want a more ChatGPT-like experience, you can run in interactive mode by passing `-i` as a parameter. In this mode, you can always interrupt generation by pressing Ctrl+C and entering one or more lines of text, which will be converted into tokens and appended to the current context. You can also specify a *reverse prompt* with the parameter `-r "reverse prompt string"`. This will result in user input being prompted whenever the exact tokens of the reverse prompt string are encountered in the generation. A typical use is to use a prompt that makes LLaMA emulate a chat between multiple users, say Alice and Bob, and pass `-r "Alice:"`.

Here is an example of a few-shot interaction, invoked with the command

```
# default arguments using a 7B model
./examples/chat.sh

# advanced chat with a 13B model
./examples/chat-13B.sh

# custom arguments using a 13B model
./main -m ./models/13B/ggml-model-q4_0.gguf -n 256 --repeat_penalty 1.0 --color -i -r "User:" -f prompts/chat-with-bob.txt
```



Note the use of `--color` to distinguish between user input and generated text. Other parameters are explained in more detail in the [README](https://github.com/ggerganov/llama.cpp/blob/master/examples/main/README.md) for the `main` example program.

[![image](https://user-images.githubusercontent.com/1991296/224575029-2af3c7dc-5a65-4f64-a6bb-517a532aea38.png)](https://user-images.githubusercontent.com/1991296/224575029-2af3c7dc-5a65-4f64-a6bb-517a532aea38.png)

### Persistent Interaction



The prompt, user inputs, and model generations can be saved and resumed across calls to `./main` by leveraging `--prompt-cache` and `--prompt-cache-all`. The `./examples/chat-persistent.sh` script demonstrates this with support for long-running, resumable chat sessions. To use this example, you must provide a file to cache the initial chat prompt and a directory to save the chat session, and may optionally provide the same variables as `chat-13B.sh`. The same prompt cache can be reused for new chat sessions. Note that both prompt cache and chat directory are tied to the initial prompt (`PROMPT_TEMPLATE`) and the model file.

```
# Start a new chat
PROMPT_CACHE_FILE=chat.prompt.bin CHAT_SAVE_DIR=./chat/default ./examples/chat-persistent.sh

# Resume that chat
PROMPT_CACHE_FILE=chat.prompt.bin CHAT_SAVE_DIR=./chat/default ./examples/chat-persistent.sh

# Start a different chat with the same prompt/model
PROMPT_CACHE_FILE=chat.prompt.bin CHAT_SAVE_DIR=./chat/another ./examples/chat-persistent.sh

# Different prompt cache for different prompt/model
PROMPT_TEMPLATE=./prompts/chat-with-bob.txt PROMPT_CACHE_FILE=bob.prompt.bin \
    CHAT_SAVE_DIR=./chat/bob ./examples/chat-persistent.sh
```



### Constrained output with grammars



`llama.cpp` supports grammars to constrain model output. For example, you can force the model to output JSON only:

```
./main -m ./models/13B/ggml-model-q4_0.gguf -n 256 --grammar-file grammars/json.gbnf -p 'Request: schedule a call at 8pm; Command:'
```



The `grammars/` folder contains a handful of sample grammars. To write your own, check out the [GBNF Guide](https://github.com/ggerganov/llama.cpp/blob/master/grammars/README.md).

For authoring more complex JSON grammars, you can also check out https://grammar.intrinsiclabs.ai/, a browser app that lets you write TypeScript interfaces which it compiles to GBNF grammars that you can save for local use. Note that the app is built and maintained by members of the community, please file any issues or FRs on [its repo](http://github.com/intrinsiclabsai/gbnfgen) and not this one.

### Instruct mode



1. First, download and place the `ggml` model into the `./models` folder
2. Run the `main` tool like this:

```
./examples/alpaca.sh
```



Sample run:

```
== Running in interactive mode. ==
 - Press Ctrl+C to interject at any time.
 - Press Return to return control to LLaMA.
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



### Obtaining and using the Facebook LLaMA 2 model



- Refer to [Facebook's LLaMA download page](https://ai.meta.com/resources/models-and-libraries/llama-downloads/) if you want to access the model data.

- Alternatively, if you want to save time and space, you can download already converted and quantized models from

   

  TheBloke

  , including:

  - [LLaMA 2 7B base](https://huggingface.co/TheBloke/Llama-2-7B-GGUF)
  - [LLaMA 2 13B base](https://huggingface.co/TheBloke/Llama-2-13B-GGUF)
  - [LLaMA 2 70B base](https://huggingface.co/TheBloke/Llama-2-70B-GGUF)
  - [LLaMA 2 7B chat](https://huggingface.co/TheBloke/Llama-2-7B-chat-GGUF)
  - [LLaMA 2 13B chat](https://huggingface.co/TheBloke/Llama-2-13B-chat-GGUF)
  - [LLaMA 2 70B chat](https://huggingface.co/TheBloke/Llama-2-70B-chat-GGUF)

### Seminal papers and background on the models



If your issue is with model generation quality, then please at least scan the following links and papers to understand the limitations of LLaMA models. This is especially important when choosing an appropriate model size and appreciating both the significant and subtle differences between LLaMA models and ChatGPT:

- LLaMA:
  - [Introducing LLaMA: A foundational, 65-billion-parameter large language model](https://ai.facebook.com/blog/large-language-model-llama-meta-ai/)
  - [LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/abs/2302.13971)
- GPT-3
  - [Language Models are Few-Shot Learners](https://arxiv.org/abs/2005.14165)
- GPT-3.5 / InstructGPT / ChatGPT:
  - [Aligning language models to follow instructions](https://openai.com/research/instruction-following)
  - [Training language models to follow instructions with human feedback](https://arxiv.org/abs/2203.02155)

### Android



#### Build on Android using Termux



[Termux](https://github.com/termux/termux-app#installation) is a method to execute `llama.cpp` on an Android device (no root required).

```
apt update && apt upgrade -y
apt install git make cmake
```



It's recommended to move your model inside the `~/` directory for best performance:

```
cd storage/downloads
mv model.gguf ~/
```



[Get the code](https://github.com/ggerganov/llama.cpp#get-the-code) & [follow the Linux build instructions](https://github.com/ggerganov/llama.cpp#build) to build `llama.cpp`.

#### Building the Project using Android NDK



Obtain the [Android NDK](https://developer.android.com/ndk) and then build with CMake.

Execute the following commands on your computer to avoid downloading the NDK to your mobile. Alternatively, you can also do this in Termux:

```
$ mkdir build-android
$ cd build-android
$ export NDK=<your_ndk_directory>
$ cmake -DCMAKE_TOOLCHAIN_FILE=$NDK/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-23 -DCMAKE_C_FLAGS=-march=armv8.4a+dotprod ..
$ make
```



Install [termux](https://github.com/termux/termux-app#installation) on your device and run `termux-setup-storage` to get access to your SD card (if Android 11+ then run the command twice).

Finally, copy these built `llama` binaries and the model file to your device storage. Because the file permissions in the Android sdcard cannot be changed, you can copy the executable files to the `/data/data/com.termux/files/home/bin` path, and then execute the following commands in Termux to add executable permission:

(Assumed that you have pushed the built executable files to the /sdcard/llama.cpp/bin path using `adb push`)

```
$cp -r /sdcard/llama.cpp/bin /data/data/com.termux/files/home/
$cd /data/data/com.termux/files/home/bin
$chmod +x ./*
```



Download model [llama-2-7b-chat.Q4_K_M.gguf](https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/blob/main/llama-2-7b-chat.Q4_K_M.gguf), and push it to `/sdcard/llama.cpp/`, then move it to `/data/data/com.termux/files/home/model/`

```
$mv /sdcard/llama.cpp/llama-2-7b-chat.Q4_K_M.gguf /data/data/com.termux/files/home/model/
```



Now, you can start chatting:

```
$cd /data/data/com.termux/files/home/bin
$./main -m ../model/llama-2-7b-chat.Q4_K_M.gguf -n 128 -cml
```



Here's a demo of an interactive session running on Pixel 5 phone:

<details open="" class="details-reset border rounded-2" style="box-sizing: border-box; display: block; border: var(--borderWidth-thin, 1px) solid var(--borderColor-default, var(--color-border-default)) !important; border-radius: var(--borderRadius-medium, 6px) !important; margin-top: 0px; margin-bottom: 16px; color: rgb(31, 35, 40); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><summary class="px-3 py-2" style="box-sizing: border-box; display: list-item; cursor: pointer; padding-top: var(--base-size-8, 8px) !important; padding-bottom: var(--base-size-8, 8px) !important; padding-right: var(--base-size-16, 16px) !important; padding-left: var(--base-size-16, 16px) !important; list-style: none; transition: color 80ms cubic-bezier(0.33, 1, 0.68, 1) 0s, background-color, box-shadow, border-color;"><svg aria-hidden="true" height="16" viewBox="0 0 16 16" version="1.1" width="16" data-view-component="true" class="octicon octicon-device-camera-video"><path d="M16 3.75v8.5a.75.75 0 0 1-1.136.643L11 10.575v.675A1.75 1.75 0 0 1 9.25 13h-7.5A1.75 1.75 0 0 1 0 11.25v-6.5C0 3.784.784 3 1.75 3h7.5c.966 0 1.75.784 1.75 1.75v.675l3.864-2.318A.75.75 0 0 1 16 3.75Zm-6.5 1a.25.25 0 0 0-.25-.25h-7.5a.25.25 0 0 0-.25.25v6.5c0 .138.112.25.25.25h7.5a.25.25 0 0 0 .25-.25v-6.5ZM11 8.825l3.5 2.1v-5.85l-3.5 2.1Z"></path></svg><span>&nbsp;</span><span aria-label="Video description llama-interactive2.mp4" class="m-1" style="box-sizing: border-box; margin: var(--base-size-4, 4px) !important;">llama-interactive2.mp4</span><span>&nbsp;</span><span class="dropdown-caret" style="box-sizing: border-box; border-bottom-color: rgba(0, 0, 0, 0); border-left-color: rgba(0, 0, 0, 0); border-right-color: rgba(0, 0, 0, 0); border-style: solid; border-width: var(--borderWidth-thicker) var(--borderWidth-thicker) 0; content: &quot;&quot;; display: inline-block; height: 0px; vertical-align: middle; width: 0px;"></span></summary><video src="https://private-user-images.githubusercontent.com/271616/225014776-1d567049-ad71-4ef2-b050-55b0b3b9274c.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTc0OTExNTQsIm5iZiI6MTcxNzQ5MDg1NCwicGF0aCI6Ii8yNzE2MTYvMjI1MDE0Nzc2LTFkNTY3MDQ5LWFkNzEtNGVmMi1iMDUwLTU1YjBiM2I5Mjc0Yy5tcDQ_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwNjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDYwNFQwODQ3MzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kMTI5NmE3Mjc4NmJiZGU2N2JmNzE5YTZkMjExOGNmMDI0ZDg0ZmNmZjMzZDYzZjg3ZDQ5Nzg2NDkxN2I1M2U2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.T1nAvZqHyTKRr3A2UXHdfxj-hMA9UsoFHMthbB1WiCQ" data-canonical-src="https://private-user-images.githubusercontent.com/271616/225014776-1d567049-ad71-4ef2-b050-55b0b3b9274c.mp4?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3MTc0OTExNTQsIm5iZiI6MTcxNzQ5MDg1NCwicGF0aCI6Ii8yNzE2MTYvMjI1MDE0Nzc2LTFkNTY3MDQ5LWFkNzEtNGVmMi1iMDUwLTU1YjBiM2I5Mjc0Yy5tcDQ_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQwNjA0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MDYwNFQwODQ3MzRaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kMTI5NmE3Mjc4NmJiZGU2N2JmNzE5YTZkMjExOGNmMDI0ZDg0ZmNmZjMzZDYzZjg3ZDQ5Nzg2NDkxN2I1M2U2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.T1nAvZqHyTKRr3A2UXHdfxj-hMA9UsoFHMthbB1WiCQ" controls="controls" muted="muted" class="d-block rounded-bottom-2 border-top width-fit" style="box-sizing: border-box; display: block !important; border-top: var(--borderWidth-thin, 1px) solid var(--borderColor-default, var(--color-border-default)) !important; border-bottom-right-radius: var(--borderRadius-medium, 6px) !important; border-bottom-left-radius: var(--borderRadius-medium, 6px) !important; max-width: 100%; max-height: 640px; min-height: 200px;"></video></details>

### Docker



#### Prerequisites



- Docker must be installed and running on your system.
- Create a folder to store big models & intermediate files (ex. /llama/models)

#### Images



We have three Docker images available for this project:

1. `ghcr.io/ggerganov/llama.cpp:full`: This image includes both the main executable file and the tools to convert LLaMA models into ggml and convert into 4-bit quantization. (platforms: `linux/amd64`, `linux/arm64`)
2. `ghcr.io/ggerganov/llama.cpp:light`: This image only includes the main executable file. (platforms: `linux/amd64`, `linux/arm64`)
3. `ghcr.io/ggerganov/llama.cpp:server`: This image only includes the server executable file. (platforms: `linux/amd64`, `linux/arm64`)

Additionally, there the following images, similar to the above:

- `ghcr.io/ggerganov/llama.cpp:full-cuda`: Same as `full` but compiled with CUDA support. (platforms: `linux/amd64`)
- `ghcr.io/ggerganov/llama.cpp:light-cuda`: Same as `light` but compiled with CUDA support. (platforms: `linux/amd64`)
- `ghcr.io/ggerganov/llama.cpp:server-cuda`: Same as `server` but compiled with CUDA support. (platforms: `linux/amd64`)
- `ghcr.io/ggerganov/llama.cpp:full-rocm`: Same as `full` but compiled with ROCm support. (platforms: `linux/amd64`, `linux/arm64`)
- `ghcr.io/ggerganov/llama.cpp:light-rocm`: Same as `light` but compiled with ROCm support. (platforms: `linux/amd64`, `linux/arm64`)
- `ghcr.io/ggerganov/llama.cpp:server-rocm`: Same as `server` but compiled with ROCm support. (platforms: `linux/amd64`, `linux/arm64`)

The GPU enabled images are not currently tested by CI beyond being built. They are not built with any variation from the ones in the Dockerfiles defined in [.devops/](https://github.com/ggerganov/llama.cpp/blob/master/.devops) and the GitHub Action defined in [.github/workflows/docker.yml](https://github.com/ggerganov/llama.cpp/blob/master/.github/workflows/docker.yml). If you need different settings (for example, a different CUDA or ROCm library, you'll need to build the images locally for now).

#### Usage



The easiest way to download the models, convert them to ggml and optimize them is with the --all-in-one command which includes the full docker image.

Replace `/path/to/models` below with the actual path where you downloaded the models.

```
docker run -v /path/to/models:/models ghcr.io/ggerganov/llama.cpp:full --all-in-one "/models/" 7B
```



On completion, you are ready to play!

```
docker run -v /path/to/models:/models ghcr.io/ggerganov/llama.cpp:full --run -m /models/7B/ggml-model-q4_0.gguf -p "Building a website can be done in 10 simple steps:" -n 512
```



or with a light image:

```
docker run -v /path/to/models:/models ghcr.io/ggerganov/llama.cpp:light -m /models/7B/ggml-model-q4_0.gguf -p "Building a website can be done in 10 simple steps:" -n 512
```



or with a server image:

```
docker run -v /path/to/models:/models -p 8000:8000 ghcr.io/ggerganov/llama.cpp:server -m /models/7B/ggml-model-q4_0.gguf --port 8000 --host 0.0.0.0 -n 512
```



### Docker With CUDA



Assuming one has the [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-container-toolkit) properly installed on Linux, or is using a GPU enabled cloud, `cuBLAS` should be accessible inside the container.

#### Building Locally



```
docker build -t local/llama.cpp:full-cuda -f .devops/full-cuda.Dockerfile .
docker build -t local/llama.cpp:light-cuda -f .devops/main-cuda.Dockerfile .
docker build -t local/llama.cpp:server-cuda -f .devops/server-cuda.Dockerfile .
```



You may want to pass in some different `ARGS`, depending on the CUDA environment supported by your container host, as well as the GPU architecture.

The defaults are:

- `CUDA_VERSION` set to `11.7.1`
- `CUDA_DOCKER_ARCH` set to `all`

The resulting images, are essentially the same as the non-CUDA images:

1. `local/llama.cpp:full-cuda`: This image includes both the main executable file and the tools to convert LLaMA models into ggml and convert into 4-bit quantization.
2. `local/llama.cpp:light-cuda`: This image only includes the main executable file.
3. `local/llama.cpp:server-cuda`: This image only includes the server executable file.

#### Usage



After building locally, Usage is similar to the non-CUDA examples, but you'll need to add the `--gpus` flag. You will also want to use the `--n-gpu-layers` flag.

```
docker run --gpus all -v /path/to/models:/models local/llama.cpp:full-cuda --run -m /models/7B/ggml-model-q4_0.gguf -p "Building a website can be done in 10 simple steps:" -n 512 --n-gpu-layers 1
docker run --gpus all -v /path/to/models:/models local/llama.cpp:light-cuda -m /models/7B/ggml-model-q4_0.gguf -p "Building a website can be done in 10 simple steps:" -n 512 --n-gpu-layers 1
docker run --gpus all -v /path/to/models:/models local/llama.cpp:server-cuda -m /models/7B/ggml-model-q4_0.gguf --port 8000 --host 0.0.0.0 -n 512 --n-gpu-layers 1
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
- Clean-up any trailing whitespaces, use 4 spaces for indentation, brackets on the same line, `void * ptr`, `int & a`
- See [good first issues](https://github.com/ggerganov/llama.cpp/issues?q=is%3Aissue+is%3Aopen+label%3A"good+first+issue") for tasks suitable for first contributions
- Tensors store data in row-major order. We refer to dimension 0 as columns, 1 as rows, 2 as matrices
- Matrix multiplication is unconventional: [`C = ggml_mul_mat(ctx, A, B)`](https://github.com/ggerganov/llama.cpp/blob/880e352277fc017df4d5794f0c21c44e1eae2b84/ggml.h#L1058-L1064) means 𝐶𝑇=𝐴𝐵𝑇⇔𝐶=𝐵𝐴𝑇.

[![matmul](https://github.com/ggerganov/llama.cpp/raw/master/media/matmul.png)](https://github.com/ggerganov/llama.cpp/blob/master/media/matmul.png)

### Docs



- [main](https://github.com/ggerganov/llama.cpp/blob/master/examples/main/README.md)
- [server](https://github.com/ggerganov/llama.cpp/blob/master/examples/server/README.md)
- [jeopardy](https://github.com/ggerganov/llama.cpp/blob/master/examples/jeopardy/README.md)
- [BLIS](https://github.com/ggerganov/llama.cpp/blob/master/docs/BLIS.md)
- [Performance troubleshooting](https://github.com/ggerganov/llama.cpp/blob/master/docs/token_generation_performance_tips.md)
- [GGML tips & tricks](https://github.com/ggerganov/llama.cpp/wiki/GGML-Tips-&-Tricks)
- [GBNF grammars](https://github.com/ggerganov/llama.cpp/blob/master/grammars/README.md)