library ieee;
use ieee.std_logic_1164.all;

entity somadorCompleto is
  port (
    cin, x, y: in std_logic;
    s, cout: out std_logic
  ) ;
end somadorCompleto;

architecture comportamental of somadorCompleto is
begin
    s <= x xor y xor cin;
    cout <= (x and y) or (y and cin) or (x and cin);
end comportamental ; -- comportamental