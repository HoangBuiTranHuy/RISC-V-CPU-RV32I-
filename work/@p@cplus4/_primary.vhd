library verilog;
use verilog.vl_types.all;
entity PCplus4 is
    port(
        fromPC          : in     vl_logic_vector(31 downto 0);
        NexttoPC        : out    vl_logic_vector(31 downto 0)
    );
end PCplus4;
