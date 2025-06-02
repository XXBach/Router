`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 08:26:19 PM
// Design Name: 
// Module Name: DriverBase
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
class DriverBase;
    virtual router_io.Test rtr_io;
    string name;
    bit [3:0] sa,da;
    logic [7:0] payload[$];
    Packet pkt2send;
    
    extern function new (string name = "Packet", virtual router_io.Test rtr_io = null); //Constructor is unable to be virtual
    extern virtual task send ();
    extern virtual function void display ( string prefix = "NOTE" );
    
endclass:DriverBase
function DriverBase::new(string name, virtual router_io.Test rtr_io);
    this.name = name;
    this.rtr_io = rtr_io;
endfunction: new
task DriverBase::send();
    @(rtr_io.router_cb);
    //phase 1: send address
    rtr_io.router_cb.frame_n[sa] <= 1'b0;
    if (TRACE_ON) $display("[%0t] TRACE: DriverBase::send() called", $time);
    @(rtr_io.router_cb);
    for (int i = 0; i < 4; i++) begin
        rtr_io.router_cb.din[sa] <= da[i];
        @(rtr_io.router_cb); 
    end
    //phase 2: connect waiting
    repeat (3) begin
        rtr_io.router_cb.frame_n[sa] <= 1'b0;
        @(rtr_io.router_cb);
    end
    //phase 3: send data
    foreach (payload[i]) begin
        bit [7:0] data_byte = payload.pop_back();
        for (int j = 0; j < 8; j++) begin
            rtr_io.router_cb.din[sa]     <= data_byte[j];
            rtr_io.router_cb.valid_n[sa] <= 1'b0;
            rtr_io.router_cb.frame_n[sa] <= 1'b0;
            @(rtr_io.router_cb);
        end
    end
endtask : send
function void DriverBase::display (string prefix);
     $display("[%0t] Driver name: %s | SA: %0d | DA: %0d | Data: %p | Status: %s", $time, name, sa, da, payload, prefix);
endfunction: display
`endif