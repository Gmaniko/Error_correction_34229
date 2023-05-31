% Author: Nikolai
function dec_message = product_code_dec(R, alpha, alphainv)
% Product code decoder using BCH(255,239)

dec_message = zeros(255);
for j = 1:255
    dec_pattern = BCH_decode_v2(R(j,:), alpha, alphainv);
    dec_message(j,:) = bitxor(R(j,:), dec_pattern);
end
for j = 1:255
    dec_pattern = BCH_decode_v2(dec_message(:,j)', alpha, alphainv);
    dec_message(:,j) = bitxor(dec_message(:,j)', dec_pattern)';
end

end