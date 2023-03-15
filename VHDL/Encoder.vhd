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
	
	signal R : std_logic_vector(6 downto 0);

	begin
	
	bindiv : process
		begin
			for i in 0 to R'length-1 loop
				if To_integer(unsigned(G)) > To_integer(unsigned(R))
					exit;
				end if;
				if R(i)='1' then
					R(i)(i to (i+G'length -1)) <= R(i)(i to (i+G'length -1)) xor G;
				end if;
			end loop;
	
	end process;
	
	
end architecture;

