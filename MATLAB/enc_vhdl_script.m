

X = eye(239);
X = fliplr(X);
P = zeros(239,17);

for i = 1:239
    C = BCHE_encode(X(i,:));
    P(i,:) = C(end-16:end);
end
[rows, cols] = size(P);
fileID = fopen("enc_vhdl_text.txt","w");

for i = 1:cols
    fprintf(fileID, 'P(%d) <= ', (cols-i));
    idx = find(P(:,i) == 1);

    for j = 1:length(idx)-1
        fprintf(fileID, 'X(%d) xor ', idx(j)-1);
    end
    fprintf(fileID, 'X(%d);\r\n', idx(end)-1);
    
end

fclose(fileID);
