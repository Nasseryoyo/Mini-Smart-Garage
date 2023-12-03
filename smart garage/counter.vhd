library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity counter is
    Port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        count : out STD_LOGIC_VECTOR(3 downto 0);
        segments : out STD_LOGIC_VECTOR(6 downto 0)
    );
end counter;

architecture Behavioral of counter is
    signal counter : unsigned(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
        elsif rising_edge(clk) then
            if counter = "1001" then
                counter <= (others => '0');
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    count <= std_logic_vector(counter);
    segments <= segment_outputs;
end Behavioral;
