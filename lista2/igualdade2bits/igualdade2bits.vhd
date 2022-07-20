library ieee;
use ieee.std_logic_1164.all;

entity igualdade2bits is
    port(
        X, Y: in std_logic_vector(1 downto 0);
        Z: out std_logic
    );
end igualdade2bits;

architecture bhv of igualdade2bits is
begin
    Z <= (not(X(0) xor Y(0))) and (not(X(1) xor Y(1)));
end bhv ; -- bhv