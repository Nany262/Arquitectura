--------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
--
-- Create Date:   17:08:57 04/01/2016
-- Module Name:   Procesador_Monociclo1
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PMonociclo1 is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
			  RESULT: out STD_LOGIC_VECTOR(31 downto 0));
			  
end PMonociclo1;

architecture Behavioral of PMonociclo1 is

component PCounter is
    Port ( Data_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Sumador is
    Port ( Constante : in  STD_LOGIC_VECTOR (31 downto 0);
           Data_In : in  STD_LOGIC_VECTOR (31 downto 0);
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component instructionMemory is
    Port ( 
			  --clk : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RegisterFile is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rsd : in  STD_LOGIC_VECTOR (4 downto 0);
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  rst: in STD_LOGIC);
end component;

component UControl is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           OPOut : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component ALU is
    Port ( ALU_Op : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALU_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal sum_to_nPC: std_logic_vector(31 downto 0);
signal nPC_to_PCandSum: std_logic_vector(31 downto 0);
signal PC_to_IM: std_logic_vector(31 downto 0);
signal IM_to_RFandUC: std_logic_vector(31 downto 0);
signal RF_to_ALU1: std_logic_vector(31 downto 0);
signal RF_to_ALU2: std_logic_vector(31 downto 0);
signal ALU_to_RF: std_logic_vector(31 downto 0);
signal UC_to_ALU: std_logic_vector(5 downto 0);

begin

Inst_nPCounter: PCounter PORT MAP(
		Data_In => sum_to_nPC,
		Reset => RESET,
		Clk => CLK,
		Data_Out => nPc_to_PCandSum
	);
	
Inst_PCounter: PCounter PORT MAP(
		Data_In => nPc_to_PCandSum,
		Reset => RESET,
		Clk => CLK,
		Data_Out => PC_to_IM
	);

Inst_Sumador: Sumador PORT MAP(
		Constante => "00000000000000000000000000000001",
		Data_In => nPC_to_PCandSum,
		Data_Out => sum_to_nPC
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => PC_to_IM,
		reset => RESET,
		outInstruction => IM_to_RFandUC 
	);
	
Inst_RegisterFile: RegisterFile PORT MAP(

		Rs1 => IM_to_RFandUC(18 downto 14),
		Rs2 => IM_to_RFandUC(4 downto 0),
		Rsd => IM_to_RFandUC(29 downto 25),
		DataToWrite => ALU_to_RF,
		Crs1 => RF_to_ALU1,
		Crs2 => RF_to_ALU2,
		rst => RESET
	);
	
Inst_UControl: UControl PORT MAP(
		OP => IM_to_RFandUC(31 downto 30),
		OP3 => IM_to_RFandUC(24 downto 19),
		OPOut => UC_to_ALU
	);

Inst_ALU: ALU PORT MAP(
		ALU_Op => UC_to_ALU,
		CRS1 => RF_to_ALU1,
		CRS2 => RF_to_ALU2,
		ALU_Out => ALU_to_RF 
	);

RESULT<= ALU_to_RF;
  
end Behavioral;

