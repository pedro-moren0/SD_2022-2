library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity parte1_tb is
end parte1_tb;

architecture sim of parte1_tb is
	component parte1 is
		port(
			key: in std_logic_vector(1 downto 0);
			hex: out std_logic_vector(6 downto 0)
		);
	end component;
	
	signal x: std_logic_vector(1 downto 0);
	signal y: std_logic_vector(6 downto 0);
	constant key0_test: std_logic_vector(8 downto 0) := "010101010";
	constant key1_test: std_logic_vector(2 downto 0) := "010";
begin
	uut: parte1 port map(
		key => x, hex => y
	);

	teste: process
	begin
		-- testando key0
		for i in 0 to 8 loop
			x(1) <= '0';
			x(0) <= key0_test(i);
			wait for 10 ns;
		end loop;
		
		for i in 0 to 2 loop
			x(1) <= key1_test(i);
			x(0) <= '0';
			wait for 10 ns;
		end loop;
		
		wait;
	end process;
end sim;