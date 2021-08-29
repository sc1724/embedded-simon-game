library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
    Port ( countstart : in STD_LOGIC;
	        clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           max : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is
    signal counter : integer range 0 to 70000000 := 0;
begin
 
 frequency_divider: process (countstart, reset, clk) 
 begin
       if (reset = '1') then
            counter <= 0;
        elsif rising_edge(clk) then
			  max <= '0';
		     if ( counter = 0 and countstart = '1') then
			  counter <= 1;
			  elsif counter = 70000000 then 
			  counter  <= 0;
			  max <= '1';
			  elsif counter > 0 then
			  counter <= counter + 1;
			  end if;
       end if;
    end process;

	 
end Behavioral;
