function dec_message = product_code_dec_v2(R, alpha, alphainv)

dec_message = R;

for j = 1:256
    dec_message(j,:) = BCHE_decode(dec_message(j,:), alpha, alphainv);
end

for j = 1:256
    dec_message(:,j) = BCHE_decode(dec_message(:,j)', alpha, alphainv)';
end

end

