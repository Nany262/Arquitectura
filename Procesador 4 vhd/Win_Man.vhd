library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Win_Man is
    Port ( CWP : in  STD_LOGIC;
           Rs1_in : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2_in : in  STD_LOGIC_VECTOR (4 downto 0);
           Rsd_in : in  STD_LOGIC_VECTOR (4 downto 0);
           Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rs1_out : out  STD_LOGIC_VECTOR (5 downto 0);
           Rs2_out : out  STD_LOGIC_VECTOR (5 downto 0);
           Rsd_out : out  STD_LOGIC_VECTOR (5 downto 0);
			  RegO7: out  STD_LOGIC_VECTOR (5 downto 0);
           nCWP : out  STD_LOGIC);
end Win_Man;

architecture Behavioral of Win_Man  is

signal Rs1_integer: integer range 0 to 39:=0;
signal Rs2_integer: integer range 0 to 39:=0;
signal Rsd_integer: integer range 0 to 39:=0;
signal auxregO7: integer range 0 to 39:=0;

begin

process(CWP,Rs1_in,Rs2_in,Rsd_in,Op,Op3)
begin
auxregO7<=conv_integer(CWP)*16;
RegO7<=conv_std_logic_vector(auxregO7,6)+"01111";
-----------------------Save-Restore------------------------
if(Op = "10" and Op3 = "111100")then--SAVE
				nCWP <= '0';
			else
				if(op = "10" and op3 = "111101")then--RESTORE
					nCWP <= '1';
				end if;
			end if;
-----------------------Rs1_in------------------------------

if(Rs1_in>="00000" and Rs1_in<="00111") then
			Rs1_integer <= conv_integer(Rs1_in);
		else
			if(Rs1_in>="11000" and Rs1_in<="11111") then
				Rs1_integer <= conv_integer(Rs1_in)-(conv_integer(CWP)*16);
			else
				if(Rs1_in>="10000" and Rs1_in<="10111") then
					Rs1_integer <= conv_integer(Rs1_in)+(conv_integer(CWP)*16);
				else
						if(Rs1_in>="01000" and Rs1_in<="01111") then
							Rs1_integer <= conv_integer(Rs1_in)+ (conv_integer(CWP)*16);
						end if;
				end if;
			end if;
		end if;

-----------------------Rs2_in------------------------------

if(Rs2_in>="00000" and Rs2_in<="00111") then
			Rs2_integer <= conv_integer(Rs2_in);
		else
			if(Rs2_in>="11000" and Rs2_in<="11111") then
				Rs2_integer <= conv_integer(Rs2_in)-(conv_integer(CWP)*16);
			else
				if(Rs2_in>="10000" and Rs2_in<="10111") then
					Rs2_integer <= conv_integer(Rs2_in)+(conv_integer(CWP)*16);
				else
						if(Rs2_in>="01000" and Rs2_in<="01111") then
							Rs2_integer <= conv_integer(Rs2_in)+ (conv_integer(CWP)*16);
						end if;
				end if;
			end if;
		end if;
		
-----------------------Rsd_in------------------------------

if(Rsd_in>="00000" and Rsd_in<="00111") then
			Rsd_integer <= conv_integer(Rsd_in);
		else
			if(Rsd_in>="11000" and Rsd_in<="11111") then
				Rsd_integer <= conv_integer(Rsd_in)-(conv_integer(CWP)*16);
			else
				if(Rsd_in>="10000" and Rsd_in<="10111") then
					Rsd_integer <= conv_integer(Rsd_in)+(conv_integer(CWP)*16);
				else
						if(Rsd_in>="01000" and Rsd_in<="01111") then
							Rsd_integer <= conv_integer(Rsd_in)+ (conv_integer(CWP)*16);
						end if;
				end if;
			end if;
		end if;
-----------------------------------------------------------
end process;

Rs1_out<= conv_std_logic_vector(Rs1_integer, 6);
Rs2_out <= conv_std_logic_vector(Rs2_integer, 6);
Rsd_out <= conv_std_logic_vector(Rsd_integer, 6);

end Behavioral;

