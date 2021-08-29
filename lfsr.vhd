library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr is
    Port ( 
	        clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           random_num : out  STD_LOGIC_VECTOR (31 downto 0));
end lfsr;

architecture Behavioral of lfsr is
signal lfsr_new: std_logic_vector( 31 downto 0 );
	 signal lfsr: std_logic_vector ( 31 downto 0 );
begin

lfsr_update: process  ( reset, lfsr)
 begin
    lfsr_new( 31 downto 1 ) <= lfsr ( 30 downto 0 );
	 lfsr_new(0) <= lfsr(31) xor lfsr(1);
	 end process lfsr_update;
	 
 lfsrgen: process ( reset, clk )
  begin 
  if ( rising_edge(clk)) then 
  if(reset = '1') then 
  lfsr <= "00000000000000000000000000000001";
  else
   lfsr <= lfsr_new;
	end if;
	end if;
	end process lfsrgen;
	
	random_num <= lfsr;


end Behavioral;
