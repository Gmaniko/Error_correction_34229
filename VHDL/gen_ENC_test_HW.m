fileID1 = fopen('ENC_HW_ROM_IN.txt','w');
fileID2 = fopen('ENC_HW_ROM_OUT.txt','w');
X = randi([0 1], 239);

for i = 0:238
    fprintf(fileID1, '%03d => "', i);
    fprintf(fileID1, num2str(X(i+1,:),'%d'));
    fprintf(fileID1, '",\n');
end
cd ..\MATLAB\
C = product_code_enc_v2(X);
CT = C';

for i = 0:255
    fprintf(fileID2, '%03d => "', i);
    fprintf(fileID2, num2str(CT(i+1,:),'%d'));
    fprintf(fileID2, '",\n');
end


