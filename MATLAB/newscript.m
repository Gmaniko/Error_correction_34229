% Author: Nikolai

X = eye(239);
X = fliplr(X);
P = zeros(239,17);

for i = 1:239
    C = BCHE_encode(X(i,:));
    P(i,:) = C(end-16:end);
end
[rows, cols] = size(P);
fileID = fopen("enc_vhdl_text.txt","w");
tot_e = sum(P);
for i = 1:cols
    
    %fprintf(fileID, 'P(%d) <= ', (cols-i));
    idx = find(P(:,i) == 1);
    idx8 = reshape(idx(1:end-7), 8, []);
    rest = idx(end-6:end);

    for j = 0:length(idx8)-1
        fprintf(fileID, 'temp_%d(%d) <= ', cols-i, j);
        for k = 1:7
            fprintf(fileID, 'X(%d) xor ', idx8(k,j+1)-1);
        end
        fprintf(fileID, 'X(%d);\r\n', idx8(8,j+1)-1);
    end

    fprintf(fileID, 'temp_%d(%d) <= ', cols-i, length(idx8));
    for k = 1:6
        fprintf(fileID, 'X(%d) xor ', rest(k)-1);
    end
    fprintf(fileID, 'X(%d);\r\n', rest(7)-1);
end

fclose(fileID);
