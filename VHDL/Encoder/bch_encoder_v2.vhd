-- Author: Nikolai
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity bch_encoder_v2 is
	port (
		clk, rst : in std_logic;
		X : in  std_logic_vector(238 downto 0);
		C : out std_logic_vector(255 downto 0)
	);
end entity;


architecture bch_encoder_v2_arch of bch_encoder_v2 is
	
	signal P : std_logic_vector(16 downto 0); -- Parity bit vector
	type SR_type is array (0 to 2) of std_logic_vector(0 to 238);
	signal X_REG : SR_type;
	signal temp_6, temp_10 : std_logic_vector(16 downto 0);
	signal temp_0, temp_12, temp_13 : std_logic_vector(15 downto 0);
	signal temp_1, temp_2, temp_3, temp_4, temp_5, temp_7, temp_8, temp_15, temp_16 : std_logic_vector(14 downto 0);
	signal temp_9, temp_11, temp_14 : std_logic_vector(13 downto 0);
	signal p0, p1, p2, p3, p4, p5, p6, p7, p8    : std_logic_vector(1 downto 0);
	signal p9, p10, p11, p12, p13, p14, p15, p16 : std_logic_vector(1 downto 0);
	
	
	
	begin
	
	-- XOR TREE

	-- XOR TREE
	
	-- Register storing X
	X_SR : process (clk, rst)
		begin
			if rst = '1' then
				X_REG <= (others => (others => '0'));
			elsif rising_edge(clk) then
				X_REG(0) <= X;
				for i in 1 to X_REG'length-1 loop
					X_REG(i) <= X_REG(i-1);
				end loop;
				C <= X_REG(X_REG'length - 1) & P;
			end if;
	end process;
	
	
	S0_REG : process(clk,rst)
		begin
			if rst = '1' then
				temp_0 <= (others => '0');
				temp_1 <= (others => '0');
				temp_2 <= (others => '0');
				temp_3 <= (others => '0');
				temp_4 <= (others => '0');
				temp_5 <= (others => '0');
				temp_6 <= (others => '0');
				temp_7 <= (others => '0');
				temp_8 <= (others => '0');
				temp_9 <= (others => '0');
				temp_10 <= (others => '0');
				temp_11 <= (others => '0');
				temp_12 <= (others => '0');
				temp_13 <= (others => '0');
				temp_14 <= (others => '0');
				temp_15 <= (others => '0');
				temp_16 <= (others => '0');
			elsif rising_edge(clk) then
				temp_16(0) <= X(1) xor X(2) xor X(3) xor X(4) xor X(5) xor X(7) xor X(12) xor X(14);
				temp_16(1) <= X(15) xor X(16) xor X(19) xor X(20) xor X(21) xor X(22) xor X(24) xor X(25);
				temp_16(2) <= X(28) xor X(29) xor X(33) xor X(35) xor X(40) xor X(41) xor X(43) xor X(49);
				temp_16(3) <= X(50) xor X(51) xor X(52) xor X(53) xor X(55) xor X(59) xor X(60) xor X(61);
				temp_16(4) <= X(62) xor X(63) xor X(64) xor X(65) xor X(68) xor X(71) xor X(73) xor X(74);
				temp_16(5) <= X(76) xor X(79) xor X(83) xor X(84) xor X(85) xor X(86) xor X(87) xor X(89);
				temp_16(6) <= X(95) xor X(96) xor X(103) xor X(105) xor X(106) xor X(108) xor X(112) xor X(115);
				temp_16(7) <= X(116) xor X(117) xor X(118) xor X(119) xor X(120) xor X(122) xor X(123) xor X(125);
				temp_16(8) <= X(127) xor X(128) xor X(129) xor X(131) xor X(134) xor X(137) xor X(138) xor X(140);
				temp_16(9) <= X(142) xor X(143) xor X(145) xor X(147) xor X(149) xor X(152) xor X(154) xor X(155);
				temp_16(10) <= X(158) xor X(164) xor X(166) xor X(168) xor X(173) xor X(175) xor X(176) xor X(180);
				temp_16(11) <= X(183) xor X(184) xor X(185) xor X(186) xor X(188) xor X(197) xor X(200) xor X(202);
				temp_16(12) <= X(203) xor X(204) xor X(206) xor X(208) xor X(210) xor X(211) xor X(212) xor X(213);
				temp_16(13) <= X(217) xor X(218) xor X(219) xor X(222) xor X(223) xor X(226) xor X(227) xor X(228);
				temp_16(14) <= X(229) xor X(230) xor X(234) xor X(235) xor X(236) xor X(237) xor X(238);
				temp_15(0) <= X(0) xor X(1) xor X(2) xor X(3) xor X(4) xor X(6) xor X(11) xor X(13);
				temp_15(1) <= X(14) xor X(15) xor X(18) xor X(19) xor X(20) xor X(21) xor X(23) xor X(24);
				temp_15(2) <= X(27) xor X(28) xor X(32) xor X(34) xor X(39) xor X(40) xor X(42) xor X(48);
				temp_15(3) <= X(49) xor X(50) xor X(51) xor X(52) xor X(54) xor X(58) xor X(59) xor X(60);
				temp_15(4) <= X(61) xor X(62) xor X(63) xor X(64) xor X(67) xor X(70) xor X(72) xor X(73);
				temp_15(5) <= X(75) xor X(78) xor X(82) xor X(83) xor X(84) xor X(85) xor X(86) xor X(88);
				temp_15(6) <= X(94) xor X(95) xor X(102) xor X(104) xor X(105) xor X(107) xor X(111) xor X(114);
				temp_15(7) <= X(115) xor X(116) xor X(117) xor X(118) xor X(119) xor X(121) xor X(122) xor X(124);
				temp_15(8) <= X(126) xor X(127) xor X(128) xor X(130) xor X(133) xor X(136) xor X(137) xor X(139);
				temp_15(9) <= X(141) xor X(142) xor X(144) xor X(146) xor X(148) xor X(151) xor X(153) xor X(154);
				temp_15(10) <= X(157) xor X(163) xor X(165) xor X(167) xor X(172) xor X(174) xor X(175) xor X(179);
				temp_15(11) <= X(182) xor X(183) xor X(184) xor X(185) xor X(187) xor X(196) xor X(199) xor X(201);
				temp_15(12) <= X(202) xor X(203) xor X(205) xor X(207) xor X(209) xor X(210) xor X(211) xor X(212);
				temp_15(13) <= X(216) xor X(217) xor X(218) xor X(221) xor X(222) xor X(225) xor X(226) xor X(227);
				temp_15(14) <= X(228) xor X(229) xor X(233) xor X(234) xor X(235) xor X(236) xor X(237);
				temp_14(0) <= X(0) xor X(4) xor X(7) xor X(10) xor X(13) xor X(15) xor X(16) xor X(17);
				temp_14(1) <= X(18) xor X(21) xor X(23) xor X(24) xor X(25) xor X(26) xor X(27) xor X(28);
				temp_14(2) <= X(29) xor X(31) xor X(35) xor X(38) xor X(39) xor X(40) xor X(43) xor X(47);
				temp_14(3) <= X(48) xor X(52) xor X(55) xor X(57) xor X(58) xor X(64) xor X(65) xor X(66);
				temp_14(4) <= X(68) xor X(69) xor X(72) xor X(73) xor X(76) xor X(77) xor X(79) xor X(81);
				temp_14(5) <= X(82) xor X(86) xor X(89) xor X(93) xor X(94) xor X(95) xor X(96) xor X(101);
				temp_14(6) <= X(104) xor X(105) xor X(108) xor X(110) xor X(112) xor X(113) xor X(114) xor X(119);
				temp_14(7) <= X(121) xor X(122) xor X(126) xor X(128) xor X(131) xor X(132) xor X(134) xor X(135);
				temp_14(8) <= X(136) xor X(137) xor X(141) xor X(142) xor X(149) xor X(150) xor X(153) xor X(154);
				temp_14(9) <= X(155) xor X(156) xor X(158) xor X(162) xor X(168) xor X(171) xor X(174) xor X(175);
				temp_14(10) <= X(176) xor X(178) xor X(180) xor X(181) xor X(182) xor X(185) xor X(188) xor X(195);
				temp_14(11) <= X(197) xor X(198) xor X(201) xor X(203) xor X(209) xor X(212) xor X(213) xor X(215);
				temp_14(12) <= X(216) xor X(218) xor X(219) xor X(220) xor X(221) xor X(222) xor X(223) xor X(224);
				temp_14(13) <= X(225) xor X(229) xor X(230) xor X(232) xor X(233) xor X(237) xor X(238);
				temp_13(0) <= X(1) xor X(2) xor X(4) xor X(5) xor X(6) xor X(7) xor X(9) xor X(17);
				temp_13(1) <= X(19) xor X(21) xor X(23) xor X(26) xor X(27) xor X(29) xor X(30) xor X(33);
				temp_13(2) <= X(34) xor X(35) xor X(37) xor X(38) xor X(39) xor X(40) xor X(41) xor X(42);
				temp_13(3) <= X(43) xor X(46) xor X(47) xor X(49) xor X(50) xor X(52) xor X(53) xor X(54);
				temp_13(4) <= X(55) xor X(56) xor X(57) xor X(59) xor X(60) xor X(61) xor X(62) xor X(67);
				temp_13(5) <= X(72) xor X(73) xor X(74) xor X(75) xor X(78) xor X(79) xor X(80) xor X(81);
				temp_13(6) <= X(83) xor X(84) xor X(86) xor X(87) xor X(88) xor X(89) xor X(92) xor X(93);
				temp_13(7) <= X(94) xor X(96) xor X(100) xor X(104) xor X(105) xor X(106) xor X(107) xor X(108);
				temp_13(8) <= X(109) xor X(111) xor X(113) xor X(115) xor X(116) xor X(117) xor X(119) xor X(121);
				temp_13(9) <= X(122) xor X(123) xor X(128) xor X(129) xor X(130) xor X(133) xor X(135) xor X(136);
				temp_13(10) <= X(137) xor X(138) xor X(141) xor X(142) xor X(143) xor X(145) xor X(147) xor X(148);
				temp_13(11) <= X(153) xor X(157) xor X(158) xor X(161) xor X(164) xor X(166) xor X(167) xor X(168);
				temp_13(12) <= X(170) xor X(174) xor X(176) xor X(177) xor X(179) xor X(181) xor X(183) xor X(185);
				temp_13(13) <= X(186) xor X(187) xor X(188) xor X(194) xor X(196) xor X(203) xor X(204) xor X(206);
				temp_13(14) <= X(210) xor X(213) xor X(214) xor X(215) xor X(220) xor X(221) xor X(224) xor X(226);
				temp_13(15) <= X(227) xor X(230) xor X(231) xor X(232) xor X(234) xor X(235) xor X(238);
				temp_12(0) <= X(0) xor X(1) xor X(3) xor X(4) xor X(5) xor X(6) xor X(8) xor X(16);
				temp_12(1) <= X(18) xor X(20) xor X(22) xor X(25) xor X(26) xor X(28) xor X(29) xor X(32);
				temp_12(2) <= X(33) xor X(34) xor X(36) xor X(37) xor X(38) xor X(39) xor X(40) xor X(41);
				temp_12(3) <= X(42) xor X(45) xor X(46) xor X(48) xor X(49) xor X(51) xor X(52) xor X(53);
				temp_12(4) <= X(54) xor X(55) xor X(56) xor X(58) xor X(59) xor X(60) xor X(61) xor X(66);
				temp_12(5) <= X(71) xor X(72) xor X(73) xor X(74) xor X(77) xor X(78) xor X(79) xor X(80);
				temp_12(6) <= X(82) xor X(83) xor X(85) xor X(86) xor X(87) xor X(88) xor X(91) xor X(92);
				temp_12(7) <= X(93) xor X(95) xor X(99) xor X(103) xor X(104) xor X(105) xor X(106) xor X(107);
				temp_12(8) <= X(108) xor X(110) xor X(112) xor X(114) xor X(115) xor X(116) xor X(118) xor X(120);
				temp_12(9) <= X(121) xor X(122) xor X(127) xor X(128) xor X(129) xor X(132) xor X(134) xor X(135);
				temp_12(10) <= X(136) xor X(137) xor X(140) xor X(141) xor X(142) xor X(144) xor X(146) xor X(147);
				temp_12(11) <= X(152) xor X(156) xor X(157) xor X(160) xor X(163) xor X(165) xor X(166) xor X(167);
				temp_12(12) <= X(169) xor X(173) xor X(175) xor X(176) xor X(178) xor X(180) xor X(182) xor X(184);
				temp_12(13) <= X(185) xor X(186) xor X(187) xor X(193) xor X(195) xor X(202) xor X(203) xor X(205);
				temp_12(14) <= X(209) xor X(212) xor X(213) xor X(214) xor X(219) xor X(220) xor X(223) xor X(225);
				temp_12(15) <= X(226) xor X(229) xor X(230) xor X(231) xor X(233) xor X(234) xor X(237);
				temp_11(0) <= X(0) xor X(1) xor X(12) xor X(14) xor X(16) xor X(17) xor X(20) xor X(22);
				temp_11(1) <= X(27) xor X(29) xor X(31) xor X(32) xor X(36) xor X(37) xor X(38) xor X(39);
				temp_11(2) <= X(43) xor X(44) xor X(45) xor X(47) xor X(48) xor X(49) xor X(54) xor X(57);
				temp_11(3) <= X(58) xor X(61) xor X(62) xor X(63) xor X(64) xor X(68) xor X(70) xor X(72);
				temp_11(4) <= X(74) xor X(77) xor X(78) xor X(81) xor X(82) xor X(83) xor X(89) xor X(90);
				temp_11(5) <= X(91) xor X(92) xor X(94) xor X(95) xor X(96) xor X(98) xor X(102) xor X(104);
				temp_11(6) <= X(107) xor X(108) xor X(109) xor X(111) xor X(112) xor X(113) xor X(114) xor X(116);
				temp_11(7) <= X(118) xor X(121) xor X(122) xor X(123) xor X(125) xor X(126) xor X(129) xor X(133);
				temp_11(8) <= X(135) xor X(136) xor X(137) xor X(138) xor X(139) xor X(141) xor X(142) xor X(146);
				temp_11(9) <= X(147) xor X(149) xor X(151) xor X(152) xor X(154) xor X(156) xor X(158) xor X(159);
				temp_11(10) <= X(162) xor X(165) xor X(172) xor X(173) xor X(174) xor X(176) xor X(177) xor X(179);
				temp_11(11) <= X(180) xor X(181) xor X(188) xor X(192) xor X(194) xor X(197) xor X(200) xor X(201);
				temp_11(12) <= X(203) xor X(206) xor X(210) xor X(217) xor X(223) xor X(224) xor X(225) xor X(226);
				temp_11(13) <= X(227) xor X(232) xor X(233) xor X(234) xor X(235) xor X(237) xor X(238);
				temp_10(0) <= X(0) xor X(1) xor X(2) xor X(3) xor X(4) xor X(5) xor X(7) xor X(11);
				temp_10(1) <= X(12) xor X(13) xor X(14) xor X(20) xor X(22) xor X(24) xor X(25) xor X(26);
				temp_10(2) <= X(29) xor X(30) xor X(31) xor X(33) xor X(36) xor X(37) xor X(38) xor X(40);
				temp_10(3) <= X(41) xor X(42) xor X(44) xor X(46) xor X(47) xor X(48) xor X(49) xor X(50);
				temp_10(4) <= X(51) xor X(52) xor X(55) xor X(56) xor X(57) xor X(59) xor X(64) xor X(65);
				temp_10(5) <= X(67) xor X(68) xor X(69) xor X(74) xor X(77) xor X(79) xor X(80) xor X(81);
				temp_10(6) <= X(82) xor X(83) xor X(84) xor X(85) xor X(86) xor X(87) xor X(88) xor X(90);
				temp_10(7) <= X(91) xor X(93) xor X(94) xor X(96) xor X(97) xor X(101) xor X(105) xor X(107);
				temp_10(8) <= X(110) xor X(111) xor X(113) xor X(116) xor X(118) xor X(119) xor X(121) xor X(123);
				temp_10(9) <= X(124) xor X(127) xor X(129) xor X(131) xor X(132) xor X(135) xor X(136) xor X(141);
				temp_10(10) <= X(142) xor X(143) xor X(146) xor X(147) xor X(148) xor X(149) xor X(150) xor X(151);
				temp_10(11) <= X(152) xor X(153) xor X(154) xor X(157) xor X(161) xor X(166) xor X(168) xor X(171);
				temp_10(12) <= X(172) xor X(178) xor X(179) xor X(183) xor X(184) xor X(185) xor X(186) xor X(187);
				temp_10(13) <= X(188) xor X(191) xor X(193) xor X(196) xor X(197) xor X(199) xor X(203) xor X(204);
				temp_10(14) <= X(205) xor X(206) xor X(208) xor X(209) xor X(210) xor X(211) xor X(212) xor X(213);
				temp_10(15) <= X(216) xor X(217) xor X(218) xor X(219) xor X(224) xor X(225) xor X(227) xor X(228);
				temp_10(16) <= X(229) xor X(230) xor X(231) xor X(232) xor X(233) xor X(235) xor X(238);
				temp_9(0) <= X(0) xor X(5) xor X(6) xor X(7) xor X(10) xor X(11) xor X(13) xor X(14);
				temp_9(1) <= X(15) xor X(16) xor X(20) xor X(22) xor X(23) xor X(30) xor X(32) xor X(33);
				temp_9(2) <= X(36) xor X(37) xor X(39) xor X(45) xor X(46) xor X(47) xor X(48) xor X(52);
				temp_9(3) <= X(53) xor X(54) xor X(56) xor X(58) xor X(59) xor X(60) xor X(61) xor X(62);
				temp_9(4) <= X(65) xor X(66) xor X(67) xor X(71) xor X(74) xor X(78) xor X(80) xor X(81);
				temp_9(5) <= X(82) xor X(90) xor X(92) xor X(93) xor X(100) xor X(103) xor X(104) xor X(105);
				temp_9(6) <= X(108) xor X(109) xor X(110) xor X(116) xor X(119) xor X(125) xor X(126) xor X(127);
				temp_9(7) <= X(129) xor X(130) xor X(135) xor X(137) xor X(138) xor X(141) xor X(143) xor X(146);
				temp_9(8) <= X(148) xor X(150) xor X(151) xor X(153) xor X(154) xor X(155) xor X(156) xor X(158);
				temp_9(9) <= X(160) xor X(164) xor X(165) xor X(166) xor X(167) xor X(168) xor X(170) xor X(171);
				temp_9(10) <= X(173) xor X(175) xor X(176) xor X(177) xor X(178) xor X(180) xor X(182) xor X(187);
				temp_9(11) <= X(188) xor X(190) xor X(192) xor X(195) xor X(196) xor X(197) xor X(198) xor X(200);
				temp_9(12) <= X(205) xor X(206) xor X(207) xor X(209) xor X(213) xor X(215) xor X(216) xor X(219);
				temp_9(13) <= X(222) xor X(224) xor X(231) xor X(232) xor X(235) xor X(236) xor X(238);
				temp_8(0) <= X(1) xor X(2) xor X(3) xor X(6) xor X(7) xor X(9) xor X(10) xor X(13);
				temp_8(1) <= X(16) xor X(20) xor X(24) xor X(25) xor X(28) xor X(31) xor X(32) xor X(33);
				temp_8(2) <= X(36) xor X(38) xor X(40) xor X(41) xor X(43) xor X(44) xor X(45) xor X(46);
				temp_8(3) <= X(47) xor X(49) xor X(50) xor X(57) xor X(58) xor X(62) xor X(63) xor X(66);
				temp_8(4) <= X(68) xor X(70) xor X(71) xor X(74) xor X(76) xor X(77) xor X(80) xor X(81);
				temp_8(5) <= X(83) xor X(84) xor X(85) xor X(86) xor X(87) xor X(91) xor X(92) xor X(95);
				temp_8(6) <= X(96) xor X(99) xor X(102) xor X(104) xor X(105) xor X(106) xor X(107) xor X(109);
				temp_8(7) <= X(112) xor X(116) xor X(117) xor X(119) xor X(120) xor X(122) xor X(123) xor X(124);
				temp_8(8) <= X(126) xor X(127) xor X(131) xor X(136) xor X(138) xor X(143) xor X(150) xor X(153);
				temp_8(9) <= X(157) xor X(158) xor X(159) xor X(163) xor X(165) xor X(167) xor X(168) xor X(169);
				temp_8(10) <= X(170) xor X(172) xor X(173) xor X(174) xor X(177) xor X(179) xor X(180) xor X(181);
				temp_8(11) <= X(183) xor X(184) xor X(185) xor X(187) xor X(188) xor X(189) xor X(191) xor X(194);
				temp_8(12) <= X(195) xor X(196) xor X(199) xor X(200) xor X(202) xor X(203) xor X(205) xor X(210);
				temp_8(13) <= X(211) xor X(213) xor X(214) xor X(215) xor X(217) xor X(219) xor X(221) xor X(222);
				temp_8(14) <= X(226) xor X(227) xor X(228) xor X(229) xor X(231) xor X(236) xor X(238);
				temp_7(0) <= X(0) xor X(1) xor X(2) xor X(5) xor X(6) xor X(8) xor X(9) xor X(12);
				temp_7(1) <= X(15) xor X(19) xor X(23) xor X(24) xor X(27) xor X(30) xor X(31) xor X(32);
				temp_7(2) <= X(35) xor X(37) xor X(39) xor X(40) xor X(42) xor X(43) xor X(44) xor X(45);
				temp_7(3) <= X(46) xor X(48) xor X(49) xor X(56) xor X(57) xor X(61) xor X(62) xor X(65);
				temp_7(4) <= X(67) xor X(69) xor X(70) xor X(73) xor X(75) xor X(76) xor X(79) xor X(80);
				temp_7(5) <= X(82) xor X(83) xor X(84) xor X(85) xor X(86) xor X(90) xor X(91) xor X(94);
				temp_7(6) <= X(95) xor X(98) xor X(101) xor X(103) xor X(104) xor X(105) xor X(106) xor X(108);
				temp_7(7) <= X(111) xor X(115) xor X(116) xor X(118) xor X(119) xor X(121) xor X(122) xor X(123);
				temp_7(8) <= X(125) xor X(126) xor X(130) xor X(135) xor X(137) xor X(142) xor X(149) xor X(152);
				temp_7(9) <= X(156) xor X(157) xor X(158) xor X(162) xor X(164) xor X(166) xor X(167) xor X(168);
				temp_7(10) <= X(169) xor X(171) xor X(172) xor X(173) xor X(176) xor X(178) xor X(179) xor X(180);
				temp_7(11) <= X(182) xor X(183) xor X(184) xor X(186) xor X(187) xor X(188) xor X(190) xor X(193);
				temp_7(12) <= X(194) xor X(195) xor X(198) xor X(199) xor X(201) xor X(202) xor X(204) xor X(209);
				temp_7(13) <= X(210) xor X(212) xor X(213) xor X(214) xor X(216) xor X(218) xor X(220) xor X(221);
				temp_7(14) <= X(225) xor X(226) xor X(227) xor X(228) xor X(230) xor X(235) xor X(237);
				temp_6(0) <= X(0) xor X(2) xor X(3) xor X(8) xor X(11) xor X(12) xor X(15) xor X(16);
				temp_6(1) <= X(18) xor X(19) xor X(20) xor X(21) xor X(23) xor X(24) xor X(25) xor X(26);
				temp_6(2) <= X(28) xor X(30) xor X(31) xor X(33) xor X(34) xor X(35) xor X(36) xor X(38);
				temp_6(3) <= X(39) xor X(40) xor X(42) xor X(44) xor X(45) xor X(47) xor X(48) xor X(49);
				temp_6(4) <= X(50) xor X(51) xor X(52) xor X(53) xor X(56) xor X(59) xor X(62) xor X(63);
				temp_6(5) <= X(65) xor X(66) xor X(69) xor X(71) xor X(72) xor X(73) xor X(75) xor X(76);
				temp_6(6) <= X(78) xor X(81) xor X(82) xor X(86) xor X(87) xor X(90) xor X(93) xor X(94);
				temp_6(7) <= X(95) xor X(96) xor X(97) xor X(100) xor X(102) xor X(104) xor X(106) xor X(107);
				temp_6(8) <= X(108) xor X(110) xor X(112) xor X(114) xor X(116) xor X(119) xor X(121) xor X(123);
				temp_6(9) <= X(124) xor X(127) xor X(128) xor X(131) xor X(136) xor X(137) xor X(138) xor X(140);
				temp_6(10) <= X(141) xor X(142) xor X(143) xor X(145) xor X(147) xor X(148) xor X(149) xor X(151);
				temp_6(11) <= X(152) xor X(154) xor X(156) xor X(157) xor X(158) xor X(161) xor X(163) xor X(164);
				temp_6(12) <= X(165) xor X(167) xor X(170) xor X(171) xor X(172) xor X(173) xor X(176) xor X(177);
				temp_6(13) <= X(178) xor X(179) xor X(180) xor X(181) xor X(182) xor X(184) xor X(187) xor X(188);
				temp_6(14) <= X(189) xor X(192) xor X(193) xor X(194) xor X(198) xor X(201) xor X(202) xor X(204);
				temp_6(15) <= X(206) xor X(209) xor X(210) xor X(215) xor X(218) xor X(220) xor X(222) xor X(223);
				temp_6(16) <= X(224) xor X(225) xor X(228) xor X(230) xor X(235) xor X(237) xor X(238);
				temp_5(0) <= X(3) xor X(4) xor X(5) xor X(10) xor X(11) xor X(12) xor X(16) xor X(17);
				temp_5(1) <= X(18) xor X(21) xor X(23) xor X(27) xor X(28) xor X(30) xor X(32) xor X(34);
				temp_5(2) <= X(37) xor X(38) xor X(39) xor X(40) xor X(44) xor X(46) xor X(47) xor X(48);
				temp_5(3) <= X(53) xor X(58) xor X(59) xor X(60) xor X(63) xor X(70) xor X(72) xor X(73);
				temp_5(4) <= X(75) xor X(76) xor X(77) xor X(79) xor X(80) xor X(81) xor X(83) xor X(84);
				temp_5(5) <= X(87) xor X(92) xor X(93) xor X(94) xor X(99) xor X(101) xor X(107) xor X(108);
				temp_5(6) <= X(109) xor X(111) xor X(112) xor X(113) xor X(116) xor X(117) xor X(119) xor X(125);
				temp_5(7) <= X(126) xor X(128) xor X(129) xor X(130) xor X(131) xor X(134) xor X(135) xor X(136);
				temp_5(8) <= X(138) xor X(139) xor X(141) xor X(143) xor X(144) xor X(145) xor X(146) xor X(148);
				temp_5(9) <= X(149) xor X(150) xor X(151) xor X(152) xor X(153) xor X(154) xor X(156) xor X(157);
				temp_5(10) <= X(158) xor X(160) xor X(162) xor X(163) xor X(168) xor X(169) xor X(170) xor X(171);
				temp_5(11) <= X(172) xor X(173) xor X(177) xor X(178) xor X(179) xor X(181) xor X(184) xor X(185);
				temp_5(12) <= X(187) xor X(191) xor X(192) xor X(193) xor X(201) xor X(202) xor X(204) xor X(205);
				temp_5(13) <= X(206) xor X(209) xor X(210) xor X(211) xor X(212) xor X(213) xor X(214) xor X(218);
				temp_5(14) <= X(221) xor X(224) xor X(226) xor X(228) xor X(230) xor X(235) xor X(238);
				temp_4(0) <= X(2) xor X(3) xor X(4) xor X(9) xor X(10) xor X(11) xor X(15) xor X(16);
				temp_4(1) <= X(17) xor X(20) xor X(22) xor X(26) xor X(27) xor X(29) xor X(31) xor X(33);
				temp_4(2) <= X(36) xor X(37) xor X(38) xor X(39) xor X(43) xor X(45) xor X(46) xor X(47);
				temp_4(3) <= X(52) xor X(57) xor X(58) xor X(59) xor X(62) xor X(69) xor X(71) xor X(72);
				temp_4(4) <= X(74) xor X(75) xor X(76) xor X(78) xor X(79) xor X(80) xor X(82) xor X(83);
				temp_4(5) <= X(86) xor X(91) xor X(92) xor X(93) xor X(98) xor X(100) xor X(106) xor X(107);
				temp_4(6) <= X(108) xor X(110) xor X(111) xor X(112) xor X(115) xor X(116) xor X(118) xor X(124);
				temp_4(7) <= X(125) xor X(127) xor X(128) xor X(129) xor X(130) xor X(133) xor X(134) xor X(135);
				temp_4(8) <= X(137) xor X(138) xor X(140) xor X(142) xor X(143) xor X(144) xor X(145) xor X(147);
				temp_4(9) <= X(148) xor X(149) xor X(150) xor X(151) xor X(152) xor X(153) xor X(155) xor X(156);
				temp_4(10) <= X(157) xor X(159) xor X(161) xor X(162) xor X(167) xor X(168) xor X(169) xor X(170);
				temp_4(11) <= X(171) xor X(172) xor X(176) xor X(177) xor X(178) xor X(180) xor X(183) xor X(184);
				temp_4(12) <= X(186) xor X(190) xor X(191) xor X(192) xor X(200) xor X(201) xor X(203) xor X(204);
				temp_4(13) <= X(205) xor X(208) xor X(209) xor X(210) xor X(211) xor X(212) xor X(213) xor X(217);
				temp_4(14) <= X(220) xor X(223) xor X(225) xor X(227) xor X(229) xor X(234) xor X(237);
				temp_3(0) <= X(1) xor X(2) xor X(3) xor X(8) xor X(9) xor X(10) xor X(14) xor X(15);
				temp_3(1) <= X(16) xor X(19) xor X(21) xor X(25) xor X(26) xor X(28) xor X(30) xor X(32);
				temp_3(2) <= X(35) xor X(36) xor X(37) xor X(38) xor X(42) xor X(44) xor X(45) xor X(46);
				temp_3(3) <= X(51) xor X(56) xor X(57) xor X(58) xor X(61) xor X(68) xor X(70) xor X(71);
				temp_3(4) <= X(73) xor X(74) xor X(75) xor X(77) xor X(78) xor X(79) xor X(81) xor X(82);
				temp_3(5) <= X(85) xor X(90) xor X(91) xor X(92) xor X(97) xor X(99) xor X(105) xor X(106);
				temp_3(6) <= X(107) xor X(109) xor X(110) xor X(111) xor X(114) xor X(115) xor X(117) xor X(123);
				temp_3(7) <= X(124) xor X(126) xor X(127) xor X(128) xor X(129) xor X(132) xor X(133) xor X(134);
				temp_3(8) <= X(136) xor X(137) xor X(139) xor X(141) xor X(142) xor X(143) xor X(144) xor X(146);
				temp_3(9) <= X(147) xor X(148) xor X(149) xor X(150) xor X(151) xor X(152) xor X(154) xor X(155);
				temp_3(10) <= X(156) xor X(158) xor X(160) xor X(161) xor X(166) xor X(167) xor X(168) xor X(169);
				temp_3(11) <= X(170) xor X(171) xor X(175) xor X(176) xor X(177) xor X(179) xor X(182) xor X(183);
				temp_3(12) <= X(185) xor X(189) xor X(190) xor X(191) xor X(199) xor X(200) xor X(202) xor X(203);
				temp_3(13) <= X(204) xor X(207) xor X(208) xor X(209) xor X(210) xor X(211) xor X(212) xor X(216);
				temp_3(14) <= X(219) xor X(222) xor X(224) xor X(226) xor X(228) xor X(233) xor X(236);
				temp_2(0) <= X(0) xor X(1) xor X(2) xor X(7) xor X(8) xor X(9) xor X(13) xor X(14);
				temp_2(1) <= X(15) xor X(18) xor X(20) xor X(24) xor X(25) xor X(27) xor X(29) xor X(31);
				temp_2(2) <= X(34) xor X(35) xor X(36) xor X(37) xor X(41) xor X(43) xor X(44) xor X(45);
				temp_2(3) <= X(50) xor X(55) xor X(56) xor X(57) xor X(60) xor X(67) xor X(69) xor X(70);
				temp_2(4) <= X(72) xor X(73) xor X(74) xor X(76) xor X(77) xor X(78) xor X(80) xor X(81);
				temp_2(5) <= X(84) xor X(89) xor X(90) xor X(91) xor X(96) xor X(98) xor X(104) xor X(105);
				temp_2(6) <= X(106) xor X(108) xor X(109) xor X(110) xor X(113) xor X(114) xor X(116) xor X(122);
				temp_2(7) <= X(123) xor X(125) xor X(126) xor X(127) xor X(128) xor X(131) xor X(132) xor X(133);
				temp_2(8) <= X(135) xor X(136) xor X(138) xor X(140) xor X(141) xor X(142) xor X(143) xor X(145);
				temp_2(9) <= X(146) xor X(147) xor X(148) xor X(149) xor X(150) xor X(151) xor X(153) xor X(154);
				temp_2(10) <= X(155) xor X(157) xor X(159) xor X(160) xor X(165) xor X(166) xor X(167) xor X(168);
				temp_2(11) <= X(169) xor X(170) xor X(174) xor X(175) xor X(176) xor X(178) xor X(181) xor X(182);
				temp_2(12) <= X(184) xor X(188) xor X(189) xor X(190) xor X(198) xor X(199) xor X(201) xor X(202);
				temp_2(13) <= X(203) xor X(206) xor X(207) xor X(208) xor X(209) xor X(210) xor X(211) xor X(215);
				temp_2(14) <= X(218) xor X(221) xor X(223) xor X(225) xor X(227) xor X(232) xor X(235);
				temp_1(0) <= X(0) xor X(2) xor X(3) xor X(4) xor X(5) xor X(6) xor X(8) xor X(13);
				temp_1(1) <= X(15) xor X(16) xor X(17) xor X(20) xor X(21) xor X(22) xor X(23) xor X(25);
				temp_1(2) <= X(26) xor X(29) xor X(30) xor X(34) xor X(36) xor X(41) xor X(42) xor X(44);
				temp_1(3) <= X(50) xor X(51) xor X(52) xor X(53) xor X(54) xor X(56) xor X(60) xor X(61);
				temp_1(4) <= X(62) xor X(63) xor X(64) xor X(65) xor X(66) xor X(69) xor X(72) xor X(74);
				temp_1(5) <= X(75) xor X(77) xor X(80) xor X(84) xor X(85) xor X(86) xor X(87) xor X(88);
				temp_1(6) <= X(90) xor X(96) xor X(97) xor X(104) xor X(106) xor X(107) xor X(109) xor X(113);
				temp_1(7) <= X(116) xor X(117) xor X(118) xor X(119) xor X(120) xor X(121) xor X(123) xor X(124);
				temp_1(8) <= X(126) xor X(128) xor X(129) xor X(130) xor X(132) xor X(135) xor X(138) xor X(139);
				temp_1(9) <= X(141) xor X(143) xor X(144) xor X(146) xor X(148) xor X(150) xor X(153) xor X(155);
				temp_1(10) <= X(156) xor X(159) xor X(165) xor X(167) xor X(169) xor X(174) xor X(176) xor X(177);
				temp_1(11) <= X(181) xor X(184) xor X(185) xor X(186) xor X(187) xor X(189) xor X(198) xor X(201);
				temp_1(12) <= X(203) xor X(204) xor X(205) xor X(207) xor X(209) xor X(211) xor X(212) xor X(213);
				temp_1(13) <= X(214) xor X(218) xor X(219) xor X(220) xor X(223) xor X(224) xor X(227) xor X(228);
				temp_1(14) <= X(229) xor X(230) xor X(231) xor X(235) xor X(236) xor X(237) xor X(238);
				temp_0(0) <= X(0) xor X(1) xor X(3) xor X(5) xor X(8) xor X(9) xor X(10) xor X(11);
				temp_0(1) <= X(12) xor X(15) xor X(17) xor X(18) xor X(19) xor X(21) xor X(23) xor X(24);
				temp_0(2) <= X(26) xor X(27) xor X(28) xor X(30) xor X(31) xor X(32) xor X(33) xor X(36);
				temp_0(3) <= X(37) xor X(38) xor X(39) xor X(40) xor X(42) xor X(43) xor X(50) xor X(52);
				temp_0(4) <= X(54) xor X(55) xor X(60) xor X(62) xor X(64) xor X(66) xor X(67) xor X(68);
				temp_0(5) <= X(72) xor X(73) xor X(75) xor X(76) xor X(80) xor X(81) xor X(82) xor X(83);
				temp_0(6) <= X(85) xor X(87) xor X(90) xor X(91) xor X(92) xor X(93) xor X(94) xor X(95);
				temp_0(7) <= X(97) xor X(98) xor X(99) xor X(100) xor X(101) xor X(102) xor X(103) xor X(106);
				temp_0(8) <= X(109) xor X(110) xor X(111) xor X(112) xor X(116) xor X(118) xor X(120) xor X(123);
				temp_0(9) <= X(126) xor X(127) xor X(129) xor X(132) xor X(133) xor X(134) xor X(138) xor X(141);
				temp_0(10) <= X(142) xor X(144) xor X(145) xor X(148) xor X(149) xor X(153) xor X(154) xor X(156);
				temp_0(11) <= X(157) xor X(158) xor X(165) xor X(166) xor X(169) xor X(170) xor X(171) xor X(172);
				temp_0(12) <= X(173) xor X(176) xor X(181) xor X(182) xor X(183) xor X(185) xor X(187) xor X(188);
				temp_0(13) <= X(198) xor X(199) xor X(200) xor X(203) xor X(205) xor X(206) xor X(209) xor X(210);
				temp_0(14) <= X(212) xor X(214) xor X(215) xor X(216) xor X(217) xor X(219) xor X(223) xor X(227);
				temp_0(15) <= X(229) xor X(231) xor X(232) xor X(233) xor X(234) xor X(236) xor X(238);
			end if;
		
	end process;
	
	S1_REG : process(clk,rst)
		begin
			if rst = '1' then
				p0 <= (others => '0');
				p1 <= (others => '0');
				p2 <= (others => '0');
				p3 <= (others => '0');
				p4 <= (others => '0');
				p5 <= (others => '0');
				p6 <= (others => '0');
				p7 <= (others => '0');
				p8 <= (others => '0');
				p9 <= (others => '0');
				p10 <= (others => '0');
				p11 <= (others => '0');
				p12 <= (others => '0');
				p13 <= (others => '0');
				p14 <= (others => '0');
				p15 <= (others => '0');
				p16 <= (others => '0');
			elsif rising_edge(clk) then
				p0(0) <= temp_0(0) xor temp_0(1) xor temp_0(2) xor temp_0(3) xor temp_0(4) xor temp_0(5) xor temp_0(6) xor temp_0(7);
				p0(1) <= temp_0(8) xor temp_0(9) xor temp_0(10) xor temp_0(11) xor temp_0(12) xor temp_0(13) xor temp_0(14) xor temp_0(15);
				
				p1(0) <= temp_1(0) xor temp_1(1) xor temp_1(2) xor temp_1(3) xor temp_1(4) xor temp_1(5) xor temp_1(6) xor temp_1(7);
				p1(1) <= temp_1(8) xor temp_1(9) xor temp_1(10) xor temp_1(11) xor temp_1(12) xor temp_1(13) xor temp_1(14);
				
				p2(0) <= temp_2(0) xor temp_2(1) xor temp_2(2) xor temp_2(3) xor temp_2(4) xor temp_2(5) xor temp_2(6) xor temp_2(7);
				p2(1) <= temp_2(8) xor temp_2(9) xor temp_2(10) xor temp_2(11) xor temp_2(12) xor temp_2(13) xor temp_2(14);
				
				p3(0) <= temp_3(0) xor temp_3(1) xor temp_3(2) xor temp_3(3) xor temp_3(4) xor temp_3(5) xor temp_3(6) xor temp_3(7);
				p3(1) <= temp_3(8) xor temp_3(9) xor temp_3(10) xor temp_3(11) xor temp_3(12) xor temp_3(13) xor temp_3(14);
				
				p4(0) <= temp_4(0) xor temp_4(1) xor temp_4(2) xor temp_4(3) xor temp_4(4) xor temp_4(5) xor temp_4(6) xor temp_4(7);
				p4(1) <= temp_4(8) xor temp_4(9) xor temp_4(10) xor temp_4(11) xor temp_4(12) xor temp_4(13) xor temp_4(14);
				
				p5(0) <= temp_5(0) xor temp_5(1) xor temp_5(2) xor temp_5(3) xor temp_5(4) xor temp_5(5) xor temp_5(6) xor temp_5(7);
				p5(1) <= temp_5(8) xor temp_5(9) xor temp_5(10) xor temp_5(11) xor temp_5(12) xor temp_5(13) xor temp_5(14);
				
				p6(0) <= temp_6(0) xor temp_6(1) xor temp_6(2) xor temp_6(3) xor temp_6(4) xor temp_6(5) xor temp_6(6) xor temp_6(7);
				p6(1) <= temp_6(8) xor temp_6(9) xor temp_6(10) xor temp_6(11) xor temp_6(12) xor temp_6(13) xor temp_6(14) xor temp_6(15) xor temp_6(16);
				
				p7(0) <= temp_7(0) xor temp_7(1) xor temp_7(2) xor temp_7(3) xor temp_7(4) xor temp_7(5) xor temp_7(6) xor temp_7(7);
				p7(1) <= temp_7(8) xor temp_7(9) xor temp_7(10) xor temp_7(11) xor temp_7(12) xor temp_7(13) xor temp_7(14);
				
				p8(0) <= temp_8(0) xor temp_8(1) xor temp_8(2) xor temp_8(3) xor temp_8(4) xor temp_8(5) xor temp_8(6) xor temp_8(7);
				p8(1) <= temp_8(8) xor temp_8(9) xor temp_8(10) xor temp_8(11) xor temp_8(12) xor temp_8(13) xor temp_8(14);
				
				p9(0) <= temp_9(0) xor temp_9(1) xor temp_9(2) xor temp_9(3) xor temp_9(4) xor temp_9(5) xor temp_9(6);
				p9(1) <= temp_9(7) xor temp_9(8) xor temp_9(9) xor temp_9(10) xor temp_9(11) xor temp_9(12) xor temp_9(13);
				
				p10(0) <= temp_10(0) xor temp_10(1) xor temp_10(2) xor temp_10(3) xor temp_10(4) xor temp_10(5) xor temp_10(6) xor temp_10(7);
				p10(1) <= temp_10(8) xor temp_10(9) xor temp_10(10) xor temp_10(11) xor temp_10(12) xor temp_10(13) xor temp_10(14) xor temp_10(15) xor temp_10(16);
				
				p11(0) <= temp_11(0) xor temp_11(1) xor temp_11(2) xor temp_11(3) xor temp_11(4) xor temp_11(5) xor temp_11(6);
				p11(1) <= temp_11(7) xor temp_11(8) xor temp_11(9) xor temp_11(10) xor temp_11(11) xor temp_11(12) xor temp_11(13);
				
				p12(0) <= temp_12(0) xor temp_12(1) xor temp_12(2) xor temp_12(3) xor temp_12(4) xor temp_12(5) xor temp_12(6) xor temp_12(7);
				p12(1) <= temp_12(8) xor temp_12(9) xor temp_12(10) xor temp_12(11) xor temp_12(12) xor temp_12(13) xor temp_12(14) xor temp_12(15);
				
				p13(0) <= temp_13(0) xor temp_13(1) xor temp_13(2) xor temp_13(3) xor temp_13(4) xor temp_13(5) xor temp_13(6) xor temp_13(7);
				p13(1) <= temp_13(8) xor temp_13(9) xor temp_13(10) xor temp_13(11) xor temp_13(12) xor temp_13(13) xor temp_13(14) xor temp_13(15);
				
				p14(0) <= temp_14(0) xor temp_14(1) xor temp_14(2) xor temp_14(3) xor temp_14(4) xor temp_14(5) xor temp_14(6);
				p14(1) <= temp_14(7) xor temp_14(8) xor temp_14(9) xor temp_14(10) xor temp_14(11) xor temp_14(12) xor temp_14(13);
				
				p15(0) <= temp_15(0) xor temp_15(1) xor temp_15(2) xor temp_15(3) xor temp_15(4) xor temp_15(5) xor temp_15(6) xor temp_15(7);
				p15(1) <= temp_15(8) xor temp_15(9) xor temp_15(10) xor temp_15(11) xor temp_15(12) xor temp_15(13) xor temp_15(14);
				
				p16(0) <= temp_16(0) xor temp_16(1) xor temp_16(2) xor temp_16(3) xor temp_16(4) xor temp_16(5) xor temp_16(6) xor temp_16(7);
				p16(1) <= temp_16(8) xor temp_16(9) xor temp_16(10) xor temp_16(11) xor temp_16(12) xor temp_16(13) xor temp_16(14);
				
			end if;
	end process;
	
	S2_REG : process(clk,rst)
		begin
			if rst = '1' then
				P <= (others => '0');
			elsif rising_edge(clk) then
				P(0) <= p0(0) xor p0(1);
				P(1) <= p1(0) xor p1(1);
				P(2) <= p2(0) xor p2(1);
				P(3) <= p3(0) xor p3(1);
				P(4) <= p4(0) xor p4(1);
				P(5) <= p5(0) xor p5(1);
				P(6) <= p6(0) xor p6(1);
				P(7) <= p7(0) xor p7(1);
				P(8) <= p8(0) xor p8(1);
				P(9) <= p9(0) xor p9(1);
				P(10) <= p10(0) xor p10(1);
				P(11) <= p11(0) xor p11(1);
				P(12) <= p12(0) xor p12(1);
				P(13) <= p13(0) xor p13(1);
				P(14) <= p14(0) xor p14(1);
				P(15) <= p15(0) xor p15(1);
				P(16) <= p16(0) xor p16(1);
			end if;
	end process;
end architecture;

