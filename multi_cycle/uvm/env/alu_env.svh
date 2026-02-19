//ENV contains AGENT + SCOREBOARD
class alu_env extends uvm_env;

    `uvm_component_utils(alu_env);

    alu_agent agent;

    alu_scoreboard scoreboard;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        agent = alu_agent::type_id::create("agent", this);
        scoreboard = alu_scoreboard::type_id::create("Scoreboard", this);
    endfunction

    //connects data from MONITOR into the SCOREBOARD
    function void connect_phase(uvm_phase phase);
        agent.monitor.monitor_analysis_port.connect(scoreboard.analysis_export);
    endfunction
endclass