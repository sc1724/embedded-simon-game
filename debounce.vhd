library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
entity debounce is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    signal temp:STD_LOGIC_VECTOR(1 downto 0);
    signal counter:STD_LOGIC_VECTOR(22 downto 0);
begin
process(clk)
begin
if (rising_edge(clk))then
    temp(1)<=temp(0);
    temp(0)<=btn;
 
    if (temp="11" xor temp="00")then
        counter<= std_logic_vector(unsigned(counter) + 1);
        if (unsigned(counter)=2500000)then
            if(temp(1)='1')then
                    dbnc<='1';
            else
                    dbnc<='0';
            end if;
        end if;
    else
    counter <= (others => '0');
    end if;
end if;

end process;

end Behavioral;