library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity FSM1 is
    Port ( clk : in STD_LOGIC;
	       reset: in STD_LOGIC;
           Start_Signal : in  STD_LOGIC;
		   Player_Correct: in STD_LOGIC;
           SEL : out  STD_LOGIC;
           countstart : out  STD_LOGIC;
           max : inout std_logic;
		   LED_DISP: out  STD_LOGIC_VECTOR (3 downto 0);
		   mux_val : inout std_logic_vector ( 3 downto 0)
			  );
end FSM1;

architecture Behavioral of FSM1 is
type state is ( WAIT_FOR, LED_Display );
signal presentState, nextstate: state;
 
 component DISPLAY is
    Port ( countstart : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
		   SEL: in STD_LOGIC;
           max : out  STD_LOGIC;
		   LED_DISP: out  STD_LOGIC_VECTOR (3 downto 0);
           MUX_VAL : out  STD_LOGIC_VECTOR (3 downto 0));
end component DISPLAY;

component WAIT_FOR_START is
    Port ( Start_Button : in  STD_LOGIC;
	       Player_Correct: in STD_LOGIC;
	       SEL: in STD_LOGIC;
           countstart : out  STD_LOGIC);
end component WAIT_FOR_START;
signal start_cnt : std_logic;
signal sel_temp : std_logic;
begin

waiting : WAIT_FOR_START port map ( start_button => start_signal,
                                    player_correct => player_correct,
									Sel => Sel_temp,
									countstart => start_cnt);
Displaying: DISPLAY port map ( countstart => start_cnt,
                               clk => clk,
								reset => reset,
								sel => sel_temp,
								max => max,
								LED_DISP => LED_DISP,
								mux_val => mux_val);										 											
seq: process( clk, reset, NextState)
begin 
    if (rising_edge(clk)) then
		if (reset='1') then
			presentstate <= WAIT_FOR;
		else
			presentstate <= nextstate;
		end if;
	end if;
end process seq;

comb : process( clk, reset, Start_Signal, Player_Correct, max, presentstate) 
begin
countstart <= '0';
   case presentstate is
	    when WAIT_FOR => SEL_temp <= '0';		 
		 if (start_signal ='1' or player_correct = '1') then
			nextstate <= led_display;
		-- elsif ((start_signal = '0' and player_correct = '0') or max = '1') then
		  -- nextstate <= presentstate;
			else 
			nextstate <= presentstate;
		end if;		
		when led_display => SEL_temp <= '1';		
		if ( max = '1') then
		 nextstate <= WAIT_FOR;
		--elsif (start_signal = '1' or player_correct = '1') then
		 --nextstate <= presentstate;
		 else
		 nextstate <= presentstate;
		end if;
		when others =>
		 nextstate <= presentstate;
	end case;	
end process comb;
Sel <= Sel_Temp;

end Behavioral;
