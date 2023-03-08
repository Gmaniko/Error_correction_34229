LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Syndrome1Calc is
	port( 
		rIn  : in std_logic_vector(6 downto 0); 
		Sout : out std_logic_vector(2 downto 0)
	);
end entity;

architecture Syndrome1Calc_arch of Syndrome1Calc is

signal S0,S1,S2,S3,S4,S5,S6 : std_logic_vector(2 downto 0);
signal S0_Mult_Alpha, S1_Mult_Alpha, S2_Mult_Alpha, S3_Mult_Alpha, S4_Mult_Alpha,  S5_Mult_Alpha : std_logic_vector(2 downto 0);

component Mult_Alpha is
	port( 
		input  : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(2 downto 0)
	);
end component;

begin
	S0 <= "00" & rIn(6)
	S1 <= S0_Mult_Alpha xor ("00" & rIn(5) );
	S2 <= S1_Mult_Alpha xor ("00" & rIn(4) );
	S3 <= S2_Mult_Alpha xor ("00" & rIn(3) );
	S4 <= S3_Mult_Alpha xor ("00" & rIn(2) );
	S5 <= S4_Mult_Alpha xor ("00" & rIn(1) );
	S6 <= S5_Mult_Alpha xor ("00" & rIn(0) );
	
	First : Mult_Alpha
	port map(
	input   => S0,
	output  => S0_Mult_Alpha
	);

end architecture