----------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
-- 
-- Create Date:    17:05:24 04/01/2016 
-- Module Name:    ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( ALU_Op : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Carry: in STD_LOGIC;
           ALU_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
process(ALU_Op,CRS1,CRS2,Carry)
begin
	case ALU_Op is 
		when "000000" => -- add
			ALU_Out <= CRS1+CRS2;
		when "010000" => --Addcc
			ALU_Out <= CRS1+CRS2;
		when "001000" => --Addx 
			ALU_Out <= CRS1+CRS2+Carry;
		when "011000" => --Addxcc 
		   ALU_Out <= CRS1+CRS2+Carry;
		
--------------------------------
		when "000100" =>  --Resta
			ALU_Out <= CRS1-CRS2;
		when "010100" =>  --Subcc
			ALU_Out <= CRS1-CRS2;
		when "001100" =>  --Subx
			ALU_Out <= CRS1-CRS2+Carry;
		when "011100" =>  --Subxcc
			ALU_Out <= CRS1-CRS2+Carry;
-------------------------------
		when "000001" =>  --And
			ALU_Out <= CRS1 and CRS2;
		when "000101" =>  -- AndN
			ALU_Out <= not(CRS1 and CRS2);			
		when "010001" =>  --Andcc
			ALU_Out <= (CRS1 and CRS2);		
		when "010101" =>  --AndNcc
			ALU_Out <= not(CRS1 and CRS2);		
-------------------------------
		when "000010" =>  --Or
			ALU_Out <= CRS1 or CRS2;
		when "000110" =>  --OrN
			ALU_Out <= not(CRS1 or CRS2);		
		when "010010" =>  --Orcc
			ALU_Out <= (CRS1 or CRS2);	
		when "010110" =>  --OrNcc
			ALU_Out <= not(CRS1 or CRS2);			
-------------------------------
		when "000011" =>  --Xor
			ALU_Out <= CRS1 xor CRS2;
		when "000111" =>  --XNOr
			ALU_Out <= not(CRS1 xor CRS2);
		when "010011" =>  --Xorcc
			ALU_Out <= (CRS1 xor CRS2);
		when "010111" =>  --XNOrcc
			ALU_Out <= not(CRS1 xor CRS2);		
-------------------------------

		when others => ALU_Out<="11111111111111111111111111111111";
	end case;
end process;


end Behavioral;

