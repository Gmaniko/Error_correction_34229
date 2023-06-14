--Author: Nikolai
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity product_encoder_v2 is
	port (
		clk : std_logic;
		rst : std_logic;
		X   : in  std_logic_vector(238 downto 0);
		C   : out std_logic_vector(255 downto 0)
	);
end entity;

architecture product_encoder_v2_arch of product_encoder_v2 is

	component bch_encoder_v2
		port(
			clk, rst : in std_logic;
			X  : in std_logic_vector(238 downto 0); 
			C  : out std_logic_vector(255 downto 0)
		);
	end component;
	
	signal cnt : integer range 0 to 255;
	signal send : std_logic;
	signal cur_col  : std_logic_vector(238 downto 0);
	signal cur_row : std_logic_vector(255 downto 0);
	type MAT_type is array (0 to 255) of std_logic_vector(0 to 238);
	signal MAT : MAT_type;

begin	

	bch_enc_row : bch_encoder_v2 port map(clk, rst, X, cur_row);
	bch_enc_col : bch_encoder_v2 port map(clk, rst, cur_col, C);
	
	process (clk, rst)
	begin
		if rst = '1' then
			MAT <= (others => (others => '0'));
			cnt <= 0;
			send <= '0';
		elsif rising_edge(clk) then
			if send = '0' then
				if cnt > 2 then --Loads encoded message into memory
					MAT(cnt-3) <= cur_row;
				end if;
				if cnt < 239 then 
					cnt <= cnt + 1;
				else 
					send <= '1';
					cnt <= 0;
				end if;
			elsif send = '1' then --Begins encoding "columns" and sending them through the transmission channel
				cur_col <= MAT(cnt);
				if cnt < 255 then
					cnt <= cnt + 1;
				else
					send <= '0';
					cnt <= 0;
				end if;
				
			end if;
		end if;
	end process;
	
	
end architecture;