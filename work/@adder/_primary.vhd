library verilog;
use verilog.vl_types.all;
entity Adder is
    port(
        in_1            : in     vl_logic_vector(31 downto 0);
        in_2            : in     vl_logic_vector(31 downto 0);
        sum             : out    vl_logic_vector(31 downto 0)
    );
end Adder;
