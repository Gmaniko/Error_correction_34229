--Author: Nikolai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Encoder_Top is
  port (
		KEY        : in std_logic_vector(0 downto 0);
		SW         : in std_logic_vector(1 downto 0);
		CLOCK_50   : in std_logic;
		LEDR       : out std_logic_vector(7 downto 0)
  );
end entity;


architecture HWTB_arch of Encoder_Top is

	component product_encoder_v3
		port (
			clk : std_logic;
			rst : std_logic;
			en  : std_logic;
			X   : in  std_logic;
			C   : out std_logic_vector(255 downto 0)
		);
	end component;
	
	
	signal X_TB : std_logic;
	signal en_TB : std_logic;
	signal C_TB : std_logic_vector(255 downto 0);
	-- signal ok_cnt : std_logic_vector(7 downto 0);
	signal clk_cnt : integer range 0 to 3199;
	signal act : std_logic;
	constant test_data : std_logic_vector(0 to 3199) := "11110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001111100100011100111110010001110011111001000111001";
	
begin

	prod_enc : product_encoder_v3 port map(CLOCK_50, SW(0), X_TB, en_TB, C_TB);
	
	-- LEDR <= ok_cnt;
	en_TB <= SW(1);
	
	PROC_TOP : process(CLOCK_50, SW(0))
	
	begin
		if SW(0) = '1' then
			-- ok_cnt <= (others => '0');
			clk_cnt <= 0;
		elsif rising_edge(CLOCK_50) then
			if KEY(0) = '0' then
				act <= '1';
			end if;
			
			if act = '1' then
				if clk_cnt < 239 then
					X_TB <= test_data(clk_cnt);
				end if;
				-- f clk_cnt > 238 then
				-- if C_TB = C_data(clk_cnt-239) then
				-- 	ok_cnt <= ok_cnt + 1;
				-- end if;
				-- nd if;
				clk_cnt <= clk_cnt + 1;
			end if;
		end if;
	end process;

end architecture;