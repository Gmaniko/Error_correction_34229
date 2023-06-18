--mads
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity DecoderBCHE is
	port(  
		clock  : in std_logic;
		input  : in std_logic_vector(255 downto 0);
		output : out std_logic_vector(255 downto 0)
	);
end entity;

architecture DecoderBCHE_arch of DecoderBCHE is

component DecoderBCHEReturnE is
	port( 
		clock  : in std_logic;
		input  : in std_logic_vector(254 downto 0);
		ecnt   : out integer;
		epattern : out std_logic_vector(254 downto 0)
	);
end component;

component DecoderBCHEModSumHelper is
	port( 
		input  : in std_logic_vector(254 downto 0);
		output : out std_logic
	);
end component;

signal R : std_logic_vector(254 downto 0);
signal pr, pc : std_logic;

signal Decision : integer range 0 to 6;
signal err_n : integer range 0 to 2;
signal epattern : std_logic_vector(254 downto 0);
signal match, tildepr : std_logic;

begin

--Extract parity bit from received sequence
R <= input(255 downto 1);
pr <= input(0);

--Check parity bits for equality

DUT1 : DecoderBCHEModSumHelper
	port map(
		input => R,
		output => pc
	);


process(pc)
begin

if(pc = pr) then
	match <= '1';
else
	match <= '0';
end if;

end process;


--Decode and return error pattern

DUT2 : DecoderBCHEReturnE
	port map(
		clock  => clock,
		input  => R,
		ecnt => err_n,
		epattern => epattern 
	);
	
--Number of errors that can be corrected


--Decision tree

DecisionTreeProcess : process(err_n,epattern)
begin

	if (pr = '0') then
		tildepr <= '1';
	else
		tildepr <= '0';
	end if;

	if (err_n = 0) then
	
		if (match = '0') then
			output <= R & tildepr;
			Decision <= 1;
		else
			output <= R & pr;
			Decision <= 2;
		end if;

	elsif (err_n = 1) then
	
		if (match = '1') then
			output <= (R xor epattern) & tildepr;
			Decision <= 3;
		else
			output <= (R xor epattern) & pr;
			Decision <= 4;
		end if;
		
	elsif (err_n = 2) then
	
		if (match = '1') then
			output <= (R xor epattern) & pr;
			Decision <= 5;
		else
			output <= input;
			Decision <= 6;
		end if;

	else

	end if;

end process;

--check : process(epattern)
--begin
--if (ecnt < 3) then
--output <= input(255 downto 1) xor epattern;
--end if;
--end process;

end architecture;



