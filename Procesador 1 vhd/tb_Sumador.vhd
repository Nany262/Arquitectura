--------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
--
-- Create Date:   17:08:57 04/01/2016
-- Module Name:   Sumador
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_Sumador IS
END tb_Sumador;
 
ARCHITECTURE behavior OF tb_Sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         Constante : IN  std_logic_vector(31 downto 0);
         Data_In : IN  std_logic_vector(31 downto 0);
         Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Constante : std_logic_vector(31 downto 0) := (others => '0');
   signal Data_In : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Data_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          Constante => Constante,
          Data_In => Data_In,
          Data_Out => Data_Out
        );


   -- Stimulus process
   stim_proc: process
   begin	
	
		Constante <= "00000000000000000000000000000010";
		Data_In <= "00000000000000000000000000000010";
		
		wait for 100 ns;
		
		Constante <= "00000000000000000000000000000011";
		Data_In <= "00000000000000000000000000000010";		
			

      wait;
   end process;

END;
