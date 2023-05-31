% Author: Nikolai
function C = BCHE_encode(X)
% Encodes information sequence X with the extended BCH(256,239) code.

% Encode with BCH(255,239) code
C = BCH_encode(X);

% Calculate even parity bit
if mod(sum(C),2) == 0
    p = 0;
else
    p = 1;
end

% Append parity bit
C = [C, p];

end