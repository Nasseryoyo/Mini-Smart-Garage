library ieee;
use ieee.std_logic_1164.all;

entity segment_display is
 port( binary : in std_logic_vector(3 downto 0);
 seg : out std_logic_vector(6 downto 0)
 );

end segment_display;

architecture arch of segment_display is 
begin
	with binary select seg <=
	     
	"0000001" when "0000", -- Display 0
	"1001111" when "0001", -- Display 1
	"0010010" when "0010", -- Display 2
	"0000110" when "0011", -- Display 3
	"1001100" when "0100", -- Display 4
	"0100100" when "0101", -- Display 5
	"0100000" when "0110", -- Display 6
	"0001111" when "0111", -- Display 7
	"0000000" when "1000" , -- Display 8
	"0000100" when "1001", -- Display 9
	"0110000" when others; --Display E

end arch;