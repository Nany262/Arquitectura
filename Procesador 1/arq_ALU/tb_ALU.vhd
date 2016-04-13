----------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
-- 
-- Create Date:    17:05:24 04/01/2016 
-- Module Name:    Sumador - Behavioral 
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         ALU_Op : IN  std_logic_vector(5 downto 0);
         CRS1 : IN  std_logic_vector(4 downto 0);
         CRS2 : IN  std_logic_vector(4 downto 0);
         ALU_Out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALU_Op : std_logic_vector(5 downto 0) := (others => '0');
   signal CRS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal ALU_Out : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          ALU_Op => ALU_Op,
          CRS1 => CRS1,
          CRS2 => CRS2,
          ALU_Out => ALU_Out
        );

   -- Stimulus process
   stim_proc: process
   begin		
		ALU_OP <="000000"; --suma
		CRS1 <= "00010";
		CRS2 <= "00010";
      wait for 100 ns;
		ALU_OP <="000100";--resta
		CRS1 <= "00010";
		CRS2 <= "00010";
      wait for 100 ns;
		ALU_OP <="000010"; --or
		CRS1 <= "00010";
		CRS2 <= "00010";
      wait for 100 ns;	--nor
		ALU_OP <="000110";
		CRS1 <= "00010";
		CRS2 <= "00010";
      wait;
   end process;

END;
