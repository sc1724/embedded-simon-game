
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM3 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           gameend : in  STD_LOGIC;
           START_BUTTON : in  STD_LOGIC;
		   LED_END : out STD_LOGIC;
		   START_SIGNAL : out STD_LOGIC);
end FSM3;

architecture Behavioral of FSM3 is
type state is (  game_end, waiting );
signal presentstate, nextstate: state;
begin
seq: process( clk, reset, nextstate)
begin
if ( rising_edge(clk)) then
	if (reset = '1') then
		presentstate <= game_end;
	else
		presentstate <= nextstate;
	end if;
end if;
end process seq;
	
comb : process( clk, reset, gameend, start_button, presentstate)
begin
start_signal <= '0';
case presentstate is
	when waiting => LED_END <= '0';
		if ( gameend = '1') then
			nextstate <= game_end;
		else
			nextstate <= presentstate;
		end if;
				  
	when game_end => LED_END <= '1';
		if (start_button = '1') then
           nextstate <= waiting;
			start_signal <= '1';
         else
            nextstate <= presentstate;
			start_signal <= '0';
         end if;
end case;
end process;				  
 					             
end Behavioral;
