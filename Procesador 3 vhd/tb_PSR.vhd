
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_PSR IS
END tb_PSR;
 
ARCHITECTURE behavior OF tb_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         Carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Carry : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          Clk => Clk,
          Reset => Reset,
          nzvc => nzvc,
          Carry => Carry
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

		reset<='1';
		nzvc<="0001";
      wait for 100 ns;	
		reset<='0';
		nzvc<="0001";
      wait for 100 ns;
		reset<='0';
		nzvc<="0000";
   end process;

END;
