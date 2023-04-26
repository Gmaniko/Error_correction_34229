LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity product_encoder is
	port (
		X : in  std_logic_vector(57120 downto 0);
		C : out std_logic_vector(65535 downto 0)
	);
end entity;

architecture product_encoder_arch of product_encoder is

	component bch_encoder is
		port( 
			X  : in std_logic_vector(238 downto 0); 
			C : out std_logic_vector(255 downto 0)
		);
	end component;
	

	begin
	
end architecture;