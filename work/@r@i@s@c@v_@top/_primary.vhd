library verilog;
use verilog.vl_types.all;
entity RISCV_Top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end RISCV_Top;
