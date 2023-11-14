library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM is
    port(
    CLK : in std_logic;
    s_write : in std_logic;
    address : in integer;
    out_mem : out std_logic_vector(3 downto 0);
    m_in : in std_logic_vector(3 downto 0)
    );
end entity MEM;

architecture MemArch of MEM is
    type MEMORY_N_4 is array (0 to 15) of std_logic_vector(3 downto 0);
    signal MEMO : MEMORY_N_4;
    begin
        process (CLK)
            begin
                if (rising_edge(CLK) and s_write = '1') then
                    MEMO(address) <= m_in;
                end if;
            end process;
        out_mem <= MEMO(address);    
end MemArch;
