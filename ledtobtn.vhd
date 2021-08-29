
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity LEDtoBTN is
    Port ( LED : in  STD_LOGIC_VECTOR (3 downto 0);
           BTN : out  STD_LOGIC_VECTOR (3 downto 0));
end LEDtoBTN;

architecture Behavioral of LEDtoBTN is

begin

BTN(0) <= LED(0);
BTN(1) <= LED(1);
BTN(2) <= LED(2);
BTN(3) <= LED(3);

end Behavioral;
