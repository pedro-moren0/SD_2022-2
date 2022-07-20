library ieee;
use ieee.std_logic_1164.all;

entity igualdade8x1 is
  port (
    X, Y: in std_logic_vector(1 downto 0);
    Z: out std_logic
  ) ;
end igualdade8x1 ;

architecture bhv of igualdade8x1 is
    component mux8x1 is
        port (
          S: in std_logic_vector(2 downto 0);
          I: in std_logic_vector(7 downto 0);
          Y: out std_logic
        ) ;
    end component;

    constant gabarito0: std_logic_vector(7 downto 0) := "11000011";
    constant gabarito1: std_logic_vector(7 downto 0) := "10000010";

    signal tmp: std_logic;
begin
    mux0: mux8x1 port map (
        S(2) => X(0), S(1) => Y(0), S(0) => '0', I => gabarito0, Y => tmp
    );

    mux1: mux8x1 port map (
        S(2) => X(1), S(1) => Y(1), S(0) => tmp, I => gabarito1, Y => Z
    );
end bhv ; -- bhv