% Author: Nikolai
% Generate testing data for bch_encoder.vhd

fileID1 = fopen('bch_enc_test_X.txt','w');
fileID2 = fopen('bch_enc_test_C.txt','w');

X = randi([0 1], 239);

cd ..\MATLAB\

for i = 1:239
	X = randi([0 1], 1, 239);
	fprintf(fileID1, num2str(X,'%d'));
    fprintf(fileID1, '\n');
	C = BCHE_encode(X);
	fprintf(fileID2, num2str(C,'%d'));
    fprintf(fileID2, '\n');
end