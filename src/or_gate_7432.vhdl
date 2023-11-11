------------------------------------------------------------------------------
-- File:    or_gate_7432.vhdl
-- Author:  (c) 2023 Jens Kallup - paule32
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
-- 7432 Quad 2-Eingangs-Logik ODER Gatter:
-- =======================================
--  Vcc
--    14 13 12     11   10  9      8
--     |  |  |      |    |  |      |
--     |  +  +      +    +  +      +
-- )---o--|--|------|----|--|------|---(
-- |      +  +      +    +  +      +   |
-- |      |  |      |    |  |      |   |
-- |      |  +--\   |    |  +--\   |   |
-- |      |      +--+    |      +--+   |
--  )     +-----/        +-----/       |
--  )                                  |
--  )  +-----\        +-----\          |
-- |   |      +--+    |      +--+      |
-- |   |  +--/   |    |  +--/   |      |
-- |   |  |      |    |  |      |      |
-- |   +  +      +    +  +      +      |
-- )---|--|------|----|--|------|--o---(
--     +  +      +    +  +      +  |
--     |  |      |    |  |      |  |
--     1  2      3    4  5      6  7 
--                                 Gnd
------------------------------------------------------------------------------
-- TTL ODER Gate:
-- ==============
--  E_0     E_1    E_2     E_3    E_4     E_5    E_6     E_7      E_0  +  E_1
-- ----- | -----  ----- | -----  ----- | -----  ----- | -----    ------------
--   0   |   0      0   |   0      0   |   0      0   |   0            0
--   0   |   1      0   |   1      0   |   1      0   |   1            1
--   1   |   0      1   |   0      1   |   0      1   |   0            1
--   1   |   1      1   |   1      1   |   1      1   |   1            1
------------------------------------------------------------------------------
entity or_gate_7432 is
    port (
        E_0: in  std_logic;  --  1 in
        E_1: in  std_logic;  --  2 in
        A_0: out std_logic;  --  3 out
        
        E_2: in  std_logic;  --  4 in
        E_3: in  std_logic;  --  5 in
        A_1: out std_logic;  --  6 out
        
        A_2: out std_logic;  --  8 out
        E_4: in  std_logic;  --  9 in
        E_5: in  std_logic;  -- 10 in
        
        A_3: out std_logic;  -- 11 out
        E_6: in  std_logic;  -- 12 in
        E_7: in  std_logic   -- 13 in
    );
end entity or_gate_7432;

architecture or_7432_truth_table of or_gate_7432 is
begin
    process (E_0, E_1)
    begin
        if  E_0 = '0' or E_1 = '0' then A_0 <= '0'; elsif
            E_0 = '0' or E_1 = '1' then A_0 <= '1'; elsif
            E_0 = '1' or E_1 = '0' then A_0 <= '1'; elsif
            E_0 = '1' or E_1 = '1' then A_0 <= '1'; elsif
            
            E_2 = '0' or E_3 = '0' then A_1 <= '0'; elsif
            E_2 = '0' or E_3 = '1' then A_1 <= '1'; elsif
            E_2 = '1' or E_3 = '0' then A_1 <= '1'; elsif
            E_2 = '1' or E_3 = '1' then A_1 <= '1'; elsif
            
            E_4 = '0' or E_5 = '0' then A_2 <= '0'; elsif
            E_4 = '0' or E_5 = '1' then A_2 <= '1'; elsif
            E_4 = '1' or E_5 = '0' then A_2 <= '1'; elsif
            E_4 = '1' or E_5 = '1' then A_2 <= '1'; elsif
            
            E_6 = '0' or E_7 = '0' then A_3 <= '0'; elsif
            E_6 = '0' or E_7 = '1' then A_3 <= '1'; elsif
            E_6 = '1' or E_7 = '0' then A_3 <= '1'; elsif
            E_6 = '1' or E_7 = '1' then A_3 <= '1';
        end if;
    end process;
end architecture or_7432_truth_table;

configuration or_7432_config of or_gate_7432 is
    for or_7432_truth_table
    end for;
end configuration or_7432_config;
