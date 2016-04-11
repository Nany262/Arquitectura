--------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
--
-- Create Date:   16:49:22 04/01/2016  
-- Module Name:  PCounter

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_PCounter IS
END tb_PCounter;
 
ARCHITECTURE behavior OF tb_PCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCounter
    PORT(
         Data_In : IN  std_logic_vector(31 downto 0);
         Reset : IN  std_logic;
         Clk : IN  std_logic;
         Data_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Data_In : std_logic_vector(31 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal Clk : std_logic := '0';

 	--Outputs
   signal Data_Out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PCounter PORT MAP (
          Data_In => Data_In,
          Reset => Reset,
          Clk => Clk,
          Data_Out => Data_Out
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Reset <= '1';
		Data_In <= "00000000000000000000000010001001";
		
		wait for 100 ns;	
		Reset <= '0';
		Data_In <= "00000000000000000000000000001001";
		
		wait for 100 ns;	
		Reset <= '0';
		Data_In <= "00000000000000000100000010001001";
      wait;
   end process;

END;
