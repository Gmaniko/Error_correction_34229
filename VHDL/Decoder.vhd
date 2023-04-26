LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Decoder is
end entity;

architecture Decoder_arch of Decoder is

type ROM_type is array (1 to 255) of std_logic_vector(7 downto 0);
constant ROM_alpha : ROM_type := ( 1 => "00000001",
2 => "00000010",
3 => "00000100",
4 => "00001000",
5 => "00010000",
6 => "00100000",
7 => "01000000",
8 => "10000000",
9 => "00011101",
10 => "00111010",
11 => "01110100",
12 => "11101000",
13 => "11001101",
14 => "10000111",
15 => "00010011",
16 => "00100110",
17 => "01001100",
18 => "10011000",
19 => "00101101",
20 => "01011010",
21 => "10110100",
22 => "01110101",
23 => "11101010",
24 => "11001001",
25 => "10001111",
26 => "00000011",
27 => "00000110",
28 => "00001100",
29 => "00011000",
30 => "00110000",
31 => "01100000",
32 => "11000000",
33 => "10011101",
34 => "00100111",
35 => "01001110",
36 => "10011100",
37 => "00100101",
38 => "01001010",
39 => "10010100",
40 => "00110101",
41 => "01101010",
42 => "11010100",
43 => "10110101",
44 => "01110111",
45 => "11101110",
46 => "11000001",
47 => "10011111",
48 => "00100011",
49 => "01000110",
50 => "10001100",
51 => "00000101",
52 => "00001010",
53 => "00010100",
54 => "00101000",
55 => "01010000",
56 => "10100000",
57 => "01011101",
58 => "10111010",
59 => "01101001",
60 => "11010010",
61 => "10111001",
62 => "01101111",
63 => "11011110",
64 => "10100001",
65 => "01011111",
66 => "10111110",
67 => "01100001",
68 => "11000010",
69 => "10011001",
70 => "00101111",
71 => "01011110",
72 => "10111100",
73 => "01100101",
74 => "11001010",
75 => "10001001",
76 => "00001111",
77 => "00011110",
78 => "00111100",
79 => "01111000",
80 => "11110000",
81 => "11111101",
82 => "11100111",
83 => "11010011",
84 => "10111011",
85 => "01101011",
86 => "11010110",
87 => "10110001",
88 => "01111111",
89 => "11111110",
90 => "11100001",
91 => "11011111",
92 => "10100011",
93 => "01011011",
94 => "10110110",
95 => "01110001",
96 => "11100010",
97 => "11011001",
98 => "10101111",
99 => "01000011",
100 => "10000110",
101 => "00010001",
102 => "00100010",
103 => "01000100",
104 => "10001000",
105 => "00001101",
106 => "00011010",
107 => "00110100",
108 => "01101000",
109 => "11010000",
110 => "10111101",
111 => "01100111",
112 => "11001110",
113 => "10000001",
114 => "00011111",
115 => "00111110",
116 => "01111100",
117 => "11111000",
118 => "11101101",
119 => "11000111",
120 => "10010011",
121 => "00111011",
122 => "01110110",
123 => "11101100",
124 => "11000101",
125 => "10010111",
126 => "00110011",
127 => "01100110",
128 => "11001100",
129 => "10000101",
130 => "00010111",
131 => "00101110",
132 => "01011100",
133 => "10111000",
134 => "01101101",
135 => "11011010",
136 => "10101001",
137 => "01001111",
138 => "10011110",
139 => "00100001",
140 => "01000010",
141 => "10000100",
142 => "00010101",
143 => "00101010",
144 => "01010100",
145 => "10101000",
146 => "01001101",
147 => "10011010",
148 => "00101001",
149 => "01010010",
150 => "10100100",
151 => "01010101",
152 => "10101010",
153 => "01001001",
154 => "10010010",
155 => "00111001",
156 => "01110010",
157 => "11100100",
158 => "11010101",
159 => "10110111",
160 => "01110011",
161 => "11100110",
162 => "11010001",
163 => "10111111",
164 => "01100011",
165 => "11000110",
166 => "10010001",
167 => "00111111",
168 => "01111110",
169 => "11111100",
170 => "11100101",
171 => "11010111",
172 => "10110011",
173 => "01111011",
174 => "11110110",
175 => "11110001",
176 => "11111111",
177 => "11100011",
178 => "11011011",
179 => "10101011",
180 => "01001011",
181 => "10010110",
182 => "00110001",
183 => "01100010",
184 => "11000100",
185 => "10010101",
186 => "00110111",
187 => "01101110",
188 => "11011100",
189 => "10100101",
190 => "01010111",
191 => "10101110",
192 => "01000001",
193 => "10000010",
194 => "00011001",
195 => "00110010",
196 => "01100100",
197 => "11001000",
198 => "10001101",
199 => "00000111",
200 => "00001110",
201 => "00011100",
202 => "00111000",
203 => "01110000",
204 => "11100000",
205 => "11011101",
206 => "10100111",
207 => "01010011",
208 => "10100110",
209 => "01010001",
210 => "10100010",
211 => "01011001",
212 => "10110010",
213 => "01111001",
214 => "11110010",
215 => "11111001",
216 => "11101111",
217 => "11000011",
218 => "10011011",
219 => "00101011",
220 => "01010110",
221 => "10101100",
222 => "01000101",
223 => "10001010",
224 => "00001001",
225 => "00010010",
226 => "00100100",
227 => "01001000",
228 => "10010000",
229 => "00111101",
230 => "01111010",
231 => "11110100",
232 => "11110101",
233 => "11110111",
234 => "11110011",
235 => "11111011",
236 => "11101011",
237 => "11001011",
238 => "10001011",
239 => "00001011",
240 => "00010110",
241 => "00101100",
242 => "01011000",
243 => "10110000",
244 => "01111101",
245 => "11111010",
246 => "11101001",
247 => "11001111",
248 => "10000011",
249 => "00011011",
250 => "00110110",
251 => "01101100",
252 => "11011000",
253 => "10101101",
254 => "01000111",
255 => "10001110");

