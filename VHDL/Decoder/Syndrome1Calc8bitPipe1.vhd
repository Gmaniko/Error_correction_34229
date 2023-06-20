LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity Syndrome1Calc8bitPipe1 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
end entity;
 architecture Syndrome1Calc8bitPipe1_arch of Syndrome1Calc8bitPipe1 is
begin
output(0) <= R(7) ;
output(1) <= R(6) ;
output(2) <= R(5) ;
output(3) <= R(4) ;
output(4) <= R(3) ;
output(5) <= R(2) ;
output(6) <= R(1) ;
output(7) <= R(0) ;
end architecture;

