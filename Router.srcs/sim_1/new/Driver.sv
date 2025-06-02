`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 09:10:30 PM
// Design Name: 
// Module Name: Driver
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


`ifndef INC_DRIVER_SV
`define INC_DRIVER_SV
`include"DriverBase.sv"
typedef class Packet;
typedef mailbox #(Packet) pkt_mbox;
class Driver extends DriverBase;
    pkt_mbox in_box;
    pkt_mbox out_box;
    semaphore sem[];
    
    extern function new(string name, int port_ID, semaphore sem[], pkt_mbox in_box, pkt_mbox out_box, virtual router_io.Test rtr_io);
    extern virtual task start();
endclass:Driver
    function Driver::new(string name, int port_ID, semaphore sem[], pkt_mbox in_box, pkt_mbox out_box, virtual router_io.Test rtr_io);
        super.new(name, rtr_io);
        if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, name);
        super.sa = port_ID;
        this.sem = sem;
        this.in_box = in_box;
        this.out_box = out_box;    
    endfunction: new
    function Driver::start();
        if (TRACE_ON) $display("[TRACE]%t %s:%m", $realtime, super.name);
        fork
            forever begin
                in_box.get(super.pkt2send);
                if(super.pkt2send.sa != this.sa) continue;
                super.da = super.pkt2send.da;
                super.payload.push_back(super.pkt2send.payload);
                sem[da].get(1);
                super.send();
                out_box.put(super.pkt2send);
                sem[da].put(1);   
            end
        join
    endfunction: start
`endif