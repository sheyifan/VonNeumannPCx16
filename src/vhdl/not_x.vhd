library IEEE;
use IEEE.std_logic_1164.all;

entity not_vhd_x is
    Port (
        I: in   STD_LOGIC;
        O: out  STD_LOGIC
    );
end not_vhd_x;

architecture default of not_vhd_x is
    component nand_vhd_x
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            Y: out  STD_LOGIC
        );
    end component;
begin
    connect: nand_vhd_x port map (I, I, O);
end default;
