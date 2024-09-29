library verilog;
use verilog.vl_types.all;
entity mux_ALUPCimm is
    port(
        PC_in           : in     vl_logic_vector(31 downto 0);
        mux_Read_data1  : in     vl_logic_vector(31 downto 0);
        Asel            : in     vl_logic;
        ALUPCimm_out    : out    vl_logic_vector(31 downto 0)
    );
end mux_ALUPCimm;
