library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dff is
    Port ( 
        	  CLK : in  STD_LOGIC;
	        EN : in STD_LOGIC;
           D : in  STD_LOGIC_VECTOR ( 3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Dff;

architecture Behavioral of Dff is
begin
 dff: process (D,CLK,EN)
 begin
 if EN = '0' then null;
 elsif (rising_edge(CLK)) then
  Q <= D;
  end if;
 end process dff; 
 
end Behavioral;
