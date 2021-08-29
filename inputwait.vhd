
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Check_Input is
    Port ( BTN : in  STD_LOGIC_VECTOR( 3 downto 0 );
           LED : in  STD_LOGIC_VECTOR( 3 downto 0 );
           gameend: out  STD_LOGIC;
			  Start_State: out STD_LOGIC);
end Check_Input;

architecture Behavioral of Check_Input is

component LEDtoBTN is
    Port ( LED : in  STD_LOGIC_VECTOR (3 downto 0);
           BTN : out  STD_LOGIC_VECTOR (3 downto 0));
end component LEDtoBTN;

component Compare is
    Port (  LED: in  STD_LOGIC_VECTOR ( 3 downto 0 );
            BTN: in  STD_LOGIC_VECTOR ( 3 downto 0 );
            gameend: out  STD_LOGIC;
				Start_State: out STD_LOGIC);
end component Compare;
signal LEDBTN_VAL : std_logic_vector( 3 downto 0 );
begin

BTN_mapping : LEDtoBTN port map ( LED => LED,
                                  BTN => LEDBTN_VAL);
Comparison : Compare port map ( LED => LEDBTN_VAL,
                                BTN => BTN,
								gameend => gameend,
								Start_State => Start_State);
end Behavioral;
