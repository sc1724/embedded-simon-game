library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity DISPLAY is
    Port ( countstart : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
		   SEL : in STD_LOGIC;
           max : out  STD_LOGIC;
		   LED_DISP: out  STD_LOGIC_VECTOR (3 downto 0);
           MUX_VAL : out  STD_LOGIC_VECTOR (3 downto 0));
end DISPLAY;

architecture Behavioral of DISPLAY is

component counter is
    Port ( countstart : in STD_LOGIC;
	       clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           max : out  STD_LOGIC);
end component counter;

component lfsr is
    Port ( 
	       clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           random_num : out  STD_LOGIC_VECTOR (31 downto 0));
end component lfsr;

component Capture is
    Port ( 
	       random_num : in  STD_LOGIC_VECTOR (31 downto 0);
		   LED_DISP : out  STD_LOGIC_VECTOR (3 downto 0);
           LED : out  STD_LOGIC_VECTOR (3 downto 0)
           );
end component Capture;

component Dff is
    Port ( 
           CLK : in  STD_LOGIC;
	       EN : in STD_LOGIC;
           D : in  STD_LOGIC_VECTOR( 3 downto 0);
           Q : out  STD_LOGIC_VECTOR( 3 downto 0));
end component Dff;

component MUX is
    Port ( Q : in  STD_LOGIC_VECTOR( 3 downto 0);
		   SEL: in STD_LOGIC;	
           MUX_VAL : out  STD_LOGIC_VECTOR( 3 downto 0));
end component MUX;
signal number: std_logic_vector( 31 downto 0);
signal LED_VAL: std_LOGIC_VECTOR( 3 downto 0);
signal LED_VAL2: std_LOGIC_VECTOR( 3 downto 0);
signal LED_VAL3: std_LOGIC_VECTOR( 3 downto 0);
begin

count : counter port map ( countstart => countstart,
                           clk => clk,
						   reset => reset,
						   max => max);
ranum: lfsr port map ( clk => clk,
                           reset => reset,
						   random_num => number);
cap: capture port map ( random_num => number,
                            LED_DISP => LED_VAL3,
                            LED => LED_VAL);
dflp: Dff port map ( Clk => Clk,
                         EN => countstart,
						 D => LED_VAL,
						 Q => LED_VAL2);
selc: MUX port map ( Q => LED_VAL2,
                         SEL => SEL,
						 MUX_VAL => MUX_VAL);
LED_DISP <= LED_VAL2;
end Behavioral;