type ROM_type2 is array (1 to 255) of integer;
constant ROM_alphaInv : ROM_type2 := ( 1 => 0,
2 => 1,
3 => 25,
4 => 2,
5 => 50,
6 => 26,
7 => 198,
8 => 3,
9 => 223,
10 => 51,
11 => 238,
12 => 27,
13 => 104,
14 => 199,
15 => 75,
16 => 4,
17 => 100,
18 => 224,
19 => 14,
20 => 52,
21 => 141,
22 => 239,
23 => 129,
24 => 28,
25 => 193,
26 => 105,
27 => 248,
28 => 200,
29 => 8,
30 => 76,
31 => 113,
32 => 5,
33 => 138,
34 => 101,
35 => 47,
36 => 225,
37 => 36,
38 => 15,
39 => 33,
40 => 53,
41 => 147,
42 => 142,
43 => 218,
44 => 240,
45 => 18,
46 => 130,
47 => 69,
48 => 29,
49 => 181,
50 => 194,
51 => 125,
52 => 106,
53 => 39,
54 => 249,
55 => 185,
56 => 201,
57 => 154,
58 => 9,
59 => 120,
60 => 77,
61 => 228,
62 => 114,
63 => 166,
64 => 6,
65 => 191,
66 => 139,
67 => 98,
68 => 102,
69 => 221,
70 => 48,
71 => 253,
72 => 226,
73 => 152,
74 => 37,
75 => 179,
76 => 16,
77 => 145,
78 => 34,
79 => 136,
80 => 54,
81 => 208,
82 => 148,
83 => 206,
84 => 143,
85 => 150,
86 => 219,
87 => 189,
88 => 241,
89 => 210,
90 => 19,
91 => 92,
92 => 131,
93 => 56,
94 => 70,
95 => 64,
96 => 30,
97 => 66,
98 => 182,
99 => 163,
100 => 195,
101 => 72,
102 => 126,
103 => 110,
104 => 107,
105 => 58,
106 => 40,
107 => 84,
108 => 250,
109 => 133,
110 => 186,
111 => 61,
112 => 202,
113 => 94,
114 => 155,
115 => 159,
116 => 10,
117 => 21,
118 => 121,
119 => 43,
120 => 78,
121 => 212,
122 => 229,
123 => 172,
124 => 115,
125 => 243,
126 => 167,
127 => 87,
128 => 7,
129 => 112,
130 => 192,
131 => 247,
132 => 140,
133 => 128,
134 => 99,
135 => 13,
136 => 103,
137 => 74,
138 => 222,
139 => 237,
140 => 49,
141 => 197,
142 => 254,
143 => 24,
144 => 227,
145 => 165,
146 => 153,
147 => 119,
148 => 38,
149 => 184,
150 => 180,
151 => 124,
152 => 17,
153 => 68,
154 => 146,
155 => 217,
156 => 35,
157 => 32,
158 => 137,
159 => 46,
160 => 55,
161 => 63,
162 => 209,
163 => 91,
164 => 149,
165 => 188,
166 => 207,
167 => 205,
168 => 144,
169 => 135,
170 => 151,
171 => 178,
172 => 220,
173 => 252,
174 => 190,
175 => 97,
176 => 242,
177 => 86,
178 => 211,
179 => 171,
180 => 20,
181 => 42,
182 => 93,
183 => 158,
184 => 132,
185 => 60,
186 => 57,
187 => 83,
188 => 71,
189 => 109,
190 => 65,
191 => 162,
192 => 31,
193 => 45,
194 => 67,
195 => 216,
196 => 183,
197 => 123,
198 => 164,
199 => 118,
200 => 196,
201 => 23,
202 => 73,
203 => 236,
204 => 127,
205 => 12,
206 => 111,
207 => 246,
208 => 108,
209 => 161,
210 => 59,
211 => 82,
212 => 41,
213 => 157,
214 => 85,
215 => 170,
216 => 251,
217 => 96,
218 => 134,
219 => 177,
220 => 187,
221 => 204,
222 => 62,
223 => 90,
224 => 203,
225 => 89,
226 => 95,
227 => 176,
228 => 156,
229 => 169,
230 => 160,
231 => 81,
232 => 11,
233 => 245,
234 => 22,
235 => 235,
236 => 122,
237 => 117,
238 => 44,
239 => 215,
240 => 79,
241 => 174,
242 => 213,
243 => 233,
244 => 230,
245 => 231,
246 => 173,
247 => 232,
248 => 116,
249 => 214,
250 => 244,
251 => 234,
252 => 168,
253 => 80,
254 => 88,
255 => 175);

