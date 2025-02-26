library IEEE;
use IEEE.std_logic_1164.all;

entity mux8_vhd_x16 is
    Port (
        S   : in    STD_LOGIC_VECTOR (2 downto 0);
        D7  : in    STD_LOGIC_VECTOR (15 downto 0);
        D6  : in    STD_LOGIC_VECTOR (15 downto 0);
        D5  : in    STD_LOGIC_VECTOR (15 downto 0);
        D4  : in    STD_LOGIC_VECTOR (15 downto 0);
        D3  : in    STD_LOGIC_VECTOR (15 downto 0);
        D2  : in    STD_LOGIC_VECTOR (15 downto 0);
        D1  : in    STD_LOGIC_VECTOR (15 downto 0);
        D0  : in    STD_LOGIC_VECTOR (15 downto 0);
        O   : out   STD_LOGIC_VECTOR (15 downto 0)
    );
end mux8_vhd_x16;

architecture default of mux8_vhd_x16 is
    component mux_hdl_x16 is
        Port (
            S:  in  STD_LOGIC;
            D1: in  STD_LOGIC_VECTOR (15 downto 0);
            D0: in  STD_LOGIC_VECTOR (15 downto 0);
            O:  out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    component mux4_vhd_x16 is
        Port (
            S:  in  STD_LOGIC_VECTOR (1 downto 0);
            D3: in  STD_LOGIC_VECTOR (15 downto 0);
            D2: in  STD_LOGIC_VECTOR (15 downto 0);
            D1: in  STD_LOGIC_VECTOR (15 downto 0);
            D0: in  STD_LOGIC_VECTOR (15 downto 0);
            O:  out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    signal H: STD_LOGIC_VECTOR (15 downto 0);
    signal L: STD_LOGIC_VECTOR (15 downto 0);

begin
    get_high : mux4_vhd_x16 port map (S(1 downto 0), D7, D6, D5, D4, H);
    get_low  : mux4_vhd_x16 port map (S(1 downto 0), D3, D2, D1, D0, L);
    last     : mux_hdl_x16 port map (S(2), H, L, O);
end default;