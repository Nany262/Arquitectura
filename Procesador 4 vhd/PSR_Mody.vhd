library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSR_Mody is
    Port ( Alu_Result : in  STD_LOGIC_VECTOR (31 downto 0);
			  AluOp : in STD_LOGIC_VECTOR (5 downto 0);
           Operando1 : in  STD_LOGIC;
           Operando2 : in  STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0);
			  reset: in STD_LOGIC
			  );
end PSR_Mody;

architecture Behavioral of PSR_Mody is

begin
process(Alu_Result, AluOp, Operando1, Operando2,reset)
begin 

	if reset = '1' then
		nzvc <= "0000";
	
	else 

		if(AluOp = "010000" or AluOp = "011000") then  -- ADDcc, ADDXcc
			
			nzvc(3)<= Alu_Result(31);
			if(Alu_Result = "00000000000000000000000000000000") then 
				nzvc(2) <= '1';
			else 
				nzvc(2) <= '0';
			end if;
			
			nzvc(1) <= (Operando1 and Operando2 and (not Alu_Result(31))) or ((Operando1) and  (not Operando2) and Alu_Result(31));
			nzvc(0) <= (Operando1 and Operando2) or ((not Alu_Result(31)) and (Operando1 or Operando2));
			
		end if;
		
		if(AluOp = "010100" or AluOp= "011100") then -- SUBcc, SUBXcc
			
			nzvc(3) <= Alu_Result(31);
			if(Alu_Result = "00000000000000000000000000000000") then 
				nzvc(2) <= '1';
			else 
				nzvc(2) <= '0';
			end if;
			nzvc(1) <= (Operando1 and (not Operando2) and (not Alu_Result(31))) or ( (not Operando1) and Operando2 and Alu_Result(31) );
			nzvc(0) <= ( (not Operando1) and Operando2) or (Alu_Result(31) and (( not Operando1 or Operando2)));
		end if;
		
		if(AluOp = "010001" or AluOp = "010101" or AluOp = "010010" or AluOp = "010110" or AluOp = "010011" or AluOp = "010111") then 
		--Andcc, AndNcc, Orcc, OrNcc, Xorcc, XNorcc.
			nzvc(3) <= Alu_Result(31);
			if(Alu_Result = "00000000000000000000000000000000") then 
				nzvc(2) <= '1';
			else 
				nzvc(2) <= '0';
			end if; 
			nzvc(1) <= '0';
			nzvc(0) <= '0';
			
		end if;
	end if;
end process;

end Behavioral;

