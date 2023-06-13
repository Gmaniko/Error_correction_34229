fileID = fopen('VHDL.txt','w');
s = "type ROM_type5 is array (-765 to 765) of integer;\n";
fprintf(fileID,s);
s = "constant ROM_MOD : ROM_type5 := ( ";
fprintf(fileID,s);

for i = -765:765
    s = ""+ (i) + ' => ' + mod(i,255) + ',\n';
    fprintf(fileID,s);
end
s=");";
fprintf(fileID,s);

fclose(fileID);