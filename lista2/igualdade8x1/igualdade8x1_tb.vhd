library ieee;
use ieee.std_logic_1164.all;

entity igualdade8x1_tb is
end igualdade8x1_tb;

architecture bhv of igualdade8x1_tb is
    component igualdade8x1 is
        port (
          X, Y: in std_logic_vector(1 downto 0);
          Z: out std_logic
        ) ;
    end component;

    signal X, Y: std_logic_vector(1 downto 0); 
    signal Z: std_logic;
begin
    uut: igualdade8x1 port map (
        X => X, Y => Y, Z => Z
    );

    process
    begin
        -- teste 1
        X <= "00";
        Y <= "00";
        wait for 10 ns;

        -- teste 2
        X <= "00";
        Y <= "01";
        wait for 10 ns;

        -- teste 3
        X <= "10";
        Y <= "10";
        wait for 10 ns;

        -- teste 4
        X <= "00";
        Y <= "11";
        wait for 10 ns;

        -- teste 5
        X <= "11";
        Y <= "11";
        wait for 10 ns;
        wait;
    end process;
end bhv ; -- bhv