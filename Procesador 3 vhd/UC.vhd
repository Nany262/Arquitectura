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
			when "000000" =>  --Add
				OPOut <= "000000";
			when "010000" => --Addcc
				OPOut <= "010000";
			when "001000" => --Addx 
				OPOut <= "001000";
			when "011000" => --Addxcc 
			OPOut <= "011000";
--------------------------------			
			when "000100" =>  --Sub
				OPOut <= "000100";
			when "010100" =>  --Subcc
				OPOut <= "010100";
			when "001100" =>  --Subx
				OPOut <= "001100";
			when "011100" =>  --Subxcc
				OPOut <= "011100";
--------------------------------
			when "000001" =>  --And
				OPOut <= "000001";
			when "010001" =>  --Andcc
				OPOut <= "010001";
			when "000101" =>  -- AndN
				OPOut <= "000101";
			when "010101" =>  --AndNcc
				OPOut <= "010101";
--------------------------------				
			when "000010" =>  --Or
				OPOut <= "000010";
			when "000110" =>  --OrN
				OPOut <= "000110";
			when "010010" =>  --Orcc
				OPOut <= "010010";
			when "010110" =>  --OrNcc
				OPOut <= "010110";
--------------------------------
			when "000011" =>  --Xor
				OPOut <= "000011";
			when "000111" =>  --XNOr
				OPOut <= "000111";
			when "010011" =>  --Xorcc
				OPOut <= "010011";
			when "010111" =>  --XNOrcc
				OPOut <= "010111";
---------------------------------
			when others => OPOut<="111111";
		end case;
	end if;
end process;

end Behavioral;