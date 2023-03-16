function dec_message = product_code_dec(R, N)
dec_message = R;


% for j = 1:N
%     dec_message(j,:) = BCH_decode(R(j,:));
% end
% for j = 1:N
%     dec_message(:,j) = BCH_decode(dec_message(:,j)')';
% end

for j = 1:N
    dec_message(j,:) = BCH_decode(dec_message(j,:));
end
for j = 1:N
    dec_message(:,j) = BCH_decode(dec_message(:,j)')';
end
