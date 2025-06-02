`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2025 09:41:14 AM
// Design Name: 
// Module Name: ReceiverBase
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
typedef class Packet;
typedef mailbox #(Packet) pkt_mbox;
class ReceiverBase;
    virtual router_io.Test rtr_io;
    string name;
    bit [3:0] sa,da;
    Packet pkt2cmp;
    
    extern function new (string name = "Packet", virtual router_io.Test rtr_io = null); //Constructor is unable to be virtual
    extern virtual task receive ();
    extern virtual function void display ( string prefix = "NOTE" );
endclass: ReceiverBase
    function ReceiverBase::new(string name, virtual router_io.Test rtr_io);
        this.name = name;
        this.rtr_io = rtr_io;
    endfunction: new
    task ReceiverBase::receive();
       bit [7:0] pkt2save;
       if (TRACE_ON) $display("[%0t] TRACE: ReceiverBase::receive() called", $time);
       forever begin
            pkt2save = 8'b00000000;
            for (int j = 0; j < 8; j++) begin
                if(rtr_io.router_cb.frameo_n[da])
                    break;
                pkt2save[j] = rtr_io.router_cb.dout[da];
                @(rtr_io.router_cb);
            end
            pkt2cmp.payload.push_back(pkt2save);
            if(rtr_io.router_cb.frameo_n[da])
                break;
            @(negedge rtr_io.router_cb.frameo_n[da]);
        end
    endtask: receive
    function void ReceiverBase::display (string prefix);
        $display("[%0t] Receiver name: %s | SA: %0d | DA: %0d | Data: %p | Status: %s", $time, name, sa, da, payload, prefix);
    endfunction: display
`endif
