library ieee;
use ieee.std_logic_1164.all;

entity or3in is
  port (
    A, B, C: in std_logic;
    S: out std_logic
  ) ;
end or3in;

architecture arch of or3in is
begin
    S <= A or B or C;
end arch ;