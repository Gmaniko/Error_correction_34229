function C = BCHE_encode(X)

% Encode with BCH(255,239) code
C = BCH_encode(X);

% Add even parity bit
if mod(sum(C),2) == 0
    p = 0;
else
    p = 1;
end
C = [C, p];