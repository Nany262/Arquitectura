
-- VHDL Instantiation Created from source file UControl.vhd -- 15:28:21 04/15/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT UControl
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		OPOut : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	Inst_UControl: UControl PORT MAP(
		OP => ,
		OP3 => ,
		OPOut => 
	);


