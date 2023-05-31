LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity bch_encoder is
	port (
		clk, rst : in std_logic;
		X : in  std_logic_vector(238 downto 0);
		C : out std_logic_vector(255 downto 0)
	);
end entity;


architecture bch_encoder_arch of bch_encoder is
	
	signal P : std_logic_vector(16 downto 0);
	signal temp : std_logic_vector(255 downto 0);
	
	begin
	
	
P(16) <= X(1) xor X(2) xor X(3) xor X(4) xor X(5) xor X(7) xor X(12) xor X(14) xor X(15) xor X(16) xor X(19) xor X(20) xor X(21) xor X(22) xor X(24) xor X(25) xor X(28) xor X(29) xor X(33) xor X(35) xor X(40) xor X(41) xor X(43) xor X(49) xor X(50) xor X(51) xor X(52) xor X(53) xor X(55) xor X(59) xor X(60) xor X(61) xor X(62) xor X(63) xor X(64) xor X(65) xor X(68) xor X(71) xor X(73) xor X(74) xor X(76) xor X(79) xor X(83) xor X(84) xor X(85) xor X(86) xor X(87) xor X(89) xor X(95) xor X(96) xor X(103) xor X(105) xor X(106) xor X(108) xor X(112) xor X(115) xor X(116) xor X(117) xor X(118) xor X(119) xor X(120) xor X(122) xor X(123) xor X(125) xor X(127) xor X(128) xor X(129) xor X(131) xor X(134) xor X(137) xor X(138) xor X(140) xor X(142) xor X(143) xor X(145) xor X(147) xor X(149) xor X(152) xor X(154) xor X(155) xor X(158) xor X(164) xor X(166) xor X(168) xor X(173) xor X(175) xor X(176) xor X(180) xor X(183) xor X(184) xor X(185) xor X(186) xor X(188) xor X(197) xor X(200) xor X(202) xor X(203) xor X(204) xor X(206) xor X(208) xor X(210) xor X(211) xor X(212) xor X(213) xor X(217) xor X(218) xor X(219) xor X(222) xor X(223) xor X(226) xor X(227) xor X(228) xor X(229) xor X(230) xor X(234) xor X(235) xor X(236) xor X(237) xor X(238);
P(15) <= X(0) xor X(1) xor X(2) xor X(3) xor X(4) xor X(6) xor X(11) xor X(13) xor X(14) xor X(15) xor X(18) xor X(19) xor X(20) xor X(21) xor X(23) xor X(24) xor X(27) xor X(28) xor X(32) xor X(34) xor X(39) xor X(40) xor X(42) xor X(48) xor X(49) xor X(50) xor X(51) xor X(52) xor X(54) xor X(58) xor X(59) xor X(60) xor X(61) xor X(62) xor X(63) xor X(64) xor X(67) xor X(70) xor X(72) xor X(73) xor X(75) xor X(78) xor X(82) xor X(83) xor X(84) xor X(85) xor X(86) xor X(88) xor X(94) xor X(95) xor X(102) xor X(104) xor X(105) xor X(107) xor X(111) xor X(114) xor X(115) xor X(116) xor X(117) xor X(118) xor X(119) xor X(121) xor X(122) xor X(124) xor X(126) xor X(127) xor X(128) xor X(130) xor X(133) xor X(136) xor X(137) xor X(139) xor X(141) xor X(142) xor X(144) xor X(146) xor X(148) xor X(151) xor X(153) xor X(154) xor X(157) xor X(163) xor X(165) xor X(167) xor X(172) xor X(174) xor X(175) xor X(179) xor X(182) xor X(183) xor X(184) xor X(185) xor X(187) xor X(196) xor X(199) xor X(201) xor X(202) xor X(203) xor X(205) xor X(207) xor X(209) xor X(210) xor X(211) xor X(212) xor X(216) xor X(217) xor X(218) xor X(221) xor X(222) xor X(225) xor X(226) xor X(227) xor X(228) xor X(229) xor X(233) xor X(234) xor X(235) xor X(236) xor X(237);
P(14) <= X(0) xor X(4) xor X(7) xor X(10) xor X(13) xor X(15) xor X(16) xor X(17) xor X(18) xor X(21) xor X(23) xor X(24) xor X(25) xor X(26) xor X(27) xor X(28) xor X(29) xor X(31) xor X(35) xor X(38) xor X(39) xor X(40) xor X(43) xor X(47) xor X(48) xor X(52) xor X(55) xor X(57) xor X(58) xor X(64) xor X(65) xor X(66) xor X(68) xor X(69) xor X(72) xor X(73) xor X(76) xor X(77) xor X(79) xor X(81) xor X(82) xor X(86) xor X(89) xor X(93) xor X(94) xor X(95) xor X(96) xor X(101) xor X(104) xor X(105) xor X(108) xor X(110) xor X(112) xor X(113) xor X(114) xor X(119) xor X(121) xor X(122) xor X(126) xor X(128) xor X(131) xor X(132) xor X(134) xor X(135) xor X(136) xor X(137) xor X(141) xor X(142) xor X(149) xor X(150) xor X(153) xor X(154) xor X(155) xor X(156) xor X(158) xor X(162) xor X(168) xor X(171) xor X(174) xor X(175) xor X(176) xor X(178) xor X(180) xor X(181) xor X(182) xor X(185) xor X(188) xor X(195) xor X(197) xor X(198) xor X(201) xor X(203) xor X(209) xor X(212) xor X(213) xor X(215) xor X(216) xor X(218) xor X(219) xor X(220) xor X(221) xor X(222) xor X(223) xor X(224) xor X(225) xor X(229) xor X(230) xor X(232) xor X(233) xor X(237) xor X(238);
P(13) <= X(1) xor X(2) xor X(4) xor X(5) xor X(6) xor X(7) xor X(9) xor X(17) xor X(19) xor X(21) xor X(23) xor X(26) xor X(27) xor X(29) xor X(30) xor X(33) xor X(34) xor X(35) xor X(37) xor X(38) xor X(39) xor X(40) xor X(41) xor X(42) xor X(43) xor X(46) xor X(47) xor X(49) xor X(50) xor X(52) xor X(53) xor X(54) xor X(55) xor X(56) xor X(57) xor X(59) xor X(60) xor X(61) xor X(62) xor X(67) xor X(72) xor X(73) xor X(74) xor X(75) xor X(78) xor X(79) xor X(80) xor X(81) xor X(83) xor X(84) xor X(86) xor X(87) xor X(88) xor X(89) xor X(92) xor X(93) xor X(94) xor X(96) xor X(100) xor X(104) xor X(105) xor X(106) xor X(107) xor X(108) xor X(109) xor X(111) xor X(113) xor X(115) xor X(116) xor X(117) xor X(119) xor X(121) xor X(122) xor X(123) xor X(128) xor X(129) xor X(130) xor X(133) xor X(135) xor X(136) xor X(137) xor X(138) xor X(141) xor X(142) xor X(143) xor X(145) xor X(147) xor X(148) xor X(153) xor X(157) xor X(158) xor X(161) xor X(164) xor X(166) xor X(167) xor X(168) xor X(170) xor X(174) xor X(176) xor X(177) xor X(179) xor X(181) xor X(183) xor X(185) xor X(186) xor X(187) xor X(188) xor X(194) xor X(196) xor X(203) xor X(204) xor X(206) xor X(210) xor X(213) xor X(214) xor X(215) xor X(220) xor X(221) xor X(224) xor X(226) xor X(227) xor X(230) xor X(231) xor X(232) xor X(234) xor X(235) xor X(238);
P(12) <= X(0) xor X(1) xor X(3) xor X(4) xor X(5) xor X(6) xor X(8) xor X(16) xor X(18) xor X(20) xor X(22) xor X(25) xor X(26) xor X(28) xor X(29) xor X(32) xor X(33) xor X(34) xor X(36) xor X(37) xor X(38) xor X(39) xor X(40) xor X(41) xor X(42) xor X(45) xor X(46) xor X(48) xor X(49) xor X(51) xor X(52) xor X(53) xor X(54) xor X(55) xor X(56) xor X(58) xor X(59) xor X(60) xor X(61) xor X(66) xor X(71) xor X(72) xor X(73) xor X(74) xor X(77) xor X(78) xor X(79) xor X(80) xor X(82) xor X(83) xor X(85) xor X(86) xor X(87) xor X(88) xor X(91) xor X(92) xor X(93) xor X(95) xor X(99) xor X(103) xor X(104) xor X(105) xor X(106) xor X(107) xor X(108) xor X(110) xor X(112) xor X(114) xor X(115) xor X(116) xor X(118) xor X(120) xor X(121) xor X(122) xor X(127) xor X(128) xor X(129) xor X(132) xor X(134) xor X(135) xor X(136) xor X(137) xor X(140) xor X(141) xor X(142) xor X(144) xor X(146) xor X(147) xor X(152) xor X(156) xor X(157) xor X(160) xor X(163) xor X(165) xor X(166) xor X(167) xor X(169) xor X(173) xor X(175) xor X(176) xor X(178) xor X(180) xor X(182) xor X(184) xor X(185) xor X(186) xor X(187) xor X(193) xor X(195) xor X(202) xor X(203) xor X(205) xor X(209) xor X(212) xor X(213) xor X(214) xor X(219) xor X(220) xor X(223) xor X(225) xor X(226) xor X(229) xor X(230) xor X(231) xor X(233) xor X(234) xor X(237);
P(11) <= X(0) xor X(1) xor X(12) xor X(14) xor X(16) xor X(17) xor X(20) xor X(22) xor X(27) xor X(29) xor X(31) xor X(32) xor X(36) xor X(37) xor X(38) xor X(39) xor X(43) xor X(44) xor X(45) xor X(47) xor X(48) xor X(49) xor X(54) xor X(57) xor X(58) xor X(61) xor X(62) xor X(63) xor X(64) xor X(68) xor X(70) xor X(72) xor X(74) xor X(77) xor X(78) xor X(81) xor X(82) xor X(83) xor X(89) xor X(90) xor X(91) xor X(92) xor X(94) xor X(95) xor X(96) xor X(98) xor X(102) xor X(104) xor X(107) xor X(108) xor X(109) xor X(111) xor X(112) xor X(113) xor X(114) xor X(116) xor X(118) xor X(121) xor X(122) xor X(123) xor X(125) xor X(126) xor X(129) xor X(133) xor X(135) xor X(136) xor X(137) xor X(138) xor X(139) xor X(141) xor X(142) xor X(146) xor X(147) xor X(149) xor X(151) xor X(152) xor X(154) xor X(156) xor X(158) xor X(159) xor X(162) xor X(165) xor X(172) xor X(173) xor X(174) xor X(176) xor X(177) xor X(179) xor X(180) xor X(181) xor X(188) xor X(192) xor X(194) xor X(197) xor X(200) xor X(201) xor X(203) xor X(206) xor X(210) xor X(217) xor X(223) xor X(224) xor X(225) xor X(226) xor X(227) xor X(232) xor X(233) xor X(234) xor X(235) xor X(237) xor X(238);
P(10) <= X(0) xor X(1) xor X(2) xor X(3) xor X(4) xor X(5) xor X(7) xor X(11) xor X(12) xor X(13) xor X(14) xor X(20) xor X(22) xor X(24) xor X(25) xor X(26) xor X(29) xor X(30) xor X(31) xor X(33) xor X(36) xor X(37) xor X(38) xor X(40) xor X(41) xor X(42) xor X(44) xor X(46) xor X(47) xor X(48) xor X(49) xor X(50) xor X(51) xor X(52) xor X(55) xor X(56) xor X(57) xor X(59) xor X(64) xor X(65) xor X(67) xor X(68) xor X(69) xor X(74) xor X(77) xor X(79) xor X(80) xor X(81) xor X(82) xor X(83) xor X(84) xor X(85) xor X(86) xor X(87) xor X(88) xor X(90) xor X(91) xor X(93) xor X(94) xor X(96) xor X(97) xor X(101) xor X(105) xor X(107) xor X(110) xor X(111) xor X(113) xor X(116) xor X(118) xor X(119) xor X(121) xor X(123) xor X(124) xor X(127) xor X(129) xor X(131) xor X(132) xor X(135) xor X(136) xor X(141) xor X(142) xor X(143) xor X(146) xor X(147) xor X(148) xor X(149) xor X(150) xor X(151) xor X(152) xor X(153) xor X(154) xor X(157) xor X(161) xor X(166) xor X(168) xor X(171) xor X(172) xor X(178) xor X(179) xor X(183) xor X(184) xor X(185) xor X(186) xor X(187) xor X(188) xor X(191) xor X(193) xor X(196) xor X(197) xor X(199) xor X(203) xor X(204) xor X(205) xor X(206) xor X(208) xor X(209) xor X(210) xor X(211) xor X(212) xor X(213) xor X(216) xor X(217) xor X(218) xor X(219) xor X(224) xor X(225) xor X(227) xor X(228) xor X(229) xor X(230) xor X(231) xor X(232) xor X(233) xor X(235) xor X(238);
P(9) <= X(0) xor X(5) xor X(6) xor X(7) xor X(10) xor X(11) xor X(13) xor X(14) xor X(15) xor X(16) xor X(20) xor X(22) xor X(23) xor X(30) xor X(32) xor X(33) xor X(36) xor X(37) xor X(39) xor X(45) xor X(46) xor X(47) xor X(48) xor X(52) xor X(53) xor X(54) xor X(56) xor X(58) xor X(59) xor X(60) xor X(61) xor X(62) xor X(65) xor X(66) xor X(67) xor X(71) xor X(74) xor X(78) xor X(80) xor X(81) xor X(82) xor X(90) xor X(92) xor X(93) xor X(100) xor X(103) xor X(104) xor X(105) xor X(108) xor X(109) xor X(110) xor X(116) xor X(119) xor X(125) xor X(126) xor X(127) xor X(129) xor X(130) xor X(135) xor X(137) xor X(138) xor X(141) xor X(143) xor X(146) xor X(148) xor X(150) xor X(151) xor X(153) xor X(154) xor X(155) xor X(156) xor X(158) xor X(160) xor X(164) xor X(165) xor X(166) xor X(167) xor X(168) xor X(170) xor X(171) xor X(173) xor X(175) xor X(176) xor X(177) xor X(178) xor X(180) xor X(182) xor X(187) xor X(188) xor X(190) xor X(192) xor X(195) xor X(196) xor X(197) xor X(198) xor X(200) xor X(205) xor X(206) xor X(207) xor X(209) xor X(213) xor X(215) xor X(216) xor X(219) xor X(222) xor X(224) xor X(231) xor X(232) xor X(235) xor X(236) xor X(238);
P(8) <= X(1) xor X(2) xor X(3) xor X(6) xor X(7) xor X(9) xor X(10) xor X(13) xor X(16) xor X(20) xor X(24) xor X(25) xor X(28) xor X(31) xor X(32) xor X(33) xor X(36) xor X(38) xor X(40) xor X(41) xor X(43) xor X(44) xor X(45) xor X(46) xor X(47) xor X(49) xor X(50) xor X(57) xor X(58) xor X(62) xor X(63) xor X(66) xor X(68) xor X(70) xor X(71) xor X(74) xor X(76) xor X(77) xor X(80) xor X(81) xor X(83) xor X(84) xor X(85) xor X(86) xor X(87) xor X(91) xor X(92) xor X(95) xor X(96) xor X(99) xor X(102) xor X(104) xor X(105) xor X(106) xor X(107) xor X(109) xor X(112) xor X(116) xor X(117) xor X(119) xor X(120) xor X(122) xor X(123) xor X(124) xor X(126) xor X(127) xor X(131) xor X(136) xor X(138) xor X(143) xor X(150) xor X(153) xor X(157) xor X(158) xor X(159) xor X(163) xor X(165) xor X(167) xor X(168) xor X(169) xor X(170) xor X(172) xor X(173) xor X(174) xor X(177) xor X(179) xor X(180) xor X(181) xor X(183) xor X(184) xor X(185) xor X(187) xor X(188) xor X(189) xor X(191) xor X(194) xor X(195) xor X(196) xor X(199) xor X(200) xor X(202) xor X(203) xor X(205) xor X(210) xor X(211) xor X(213) xor X(214) xor X(215) xor X(217) xor X(219) xor X(221) xor X(222) xor X(226) xor X(227) xor X(228) xor X(229) xor X(231) xor X(236) xor X(238);
P(7) <= X(0) xor X(1) xor X(2) xor X(5) xor X(6) xor X(8) xor X(9) xor X(12) xor X(15) xor X(19) xor X(23) xor X(24) xor X(27) xor X(30) xor X(31) xor X(32) xor X(35) xor X(37) xor X(39) xor X(40) xor X(42) xor X(43) xor X(44) xor X(45) xor X(46) xor X(48) xor X(49) xor X(56) xor X(57) xor X(61) xor X(62) xor X(65) xor X(67) xor X(69) xor X(70) xor X(73) xor X(75) xor X(76) xor X(79) xor X(80) xor X(82) xor X(83) xor X(84) xor X(85) xor X(86) xor X(90) xor X(91) xor X(94) xor X(95) xor X(98) xor X(101) xor X(103) xor X(104) xor X(105) xor X(106) xor X(108) xor X(111) xor X(115) xor X(116) xor X(118) xor X(119) xor X(121) xor X(122) xor X(123) xor X(125) xor X(126) xor X(130) xor X(135) xor X(137) xor X(142) xor X(149) xor X(152) xor X(156) xor X(157) xor X(158) xor X(162) xor X(164) xor X(166) xor X(167) xor X(168) xor X(169) xor X(171) xor X(172) xor X(173) xor X(176) xor X(178) xor X(179) xor X(180) xor X(182) xor X(183) xor X(184) xor X(186) xor X(187) xor X(188) xor X(190) xor X(193) xor X(194) xor X(195) xor X(198) xor X(199) xor X(201) xor X(202) xor X(204) xor X(209) xor X(210) xor X(212) xor X(213) xor X(214) xor X(216) xor X(218) xor X(220) xor X(221) xor X(225) xor X(226) xor X(227) xor X(228) xor X(230) xor X(235) xor X(237);
P(6) <= X(0) xor X(2) xor X(3) xor X(8) xor X(11) xor X(12) xor X(15) xor X(16) xor X(18) xor X(19) xor X(20) xor X(21) xor X(23) xor X(24) xor X(25) xor X(26) xor X(28) xor X(30) xor X(31) xor X(33) xor X(34) xor X(35) xor X(36) xor X(38) xor X(39) xor X(40) xor X(42) xor X(44) xor X(45) xor X(47) xor X(48) xor X(49) xor X(50) xor X(51) xor X(52) xor X(53) xor X(56) xor X(59) xor X(62) xor X(63) xor X(65) xor X(66) xor X(69) xor X(71) xor X(72) xor X(73) xor X(75) xor X(76) xor X(78) xor X(81) xor X(82) xor X(86) xor X(87) xor X(90) xor X(93) xor X(94) xor X(95) xor X(96) xor X(97) xor X(100) xor X(102) xor X(104) xor X(106) xor X(107) xor X(108) xor X(110) xor X(112) xor X(114) xor X(116) xor X(119) xor X(121) xor X(123) xor X(124) xor X(127) xor X(128) xor X(131) xor X(136) xor X(137) xor X(138) xor X(140) xor X(141) xor X(142) xor X(143) xor X(145) xor X(147) xor X(148) xor X(149) xor X(151) xor X(152) xor X(154) xor X(156) xor X(157) xor X(158) xor X(161) xor X(163) xor X(164) xor X(165) xor X(167) xor X(170) xor X(171) xor X(172) xor X(173) xor X(176) xor X(177) xor X(178) xor X(179) xor X(180) xor X(181) xor X(182) xor X(184) xor X(187) xor X(188) xor X(189) xor X(192) xor X(193) xor X(194) xor X(198) xor X(201) xor X(202) xor X(204) xor X(206) xor X(209) xor X(210) xor X(215) xor X(218) xor X(220) xor X(222) xor X(223) xor X(224) xor X(225) xor X(228) xor X(230) xor X(235) xor X(237) xor X(238);
P(5) <= X(3) xor X(4) xor X(5) xor X(10) xor X(11) xor X(12) xor X(16) xor X(17) xor X(18) xor X(21) xor X(23) xor X(27) xor X(28) xor X(30) xor X(32) xor X(34) xor X(37) xor X(38) xor X(39) xor X(40) xor X(44) xor X(46) xor X(47) xor X(48) xor X(53) xor X(58) xor X(59) xor X(60) xor X(63) xor X(70) xor X(72) xor X(73) xor X(75) xor X(76) xor X(77) xor X(79) xor X(80) xor X(81) xor X(83) xor X(84) xor X(87) xor X(92) xor X(93) xor X(94) xor X(99) xor X(101) xor X(107) xor X(108) xor X(109) xor X(111) xor X(112) xor X(113) xor X(116) xor X(117) xor X(119) xor X(125) xor X(126) xor X(128) xor X(129) xor X(130) xor X(131) xor X(134) xor X(135) xor X(136) xor X(138) xor X(139) xor X(141) xor X(143) xor X(144) xor X(145) xor X(146) xor X(148) xor X(149) xor X(150) xor X(151) xor X(152) xor X(153) xor X(154) xor X(156) xor X(157) xor X(158) xor X(160) xor X(162) xor X(163) xor X(168) xor X(169) xor X(170) xor X(171) xor X(172) xor X(173) xor X(177) xor X(178) xor X(179) xor X(181) xor X(184) xor X(185) xor X(187) xor X(191) xor X(192) xor X(193) xor X(201) xor X(202) xor X(204) xor X(205) xor X(206) xor X(209) xor X(210) xor X(211) xor X(212) xor X(213) xor X(214) xor X(218) xor X(221) xor X(224) xor X(226) xor X(228) xor X(230) xor X(235) xor X(238);
P(4) <= X(2) xor X(3) xor X(4) xor X(9) xor X(10) xor X(11) xor X(15) xor X(16) xor X(17) xor X(20) xor X(22) xor X(26) xor X(27) xor X(29) xor X(31) xor X(33) xor X(36) xor X(37) xor X(38) xor X(39) xor X(43) xor X(45) xor X(46) xor X(47) xor X(52) xor X(57) xor X(58) xor X(59) xor X(62) xor X(69) xor X(71) xor X(72) xor X(74) xor X(75) xor X(76) xor X(78) xor X(79) xor X(80) xor X(82) xor X(83) xor X(86) xor X(91) xor X(92) xor X(93) xor X(98) xor X(100) xor X(106) xor X(107) xor X(108) xor X(110) xor X(111) xor X(112) xor X(115) xor X(116) xor X(118) xor X(124) xor X(125) xor X(127) xor X(128) xor X(129) xor X(130) xor X(133) xor X(134) xor X(135) xor X(137) xor X(138) xor X(140) xor X(142) xor X(143) xor X(144) xor X(145) xor X(147) xor X(148) xor X(149) xor X(150) xor X(151) xor X(152) xor X(153) xor X(155) xor X(156) xor X(157) xor X(159) xor X(161) xor X(162) xor X(167) xor X(168) xor X(169) xor X(170) xor X(171) xor X(172) xor X(176) xor X(177) xor X(178) xor X(180) xor X(183) xor X(184) xor X(186) xor X(190) xor X(191) xor X(192) xor X(200) xor X(201) xor X(203) xor X(204) xor X(205) xor X(208) xor X(209) xor X(210) xor X(211) xor X(212) xor X(213) xor X(217) xor X(220) xor X(223) xor X(225) xor X(227) xor X(229) xor X(234) xor X(237);
P(3) <= X(1) xor X(2) xor X(3) xor X(8) xor X(9) xor X(10) xor X(14) xor X(15) xor X(16) xor X(19) xor X(21) xor X(25) xor X(26) xor X(28) xor X(30) xor X(32) xor X(35) xor X(36) xor X(37) xor X(38) xor X(42) xor X(44) xor X(45) xor X(46) xor X(51) xor X(56) xor X(57) xor X(58) xor X(61) xor X(68) xor X(70) xor X(71) xor X(73) xor X(74) xor X(75) xor X(77) xor X(78) xor X(79) xor X(81) xor X(82) xor X(85) xor X(90) xor X(91) xor X(92) xor X(97) xor X(99) xor X(105) xor X(106) xor X(107) xor X(109) xor X(110) xor X(111) xor X(114) xor X(115) xor X(117) xor X(123) xor X(124) xor X(126) xor X(127) xor X(128) xor X(129) xor X(132) xor X(133) xor X(134) xor X(136) xor X(137) xor X(139) xor X(141) xor X(142) xor X(143) xor X(144) xor X(146) xor X(147) xor X(148) xor X(149) xor X(150) xor X(151) xor X(152) xor X(154) xor X(155) xor X(156) xor X(158) xor X(160) xor X(161) xor X(166) xor X(167) xor X(168) xor X(169) xor X(170) xor X(171) xor X(175) xor X(176) xor X(177) xor X(179) xor X(182) xor X(183) xor X(185) xor X(189) xor X(190) xor X(191) xor X(199) xor X(200) xor X(202) xor X(203) xor X(204) xor X(207) xor X(208) xor X(209) xor X(210) xor X(211) xor X(212) xor X(216) xor X(219) xor X(222) xor X(224) xor X(226) xor X(228) xor X(233) xor X(236);
P(2) <= X(0) xor X(1) xor X(2) xor X(7) xor X(8) xor X(9) xor X(13) xor X(14) xor X(15) xor X(18) xor X(20) xor X(24) xor X(25) xor X(27) xor X(29) xor X(31) xor X(34) xor X(35) xor X(36) xor X(37) xor X(41) xor X(43) xor X(44) xor X(45) xor X(50) xor X(55) xor X(56) xor X(57) xor X(60) xor X(67) xor X(69) xor X(70) xor X(72) xor X(73) xor X(74) xor X(76) xor X(77) xor X(78) xor X(80) xor X(81) xor X(84) xor X(89) xor X(90) xor X(91) xor X(96) xor X(98) xor X(104) xor X(105) xor X(106) xor X(108) xor X(109) xor X(110) xor X(113) xor X(114) xor X(116) xor X(122) xor X(123) xor X(125) xor X(126) xor X(127) xor X(128) xor X(131) xor X(132) xor X(133) xor X(135) xor X(136) xor X(138) xor X(140) xor X(141) xor X(142) xor X(143) xor X(145) xor X(146) xor X(147) xor X(148) xor X(149) xor X(150) xor X(151) xor X(153) xor X(154) xor X(155) xor X(157) xor X(159) xor X(160) xor X(165) xor X(166) xor X(167) xor X(168) xor X(169) xor X(170) xor X(174) xor X(175) xor X(176) xor X(178) xor X(181) xor X(182) xor X(184) xor X(188) xor X(189) xor X(190) xor X(198) xor X(199) xor X(201) xor X(202) xor X(203) xor X(206) xor X(207) xor X(208) xor X(209) xor X(210) xor X(211) xor X(215) xor X(218) xor X(221) xor X(223) xor X(225) xor X(227) xor X(232) xor X(235);
P(1) <= X(0) xor X(2) xor X(3) xor X(4) xor X(5) xor X(6) xor X(8) xor X(13) xor X(15) xor X(16) xor X(17) xor X(20) xor X(21) xor X(22) xor X(23) xor X(25) xor X(26) xor X(29) xor X(30) xor X(34) xor X(36) xor X(41) xor X(42) xor X(44) xor X(50) xor X(51) xor X(52) xor X(53) xor X(54) xor X(56) xor X(60) xor X(61) xor X(62) xor X(63) xor X(64) xor X(65) xor X(66) xor X(69) xor X(72) xor X(74) xor X(75) xor X(77) xor X(80) xor X(84) xor X(85) xor X(86) xor X(87) xor X(88) xor X(90) xor X(96) xor X(97) xor X(104) xor X(106) xor X(107) xor X(109) xor X(113) xor X(116) xor X(117) xor X(118) xor X(119) xor X(120) xor X(121) xor X(123) xor X(124) xor X(126) xor X(128) xor X(129) xor X(130) xor X(132) xor X(135) xor X(138) xor X(139) xor X(141) xor X(143) xor X(144) xor X(146) xor X(148) xor X(150) xor X(153) xor X(155) xor X(156) xor X(159) xor X(165) xor X(167) xor X(169) xor X(174) xor X(176) xor X(177) xor X(181) xor X(184) xor X(185) xor X(186) xor X(187) xor X(189) xor X(198) xor X(201) xor X(203) xor X(204) xor X(205) xor X(207) xor X(209) xor X(211) xor X(212) xor X(213) xor X(214) xor X(218) xor X(219) xor X(220) xor X(223) xor X(224) xor X(227) xor X(228) xor X(229) xor X(230) xor X(231) xor X(235) xor X(236) xor X(237) xor X(238);
P(0) <= X(0) xor X(1) xor X(3) xor X(5) xor X(8) xor X(9) xor X(10) xor X(11) xor X(12) xor X(15) xor X(17) xor X(18) xor X(19) xor X(21) xor X(23) xor X(24) xor X(26) xor X(27) xor X(28) xor X(30) xor X(31) xor X(32) xor X(33) xor X(36) xor X(37) xor X(38) xor X(39) xor X(40) xor X(42) xor X(43) xor X(50) xor X(52) xor X(54) xor X(55) xor X(60) xor X(62) xor X(64) xor X(66) xor X(67) xor X(68) xor X(72) xor X(73) xor X(75) xor X(76) xor X(80) xor X(81) xor X(82) xor X(83) xor X(85) xor X(87) xor X(90) xor X(91) xor X(92) xor X(93) xor X(94) xor X(95) xor X(97) xor X(98) xor X(99) xor X(100) xor X(101) xor X(102) xor X(103) xor X(106) xor X(109) xor X(110) xor X(111) xor X(112) xor X(116) xor X(118) xor X(120) xor X(123) xor X(126) xor X(127) xor X(129) xor X(132) xor X(133) xor X(134) xor X(138) xor X(141) xor X(142) xor X(144) xor X(145) xor X(148) xor X(149) xor X(153) xor X(154) xor X(156) xor X(157) xor X(158) xor X(165) xor X(166) xor X(169) xor X(170) xor X(171) xor X(172) xor X(173) xor X(176) xor X(181) xor X(182) xor X(183) xor X(185) xor X(187) xor X(188) xor X(198) xor X(199) xor X(200) xor X(203) xor X(205) xor X(206) xor X(209) xor X(210) xor X(212) xor X(214) xor X(215) xor X(216) xor X(217) xor X(219) xor X(223) xor X(227) xor X(229) xor X(231) xor X(232) xor X(233) xor X(234) xor X(236) xor X(238);

	temp <= X & P;
	
	
	process (clk, rst)
		begin
			if rst = '1' then
				C <= (others => '0');
			elsif rising_edge(clk) then
				C <= temp;
			end if;
	end process;
	
end architecture;

