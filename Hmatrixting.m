%---- STEP 1, create matrix with alpha^x exponent values ----
n=255;
H = zeros(2, n);

H(1,1)=1;
H(2,1)=1;

for i = 1:(n-1)
   H(1,i+1) = (i+1);
   H(2,i+1) = (3)*(i)+1;
end

%---- STEP 1.2, map matrix from alpha exponent to bit values ----
R = zeros(1, 255);
P = [1,0,0,0,1,1,1,0,1];
m = length(P) - 1;
N = length(R)*3;

% Calculate log-table that returns an element of the Galois field
% given the exponent of the primitive element.
alpha = zeros(N, m);
alpha(1,:) = [zeros(1, m-1) 1];
for i = 2:N
    u = alpha(i-1,1);
    alpha(i,:) = [alpha(i-1,2:end) 0];
    if u ==1
        alpha(i,:) = bitxor(alpha(i,:), P(2:end));
    end
end

%map
alcol = length(alpha(1,:));
H2=zeros(alcol*2,255);
for i = 1:255
   H2(1:alcol,i) = flip(transpose(alpha(H(1,i),:)));
   H2(alcol+1:alcol*2,i) = flip(transpose(alpha(H(2,i),:)));
end


%step 1.3 tranpose h and complete matrix multiplication

zeros(1, 255) * transpose(H2)
ones(1,255) * transpose(H2)

%n=15 example
htest = [1,0,0,0,1,0,0,1,1,0,1,0,1,1,1;0,1,0,0,1,1,0,1,0,1,1,1,1,0,0;0,0,1,0,0,1,1,0,1,0,1,1,1,1,0;0,0,0,1,0,0,1,1,0,1,0,1,1,1,1;1,0,0,0,1,1,0,0,0,1,1,0,0,0,1;0,0,0,1,1,0,0,0,1,1,0,0,0,1,1;0,0,1,0,1,0,0,1,0,1,0,0,1,0,1;0,1,1,1,1,0,1,1,1,1,0,1,1,1,1];
c0 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
c1 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
c0*transpose(htest)
c1*transpose(htest)
