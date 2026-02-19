//TEST contains the ENV
class alu_test extends uvm_test;
    `uvm_component_utils(alu_test);

    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    alu_env env;

    function void build_phase(uvm_phase phase);
        env = alu_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        phase.raise_objection(this);

        `uvm_info("======= STARTING ALU TEST SEQUENCE =======", UVM_LOW)

        phase.drop_objection(this);
    endtask
endclass