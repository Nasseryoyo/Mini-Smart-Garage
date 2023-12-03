library ieee;
use ieee.std_logic_1164.all;

entity smartgarage is
port(clk, button, sensor_out: in STD_LOGIC;
	servo: out STD_LOGIC;
	seven_segment0 , seven_segment1,seven_segment2 : out STD_LOGIC_VECTOR(6 downto 0)
	);
end smartgarage;

architecture arch of smartgarage is

Signal seg0,seg1,seg2 : STD_LOGIC_VECTOR(3 downto 0);
begin

   GATE : entity work.sensor(arch)
	port map (
		clk => clk,
		button => button,
		sen_out => sensor_out,
		pwm => servo,
		count0 => seg0,
		count1 => seg1,
		count2 => seg2
);
Segment0 : entity work.segment_display(arch)
port map(
binary => seg0,
seg => seven_segment0
);
Segment1 : entity work.segment_display(arch)
port map(
binary => seg1,
seg => seven_segment1
);
Segment2 : entity work.segment_display(arch)
port map(
binary => seg2,
seg => seven_segment2
);
end arch;

