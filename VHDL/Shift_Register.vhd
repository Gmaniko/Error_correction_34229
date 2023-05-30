library IEEE;
use IEEE.std_logic_1164.all;

entity Shift_Register is
	port (clk, rst : in  std_logic;
				Din      : in  std_logic_vector(255 downto 0);
				Dout     : out std_logic_vector(255 downto 0);
	);
end entity;

architecture Shift_Register_arch of Shift_Register is

	signal D000, D001, D002, D003, D004, D005, D006, D007 : std_logic_vector(255 downto 0);
	signal D008, D009, D010, D011, D012, D013, D014, D015 : std_logic_vector(255 downto 0);
	signal D016, D017, D018, D019, D020, D021, D022, D023 : std_logic_vector(255 downto 0);
	signal D024, D025, D026, D027, D028, D029, D030, D031 : std_logic_vector(255 downto 0);
	signal D032, D033, D034, D035, D036, D037, D038, D039 : std_logic_vector(255 downto 0);
	signal D040, D041, D042, D043, D044, D045, D046, D047 : std_logic_vector(255 downto 0);
	signal D048, D049, D050, D051, D052, D053, D054, D055 : std_logic_vector(255 downto 0);
	signal D056, D057, D058, D059, D060, D061, D062, D063 : std_logic_vector(255 downto 0);
	signal D064, D065, D066, D067, D068, D069, D070, D071 : std_logic_vector(255 downto 0);
	signal D072, D073, D074, D075, D076, D077, D078, D079 : std_logic_vector(255 downto 0);
	signal D080, D081, D082, D083, D084, D085, D086, D087 : std_logic_vector(255 downto 0);
	signal D088, D089, D090, D091, D092, D093, D094, D095 : std_logic_vector(255 downto 0);
	signal D096, D097, D098, D099, D100, D101, D102, D103 : std_logic_vector(255 downto 0);
	signal D104, D105, D106, D107, D108, D109, D110, D111 : std_logic_vector(255 downto 0);
	signal D112, D113, D114, D115, D116, D117, D118, D119 : std_logic_vector(255 downto 0);
	signal D120, D121, D122, D123, D124, D125, D126, D127 : std_logic_vector(255 downto 0);
	signal D128, D129, D130, D131, D132, D133, D134, D135 : std_logic_vector(255 downto 0);
	signal D136, D137, D138, D139, D140, D141, D142, D143 : std_logic_vector(255 downto 0);
	signal D144, D145, D146, D147, D148, D149, D150, D151 : std_logic_vector(255 downto 0);
	signal D152, D153, D154, D155, D156, D157, D158, D159 : std_logic_vector(255 downto 0);
	signal D160, D161, D162, D163, D164, D165, D166, D167 : std_logic_vector(255 downto 0);
	signal D168, D169, D170, D171, D172, D173, D174, D175 : std_logic_vector(255 downto 0);
	signal D176, D177, D178, D179, D180, D181, D182, D183 : std_logic_vector(255 downto 0);
	signal D184, D185, D186, D187, D188, D189, D190, D191 : std_logic_vector(255 downto 0);
	signal D192, D193, D194, D195, D196, D197, D198, D199 : std_logic_vector(255 downto 0);
	signal D200, D201, D202, D203, D204, D205, D206, D207 : std_logic_vector(255 downto 0);
	signal D208, D209, D210, D211, D212, D213, D214, D215 : std_logic_vector(255 downto 0);
	signal D216, D217, D218, D219, D220, D221, D222, D223 : std_logic_vector(255 downto 0);
	signal D224, D225, D226, D227, D228, D229, D230, D231 : std_logic_vector(255 downto 0);
	signal D232, D233, D234, D235, D236, D237, D238, D239 : std_logic_vector(255 downto 0);
	signal D240, D241, D242, D243, D244, D245, D246, D247 : std_logic_vector(255 downto 0);
	signal D248, D249, D250, D251, D252, D253, D254, D255 : std_logic_vector(255 downto 0);
	
	type D_type is array(0 to 255) of std_logic_vector(255 downto 0);
	
	begin

		SHIFT : process(clk, rst)
			begin
				if rst = '0' then
					D000 <= (others => '0'); D000 <= (others => '0'); D000 <= (others => '0'); D000 <= (others => '0'); 
		end process;

end architecture;