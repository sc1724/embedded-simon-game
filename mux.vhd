library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
    Port ( Q : in  STD_LOGIC_VECTOR(3 downto 0);
	        SEL : in STD_LOGIC;
           MUX_VAL : out  STD_LOGIC_VECTOR(3 downto 0));
end MUX;
architecture Behavioral of MUX is

begin
MUX: process ( Q, SEL) 
begin
if ( Sel = '1' ) then
MUX_VAL <= Q;
else
MUX_VAL <= "0000";
end if;
end process;
end Behavioral;
