library ieee;
use ieee.std_logic_1164.all;

ENTITY sensor IS
	PORT(clk, button, sen_out: IN STD_LOGIC;
			pwm: OUT STD_LOGIC;
			count2,count0,count1: out std_logic_vector(3 downto 0)
			);
END sensor;

ARCHITECTURE arch OF sensor IS

constant clk_hz : real := 10.0e6; -- 10 mega hertz
  constant pulse_hz : real := 50.0;
  constant min_pulse_us : real := 500.0; -- TowerPro SG90 values
  constant max_pulse_us : real := 2500.0; -- TowerPro SG90 values
  constant step_bits : positive := 8; -- 0 to 255
  constant step_count : positive := 2**step_bits;--how much you divide the 180 degrees
  signal position : integer range 0 to step_count - 1; -- current angle of the servo
  signal motor_control : std_logic := '0'; -- state of the gate whether open or closed
  signal counter_control : std_logIC :='0';
begin
	
	motor_control <= '1' when (button = '1' OR sen_out = '0') else '0';
	counter_control <= '1' when (sen_out = '0') else '0';
	with motor_control select 
	position <= 0 when '0',
	127 when others;-- angle 127 midway between 0 and 256

	
	SERVO : entity work.servo(rtl)
		generic map (
		clk_hz => clk_hz,
		pulse_hz => pulse_hz,
		min_pulse_us => min_pulse_us,
		max_pulse_us => max_pulse_us,
		step_count => step_count
	)
	port map (
		clk => clk,
		rst => '0',
		position => position,--angle of the servo
		pwm => pwm
	);	
	
BCD : entity work.BCD(arch)
Port map(
clk => clk,
sen =>counter_control,
BCD0 =>count0,
BCD1 =>count1,
BCD2 => count2
);


	
end arch;