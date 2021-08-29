library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Capture is
    Port (  random_num : in  STD_LOGIC_VECTOR (31 downto 0);
			LED_DISP: out STD_LOGIC_VECTOR (3 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0)
           );
end Capture;

architecture Behavioral of Capture is   

begin

RandomToLed: process ( random_num)
begin
 LED(0) <= '0';
 LED(1) <= '0';
 LED(2) <= '0';
 LED(3) <= '0';
 if (random_num <= X"40000000" ) then
   LED(0) <= '0';
	LED(1) <= '1';
   LED(2) <= '0';
   LED(3) <= '0';
	elsif (random_num <= X"80000000") then
	LED(0) <= '1';
	LED(1) <= '0';
    LED(2) <= '0';
	LED(3) <= '0';
	elsif (random_num <= X"C0000000") then
	LED(0) <= '0';
	LED(1) <= '0';
	LED(2) <= '0';
	LED(3) <= '1';
	else
	LED(0) <= '0';
	LED(1) <= '0';
	LED(2) <= '1';
	LED(3) <= '0';
	end if;
end process Randomtoled;
	
RandomToLed2: process ( random_num)
begin
 LED_DISP(0) <= '0';
 LED_DISP(1) <= '0';
 LED_DISP(2) <= '0';
 LED_DISP(3) <= '0';
 if (random_num <= X"40000000" ) then
   LED_DISP(0) <= '0';
   LED_DISP(1) <= '1';
   LED_DISP(2) <= '0';
   LED_DISP(3) <= '0';
	elsif (random_num <= X"80000000") then
    LED_DISP(0) <= '1';
	LED_DISP(1) <= '0';
    LED_DISP(2) <= '0';
	LED_DISP(3) <= '0';
	elsif (random_num <= X"C0000000") then
	LED_DISP(0) <= '0';
	LED_DISP(1) <= '0';
	LED_DISP(2) <= '0';
	LED_DISP(3) <= '1';
	else
	LED_DISP(0) <= '0';
	LED_DISP(1) <= '0';
	LED_DISP(2) <= '1';
	LED_DISP(3) <= '0';
    end if;
	
end process randomtoled2;
 
  

end Behavioral;
