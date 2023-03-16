function dec_message = product_code_dec(R, iterations, N)
dec_message = zeros(N);

for j = 1:N
    dec_message(j,:) = BCH_decode(R(j,:));
end
for j = 1:N
    dec_message(:,j) = BCH_decode(dec_message(:,j)')';
end

for i = 2:iterations
    for j = 1:N
        dec_message(j,:) = BCH_decode(dec_message(j,:));
    end
    for j = 1:N
        dec_message(:,j) = BCH_decode(dec_message(:,j)')';
    end
end
