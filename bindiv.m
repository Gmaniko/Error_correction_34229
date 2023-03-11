function [remainder] = bindiv(dividend, divisor)

n = length(divisor) - 1;

remainder = [dividend zeros(1,n)];


for i=1:length(remainder)
    if polyval(divisor,2) > polyval(remainder,2)
        break
    end
    if remainder(i) ~= 1
        continue
    end
    
    remainder(i:n+i) = bitxor(remainder(i:n+i),divisor);
    
end

remainder = remainder(end-(n-1):end);