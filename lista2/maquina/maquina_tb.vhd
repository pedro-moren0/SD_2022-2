library ieee;
use ieee.std_logic_1164.all;

entity maquina_tb is
end maquina_tb;

architecture bhv of maquina_tb is
    component maquina is
        port (
          clk, resetn, w: in std_logic;
          z: out std_logic
        ) ;
    end component;
    signal clk, resetn, w, z: std_logic;
    signal entrada: std_logic_vector(7 downto 0);
    constant clk_period: time := 10 ns;
    shared variable count: integer := 0;
begin

    uut: maquina port map (
        clk => clk, resetn => resetn, w => w, z => z
    );

    clock_process: process
    begin
        if count = 2 then
            wait;
        end if;
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    maquina_test: process
    begin
        -- vetor de teste 1
        resetn <= '0';
        w <= '0';
        entrada <= "11101101";
        wait for clk_period * 2;

        resetn <= '1';
        for i in entrada'range loop
            w <= entrada(i);
            wait for 10 ns;
        end loop;
        count := 1;

        -- vetor de teste 2
        resetn <= '0';
        w <= '0';
        entrada <= "01011001";
        wait for clk_period * 2;

        resetn <= '1';
        for i in entrada'range loop
            w <= entrada(i);
            wait for 10 ns;
        end loop;
        count := 2;

        resetn <= '0';
        wait;
    end process;
end bhv ; -- bhv