`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 09:35:47 AM
// Design Name: 
// Module Name: Receiver
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


`ifndef INC_RECEIVER_SV
`define INC_RECEIVER_SV
`include "ReceiverBase.sv"
typedef class Packet;
typedef mailbox #(Packet) pkt_mbox;
class Receiver extends ReceiverBase;
    pkt_mbox out_box;
    
    extern function new(string name, int port_ID, pkt_mbox out_box, virtual router_io.Test rtr_io);
    extern virtual task start();
endclass:Receiver
    function Receiver::new(string name, int port_ID, pkt_mbox out_box, virtual router_io.Test rtr_io);
        super.new(name, rtr_io);
        if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, super.name);
        super.da = port_ID;
        this.out_box = out_box;    
    endfunction: new
    task Receiver::start();
        if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, super.name);
        fork
            forever begin
                super.receive();
                out_box.put(pkt2cmp.copy()); 
            end
        join
    endtask: start
`endif
