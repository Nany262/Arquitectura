----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Design Name: 
-- Module Name:    ExtSigno - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ExtSigno30 is
    Port ( Dato30  : in  STD_LOGIC_VECTOR (29 downto 0);
           Dato32 : out  STD_LOGIC_VECTOR (31 downto 0));
end ExtSigno30;

architecture Behavioral of ExtSigno30 is

begin
process(Dato30)
begin
	if(Dato30(29) = '1') then 
		Dato32(29 downto 0) <= Dato30;
		Dato32(31 downto 30) <= (others=>'1');
		
	else 
		Dato32(29 downto 0) <= Dato30;
		Dato32(31 downto 30) <= (others=>'0');
	end if;
end process;

end Behavioral;

