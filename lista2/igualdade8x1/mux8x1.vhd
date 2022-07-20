library ieee;
use ieee.std_logic_1164.all;

entity mux8x1 is
  port (
    S: in std_logic_vector(2 downto 0);
    I: in std_logic_vector(7 downto 0);
    Y: out std_logic
  ) ;
end mux8x1;

architecture bhv of mux8x1 is
begin
    Y <= I(0) when S = "000" else
    I(1) when S = "001" else
    I(2) when S = "010" else
    I(3) when S = "011" else
    I(4) when S = "100" else
    I(5) when S = "101" else
    I(6) when S = "110" else
    I(7) when S = "111" else
    'X';
end bhv ; -- bhv