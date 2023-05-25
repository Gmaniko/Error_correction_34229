function dec_message = product_code_dec(R, alpha, alphainv)
%dec_message = R;
dec_message = zeros(255);
for j = 1:255
    dec_message(j,:) = BCH_decode(R(j,:), alpha, alphainv);
end
for j = 1:255
    dec_message(:,j) = BCH_decode(dec_message(:,j)', alpha, alphainv)';
end
