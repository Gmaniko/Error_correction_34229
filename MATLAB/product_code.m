N = 255;
K = 239;

%Message
rng('default')
X = randi([0 1],K);


C = zeros(N);
for i = 1:K
    C(i,:) = BCH_encode(X(i,:));
end

for i = 1:N
    C(:,i) = BCH_encode(C(1:K,i)');
end

rng('shuffle')
p = 0.005;
noise = rand(N) < p;

fprintf('Number of errors: %d\n', sum(noise,'all'))

R = bitxor(C,noise);



dec_message = zeros(N);
iterations = 1;

for j = 1:N
    dec_message(j,:) = BCH_decode(R(j,:));
end
for j = 1:N
    dec_message(:,j) = BCH_decode(dec_message(:,j)')';
end

for i = 2:iterations
    for j = 1:N
        dec_message(j,:) = BCH_decode(dec_message(j,:));
    end
    for j = 1:N
        dec_message(:,j) = BCH_decode(dec_message(:,j)')';
    end
end


if isequal(dec_message,C)
    disp('Succesfully decoded.')
else
    disp('Could not decode (too many errors).')
end

sum(bitxor(dec_message,C),'all')