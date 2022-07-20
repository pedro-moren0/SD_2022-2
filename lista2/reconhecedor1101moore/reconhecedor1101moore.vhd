library ieee;
use ieee.std_logic_1164.all;

entity reconhecedor1101moore is
  port (
    clk, resetn, w: in std_logic;
    z: out std_logic
  ) ;
end reconhecedor1101moore;

architecture behaviour of reconhecedor1101moore is
    type State_type is (A, B, C, D, E);
    signal y: State_type;
begin
    -- mudar esses dois
    -- logica de mudanca de estado
    process(clk, resetn)
    begin
        if resetn = '0' then
            y <= A; -- estado inicial
        elsif (clk'event and clk = '1') then
            case y is
                when A =>
                    if w = '0' then y <= A;
                    else y <= B;
                    end if;
                when B =>
                    if w = '0' then y <= A;
                    else y <= C;
                    end if;
                when C =>
                    if w = '0' then y <= D;
                    else y <= C;
                    end if;
                when D =>
                    if w = '0' then y <= A;
                    else y <= B;
                    end if;
            end case;
        end if ;
    end process;

    -- logica de saida
    process(w, y)
    begin
        case y is
            when D =>
                if w = '1' then z <= '1';
                else z <= '0';
                end if;
            when others =>
                z <= '0';
        end case;
    end process;
end behaviour;