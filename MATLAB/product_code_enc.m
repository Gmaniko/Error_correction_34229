function C = product_code_enc(X, N, K)


C = zeros(N);
for i = 1:K
    C(i,:) = BCH_encode(X(i,:));
end

for i = 1:N
    C(:,i) = BCH_encode(C(1:K,i)');
end
