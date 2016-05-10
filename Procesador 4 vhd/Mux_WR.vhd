library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_WR is
    Port ( Rds : in  STD_LOGIC_VECTOR (6 downto 0);
           RegO7 : in  STD_LOGIC_VECTOR (6 downto 0);
           rfDest : in  STD_LOGIC;
           nRds : out  STD_LOGIC_VECTOR (6 downto 0));
end Mux_WR;

architecture Behavioral of Mux_WR is

begin

process(Rds,RegO7,rfDest)
	begin 
	
		if(rfDest = '1') then 
			nRds <= RegO7;
		else
			if(rfDest = '0') then
			nRds <= Rds;
			end if;
		end if;
end process;

end Behavioral;

