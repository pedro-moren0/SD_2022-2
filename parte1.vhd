library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity parte1 is
	port(
		key: in std_logic_vector(1 downto 0);
		hex: out std_logic_vector(6 downto 0)
	);
end parte1;

architecture bhv of parte1 is
	
	component ContadorBinario50M is
		port(
			entry: in std_logic;
			saida: out std_logic
		);
	end component;
	
	component ContadorBinario is
		port(
			KEY: in std_logic_vector(1 downto 0);
			LEDG: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component sete_segmentos is
		port(
			valor_bin: in std_logic_vector(3 downto 0);
			HEX0: out std_logic_vector(6 downto 0)
		);
	end component;

	
	signal contadorOutput: std_logic_vector(3 downto 0);
	signal clkOutput: std_logic;
begin
	clk_reduz: ContadorBinario50M port map(
		entry => key(0), saida => clkOutput
	);
	
	contador: ContadorBinario port map(
		KEY(0) => clkOutput, KEY(1) => key(1), LEDG => contadorOutput
	);
	
	seg: sete_segmentos port map(
		valor_bin => contadorOutput, HEX0 => hex
	);
end bhv;