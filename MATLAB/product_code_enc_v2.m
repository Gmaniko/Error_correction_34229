function C = product_code_enc_v2(X)

C = zeros(256);
for i = 1:239
    C(i,:) = BCHE_encode(X(i,:));
end

for i = 1:256
    C(:,i) = BCHE_encode(C(1:239,i)');
end

end

