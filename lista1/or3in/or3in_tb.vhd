library ieee;
use ieee.std_logic_1164.all;

-- library work;
-- use work.all;

entity or3in_tb is
end or3in_tb;

architecture behav of or3in_tb is
    component or3in is
        port (
        A, B, C: in std_logic;
        S: out std_logic
        ) ;
    end component;

    signal A: std_logic;
    signal B: std_logic;
    signal C: std_logic;
    signal S: std_logic;

begin
    dut: or3in port map(A=>A, B=>B, C=>C, S=>S);

    process
    begin
        -- vetor de teste 1
        A <= '0';
        B <= '0';
        C <= '0';
        wait for 20 ns;

        -- vetor de teste 2
        A <= '1';
        B <= '0';
        C <= '0';
        wait for 20 ns;

        -- vetor de teste 3
        A <= '0';
        B <= '1';
        C <= '0';
        wait for 20 ns;

        -- vetor de teste 4
        A <= '1';
        B <= '1';
        C <= '0';
        wait for 20 ns;

        -- vetor de teste 5
        A <= '0';
        B <= '0';
        C <= '1';
        wait for 20 ns;

        -- vetor de teste 6
        A <= '1';
        B <= '0';
        C <= '1';
        wait for 20 ns;

        -- vetor de teste 7
        A <= '0';
        B <= '1';
        C <= '1';
        wait for 20 ns;

        -- vetor de teste 8
        A <= '1';
        B <= '1';
        C <= '1';
        wait for 20 ns;
        wait;
    end process;
end behav;