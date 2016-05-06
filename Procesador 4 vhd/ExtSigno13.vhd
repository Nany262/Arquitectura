----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Design Name: 
-- Module Name:    ExtSigno - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ExtSigno is
    Port ( Dato13 : in  STD_LOGIC_VECTOR (12 downto 0);
           Dato32 : out  STD_LOGIC_VECTOR (31 downto 0));
end ExtSigno;

architecture Behavioral of ExtSigno is

begin
process(Dato13)
begin
	if(Dato13(12) = '1') then 
		Dato32(12 downto 0) <= Dato13;
		Dato32(31 downto 13) <= (others=>'1');
		
	else 
		Dato32(12 downto 0) <= Dato13;
		Dato32(31 downto 13) <= (others=>'0');
	end if;
end process;

end Behavioral;

