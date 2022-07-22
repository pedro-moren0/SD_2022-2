library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
    port( clk : in std_logic;
        resetn : in std_logic;
        av_princ : out std_logic_vector(0 to 2);
        av_sec : out std_logic_vector(0 to 2)
    );
end semaforo;

architecture bhv of semaforo is
    type t_state is (A, B, C, D, E, F, G);
    signal y: t_state;
begin
    state_logic: process(clk, resetn)
    begin
        if resetn = '0' then
            y <= A; -- estado inicial
        elsif (clk'event and clk = '1') then
            case y is
                when A => -- output state
                    y <= B;
                when B => -- wait state
                    y <= C;
                when C => -- wait state
                    y <= D;
                when D => -- output state
                    y <= E;
                when E => -- output state
                    y <= F;
                when F => -- wait state
                    y <= G;
                when G => -- output state
                    y <= A;
                end case;
        end if ;
    end process;

    -- moore
    output_logic: process(y)
    begin
        case y is
            when A =>
                av_princ <= "100";
                av_sec <= "001";
            when D =>
                av_princ <= "010";
                av_sec <= "001";
            when E =>
                av_princ <= "001";
                av_sec <= "100";
            when G =>
                av_princ <= "001";
                av_sec <= "010";
            when others =>
        end case;
    end process;
end bhv ; -- bhv