library ieee;
use ieee.std_logic_1164.all;

entity somador4bits_tb is
end somador4bits_tb;

architecture arch of somador4bits_tb is
    component somador4bits is
        port (
            X, Y: in std_logic_vector(3 downto 0);
            S: out std_logic_vector(3 downto 0);
            Cout: out std_logic
        ) ;
    end component;

    signal A: std_logic_vector(3 downto 0);
    signal B: std_logic_vector(3 downto 0);
    signal S: std_logic_vector(3 downto 0);
    signal C: std_logic;
begin
    dut: somador4bits port map (
        X => A, Y => B, S => S, Cout => C
    );

    process
    begin
        -- vetor de teste 1
        A <= "0000";
        B <= "0000";
        wait for 20 ns;

        -- vetor de teste 2
        A <= "1111";
        B <= "0001";
        wait for 20 ns;

        -- vetor de teste 3
        A <= "1111";
        B <= "1111";
        wait for 20 ns;

        -- vetor de teste 4
        A <= "0110"; -- 6
        B <= "0111"; -- 7
        wait for 20 ns;
        wait;
    end process;
end arch ; -- arch