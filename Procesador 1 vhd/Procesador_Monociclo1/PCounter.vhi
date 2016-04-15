
-- VHDL Instantiation Created from source file PCounter.vhd -- 15:11:21 04/15/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT PCounter
	PORT(
		Data_In : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;
		Clk : IN std_logic;          
		Data_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_PCounter: PCounter PORT MAP(
		Data_In => ,
		Reset => ,
		Clk => ,
		Data_Out => 
	);


