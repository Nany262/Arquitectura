
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Mux IS
END tb_Mux;
 
ARCHITECTURE behavior OF tb_Mux IS 
 
 
    COMPONENT Mux
    PORT(
         Crs32 : IN  std_logic_vector(31 downto 0);
         imm32 : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Crs32 : std_logic_vector(31 downto 0) := (others => '0');
   signal imm32 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal Data_Out : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux PORT MAP (
          Crs32 => Crs32,
          imm32 => imm32,
          i => i,
          Data_Out => Data_Out
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Crs32 <="00000000000000000000000000000010";
		imm32 <="00000000000000000000000000000110";
		i <= '1';
      wait for 100 ns;
		
		Crs32 <="00000000000000000000000000000010";
		imm32 <="00000000000000000000000000000110";
		i <= '0';
		
      -- insert stimulus here 
		wait;
   end process;

END;
