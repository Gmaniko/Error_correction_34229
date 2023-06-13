
% Code word length
N = 255;
% Message length
K = 239;

%Define primitive polynomial
PrimPoly = [1,0,0,0,1,1,1,0,1];

%Generate log/antilog tables
[alpha, alphainv] = logantilog(N, PrimPoly);

rlist = zeros(100,255);
clist = zeros(100,255);

for a = 1:100

% Generate random information bits
X = randi([0 1],1,K);

% Encode
C = BCH_encode(X);

% Number of errors
err_n = 2;

% Generate noise
noise = zeros(1,length(C));
noise(randperm(length(C),err_n)) = 1;

% Received information is code word with err_n errors
R = bitxor(C,noise);

rlist(a,:) = R;
clist(a,:) = C;

end


fileID = fopen('VHDL.txt','w');
s = "type ROM_type is array (1 to 100) of std_logic_vector(254 downto 0);\n";
fprintf(fileID,s);
s = "constant ROM_C : ROM_type := ( ";
fprintf(fileID,s);

for i = 1:100
    
    dude = "";
    for j = 1:255
        dude = dude + clist(i,j); 
    end

    s = ""+ (i) + ' => "' + reverse(dude) + '",\n';
    fprintf(fileID,s);
end
s=");";
fprintf(fileID,s);

s="\n\n\n";
fprintf(fileID,s);


s = "constant ROM_R : ROM_type := ( ";
fprintf(fileID,s);

for i = 1:100
    
    dude = "";
    for j = 1:255
        dude = dude + rlist(i,j); 
    end

    s = ""+ (i) + ' => "' + reverse(dude) + '",\n';
    fprintf(fileID,s);
end
s=");";
fprintf(fileID,s);


fclose(fileID);
