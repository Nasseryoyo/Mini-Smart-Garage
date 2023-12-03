library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BCD is
  Port (
    clk : in STD_logic;
    sen : in STD_logic;

    BCD2, BCD1, BCD0 : buffer STD_LOGIC_VECTOR(3 downto 0)
  );
end BCD;

Architecture arch of BCD is
  signal triggered : std_logic := '0';
  signal delay_counter : integer range 0 to 5000000  := 0; -- Adjust the delay value

begin
  process(clk, sen)
  begin
    if clk'event and clk = '1' then
      if sen = '1' and triggered = '0' then
        if delay_counter = 5000000  then -- Check if the delay is reached
          triggered <= '1';
          if BCD0 = "1001" then
            BCD0 <= "0000";
            if BCD1 = "1001" then
              BCD1 <= "0000";
              if BCD2 = "1001" then
                BCD2 <= "0000";
              else
                BCD2 <= BCD2 + '1';
              end if;
            else
              BCD1 <= BCD1 + '1';
            end if;
          else
            BCD0 <= BCD0 + '1';
          end if;
        else
          delay_counter <= delay_counter + 1; -- Increment the delay counter
        end if;
      end if;
    end if;

    if sen = '0' then
      triggered <= '0';
      delay_counter <= 0; -- Reset the delay counter
    end if;
  end process;
end arch;
