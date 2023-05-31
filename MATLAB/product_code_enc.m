% Author: Nikolai
function C = product_code_enc(X)
% Product code encoder using BCH(255,239)

C = zeros(255);
for i = 1:239
    C(i,:) = BCH_encode(X(i,:));
end

for i = 1:255
    C(:,i) = BCH_encode(C(1:239,i)');
end

end
