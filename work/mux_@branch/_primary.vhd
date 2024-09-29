library verilog;
use verilog.vl_types.all;
entity mux_Branch is
    port(
        Branch          : in     vl_logic;
        plus4           : in     vl_logic_vector(31 downto 0);
        pcimm           : in     vl_logic_vector(31 downto 0);
        muxBranch_Out   : out    vl_logic_vector(31 downto 0)
    );
end mux_Branch;
