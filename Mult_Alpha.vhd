LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Mult_Alpha is
	port( 
		input  : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(2 downto 0)
	);
end entity;

architecture Mult_Alpha_arch of Mult_Alpha is

signal shiftInput : std_logic_vector(2 downto 0);

begin
  MULTIPLY : process (input)
  begin

	shiftInput <= (input(1 downto 0) & "0")
	
	if (input(2) = '0') then
		output <= shiftInput;
	else
		output <= (shiftInput xor "011");
	end if;
	
  end process;

end architecture;
