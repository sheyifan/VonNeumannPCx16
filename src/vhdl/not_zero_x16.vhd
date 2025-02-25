library IEEE;
use IEEE.std_logic_1164.all;

entity not_zero_vhd_x16 is
    Port (
        I: in   STD_LOGIC_VECTOR (15 downto 0);
        O: out  STD_LOGIC
    );
end not_zero_vhd_x16;

architecture default of not_zero_vhd_x16 is
    component or_vhd_x
        Port (
            A: in   STD_LOGIC;
            B: in   STD_LOGIC;
            O: out  STD_LOGIC
        );
    end component;

    signal OR1: STD_LOGIC;
    signal OR2: STD_LOGIC;
    signal OR3: STD_LOGIC;
    signal OR4: STD_LOGIC;
    signal OR5: STD_LOGIC;
    signal OR6: STD_LOGIC;
    signal OR7: STD_LOGIC;
    signal OR8: STD_LOGIC;
    signal OR9: STD_LOGIC;
    signal OR10: STD_LOGIC;
    signal OR11: STD_LOGIC;
    signal OR12: STD_LOGIC;
    signal OR13: STD_LOGIC;
    signal OR14: STD_LOGIC;
    signal OR15: STD_LOGIC;

begin
    or_1:   or_vhd_x port map (I(0), I(1), OR1);
    or_2:   or_vhd_x port map (OR1, I(2), OR2);
    or_3:   or_vhd_x port map (OR2, I(3), OR3);
    or_4:   or_vhd_x port map (OR3, I(4), OR4);
    or_5:   or_vhd_x port map (OR4, I(5), OR5);
    or_6:   or_vhd_x port map (OR5, I(6), OR6);
    or_7:   or_vhd_x port map (OR6, I(7), OR7);
    or_8:   or_vhd_x port map (OR7, I(8), OR8);
    or_9:   or_vhd_x port map (OR8, I(9), OR9);
    or_10:  or_vhd_x port map (OR9, I(10), OR10);
    or_11:  or_vhd_x port map (OR10, I(11), OR11);
    or_12:  or_vhd_x port map (OR11, I(12), OR12);
    or_13:  or_vhd_x port map (OR12, I(13), OR13);
    or_14:  or_vhd_x port map (OR13, I(14), OR14);
    or_15:  or_vhd_x port map (OR14, I(15), OR15);
    O <= OR15;
end default;
    