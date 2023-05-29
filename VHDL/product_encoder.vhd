LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity product_encoder is
	port (
		clk : std_logic;
		rst : std_logic;
		X   : in  std_logic_vector(238 downto 0);
		C   : out std_logic_vector(255 downto 0)
	);
end entity;

architecture product_encoder_arch of product_encoder is

	component bch_encoder
		port( 
			X  : in std_logic_vector(238 downto 0); 
			C  : out std_logic_vector(255 downto 0)
		);
	end component;
	
	signal cnt : integer range 0 to 255;
	signal send : std_logic;
	signal cur_col  : std_logic_vector(238 downto 0);
	signal cur_row : std_logic_vector(255 downto 0);
	type MAT_type is array (0 to 255) of std_logic_vector(0 to 255);
	signal MAT : MAT_type;

begin

	bch_enc_row : bch_encoder port map(X, cur_row);
	bch_enc_col : bch_encoder port map(cur_col, C);
	
	process (clk, rst)
	begin
		if rst = '1' then
			MAT <= (others => (others => '0'));
			cnt <= 0;
			send <= '0';
			--cur_col <= (others => '0');
			--cur_row <= (others => '0');
		elsif rising_edge(clk) then
			if send = '0' then
				MAT(cnt) <= cur_row;
				if cnt < 238 then 
					cnt <= cnt + 1;
				else 
					send <= '1';
					cnt <= 0;
				end if;
			elsif send = '1' then
				if cnt < 255 then
					cnt <= cnt + 1;
				else
					send <= '0';
					cnt <= 0;
				end if;
				cur_col <= MAT(0)(cnt) & MAT(1)(cnt) & MAT(2)(cnt) & MAT(3)(cnt) & MAT(4)(cnt) & MAT(5)(cnt) & MAT(6)(cnt) & MAT(7)(cnt) & MAT(8)(cnt) & MAT(9)(cnt) & MAT(10)(cnt) & MAT(11)(cnt) & MAT(12)(cnt) & MAT(13)(cnt) & MAT(14)(cnt) & MAT(15)(cnt) & MAT(16)(cnt) & MAT(17)(cnt) & MAT(18)(cnt) & MAT(19)(cnt) & MAT(20)(cnt) & MAT(21)(cnt) & MAT(22)(cnt) & MAT(23)(cnt) & MAT(24)(cnt) & MAT(25)(cnt) & MAT(26)(cnt) & MAT(27)(cnt) & MAT(28)(cnt) & MAT(29)(cnt) & MAT(30)(cnt) & MAT(31)(cnt) & MAT(32)(cnt) & MAT(33)(cnt) & MAT(34)(cnt) & MAT(35)(cnt) & MAT(36)(cnt) & MAT(37)(cnt) & MAT(38)(cnt) & MAT(39)(cnt) & MAT(40)(cnt) & MAT(41)(cnt) & MAT(42)(cnt) & MAT(43)(cnt) & MAT(44)(cnt) & MAT(45)(cnt) & MAT(46)(cnt) & MAT(47)(cnt) & MAT(48)(cnt) & MAT(49)(cnt) & MAT(50)(cnt) & MAT(51)(cnt) & MAT(52)(cnt) & MAT(53)(cnt) & MAT(54)(cnt) & MAT(55)(cnt) & MAT(56)(cnt) & MAT(57)(cnt) & MAT(58)(cnt) & MAT(59)(cnt) & MAT(60)(cnt) & MAT(61)(cnt) & MAT(62)(cnt) & MAT(63)(cnt) & MAT(64)(cnt) & MAT(65)(cnt) & MAT(66)(cnt) & MAT(67)(cnt) & MAT(68)(cnt) & MAT(69)(cnt) & MAT(70)(cnt) & MAT(71)(cnt) & MAT(72)(cnt) & MAT(73)(cnt) & MAT(74)(cnt) & MAT(75)(cnt) & MAT(76)(cnt) & MAT(77)(cnt) & MAT(78)(cnt) & MAT(79)(cnt) & MAT(80)(cnt) & MAT(81)(cnt) & MAT(82)(cnt) & MAT(83)(cnt) & MAT(84)(cnt) & MAT(85)(cnt) & MAT(86)(cnt) & MAT(87)(cnt) & MAT(88)(cnt) & MAT(89)(cnt) & MAT(90)(cnt) & MAT(91)(cnt) & MAT(92)(cnt) & MAT(93)(cnt) & MAT(94)(cnt) & MAT(95)(cnt) & MAT(96)(cnt) & MAT(97)(cnt) & MAT(98)(cnt) & MAT(99)(cnt) & MAT(100)(cnt) & MAT(101)(cnt) & MAT(102)(cnt) & MAT(103)(cnt) & MAT(104)(cnt) & MAT(105)(cnt) & MAT(106)(cnt) & MAT(107)(cnt) & MAT(108)(cnt) & MAT(109)(cnt) & MAT(110)(cnt) & MAT(111)(cnt) & MAT(112)(cnt) & MAT(113)(cnt) & MAT(114)(cnt) & MAT(115)(cnt) & MAT(116)(cnt) & MAT(117)(cnt) & MAT(118)(cnt) & MAT(119)(cnt) & MAT(120)(cnt) & MAT(121)(cnt) & MAT(122)(cnt) & MAT(123)(cnt) & MAT(124)(cnt) & MAT(125)(cnt) & MAT(126)(cnt) & MAT(127)(cnt) & MAT(128)(cnt) & MAT(129)(cnt) & MAT(130)(cnt) & MAT(131)(cnt) & MAT(132)(cnt) & MAT(133)(cnt) & MAT(134)(cnt) & MAT(135)(cnt) & MAT(136)(cnt) & MAT(137)(cnt) & MAT(138)(cnt) & MAT(139)(cnt) & MAT(140)(cnt) & MAT(141)(cnt) & MAT(142)(cnt) & MAT(143)(cnt) & MAT(144)(cnt) & MAT(145)(cnt) & MAT(146)(cnt) & MAT(147)(cnt) & MAT(148)(cnt) & MAT(149)(cnt) & MAT(150)(cnt) & MAT(151)(cnt) & MAT(152)(cnt) & MAT(153)(cnt) & MAT(154)(cnt) & MAT(155)(cnt) & MAT(156)(cnt) & MAT(157)(cnt) & MAT(158)(cnt) & MAT(159)(cnt) & MAT(160)(cnt) & MAT(161)(cnt) & MAT(162)(cnt) & MAT(163)(cnt) & MAT(164)(cnt) & MAT(165)(cnt) & MAT(166)(cnt) & MAT(167)(cnt) & MAT(168)(cnt) & MAT(169)(cnt) & MAT(170)(cnt) & MAT(171)(cnt) & MAT(172)(cnt) & MAT(173)(cnt) & MAT(174)(cnt) & MAT(175)(cnt) & MAT(176)(cnt) & MAT(177)(cnt) & MAT(178)(cnt) & MAT(179)(cnt) & MAT(180)(cnt) & MAT(181)(cnt) & MAT(182)(cnt) & MAT(183)(cnt) & MAT(184)(cnt) & MAT(185)(cnt) & MAT(186)(cnt) & MAT(187)(cnt) & MAT(188)(cnt) & MAT(189)(cnt) & MAT(190)(cnt) & MAT(191)(cnt) & MAT(192)(cnt) & MAT(193)(cnt) & MAT(194)(cnt) & MAT(195)(cnt) & MAT(196)(cnt) & MAT(197)(cnt) & MAT(198)(cnt) & MAT(199)(cnt) & MAT(200)(cnt) & MAT(201)(cnt) & MAT(202)(cnt) & MAT(203)(cnt) & MAT(204)(cnt) & MAT(205)(cnt) & MAT(206)(cnt) & MAT(207)(cnt) & MAT(208)(cnt) & MAT(209)(cnt) & MAT(210)(cnt) & MAT(211)(cnt) & MAT(212)(cnt) & MAT(213)(cnt) & MAT(214)(cnt) & MAT(215)(cnt) & MAT(216)(cnt) & MAT(217)(cnt) & MAT(218)(cnt) & MAT(219)(cnt) & MAT(220)(cnt) & MAT(221)(cnt) & MAT(222)(cnt) & MAT(223)(cnt) & MAT(224)(cnt) & MAT(225)(cnt) & MAT(226)(cnt) & MAT(227)(cnt) & MAT(228)(cnt) & MAT(229)(cnt) & MAT(230)(cnt) & MAT(231)(cnt) & MAT(232)(cnt) & MAT(233)(cnt) & MAT(234)(cnt) & MAT(235)(cnt) & MAT(236)(cnt) & MAT(237)(cnt) & MAT(238)(cnt);
			end if;
		end if;
	end process;
	
	
end architecture;