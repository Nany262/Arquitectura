
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Win IS
END tb_Win;
 
ARCHITECTURE behavior OF tb_Win IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Win_Man
    PORT(
         CWP : IN  std_logic;
         Rs1_in : IN  std_logic_vector(4 downto 0);
         Rs2_in : IN  std_logic_vector(4 downto 0);
         Rsd_in : IN  std_logic_vector(4 downto 0);
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         Rs1_out : OUT  std_logic_vector(5 downto 0);
         Rs2_out : OUT  std_logic_vector(5 downto 0);
         Rsd_out : OUT  std_logic_vector(5 downto 0);
         RegO7 : OUT  std_logic_vector(5 downto 0);
         nCWP : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CWP : std_logic := '0';
   signal Rs1_in : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2_in : std_logic_vector(4 downto 0) := (others => '0');
   signal Rsd_in : std_logic_vector(4 downto 0) := (others => '0');
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Rs1_out : std_logic_vector(5 downto 0);
   signal Rs2_out : std_logic_vector(5 downto 0);
   signal Rsd_out : std_logic_vector(5 downto 0);
   signal RegO7 : std_logic_vector(5 downto 0);
   signal nCWP : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Win_Man PORT MAP (
          CWP => CWP,
          Rs1_in => Rs1_in,
          Rs2_in => Rs2_in,
          Rsd_in => Rsd_in,
          Op => Op,
          Op3 => Op3,
          Rs1_out => Rs1_out,
          Rs2_out => Rs2_out,
          Rsd_out => Rsd_out,
          RegO7 => RegO7,
          nCWP => nCWP
        );


   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		CWP <= '1';
		Op <= "10";
		Op3 <= "101101";
		Rs1_in <= "00001";
		Rs2_in <= "10001";
		Rsd_in <= "10010";

      wait;
   end process;

END;
