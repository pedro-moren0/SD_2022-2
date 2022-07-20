library ieee;
use ieee.std_logic_1164.all;

entity maquina is
  port (
    clk, resetn, w: in std_logic;
    z: out std_logic
  ) ;
end maquina;

architecture bhv of maquina is
    type t_state is (A, B, C);
    signal y: t_state;
begin
    state_logic: process(clk, resetn)
    begin
        if resetn = '0' then
            y <= A; -- estado inicial
        elsif (clk'event and clk = '1') then
            case y is
                when A =>
                    if w = '0' then y <= B;
                    else y <= C;
                    end if;
                when B =>
                    if w = '0' then y <= B;
                    else y <= C;
                    end if;
                when C =>
                    if w = '0' then y <= A;
                    else y <= B;
                    end if;
            end case;
        end if;
    end process;

    output_logic: process(y, w)
    begin
        if y = B then z <= '0';
        else z <= '1';
        end if ;
    end process;
end bhv ; -- bhv