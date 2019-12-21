# 泽小白工具链
包含工具：

1. Lable2Rec：  
`Audacity标签轨转录音表工具`    
`用法：Lable2Rec <rec> <lable> [sflg]`  
`rec：输出录音表`  
`lable：标签轨`  
`sflg：跳过的标签（通常是第一个 ）`  
`省略sflg将跳过空标签`
2. Dir2Rec  
`基于文件列表的录音表构建工具`  
`用法：Dir2Rec <rec> [dir]`  
`rec：输出录音表`  
`dir：文件夹`  
3. WaveMove  
`音频文件整理工具（按标签整理音频文件）`  
`用法：WaveMove <lable> <dir> [sflg]`  
`lable：标签轨`  
`dir：移动到的文件夹`  
`sflg：跳过的标签（通常是第一个 ）`  
`省略sflg将跳过空标签`
4. ZMake  
`自动制作工具`  
`用法：ZMake [clean|install]`  
`clean：删除文件重新开始`  
`install：将音源灌入UTAU（需要管理员权限）`   
`本工具要求你的电脑上已经安装了UTAU，如果UTAU没安装到默认路径，请在工具所在目录下建立Config.ini`   
`Config.ini 示例：`   
`UDIR=您的UTAU安装路径，不要带空格`   