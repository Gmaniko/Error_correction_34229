%Author: Nikolai
function dec_message = product_code_dec_v2(R, alpha, alphainv)
% Product code decoder using extended BCH(256,239)
dec_message = zeros(256);

% Decode rows
for j = 1:256
    dec_message(j,:) = BCHE_decode(R(j,:), alpha, alphainv);
end

% Decode columns
for j = 1:256
    dec_message(:,j) = BCHE_decode(dec_message(:,j)', alpha, alphainv)';
end

end

