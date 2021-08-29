
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity WAIT_FOR_START is
    Port ( Start_Button : in  STD_LOGIC;
	       Player_Correct: in STD_LOGIC;
      	   SEL : in STD_LOGIC;
           countstart : out  STD_LOGIC);
end WAIT_FOR_START;

architecture Behavioral of WAIT_FOR_START is

begin
WAIT_FOR_START: process( SEL, Start_Button, Player_Correct )
begin
if (SEL = '0') then
if (Player_Correct = '1' or Start_Button = '1') then
    countstart <= '1';
	 else
	 countstart <= '0';
end if;
else countstart <= '0';
end if;
end process;
	 

end Behavioral;
