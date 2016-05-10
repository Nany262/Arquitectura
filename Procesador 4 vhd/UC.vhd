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
           OP2 : in  STD_LOGIC_VECTOR (2 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  
			  enableMem : out STD_LOGIC;
           rfDest : out  STD_LOGIC;
           rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0); -- PC
           wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC; -- Escritura en RF
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end UControl;

architecture Behavioral of UControl is

begin
process(OP,OP2,OP3,Cond,icc)
begin
	if(OP = "01") then -- Call
	
	
		pcSource <= "01"; -- PC + (4 x disp30)
		wrEnRF <= '1'; --Guardar el valor actual de PC
		rfSource <= "10"; -- PC
		enableMem <= '1';
		rfDest <= '1'; -- r[15]
		wrEnMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
		ALUOP <= "111111"; -- ninguno
		
	else 
		if(OP = "00") then -- Branches & Sethi 
			if(OP2 = "010")then -- Branch on Integer Condition Codes Instructions
						case cond is
							
							when "1000" => -- Branch Always
								pcSource <= "10"; -- Siempre se salta a PC + (4 x seu(disp22))
								wrEnRF <= '0';
								enableMem <= '1';
								rfSource <= "00"; -- No se permite escritura en el Register File
								rfDest <= '0'; --No se permitira escritura en el Register File
								wrEnMem <= '0';
								ALUOP <= "111111";
								
								
							when "1001" => -- Branch on Not Equal  

								if(not(icc(2)) = '1') then -- not Z
									pcSource <= "10"; -- Siempre se salta a PC + (4 x seu(disp22))
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; -- Se salta a PC + 4
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0';
									ALUOP <= "111111";
								end if;
								
								
							 when "0001" => -- Branch on Equal
								if(icc(2) = '1') then --  Z
									pcSource <= "10"; -- Siempre se salta a PC + (4 x seu(disp22))
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; -- Se salta a PC + 4
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00";
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								end if;
		
		
		
	if(OP = "10") then -- Aritmeticas, logicas, Shift , Jum and link
	
	if(OP = "11") then --Load and Store
	
		
	
	
	
	
	
	
	
	
	
--		case OP3 is 
--			when "000000" =>  --Add
--				OPOut <= "000000";
--			when "010000"0 => --Addcc
--				OPOut <= "010000";
--			when "001000" => --Addx 
--				OPOut <= "001000";
--			when "011000" => --Addxcc 
--			OPOut <= "011000";
----------------------------------			
--			when "000100" =>  --Sub
--				OPOut <= "000100";
--			when "010100" =>  --Subcc
--				OPOut <= "010100";
--			when "001100" =>  --Subx
--				OPOut <= "001100";
--			when "011100" =>  --Subxcc
--				OPOut <= "011100";
----------------------------------
--			when "000001" =>  --And
--				OPOut <= "000001";
--			when "010001" =>  --Andcc
--				OPOut <= "010001";
--			when "000101" =>  -- AndN
--				OPOut <= "000101";
--			when "010101" =>  --AndNcc
--				OPOut <= "010101";
----------------------------------				
--			when "000010" =>  --Or
--				OPOut <= "000010";
--			when "000110" =>  --OrN
--				OPOut <= "000110";
--			when "010010" =>  --Orcc
--				OPOut <= "010010";
--			when "010110" =>  --OrNcc
--				OPOut <= "010110";
----------------------------------
--			when "000011" =>  --Xor
--				OPOut <= "000011";
--			when "000111" =>  --XNOr
--				OPOut <= "000111";
--			when "010011" =>  --Xorcc
--				OPOut <= "010011";
--			when "010111" =>  --XNOrcc
--				OPOut <= "010111";
-----------------------------------
--			when others => OPOut<="111111";
--		end case;
	end if;
end process;

end Behavioral;