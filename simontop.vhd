library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_LEVEL is
port ( clk : in STD_LOGIC;
       reset: in STD_LOGIC;
	   BTN: in STD_LOGIC_VECTOR( 3 downto 0 );
	   Start_Button: in STD_LOGIC;
	   LED_DISP: out  STD_LOGIC_VECTOR (3 downto 0);
	   LED_END: out STD_LOGIC;
	   SEL: out STD_LOGIC;
	   jd: out STD_LOGIC_VECTOR (3 downto 0);
	   je: out STD_LOGIC_VECTOR (3 downto 0);
	   countstart: out STD_LOGIC);
end TOP_LEVEL;

architecture Behavioral of TOP_LEVEL is
component debounce is
    Port( btn : in STD_LOGIC;
          clk : in STD_LOGIC;
          dbnc : out STD_LOGIC
    );
end component debounce;
component score is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; 
           pass : in STD_LOGIC;
           jd : out STD_LOGIC_VECTOR (3 downto 0);
           je : out STD_LOGIC_VECTOR (3 downto 0));
end component score;
component FSM1 is
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
end component FSM1;

component FSM2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           max : in  STD_LOGIC;
		   LED : in STD_LOGIC_VECTOR ( 3 downto 0);
		   BTN: in STD_LOGIC_VECTOR ( 3 downto 0);
           gameend : out  STD_LOGIC;
           START_STATE : out  STD_LOGIC);
end component FSM2;

component FSM3 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           gameend : in  STD_LOGIC;
           START_BUTTON : in  STD_LOGIC;
		   LED_END : out std_logic;
		   START_SIGNAL: out STD_LOGIC);
end component FSM3;
signal twotothree: std_logic;
signal threetoone: std_logic;
signal player_right: std_logic;
signal onetotwo:  STD_LOGIC;
signal LED_OUT: STD_LOGIC_VECTOR( 3 downto 0);
signal temp: STD_LOGIC_VECTOR( 3 downto 0);
signal dbnc0, dbnc1, dbnc2, dbnc3: std_logic;
signal dbnce:std_logic_vector(3 downto 0);
begin
Third: FSM3 port map ( clk => clk,
                       reset => reset,
						gameend => twotothree,
						Start_Button => Start_Button,
						LED_END => LED_END,
						START_Signal => threetoone);

First: FSM1 port map ( clk => clk,
                       reset => reset,
					  START_Signal => threetoone,
					  Player_Correct => player_right,
	            	  sel => sel,
					  countstart => countstart,
					  max => onetotwo,
					  LED_DISP => LED_OUT,
					  MUX_VAL => temp);

Second: FSM2 port map ( clk => clk,
                       reset => reset,
						max => onetotwo,
						LED => LED_OUT,
						BTN => dbnce,
						gameend => twotothree,
						START_STATE => player_right);
Screen: score port map(clk=>clk,
                        reset =>reset,
                        jd=>jd,
                        je=>je,
                        pass=>player_right);
deb0: debounce port map(clk=>clk,
                        btn=>BTN(0),
                        dbnc=>dbnc0);
deb1: debounce port map(clk=>clk,
                       btn=>BTN(1),
                     dbnc=>dbnc1);
deb2: debounce port map(clk=>clk,
                        btn=>BTN(2),
                          dbnc=>dbnc2);
deb01: debounce port map(clk=>clk,
                          btn=>BTN(3),
                          dbnc=>dbnc3);
dbnce<=dbnc3 & dbnc2 & dbnc1 & dbnc0;
LED_DISP <= temp;
end Behavioral;
