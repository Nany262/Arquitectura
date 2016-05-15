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
		rfDest <= '1'; -- r[15]
		wrEnMem <= '0'; -- El dato es leido de memoria pero no se toma en cuenta
		ALUOP <= "111111"; -- ninguno	
		end if;
----------------------------------------------------------------------------------------------------------
if(OP = "00") then -- Branches Nop & Sethi 
		if(OP2="100") then --Sethi y Nop
			pcSource <= "11";
			wrEnRF <= '0'; 
			rfSource <= "01"; --debe dar el resultado de la alu
			rfDest <= '0'; -- no se escribe
			wrEnMem <= '0'; 
			ALUOP <= "111111"; -- no debe hacer ninguna operacion aritmetica
			end if;
else
		if(OP2 = "010")then -- Branch
			case cond is
				when "1000" => -- Branch Always
					pcSource <= "10"; -- Siempre se salta a PC + (4 x seu(disp22))
					wrEnRF <= '0'; 
					rfSource <= "00"; -- No se permite escritura en el Register File
					rfDest <= '0'; --No se permitira escritura en el Register File
					wrEnMem <= '0'; --data memory
					ALUOP <= "111111";
					
				when "1001" => -- Branch on Not Equal  
					if(not(icc(2)) = '1') then -- not Z
						pcSource <= "10"; -- Siempre se salta a PC + (4 x seu(disp22))
						wrEnRF <= '0';
						rfSource <= "00"; 
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00"; 
						rfDest <= '0'; 
						wrEnMem <= '0';
						ALUOP <= "111111";
					end if;
					 
				 when "0001" => -- Branch on Equal
					if(icc(2) = '1') then --  Z
						pcSource <= "10"; -- Siempre se salta a PC + (4 x seu(disp22))
						wrEnRF <= '0';
						rfSource <= "00"; 
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "1010"=> --Greather
					if(not(icc(2) or (icc(3) or icc(1)))='1') then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "0010"=> --Less or equal
					if ((icc(2) or (icc(3) xor icc(1)))='1') then 
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "1011"=>--Greather or equal
					if(not(icc(3) xor icc(1))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
				
				when "0011" => --Less
					if((icc(3) xor icc(1))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "1100" => --Greather unsigned
					if(not(icc(0) or icc(2))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "0100" => --Less or equal unsigned 
					if((icc(0) or icc(2))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
				
				when "1101" => --Carry clear
					if(not(icc(0))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
				
				when "0101" => --Carry set
					if(icc(0)='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "1110" => --Positive
					if(not(icc(3))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when "0110" => --Negative
					if(icc(3)='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
							
				when "1111" => --Overflow clear
					if(not(icc(1))='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
				
				when "0111" => --Overflow set
					if(icc(1)='1')then
						pcSource <= "10"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					else
						pcSource <= "11"; -- Se salta a PC + 4
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0'; 
						wrEnMem <= '0'; 
						ALUOP <= "111111";
					end if;
					
				when others => -- Not Implemented
						pcSource <= "00";
						wrEnRF <= '0';
						rfSource <= "00";
						rfDest <= '0';
						wrEnMem <= '0';
						ALUOP <= "111111"; 
				end case;
			end if;
		end if;			
---------------------------------------------------------------------------------------------------
if(OP = "11") then --Load and Store
		if(OP3="000000") then --Load
				pcSource <= "00";
				wrEnRF <= '1';
				rfSource <= "00";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000000"; -- suma de direcciones
		end if;
		if (OP3="000100") then --Store
				pcSource <= "11";
				wrEnRF <= '0';
				rfSource <= "00";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000000"; --suma de direcciones
		end if;
end if;
---------------------------------------------------------------------------------------------------								
	if(OP = "10") then -- Aritmeticas, logicas, Shift , Jump and link
		
		case OP3 is 
--			when ""=> --Shift Left
--				pcSource <= "11"; --No salta
--				wrEnRF <= '1';
--				rfSource <= "01";
--				rfDest <= '0';
--				wrEnMem <= '0';
--				ALUOP <= "000000";
--				
--			when ""=> --Shift Right
--				pcSource <= "11"; --No salta
--				wrEnRF <= '1';
--				rfSource <= "01";
--				rfDest <= '0';
--				wrEnMem <= '0';
--				ALUOP <= "000000";
------------------------------------
			when "111100"=> --Save
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000000"; --Modifica CWP?
			
			when "111101"=> --Restore
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000000"; --Modifica CWP?
------------------------------------
		when "111000"=> --Jump and Link
				pcSource <= "00";
				wrEnRF <= '1';
				rfSource <= "10";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000000";
------------------------------------
			when "000000" =>  --Add
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000000";
			when "010000"=> --Addcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010000";
			when "001000" => --Addx 
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "001000";
			when "011000" => --Addxcc 
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "011000";
----------------------------------			
			when "000100" =>  --Sub
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000100";
			when "010100" =>  --Subcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010100";
			when "001100" =>  --Subx
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "001100";
			when "011100" =>  --Subxcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "011100";
----------------------------------
			when "000001" =>  --And
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000001";
			when "010001" =>  --Andcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010001";
			when "000101" =>  -- AndN
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000101";
			when "010101" =>  --AndNcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010101";
--------------------------------				
			when "000010" =>  --Or
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000010";
			when "000110" =>  --OrN
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000110";
			when "010010" =>  --Orcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010010";
			when "010110" =>  --OrNcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010110";
--------------------------------
			when "000011" =>  --Xor
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000011";
			when "000111" =>  --XNOr
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "000111";
			when "010011" =>  --Xorcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010011";
			when "010111" =>  --XNOrcc
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP <= "010111";
---------------------------------
			when others => 
				pcSource <= "11";
				wrEnRF <= '1';
				rfSource <= "01";
				rfDest <= '0';
				wrEnMem <= '0';
				ALUOP<="111111";
		end case;
	end if;
end process;

end Behavioral;