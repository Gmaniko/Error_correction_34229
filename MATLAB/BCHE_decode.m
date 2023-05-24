function dec_message = BCHE_decode(Re, alpha, alphainv)
R = Re(1:end-1);
pr = Re(end);

[dec_pattern, match] = BCH_decode_v2(R, pr, alpha, alphainv);

err_n = sum(dec_pattern);

if err_n == 0
    if match == -1
        dec_message = [R, ~pr];
    else
        dec_message = [R, pr];
    end
elseif err_n == 1
    R = bitxor(R, dec_pattern);
    if match == +1
        dec_message = [R, ~pr];
    else
        dec_message = [R, pr];
    end
elseif err_n == 2
    if match == +1
        R = bitxor(R, dec_pattern);
        dec_message = [R, pr];
    else
        dec_message = Re;
    end
else
    dec_message = Re;
end
