------------------------------------------------------------------------------
-- File:    or_gate.vhdl
-- Author:  Jens Kallup - paule32
--
-- License: MIT - only for education, and non-profit !
------------------------------------------------------------------------------
-- used format:
-- ============
-- E_n => Eingang/Input  (Bsp: E_0, E_1, ...)
-- A_n => Ausgang/Output (Bsp: A_0 )
------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------------
-- TTL ODER Gate:
-- ==============
--  E_0     E_1     E_0  +  E_1
-- ----- | -----   ------------
--   0   |   0           0
--   0   |   1           1
--   1   |   0           1
--   1   |   1           1
------------------------------------------------------------------------------
entity or_gate is
    port (
        E_0: in  std_logic;
        E_1: in  std_logic;
        A_0: out std_logic
    );
end entity or_gate;

architecture or_truth_table of or_gate is
begin
    process (E_0, E_1)
    begin
        if  E_0 = '0' and E_1 = '0' then A_0 <= '0'; elsif
            E_0 = '0' and E_1 = '1' then A_0 <= '1'; elsif
            E_0 = '1' and E_1 = '0' then A_0 <= '1'; elsif
            E_0 = '1' and E_1 = '1' then A_0 <= '1';
        end if;
    end process;
end architecture or_truth_table;

configuration or_config of or_gate is
    for or_truth_table
    end for;
end configuration or_config;
