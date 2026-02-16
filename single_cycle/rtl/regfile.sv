module dff_reg (clk, in, out);
    parameter BIT_WIDTH = 32;

    input   wire   clk;
    input   wire   [BIT_WIDTH-1:0] in;
    output  reg    [BIT_WIDTH-1:0] out;

    always_ff @(posedge clk) begin
        out <= in;
    end
endmodule

module regfile (clk, in, out);
    parameter BIT_WIDTH = 32;

    input   wire   clk;
    input   wire   [BIT_WIDTH-1:0] in;

    output  reg    [BIT_WIDTH-1:0] out;

    wire [BIT_WIDTH-1:0] x [15:0];

    always_ff @(posedfe clk) begin
        

    end
    


endmodule