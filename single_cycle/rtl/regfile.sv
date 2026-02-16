module dff_reg (clk, in, out);
    parameter BIT_WIDTH = 32;

    input   wire   clk;
    input   wire   [BIT_WIDTH-1:0] in;
    output  reg    [BIT_WIDTH-1:0] out;

    always_ff @(posedge clk) begin
        out <= in;
    end
endmodule