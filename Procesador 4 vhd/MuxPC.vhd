
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MuxPC is
    Port ( PCdisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCdisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
           PCSourceOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxPC;

architecture Behavioral of MuxPC is

begin

	process(PCdisp30,Pcdisp22,Pc1,Address,PcSource)
	begin
			case PCSource is
				when "00" =>
						PCSourceOut <= Address;
				when "01" => 
						PCSourceOut <= Pcdisp30;
				when "10" =>
						PCSourceOut <= PCdisp22;
				when others => 
						PCSourceOut <= PC1;
						
			end case;
	end process;
end Behavioral;

