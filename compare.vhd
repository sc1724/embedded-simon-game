library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Compare is
    Port (  LED: in  STD_LOGIC_VECTOR ( 3 downto 0 );
            BTN: in  STD_LOGIC_VECTOR ( 3 downto 0 );
            gameend: out  STD_LOGIC;
			Start_State: out STD_LOGIC);
end Compare;

architecture Behavioral of Compare is
begin
comparator: process( LED, BTN )
begin 
if BTN <= "0000" then
   Start_State <= '0';
	gameend <= '0';
 elsif	
  (LED = BTN) then
   Start_State <= '1';
	gameend <= '0';
else
	Start_State <= '0';
	gameend <= '1';
end if;
end process;

end Behavioral;
