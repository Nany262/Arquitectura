
-- VHDL Instantiation Created from source file ALU.vhd -- 15:28:57 04/15/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ALU
	PORT(
		ALU_Op : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(4 downto 0);
		CRS2 : IN std_logic_vector(4 downto 0);          
		ALU_Out : OUT std_logic_vector(4 downto 0)
		);
	END COMPONENT;

	Inst_ALU: ALU PORT MAP(
		ALU_Op => ,
		CRS1 => ,
		CRS2 => ,
		ALU_Out => 
	);


