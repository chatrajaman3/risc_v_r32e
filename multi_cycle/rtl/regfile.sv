module dff_reg (clk, in, out);
    parameter BIT_WIDTH = 32;

    input   wire   clk;
    input   wire   [BIT_WIDTH-1:0] in;
    output  reg    [BIT_WIDTH-1:0] out;

    always_ff @(posedge clk) begin
        out <= in;
    end
endmodule

module regfile (clk, data_in, write_en, write_reg, read_reg, data_out);
    parameter BIT_WIDTH = 32;

    input   wire   clk;                     //clk signal
    input   wire   [BIT_WIDTH-1:0] data_in; //data in
    input   wire   write_en;                //write enable
    input   wire   [3:0] write_reg;         //register to be written
    input   wire   [3:0] read_reg;          //register to be read


    output  reg    [BIT_WIDTH-1:0] data_out;//data output bus

    reg [BIT_WIDTH-1:0] x [15:0];          //create registers

    assign x[0] = `0;

    always_ff @(posedge clk) begin
        //write to reg if write_en high
        if (write_en) begin
            x[write_reg] <= data_in;
        end
    end

    assign data_out = x[read_reg];          //data output is at read_reg value
endmodule