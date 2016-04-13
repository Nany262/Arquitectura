----------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
-- 
-- Create Date:    17:05:24 04/01/2016 
-- Module Name:    IM - Behavioral 
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tbInstructionMemory IS
END tbInstructionMemory;
 
ARCHITECTURE behavior OF tbInstructionMemory IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructionMemory PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

   -- Stimulus process
   stim_proc: process
   begin		
		address <="00000000000000000000000000000001";
      reset <= '1';
      wait for 100 ns;
		address <="00000000000000000000000000000000";
      reset <= '0';
      wait for 100 ns;
		address <="00000000000000000000000000000011";
      reset <= '0';
      wait;	
   end process;

END;
