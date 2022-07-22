library ieee;
use ieee.std_logic_1164.all;

entity semaforo_tb is
end semaforo_tb;

architecture behav of semaforo_tb is
    component semaforo is
        port( clk : in std_logic;
            resetn : in std_logic;
            av_princ : out std_logic_vector(0 to 2);
            av_sec : out std_logic_vector(0 to 2)
        );
    end component;

    constant clk_period : time := 20 ns;
    constant clk_max : integer := 20;
    signal clk : std_logic := '0';
    signal resetn: std_logic;
    signal avp: std_logic_vector(0 to 2);
    signal avs: std_logic_vector(0 to 2);
begin
    uut: semaforo port map (
        clk => clk, resetn => resetn, av_princ => avp, av_sec => avs
    );

    process
    begin
        for count_value in 0 to clk_max loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    process
    begin
        resetn <= '0';
        wait for clk_period;
        resetn <= '1';
        wait;
    end process;
end behav;