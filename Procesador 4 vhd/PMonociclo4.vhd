--------------------------------------------------------------------------------
-- Company: UTP
-- Engineer: Vanessa Penagos & Daniela Zuluaga
--
-- Create Date:   17:08:57 04/01/2016
-- Module Name:   Procesador_Monociclo
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PMonociclo4 is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
			  RESULT: out STD_LOGIC_VECTOR(31 downto 0));
			  
end PMonociclo4;

architecture Behavioral of PMonociclo4 is

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
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RegisterFile is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           Rsd : in  STD_LOGIC_VECTOR (5 downto 0);
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
			  WE: in STD_LOGIC;
			  rst: in STD_LOGIC;
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Crsd : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end component;

component UControl is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP2 : in  STD_LOGIC_VECTOR (2 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);  
           rfDest : out  STD_LOGIC;
           rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0); -- PC
           wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC; -- Escritura en RF
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component ALU is
    Port ( ALU_Op : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  Carry: in STD_LOGIC;
           ALU_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux_RSA is
    Port ( Crs32 : in  STD_LOGIC_VECTOR (31 downto 0);
           imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           Data_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MuxRFSource is
    Port ( DataMemory : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFSource : in  STD_LOGIC_VECTOR (1 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component Mux_WR is
    Port ( Rds : in  STD_LOGIC_VECTOR (5 downto 0);
           RegO7 : in  STD_LOGIC_VECTOR (5 downto 0);
           rfDest : in  STD_LOGIC;
           nRds : out  STD_LOGIC_VECTOR (5 downto 0));
end component;

component MuxPC is
    Port ( PCdisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCdisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Address : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
           PCSourceOut : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ExtSigno13 is
    Port ( Dato13 : in  STD_LOGIC_VECTOR (12 downto 0);
           Dato32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ExtSigno22 is
    Port ( Dato22  : in  STD_LOGIC_VECTOR (21 downto 0);
           Dato32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ExtSigno30 is
    Port ( Dato30  : in  STD_LOGIC_VECTOR (29 downto 0);
           Dato32 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PSR_Mody is
    Port ( Alu_Result : in  STD_LOGIC_VECTOR (31 downto 0);
			  AluOp : in STD_LOGIC_VECTOR (5 downto 0);
           Operando1 : in  STD_LOGIC;
           Operando2 : in  STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0);
			  reset: in STD_LOGIC
			  );
end component;

component PSR is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in  STD_LOGIC;
			  icc: out  STD_LOGIC_VECTOR (3 downto 0);
			  cwp : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end component;

component Win_Man is
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
end component;

component DataMemory is
    Port ( Address : in  STD_LOGIC_VECTOR (4 downto 0);
           Data : in  STD_LOGIC_VECTOR (31 downto 0);
           DataToMem: out  STD_LOGIC_VECTOR (31 downto 0);
           WE : in  STD_LOGIC;
			  rst: in STD_LOGIC);
end component;

signal MuxPC_to_nPC: std_logic_vector(31 downto 0);
signal Sum1_to_MuxPC: std_logic_vector(31 downto 0);
signal nPC_to_PCandSum1: std_logic_vector(31 downto 0);
signal PC_to_IMandSum2andSum3andMuxRF: std_logic_vector(31 downto 0);
signal SEU22_to_Sum2: std_logic_vector(31 downto 0);
signal Sum2_to_MuxPC: std_logic_vector(31 downto 0);
signal SEU30_to_Sum3: std_logic_vector(31 downto 0);
signal Sum3_to_MuxPC: std_logic_vector(31 downto 0);
signal IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM: std_logic_vector(31 downto 0);
signal WM_to_RFrs1: std_logic_vector(5 downto 0);
signal WM_to_RFrs2: std_logic_vector(5 downto 0);
signal MuxWR_to_RFrsd: std_logic_vector(5 downto 0);
signal MuxRF_to_RF: std_logic_vector(31 downto 0);
signal RF_to_ALU1andPSRMody: std_logic_vector(31 downto 0);
signal RF_to_MuxRSA: std_logic_vector(31 downto 0);
signal RF_to_DM:  std_logic_vector(31 downto 0);
signal UC_to_RF: std_logic;
signal PSR_to_UC: std_logic_vector(3 downto 0);
signal UC_to_MuxWR: std_logic;
signal UC_to_MuxRF: std_logic_vector(1 downto 0);
signal UC_to_MuxPC: std_logic_vector(1 downto 0);
signal UC_to_DM: std_logic;
signal UC_to_ALUandPSRMody: std_logic_vector(5 downto 0);
signal MuxRSA_to_ALUandPSRMody: std_logic_vector(31 downto 0);
signal ALU_to_DMandPSRModyandMuxPC: std_logic_vector(31 downto 0);
signal SEU13_to_MuxRSA: std_logic_vector(31 downto 0);
signal WM_to_MuxWRrds:std_logic_vector(5 downto 0);
signal WM_to_MuxWRo7:std_logic_vector(5 downto 0);
signal PSRMody_to_PSR: std_logic_vector(3 downto 0);
signal PSR_to_ALU: std_logic;
signal WM_to_PSR: std_logic;
signal PSR_to_WM: std_logic;
signal DM_to_MuxRF:std_logic_vector(31 downto 0);

begin

Inst_nPCounter: PCounter PORT MAP(
		Data_In => MuxPC_to_nPC,
		Reset => RESET,
		Clk => CLK,
		Data_Out => nPc_to_PCandSum1
	);
	
Inst_PCounter: PCounter PORT MAP(
		Data_In => nPc_to_PCandSum1,
		Reset => RESET,
		Clk => CLK,
		Data_Out => PC_to_IMandSum2andSum3andMuxRF
	);

Inst_Sumador1: Sumador PORT MAP(
		Constante => "00000000000000000000000000000001",
		Data_In => nPC_to_PCandSum1,
		Data_Out => Sum1_to_MuxPC
	);
	
Inst_Sumador2: Sumador PORT MAP(
		Constante => PC_to_IMandSum2andSum3andMuxRF,
		Data_In => SEU22_to_SUM2,
		Data_Out => Sum2_to_MuxPC
	);

Inst_Sumador3: Sumador PORT MAP(
		Constante => PC_to_IMandSum2andSum3andMuxRF,
		Data_In =>SEU30_to_Sum3,
		Data_Out => Sum3_to_MuxPC
	);
	
Inst_instructionMemory: instructionMemory PORT MAP(
		address => PC_to_IMandSum2andSum3andMuxRF,
		reset => RESET,
		outInstruction => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM
	);
	
Inst_RegisterFile: RegisterFile PORT MAP(

		Rs1 => WM_to_RFrs1,
		Rs2 => WM_to_RFrs2,
		Rsd => MuxWR_to_RFrsd,
		DataToWrite => MuxRF_to_RF,
		WE=> UC_to_RF ,
		rst => RESET,
		Crs1 => RF_to_ALU1andPSRMody,
		Crs2 => RF_to_MuxRSA,
		Crsd => RF_to_DM
	);
	
Inst_UControl: UControl PORT MAP(
		OP => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(31 downto 30),
		OP3 => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(24 downto 19),
		OP2 => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(24 downto 22),
		Cond => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(28 downto 25),
		icc => PSR_to_UC,  
      rfDest => UC_to_MuxWR,
     	rfSource =>UC_to_MuxRF,
		pcSource =>UC_to_MuxPC,
     	wrEnMem => UC_to_DM,
      wrEnRF => UC_to_RF,
      ALUOP => UC_to_ALUandPSRMody
	);

Inst_ALU: ALU PORT MAP(
		ALU_Op => UC_to_ALUandPSRMody,
		CRS1 => RF_to_ALU1andPSRMody,
		CRS2 => MuxRSA_to_ALUandPSRMody,
		ALU_Out => ALU_to_DMandPSRModyandMuxPC, 
		Carry => PSR_to_ALU
	);

Inst_MUX_RSA: Mux_RSA PORT MAP(		
		Crs32 => RF_to_MuxRSA,
      imm32 => SEU13_to_MuxRSA,
      i=>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(13),
		Data_Out=> MuxRSA_to_ALUandPSRMody
	);
	
Inst_MuxRF: MuxRFSource PORT MAP( 
		DataMemory =>DM_to_MuxRF,
      AluResult =>ALU_to_DMandPSRModyandMuxPC,
      PC =>PC_to_IMandSum2andSum3andMuxRF,
      RFSource=>UC_to_MuxRF,
      DataOut =>MuxRF_to_RF
	);
	
Inst_MuxWR: Mux_WR PORT MAP ( 
		Rds =>WM_to_MuxWRrds,
      RegO7 =>WM_to_MuxWRo7,
      rfDest =>UC_to_MuxWR,
      nRds =>MuxWR_to_RFrsd
	);

Inst_MuxPC: MuxPc PORT MAP ( 
		PCdisp30 =>Sum3_to_MuxPC,
      PCdisp22 =>Sum2_to_MuxPC,
      PC1 =>Sum1_to_MuxPC,
      Address =>ALU_to_DMandPSRModyandMuxPC,
      PCSource =>UC_to_MuxPC,
      PCSourceOut =>MuxPC_to_nPC
	);
	
Inst_SEU13: ExtSigno13 PORT MAP(		
		Dato13 => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(12 downto 0),
      Dato32=> SEU13_to_MuxRSA
	);
	
Inst_SEU22:ExtSigno22 PORT MAP ( 
		Dato22=>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(21 downto 0),
      Dato32=> SEU22_to_SUM2
	);

Inst_SEU30: ExtSigno30 PORT MAP ( 
		Dato30=>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(29 downto 0),
      Dato32=> SEU30_to_Sum3
	);
	
Inst_PSRMody: PSR_Mody PORT MAP(
      Alu_Result => ALU_to_DMandPSRModyandMuxPC,
		AluOp => UC_to_ALUandPSRMody,
      Operando1 => RF_to_ALU1andPSRMody(31),
      Operando2 => MuxRSA_to_ALUandPSRMody(31),
      nzvc => PSRMody_to_PSR,
		reset => RESET
	);

Inst_PSR: PSR PORT MAP(
     Clk => CLK,
     Reset => RESET,
	  ncwp =>WM_to_PSR,
	  cwp=>PSR_to_WM,
	  icc=>PSR_to_UC,
     nzvc => PSRMody_to_PSR,
     Carry =>PSR_to_ALU
	);
	
Inst_WM: Win_Man PORT MAP ( 
	  CWP =>PSR_to_WM,
	  Rs1_in =>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(18 downto 14),
	  Rs2_in =>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(4 downto 0),
	  Rsd_in =>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(29 downto 25),
	  Op =>IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(31 downto 30),
	  Op3 => IM_to_RFandUCandMuxRSAandSEU13andSEU22andSEU30andWM(24 downto 19),
	  Rs1_out =>WM_to_RFrs1,
	  Rs2_out =>WM_to_RFrs2,
	  Rsd_out =>WM_to_MuxWRrds,
	  RegO7=>WM_to_MuxWRo7,
	  nCWP =>WM_to_PSR
	);

Inst_DM: DataMemory PORT MAP (
	  Address =>ALU_to_DMandPSRModyandMuxPC(4 downto 0),
	  Data =>RF_to_DM,
	  WE =>UC_to_DM,
	  DataToMem=>DM_to_MuxRF,
	  rst=>RESET
	);
	
RESULT<= ALU_to_DMandPSRModyandMuxPC;
  
end Behavioral;