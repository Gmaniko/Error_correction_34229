--Author: Nikolai
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity product_encoder_v3 is
	port (
		clk : std_logic;
		rst : std_logic;
		X   : in  std_logic;
		C   : out std_logic_vector(255 downto 0)
	);
end entity;

architecture product_encoder_v3_arch of product_encoder_v3 is

	component bch_encoder_v2
		port(
			clk, rst : in std_logic;
			X  : in std_logic_vector(238 downto 0); 
			C  : out std_logic_vector(255 downto 0)
		);
	end component;
	
	
	signal state : integer range 0 to 1;
	signal cnt_in  : integer range 0 to 238;
	signal clk_cnt : integer range 0 to 243;
	signal row_cnt : integer range 0 to 238;
	signal X_vec : std_logic_vector(238 downto 0);
	signal out1 : std_logic_vector(255 downto 0);
	type MAT_type is array (0 to 238) of std_logic_vector(0 to 255);
	signal MAT1, MAT2 : MAT_type;

begin	

	bch_enc_row : bch_encoder_v2 port map(clk, rst, X_vec, out1);
	bch_enc_col : bch_encoder_v2 port map(clk, rst, X_vec, C);
	

	process (clk,rst)
		begin
			if rst = '1' then
			elsif rising_edge(clk) then
				X_vec(238 - cnt_in) <= X;
				
				
				if clk_cnt < 243 then
					clk_cnt <= clk_cnt + 1;
				else
					clk_cnt <= 0;
				end if;
				
				if cnt_in < 238 then
					cnt_in <= cnt_in + 1;
				else
					cnt_in <= 0;
				end if;
				
				if clk_cnt = 243 then
					MAT1(row_cnt) <= out1;
					row_cnt <= row_cnt + 1;
					clk_cnt <= 0;
				end if;
				
			end if;
	end process;
	
end architecture;