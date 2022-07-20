library ieee;
use ieee.std_logic_1164.all;

entity reconhecedor1101mealy_tb is
end reconhecedor1101mealy_tb;

architecture behaviour of reconhecedor1101mealy_tb is
    component reconhecedor1101mealy is
        port (
            clk, resetn, w: in std_logic;
            z: out std_logic
        ) ;
    end component;

    constant clk_period : time := 10 ns;

    signal resetn: std_logic;
    signal clk: std_logic;
    signal w: std_logic;
    signal z: std_logic;
    signal entrada: std_logic_vector(7 downto 0);
    shared variable count: integer := 0;
begin
    dut: reconhecedor1101mealy port map (
        clk => clk, resetn => resetn, w => w, z => z
    );

    -- Clock process definition
    clk_process: process
    begin
    if count = 2 then
        wait;
    end if;
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    end process;
    
    process
    begin
        -- vetor de teste 1
        resetn <= '0';
        w <= '0';
        entrada <= "11101101";
        wait for 20 ns;

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
        wait for 20 ns;

        resetn <= '1';
        for i in entrada'range loop
            w <= entrada(i);
            wait for 10 ns;
        end loop;
        count := 2;
        wait;
    end process;
end behaviour ; -- arch