LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity Syndrome1Calc8bitPipe4 is
port( 
 R : in std_logic_vector(7 downto 0); 
 output : out std_logic_vector(7 downto 0) 
 ); 
end entity;
 architecture Syndrome1Calc8bitPipe4_arch of Syndrome1Calc8bitPipe4 is
begin
output(0) <= R(0) xor R(7) ;
output(1) <= R(6) xor R(7) ;
output(2) <= R(5) xor R(6) ;
output(3) <= R(4) xor R(5) ;
output(4) <= R(0) xor R(3) xor R(4) ;
output(5) <= R(0) xor R(2) xor R(3) ;
output(6) <= R(0) xor R(1) xor R(2) ;
output(7) <= R(0) xor R(1) ;
end architecture;

