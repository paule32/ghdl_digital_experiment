------------------------------------------------------------------------------
-- File:    master.vhdl
-- Author:  Jens Kallup - paule32
--
-- License: MIT - only for education, and non-profit !
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.all;

entity master is
end entity master;

architecture behavior of master is
    signal E0, E1, A0_and, A0_or: std_logic;
begin
    -- Instanzen
    and_gate_instance: entity and_gate
        port map (
            E_0 => E0,
            E_1 => E1,
            A_0 => A0_and
        );
    or_gate_instance: entity or_gate
        port map (
            E_0 => E0,
            E_1 => E1,
            A_0 => A0_or
        );
end architecture behavior;
