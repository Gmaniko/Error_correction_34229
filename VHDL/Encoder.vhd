LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity encoder is
	port(
		X : in  std_logic_vector(3 downto 0);
		C : out std_logic_vector(6 downto 0)
	);
end entity;


architecture encoder_arch of encoder is

	constant G : std_logic_vector(3 downto 0) := "1011";
	
	signal R   : std_logic_vector(6 downto 0);
	signal idx : integer range 0 to 6;

	begin
	
	bindiv : process
		begin
			while To_integer(unsigned(G)) < To_integer(unsigned(R)) loop
				if R(idx)='1' then
					R((idx+G'length -1) downto idx) <= R((idx+G'length -1) downto idx) xor G;
				end if;
				idx <= idx + 1;
			end loop;
	
	end process;
	
	
end architecture;

