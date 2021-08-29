
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           max : in  STD_LOGIC;
		   LED : in STD_LOGIC_VECTOR ( 3 downto 0);
		   BTN: in STD_LOGIC_VECTOR ( 3 downto 0);
           gameend : out  STD_LOGIC;
           START_STATE : out  STD_LOGIC);
end FSM2;

architecture Behavioral of FSM2 is

component Check_Input is
    Port (  BTN : in  STD_LOGIC_VECTOR( 3 downto 0 );
           LED : in  STD_LOGIC_VECTOR( 3 downto 0 );
           gameend: out  STD_LOGIC;
			  Start_State: out STD_LOGIC);
end component Check_Input;


type state is ( In_Wait, check_in);
signal PresentState, NextState : state;
signal Start_State_temp: std_logic;
signal G_OVER_temp: std_logic;
begin

Ci: Check_Input port map ( BTN => BTN,
                           LED => LED,
                           gameend => G_OVER_temp,
                           Start_State => Start_State_temp);
									 
seq: process( clk, reset, nextstate)
begin
if (rising_edge(clk)) then
		if (reset='1') then
			PresentState <= In_Wait;
		else
			PresentState <= NextState;
		end if;
	end if;
end process seq;

comb: process ( clk, reset, max, presentstate, BTN, G_OVER_TEMP, START_STATE_TEMP)
begin
gameend <= '0';
START_STATE <= '0';
case presentstate is
     when In_Wait =>	 
         if ( max = '1') then
              NextState <=  check_in; 
          else 
              NextState <= PresentState;
         end if;
      when check_in =>
          if ( BTN = "0000") then
             NextState <= PresentState;
         else NextState <= in_wait;
			gameend <= G_OVER_TEMP;
			START_STATE <= START_STATE_TEMP;
         end if;										 
        when others =>
		 nextstate <= presentstate;                     
		end case;
		end process comb;
end Behavioral;
