library verilog;
use verilog.vl_types.all;
entity branch_comp is
    port(
        data1           : in     vl_logic_vector(31 downto 0);
        data2           : in     vl_logic_vector(31 downto 0);
        BrUn            : in     vl_logic;
        BrLT            : out    vl_logic;
        BrEq            : out    vl_logic
    );
end branch_comp;
