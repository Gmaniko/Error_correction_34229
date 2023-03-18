LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity encoder is
	port (
		X : in  std_logic_vector(238 downto 0);
		C : out std_logic_vector(254 downto 0)
	);
end entity;


architecture encoder_arch of encoder is

	constant G : std_logic_vector(16 downto 0) := "10110111101100011";
	
	signal R : std_logic_vector(254 downto 0);

	begin
	
	
	bindiv : process(X)
		begin
			R <= X & "0000000000000000";
			
			for i in 0 to 238 loop
				if R(i)='1' then
						R((i+16) downto i) <= R((i+16) downto i) xor G;
				end if;
			end loop;
			
			C <= X & R(254 downto 239);
	end process;
	
	
end architecture;

