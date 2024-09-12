

### Prepared



1. SenseVoiceSmall

   ```shell
   git lfs install
   git clone https://www.modelscope.cn/iic/SenseVoiceSmall.git
   ```

   

2. FSMN

   ```shell
   git lfs install
   git clone https://www.modelscope.cn/iic/speech_fsmn_vad_zh-cn-16k-common-pytorch.git
   ```

   

3. FFmpeg

   > Centos 7

   ```shell
   sudo yum install epel-release
   
   sudo yum localinstall --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
   
   sudo yum install ffmpeg ffmpeg-devel
   ```

   

   > Centos 8

   ```shell
   yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
   yum install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-8.noarch.rpm
   yum install https://rpmfind.net/linux/centos/8-stream/PowerTools/x86_64/os/Packages/SDL2-2.0.10-2.el8.x86_64.rpm
   
   yum install ffmpeg ffmpeg-devel
   ```

   

4. 



### SenseVoice

```shell
https://github.com/FunAudioLLM/SenseVoice.git
```



```shell
conda create -n SenseVoice python=3.10
conda activate SenseVoice

pip install -r requirements.txt
```



