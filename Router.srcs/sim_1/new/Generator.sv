`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 04:55:56 PM
// Design Name: 
// Module Name: Generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`ifndef INC_GENERATOR_SV
`define INC_GENERATOR_SV

class Generator;
    string name;
    rand Packet pkt2send;
    pkt_mbox out_box;
    int run_for_n_packets;

    extern function new(string name = "GEN", int run_for_n_packets = 0);
    extern task start();
endclass: Generator

function Generator::new(string name, int run_for_n_packets);
    this.name = name;
    this.run_for_n_packets = run_for_n_packets;
endfunction:new

task Generator::start();
    int i = 0;
    forever begin
        if (run_for_n_packets > 0 && i >= run_for_n_packets) break;
        pkt2send = new($sformatf("%s_PKT", name));
        pkt2send.sa = $urandom_range(0, 15);
        pkt2send.da = $urandom_range(0, 15);
        pkt2send.payload.delete();
        pkt2send.pkt2cmp_payload.delete();
        repeat ($urandom_range(2, 4)) begin
            pkt2send.payload.push_back($urandom($time));
        end
        out_box.put(pkt2send.copy());
        i++;
    end
endtask:start

`endif

