----------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa PEnagos & Daniela Zuluaga
-- 
-- Create Date:    16:42:30 04/01/2016 
-- Module Name:    PCounter - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PCounter is
    Port ( Data_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end PCounter;

architecture Behavioral of PCounter is

begin

process(Data_In,Reset,Clk)
begin
		if(Reset = '1') then 
			Data_Out <= "00000000000000000000000000000000";
		else 
			if(rising_edge(Clk)) then
				Data_Out <= Data_In;
			end if;
		end if;
end process;		

end Behavioral;

