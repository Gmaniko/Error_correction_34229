LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Decoder is
	port( 
		receivedInput   : in std_logic_vector(6 downto 0);
		correctedOutput : out std_logic_vector(6 downto 0)
	);
end entity;

architecture Decoder_arch of Decoder is

signal syndrome1, syndrome3 : std_logic_vector(2 downto 0);

component Syndrome1Calc is
	port( 
		rIn  : in std_logic_vector(6 downto 0); 
		Sout : out std_logic_vector(2 downto 0)
	);
end component;

component Syndrome3Calc is
	port( 
		rIn  : in std_logic_vector(6 downto 0); 
		Sout : out std_logic_vector(2 downto 0)
	);
end component;

begin

end architecture;