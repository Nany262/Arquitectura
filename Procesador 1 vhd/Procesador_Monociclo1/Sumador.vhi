
-- VHDL Instantiation Created from source file Sumador.vhd -- 15:14:28 04/15/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Sumador
	PORT(
		Constante : IN std_logic_vector(31 downto 0);
		Data_In : IN std_logic_vector(31 downto 0);          
		Data_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Sumador: Sumador PORT MAP(
		Constante => ,
		Data_In => ,
		Data_Out => 
	);


