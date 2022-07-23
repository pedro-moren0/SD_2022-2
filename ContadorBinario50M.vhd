library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ContadorBinario50M is
	port(
		entry: in std_logic;
		saida: out std_logic
	);
end ContadorBinario50M;

architecture comportamental of ContadorBinario50M is
	shared variable tmp: integer := 0;
	signal s: std_logic := '0';
begin
	process (entry)
	begin
		if (entry = '1') then
			tmp := tmp + 1;
		end if;
	end process;
	
	process(entry)
	begin
		if (tmp <= 50000000) then
			s <= (not s);
			tmp := 0;
		end if;
	end process;
	
	saida <= s;
end;
