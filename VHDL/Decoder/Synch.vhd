LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Synch is
	port( 
		input  : in std_logic;
		clock  : in std_logic;
		output : out std_logic_vector(254 downto 0)
	);
end entity;

architecture Synch_arch of Synch is

--Start Pattern:  0110 0101
signal sipo : std_logic_vector(254 downto 0);
signal sipohead : integer;
signal state : integer;


begin

PatternMatchState : process(clock,input)
begin
if (clock'event and clock='1') then

	if(state < 0 or state > 8) then
		state <= 0;
	end if;

	if (state = 0) then
		if(input = '0') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 1) then
		if(input = '1') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 2) then
		if(input = '1') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 3) then
		if(input = '0') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 4) then
		if(input = '0') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 5) then
		if(input = '1') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 6) then
		if(input = '0') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 7) then
		if(input = '1') then
			state <= state+1;
		else
			state <= 0;
		end if;
	end if;
	
	if (state = 8 and sipohead = -1) then
		state <= 0;
	end if;

end if;
end process;


SIPOprocess : process(clock,input)
begin

if (clock'event and clock='1' and state = 7) then
	sipohead <= 254;
end if;

if (clock'event and clock='1' and state = 8) then
	if (sipohead = -1) then
		output <= sipo;
	else
		sipo(sipohead) <= input;
		sipohead <= sipohead -1;
	end if;
end if;

end process;

end architecture;


