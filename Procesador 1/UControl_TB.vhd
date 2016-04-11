--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:11:52 04/06/2016
-- Design Name:   
-- Module Name:   F:/ProcesadorUno/aqr_UC/UControl_TB.vhd
-- Project Name:  aqr_UC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UControl
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
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
