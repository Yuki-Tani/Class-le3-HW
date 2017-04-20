library verilog;
use verilog.vl_types.all;
entity counter10x4 is
    port(
        clock           : in     vl_logic;
        LED             : out    vl_logic_vector(7 downto 0);
        selecters       : out    vl_logic_vector(3 downto 0);
        overflow        : out    vl_logic
    );
end counter10x4;
