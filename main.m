%��ҵ˵��������ҵ��ʾ�˴�wav�ļ���÷������ϵ����ȫ���̡�
%Ҫ����Ҫ���ԼӶϵ�ķ�ʽ�������У�ѧϰÿһ�����������ã������������۵����ݽ��������
%      ������Ӧ�Ŀ�λ���Լ����ԣ������������ѧϰ��
clc,clear

waveDir='E:\��������\���Ͽ⼯\NIST_2003_SR_female_test';
speaker = dir(waveDir);
speaker(1:2) = [];
speakerNum = length(speaker);%speakerNum:������

% ====== ������ȡ
fprintf('\n��ȡ�����ļ�������������ȡ...\n\n');
for i = 1:speakerNum

    fprintf('\n������ȡ��%d����%s������', i, speaker(i,1).name);
    %��֡����
    framelengthinms = 20; 
     %ע��wavsample��һ����������samplerate����Ƶ�ʣ�
    [wavsample,samplerate] = wavread(['E:\��������\���Ͽ⼯\NIST_2003_SR_female_test\' speaker(i,1).name]); 
    %��Ӧ�ü���һ������wavsample�;���data���������������Ͽν����Ƿ�һ�¡�
    %������melecepst����ÿһ�������ĺ��壨���Ǹ�����������������˵����
    %��������Ĳ���������
     data=melcepst(������,������,'0dD',12,floor(3*log(samplerate)),floor((samplerate*framelengthinms)/1000),floor((samplerate*framelengthinms)/2000));
     %ע�⣺melecept�Ƕ��źŽ���÷������ϵ����ȡ���������ϸ����˵����voicebox��melecept���н���
     a=speaker(i).name;
     a=a(1:4);
     a=num2str(a);
    
    %save(a,data);
    %ע��Щ����----dleriter!!!
    dlmwrite(a,data,'delimiter', ' ','-append');
    fprintf('  ��ɣ���');
    
  
 
end



