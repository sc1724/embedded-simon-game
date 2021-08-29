library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
entity score is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC; 
           pass : in STD_LOGIC;
           jd : out STD_LOGIC_VECTOR (3 downto 0);
           je : out STD_LOGIC_VECTOR (3 downto 0));
end score;

architecture Behavioral of score is
signal counter: STD_LOGIC_VECTOR (3 downto 0);

begin
je(3)<='0';
process(counter)
begin
    case counter is
    when "0000" => 
    jd(0)<='1';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='1';
    je(0)<='1';
    je(1)<='1';
    je(2)<='0';    
    when "0001" => 
    jd(0)<='0';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='0';
    je(0)<='0';
    je(1)<='0';
    je(2)<='0';
    when "0010" => 
    jd(0)<='1';
    jd(1)<='1';
    jd(2)<='0';
    jd(3)<='1';
    je(0)<='1';
    je(1)<='0';
    je(2)<='1';
    when "0011" => 
    jd(0)<='1';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='1';
    je(0)<='0';
    je(1)<='0';
    je(2)<='1';
    when "0100" => 
    jd(0)<='0';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='0';
    je(0)<='0';
    je(1)<='1';
    je(2)<='1';
    when "0101" => 
    jd(0)<='1';
    jd(1)<='0';
    jd(2)<='1';
    jd(3)<='1';
    je(0)<='0';
    je(1)<='1';
    je(2)<='1';
    when "0110" => 
    jd(0)<='1';
    jd(1)<='0';
    jd(2)<='1';
    jd(3)<='1';
    je(0)<='1';
    je(1)<='1';
    je(2)<='1';
    when "0111" => 
    jd(0)<='1';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='0';
    je(0)<='0';
    je(1)<='0';
    je(2)<='0';
    when "1000" => 
    jd(0)<='1';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='1';
    je(0)<='1';
    je(1)<='1';
    je(2)<='1'; 
    when "1001" => 
    jd(0)<='1';
    jd(1)<='1';
    jd(2)<='1';
    jd(3)<='1';
    je(0)<='0';
    je(1)<='1';
    je(2)<='1';
    when others=>
        jd(0)<='1';
        jd(1)<='1';
        jd(2)<='1';
        jd(3)<='1';
        je(0)<='1';
        je(1)<='1';
        je(2)<='0'; 
    end case;
end process;

process(clk,reset)
begin 
    if(reset='1') then
        counter <= (others => '0');
    elsif(rising_edge(clk) AND pass='1') then
        counter <= counter + 1;
    end if;
end process;
 
end Behavioral;