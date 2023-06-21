-- SIPO Component
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity SIPO is
	port
	(
		clk : in std_logic;
		input : in std_logic;
		output : out std_logic_vector(31 downto 0)
	);
end SIPO;

architecture SIPO_arch of SIPO is
	signal mem : std_logic_vector(31 downto 0);
	begin
		process(clk)
		begin
			if rising_edge(clk) then
				mem <= input & mem(31 downto 1);
   		     	end if;

		end process;
	output <= mem;
end SIPO_arch;