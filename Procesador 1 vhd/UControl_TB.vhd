--------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
--
-- Create Date:   17:08:57 04/01/2016
-- Module Name:   Sumador
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY UControl_TB IS
END UControl_TB;
 
ARCHITECTURE behavior OF UControl_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UControl
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         OPOut : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal OPOut : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UControl PORT MAP (
          OP => OP,
          OP3 => OP3,
          OPOut => OPOut
        );
 

   -- Stimulus process
   stim_proc: process
   begin			
		 OP <="00";
		OP3 <="000000";
      wait for 100 ns;

		OP <="10";
		OP3 <="000100";
		wait;
   end process;

END;
