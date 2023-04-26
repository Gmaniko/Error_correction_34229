function dec_message = BCHE_decode(Re)
R = Re(1:end-1);
pr = Re(end);

[dec_pattern, match] = BCH_decode_v2(R, pr);

if sum(dec_pattern) == 0
    if match == -1
        dec_message = [R, ~pr];
    else
        dec_message = Re;
    end
elseif sum(dec_pattern) == 1
    R = bitxor(R, dec_pattern);
    if match == +1
        dec_message = [R, ~pr];
    else
        dec_message = [R, pr];
    end
elseif sum(dec_pattern) == 2
    if match == +1
        R = bitxor(R, dec_pattern);
        dec_message = [R, pr];
    else
        dec_message = Re;
    end
end
