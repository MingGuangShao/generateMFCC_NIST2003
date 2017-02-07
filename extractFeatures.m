%extractFeatures('F:/博士资料/博士资料/2007语料train/data/lre07_tr/rus/wav_list.txt', 'D:/我的资料/桌面/代码/voicebox/ww.txt')
function ret = extractFeatures( inputwavfilelistloc, outputfeaturefileloc )
%EXTRACTFEATURES extract features for wav files
%   RET = EXTRACTFEATURES( INPUTWAVFILELISTLOC, OUTPUTFEATUREFILELOC) uses the Expectation
%	extract features from input wav files, and write features to the output
%	feature file.

fid = fopen(inputwavfilelistloc);
framelengthinms = 20;
nrowsfortrain = 40;
reducedatadimension = 12;
while 1
        tline = fgetl(fid);
        disp(tline)
        if ~ischar(tline), break, end
        [wavsample, samplerate] = wavread(tline);
        cepstfeature = melcepst(wavsample,samplerate,'0dD',12,floor(3*log(samplerate)),floor((samplerate*framelengthinms)/1000),floor((samplerate*framelengthinms)/2000));
%         [FX,VUV] = fxrapt(wavsample,samplerate);
%         [numvoicedframe,hon] = size(FX);
%         for i = 2:1:numvoicedframe
%             if floor(VUV(i,1)/floor((samplerate*framelengthinms)/2000)) ~= floor(VUV(i-1,1)/floor((samplerate*framelengthinms)/2000))
%                 dlmwrite(outputfeaturefileloc, cepstfeature(floor(VUV(i,1)/floor((samplerate*framelengthinms)/2000))+1,:), 'delimiter', ' ','-append');
%             end
%         end
         [ndata nclo] = size(cepstfeature);
         randomrows = ceil(ndata.*rand(floor(ndata/3),1));
         traindata = cepstfeature(randomrows,:);
        dlmwrite(outputfeaturefileloc, traindata, 'delimiter', ' ','-append');
        
        clearvars cepstfeature;
end
fclose(fid);
