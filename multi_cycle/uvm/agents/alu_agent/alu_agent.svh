//AGENT contains the SEQUENCER, DRIVER and MONITOR
class alu_agent extends uvm_agent;

    `uvm_component_utils(alu_agent);

    //create driver, monitor and sequencer
    alu_driver driver;
    alu_monitor monitor;
    uvm_sequencer#(alu_transaction) sequencer;

    //constructor
    function new (string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    //build phase
    function void build_phase(ucm_phase phase);

        driver = alu_driver::type_id::create("driver", this);

        monitor = alu_monitor::type_id::create("monitor", this);

        sequencer = uvm_sequencer#(alu_transaction)::type_id::create("sequencer", this);
    endfunction

    //connect phase
    function void connect_phase (uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction

    //run phase
    task run_phase(uvm_phase phase);

        phase.raise_objection(this);

        begin
            alu_sequence seq;

            seq = alu_sequence::type_id::create("seq");

            seq.start(sequencer);
        end

        phase.drop_objection(this);
    endtask
endclass