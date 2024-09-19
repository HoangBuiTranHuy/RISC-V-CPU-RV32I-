library verilog;
use verilog.vl_types.all;
entity Mux2 is
    port(
        Sel             : in     vl_logic;
        A2              : in     vl_logic_vector(31 downto 0);
        B2              : in     vl_logic_vector(31 downto 0);
        Mux2_out        : out    vl_logic_vector(31 downto 0)
    );
end Mux2;
