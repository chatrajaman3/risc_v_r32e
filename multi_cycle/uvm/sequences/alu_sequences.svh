class alu_transaction extends uvm_sequence_item;

    `uvm_object_utils(alu_transaction)

    //convert transaction into a string
    function string convert2string;
        return $sformatf("in1=%d, in2=%d, op=%b", in1, in2, opcode);
    endfunction

    //inputs to be randomized
    rand bit [31:0] in1, in2;
    rand bit [3:0] opcode;

    //output
    bit [31:0] out;

    //rand constraints
    constraint c_in1    { in1>=0; in1<=(2**32)-1;}
    constraint c_in2    { in1>=0; in1<=(2**32)-1;}
    constraint c_opcode { op>=4'b0000; op<=4'b1111;}

    //constructor
    function new (string name = "");
        super.new(name);
    endfunction
endclass


class alu_sequence extends uvm_sequence#(alu_transaction);

    `uvm_object_utils(alu_sequence)

    function new (string name = "");
        super.new(name);
    endfunction

    task body;
        repeat (20) begin
            req = alu_transaction::type_id::create("req");

            start_item(req);

            if (!req1.randomize()) begin
                `uvm_error("ALU_SEQUENCE", "Randomize failed.");
            end

            finish_item(req);
        end
    endtask
endclass