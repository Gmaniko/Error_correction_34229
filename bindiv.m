function [remainder] = bindiv(dividend, divisor)

remainder = [dividend zeros(1,length(divisor)-1)];
n = length(divisor);

for i=1:length(remainder)
    if polyval(divisor,2) > polyval(remainder,2)
        break
    end
    if remainder(i) ~= 1
        continue
    end
    
    remainder(i:n+i-1) = bitxor(remainder(i:n+i-1),divisor);
    
end

remainder = remainder(end-(length(divisor)-1):end);