module branch_comp (data1, data2, BrUn, BrLT, BrEq);
    input [31:0] data1;  
    input [31:0] data2;  
    input BrUn;  
    output reg BrLT;         
    output reg BrEq;        


  always @(*) begin
        // Compare equality
        BrEq = (data1 == data2);

        // Compare less than
        if (BrUn) begin
            // Unsigned comparison
            BrLT = (data1 < data2);  // Unsigned comparison
        end else begin
            // Signed comparison
            BrLT = ($signed(data1) < $signed(data2));  // Signed comparison
        end
    end
endmodule

