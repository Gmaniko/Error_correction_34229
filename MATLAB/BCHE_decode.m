function dec_message = BCHE_decode(Re, alpha, alphainv)
% Decodes received sequence Re with the extended BCH(256,239) code.

% Extract parity bit from received sequence
R = Re(1:end-1);
pr = Re(end);

[dec_pattern, match] = BCH_decode_v2(R, pr, alpha, alphainv);

% Number of errors that can be corrected
err_n = sum(dec_pattern);

% Decision tree
if err_n == 0
    if match == false
        dec_message = [R, ~pr];
    else
        dec_message = [R, pr];
    end
elseif err_n == 1
    R = bitxor(R, dec_pattern);
    if match == true
        dec_message = [R, ~pr];
    else
        dec_message = [R, pr];
    end
elseif err_n == 2
    if match == true
        R = bitxor(R, dec_pattern);
        dec_message = [R, pr];
    else
        dec_message = Re;
    end
else
    dec_message = Re;
end
