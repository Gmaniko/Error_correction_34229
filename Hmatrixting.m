%---- STEP 1, create matrix with alpha^x values ----
n=15;
H = zeros(2, n);

H(1,1)=1;
H(2,1)=1;

for i = 1:n
   H(1,i+1) = (i);
   H(2,i+1) = (3)*(i);
end

%---- STEP 1.2, map matrix from alpha to bit values ----

%Primitive polynomial of GF(256)
%P = [1,0,0,1,1];
P = [1,0,0,0,0,1,1];
m = length(P) - 1;
N = 15;

alpha = zeros(N, m);
alpha(1,:) = [zeros(1, m-1) 1];
for i = 2:N
    u = alpha(i-1,1);
    alpha(i,:) = [alpha(i-1,2:end) 0];
    if u ==1
        alpha(i,:) = bitxor(alpha(i,:), P(2:end));
    end
end

alphainv = zeros(N,1);
for i = 1:N
    alphainv(polyval(alpha(i,:),2)) = i-1;
end


%step 1.3 tranpose h and complete matrix multiplication



%n=15 example
htest = [1,0,0,0,1,0,0,1,1,0,1,0,1,1,1;0,1,0,0,1,1,0,1,0,1,1,1,1,0,0;0,0,1,0,0,1,1,0,1,0,1,1,1,1,0;0,0,0,1,0,0,1,1,0,1,0,1,1,1,1;1,0,0,0,1,1,0,0,0,1,1,0,0,0,1;0,0,0,1,1,0,0,0,1,1,0,0,0,1,1;0,0,1,0,1,0,0,1,0,1,0,0,1,0,1;0,1,1,1,1,0,1,1,1,1,0,1,1,1,1];
c0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
c1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
c0*transpose(htest)
c1*transpose(htest)
