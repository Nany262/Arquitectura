----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Vanessa Penagos & Daniela zuluaga
-- 
-- Create Date:    17:34:31 04/01/2016 
-- Module Name:    UControl - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UControl is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           OPOut : out  STD_LOGIC_VECTOR (5 downto 0));
end UControl;

architecture Behavioral of UControl is

begin
process(OP,OP3)
begin
	if(OP = "10") then
		case OP3 is 
			when "000000" =>  --Suma
				OPOut <= "000000";
			when "000100" =>  --Resta
				OPOut <= "000100";
			when "000001" =>  --And
				OPOut <= "000001";
			when "000010" =>  --Or
				OPOut <= "000010";
			when "000110" =>  --OrN
				OPOut <= "000110";		
			when "000011" =>  --Xor
				OPOut <= "000011";
			when "000111" =>  --XNOr
				OPOut <= "000111";
			when "000101" =>  -- AndN
				OPOut <= "000101";
			when others => OPOut<="111111";
		end case;
	end if;
end process;

end Behavioral;