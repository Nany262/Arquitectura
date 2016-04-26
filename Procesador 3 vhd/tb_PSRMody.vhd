
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_PSRMody IS
END tb_PSRMody;
 
ARCHITECTURE behavior OF tb_PSRMody IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Mody
    PORT(
         Alu_Result : IN  std_logic_vector(31 downto 0);
         AluOp : IN  std_logic_vector(5 downto 0);
         Operando1 : IN  std_logic;
         Operando2 : IN  std_logic;
         nzvc : OUT  std_logic_vector(3 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Alu_Result : std_logic_vector(31 downto 0) := (others => '0');
   signal AluOp : std_logic_vector(5 downto 0) := (others => '0');
   signal Operando1 : std_logic := '0';
   signal Operando2 : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Mody PORT MAP (
          Alu_Result => Alu_Result,
          AluOp => AluOp,
          Operando1 => Operando1,
          Operando2 => Operando2,
          nzvc => nzvc,
          reset => reset
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      Alu_Result<="00000000000000000000000000000000";
		AluOp<="010000";
      Operando1<='1';
      Operando2<='1';
		reset<='1';
		wait for 100 ns;
		Alu_Result<="00000000000000000000000000000000";
		AluOp<="010000";
      Operando1<='1';
      Operando2<='1';
		reset<='0';
		wait for 100 ns;
		Alu_Result<="00000000000000000000000000000000";
		AluOp<="000001";
      Operando1<='1';
      Operando2<='1';
		reset<='0';
		wait;
   end process;

END;
