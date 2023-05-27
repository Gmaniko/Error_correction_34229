N = 255;
K = 239;

%Message
%rng('default')

%X = zeros(K);
%Encode

PrimPoly = [1,0,0,0,1,1,1,0,1];
[alpha, alphainv] = logantilog(N, PrimPoly);

%Add noise
%
%p = linspace(0.00847,0.01257,12);
p = linspace(0.0065,0.0125,15);
iter = 1:10;
BER = zeros(length(iter), length(p));
channel = zeros(1,length(p));
for b = 1:100
    fprintf('Iteration number : %d\n', b)
    X = randi([0 1],K);
    C = product_code_enc(X);
    for j = 1:length(p)
        noise = zeros(255);
        noise(randperm(255^2,round(p(j)*255^2))) = 1;
        R = bitxor(C,noise);
        channel(j) = channel(j) + sum(noise,'all')/(255^2);
        dec_message = R;
        for i = iter
            %fprintf('Number of errors: %d\n', sum(noise,'all'))
            dec_message = product_code_dec(dec_message, alpha, alphainv);
            BER(i,j) = BER(i,j) + sum(bitxor(dec_message,C),'all')/(255^2);
        end
        fprintf('error probability: %f\n',p(j))
    end
end
channel = channel ./ 100;
BER = BER ./ 100;
plotting_script