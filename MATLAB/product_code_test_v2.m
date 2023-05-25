N = 255;
K = 239;

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
    C = product_code_enc_v2(X);
    for j = 1:length(p)
        rng('shuffle')
        noise = zeros(256);
        noise(randperm(256^2,round(p(j)*256^2))) = 1;
        R = bitxor(C,noise);
        channel(j) = channel(j) + nnz(noise)/(256^2);
        dec_message = R;
        for i = iter
            %fprintf('Number of errors: %d\n', sum(noise,'all'))
            dec_message = product_code_dec_v2(dec_message, alpha, alphainv);
            BER(i,j) = BER(i,j) + nnz(bitxor(dec_message,C))/(256^2);
        end
        fprintf('error probability: %f\n',p(j))
    end
end
channel = channel ./ 100;
BER = BER ./ 100;
plotting_script