%作业说明：本作业演示了从wav文件到梅尔倒谱系数的全过程。
%要求：需要你以加断点的方式认真运行，学习每一个函数的作用，把他们与讨论的内容结合起来。
%      补齐相应的空位，自己调试，建议你们组队学习。
clc,clear

waveDir='E:\科研资料\语料库集\NIST_2003_SR_female_test';
speaker = dir(waveDir);
speaker(1:2) = [];
speakerNum = length(speaker);%speakerNum:人数；

% ====== 特征提取
fprintf('\n读取语音文件并进行特征提取...\n\n');
for i = 1:speakerNum

    fprintf('\n正在提取第%d个人%s的特征', i, speaker(i,1).name);
    %分帧！！
    framelengthinms = 20; 
     %注意wavsample是一个列向量，samplerate代表频率！
    [wavsample,samplerate] = wavread(['E:\科研资料\语料库集\NIST_2003_SR_female_test\' speaker(i,1).name]); 
    %你应该计算一下向量wavsample和矩阵data的行列数与我们上课讲的是否一致。
    %务必理解melecepst里面每一个参数的含义（打开那个函数，函数里面有说明）
    %补齐下面的参数！！！
     data=melcepst(。。。,。。。,'0dD',12,floor(3*log(samplerate)),floor((samplerate*framelengthinms)/1000),floor((samplerate*framelengthinms)/2000));
     %注意：melecept是对信号进行梅尔倒谱系数提取：里面的详细参数说明在voicebox中melecept中有介绍
     a=speaker(i).name;
     a=a(1:4);
     a=num2str(a);
    
    %save(a,data);
    %注意些方法----dleriter!!!
    dlmwrite(a,data,'delimiter', ' ','-append');
    fprintf('  完成！！');
    
  
 
end



