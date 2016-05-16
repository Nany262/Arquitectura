----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:50 04/15/2016 
-- Design Name: 
-- Module Name:    Mux - Behavioral 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_RSA is
    Port ( Crs32 : in  STD_LOGIC_VECTOR (31 downto 0);
           imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_RSA;

architecture Behavioral of Mux_RSA is

begin
	
	process(Crs32,imm32,i)
	begin 
	
		if(i = '1') then 
			Data_Out <= imm32;
		else
			if(i = '0') then
			Data_Out <= Crs32;
			end if;
		end if;
		
	end process;

end Behavioral;

