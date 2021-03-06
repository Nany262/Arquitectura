----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Design Name: 
-- Module Name:    ExtSigno - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ExtSigno22 is
    Port ( Dato22  : in  STD_LOGIC_VECTOR (21 downto 0);
           Dato32 : out  STD_LOGIC_VECTOR (31 downto 0));
end ExtSigno22;

architecture Behavioral of ExtSigno22 is

begin
process(Dato22)
begin
	if(Dato22(21) = '1') then 
		Dato32(21 downto 0) <= Dato22;
		Dato32(31 downto 22) <= (others=>'1');
		
	else 
		Dato32(21downto 0) <= Dato22;
		Dato32(31 downto 22) <= (others=>'0');
	end if;
end process;

end Behavioral;


