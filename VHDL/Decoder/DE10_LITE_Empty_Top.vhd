LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--=======================================================
--  Entity decleration
--=======================================================

    --DE10_LITE_Empty_Top: 
    --
	-------------- CLOCK ----------
	--input 		          		ADC_CLK_10,
	--input 		          		MAX10_CLK1_50,
	--input 		          		MAX10_CLK2_50,
    --
	-------------- SDRAM ----------
	--output		    [12:0]		DRAM_ADDR,
	--output		     [1:0]		DRAM_BA,
	--output		          		DRAM_CAS_N,
	--output		          		DRAM_CKE,
	--output		          		DRAM_CLK,
	--output		          		DRAM_CS_N,
	--inout 		    [15:0]		DRAM_DQ,
	--output		          		DRAM_LDQM,
	--output		          		DRAM_RAS_N,
	--output		          		DRAM_UDQM,
	--output		          		DRAM_WE_N,
    --
	-------------- SEG7 ----------
	--output		     [7:0]		HEX0,
	--output		     [7:0]		HEX1,
	--output		     [7:0]		HEX2,
	--output		     [7:0]		HEX3,
	--output		     [7:0]		HEX4,
	--output		     [7:0]		HEX5,
    --
	-------------- KEY ----------
	--input 		     [1:0]		KEY,
    --
	-------------- LED ----------
	--output		     [9:0]		LEDR,
    --
	-------------- SW ----------
	--input 		     [9:0]		SW,
    --
	-------------- VGA ----------
	--output		     [3:0]		VGA_B,
	--output		     [3:0]		VGA_G,
	--output		          		VGA_HS,
	--output		     [3:0]		VGA_R,
	--output		          		VGA_VS,
    --
	-------------- Accelerometer ----------
	--output		          		GSENSOR_CS_N,
	--input 		     [2:1]		GSENSOR_INT,
	--output		          		GSENSOR_SCLK,
	--inout 		          		GSENSOR_SDI,
	--inout 		          		GSENSOR_SDO,
    --
	-------------- Arduino ----------
	--inout 		    [15:0]		ARDUINO_IO,
	--inout 		          		ARDUINO_RESET_N,
    --
	-------------- GPIO, GPIO connect to GPIO Default ----------
	--inout 		    [35:0]		GPIO


entity DE10_LITE_Empty_Top is
	port(
		ADC_CLK_10  : in std_logic;
		HEX0	:		out bit_vector(7 downto 0) --OK/KO
	);
end DE10_LITE_Empty_Top;


--=======================================================
-- Architecture declaration
--=======================================================

architecture RTL of DE10_LITE_Empty_Top is	

component Decoder is
		port(  
		clock  : in std_logic;
		input  : in std_logic_vector(254 downto 0);
		output : out std_logic_vector(254 downto 0)
		);
end component;

signal result : std_logic_vector(254 downto 0);

--FOR SINGLE TESTING
type ROM_type is array (0 to 0) of std_logic_vector(254 downto 0);
constant ROM_R : ROM_type := ( 
0 =>  "001010000011101101110101001010011110001010111010110011010011001111000111110001110010010001100010011101100010111011001011111110011010001011100101111101110010010001000001110010000010101100100000101100011100111001001010010110110101101011110100101001100100000"
);
constant ROM_C : ROM_type := ( 
0 => "001010000011101101110101001010011110001010111010110011010011001111000111110001110010010001100010011101100010111011001011111110011010001011100101111101110010010001000001110010000010101100100000101100111100111001001010010110110101101010110100101001100100000"
);
begin

DUT : Decoder
	port map(
		clock => ADC_CLK_10,
		input => ROM_R(0),
		output => result
	);

	
debugger : process (result)
  begin
    if (result = ROM_C(0)) then
	 HEX0 <= "00100100";
	 else
	 HEX0 <= "11111111";
	 end if;
	
End process;


	
end RTL;

