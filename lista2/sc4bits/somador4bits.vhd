library ieee;
use ieee.std_logic_1164.all;

entity somador4bits is
  port (
    X, Y: in std_logic_vector(3 downto 0);
    S: out std_logic_vector(3 downto 0);
    Cout: out std_logic
  ) ;
end somador4bits;

architecture arch of somador4bits is
    component somadorCompleto is
        port(
            Cin, X, Y: in std_logic;
            S, Cout: out std_logic
        );
    end component;
    
    signal I: std_logic_vector(2 downto 0);
begin
    SC0: somadorCompleto port map (
        Cin => '0', X => X(0), Y => Y(0), S => S(0), Cout => I(0)
    );
    SC1: somadorCompleto port map (
        Cin => I(0), X => X(1), Y => Y(1), S => S(1), Cout => I(1)
    );
    SC2: somadorCompleto port map (
        Cin => I(1), X => X(2), Y => Y(2), S => S(2), Cout => I(2)
    );
    SC3: somadorCompleto port map (
        Cin => I(2), X => X(3), Y => Y(3), S => S(3), Cout => Cout
    );
end arch ; -- arch