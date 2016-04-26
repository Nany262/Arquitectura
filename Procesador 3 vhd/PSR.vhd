library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           Carry : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin
process(Clk, Reset, nzvc)
begin 

	if(rising_edge(Clk)) then
		if(Reset = '0') then
			Carry <= nzvc(0);
		else 
			Carry <= '0';
		end if;
	end if;
end process;
end Behavioral;

