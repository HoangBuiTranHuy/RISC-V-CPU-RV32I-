library verilog;
use verilog.vl_types.all;
entity Mux1 is
    port(
        Sel             : in     vl_logic;
        A1              : in     vl_logic_vector(31 downto 0);
        B1              : in     vl_logic_vector(31 downto 0);
        Mux1_out        : out    vl_logic_vector(31 downto 0)
    );
end Mux1;