signal test : std_logic_vector(254 downto 0);
signal S1 : std_logic_vector(7 downto 0);
signal S3 : std_logic_vector(7 downto 0);
signal s1pow3, s3pow1, s1pow3s3 : integer;
signal rat : std_logic_vector(7 downto 0);


component Syndrome1Calc is
	port( 
		R  : in std_logic_vector(254 downto 0); 
		output : out std_logic_vector(7 downto 0)
	);
end component;

component Syndrome3Calc is
	port( 
		R  : in std_logic_vector(254 downto 0); 
		output : out std_logic_vector(7 downto 0)
	);
end component;

begin
	
test <= "111000110010101000000110100001100100000010000111110110111110000110110010101011100010001110000010010001100000000101101110000101000111010001110100011101010100001011100101101111001000101010001111101010100011011100011000101100001010111110110100100101110011011";
--01111011


--S1 as exponent of primitive element to the third power
--polyval(S1, 2)

process (S1)
begin
	if (to_integer(unsigned(S1)) > 0) then
		s1pow3 <= ROM_alphaInv(to_integer(unsigned(S1)))*3 mod 255;
  end if;
end process;

--% S3 as exponent of primitive element
process (S3)
begin
	if (to_integer(unsigned(S3)) > 0) then
		s3pow1 <= ROM_alphaInv(to_integer(unsigned(S3)));
  end if;
end process;


--% Subtracting the exponents 
s1pow3s3 <= (s3pow1 - s1pow3) mod 255;

--% add 1 to get 1 + S3/(S1^3)
--rat = bitxor(alpha(s1pow3s3+1,:), alpha(0+1,:));
process (s1pow3s3)
begin
	if (s1pow3s3 >= 0) then
	rat <= ROM_alpha((s1pow3s3+1)) xor ROM_alpha(1);
	end if;
end process;


DUT1 : Syndrome1Calc
	port map(
		R  => test,
		output => S1
	);

DUT2 : Syndrome3Calc
	port map(
		R  => test,
		output => S3
	);

end architecture;


