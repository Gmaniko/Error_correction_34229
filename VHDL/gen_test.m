fileID = fopen('enc_test.txt','w');

X = randi([0 1], 239);

for i = 1:239
    str1 = num2str(X(i,:),'%d');
    fprintf(fileID, strcat(str1,'\n'));
end
cd ..\MATLAB\
C = product_code_enc_v2(X);

