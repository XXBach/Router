`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 04:01:44 PM
// Design Name: 
// Module Name: Packet
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

`ifndef INC_PACKET_SV
`define INC_PACKET_SV
class Packet; //Thay cho Transaction
// Property Declaration
    rand bit[3:0] sa, da;
    rand logic[7:0] payload[$];
    string name; //thay cho ID
// Adding constraint    
//  constraint addr_cnstr {sa >= 0; sa <= 15; da <= 15; da >= 0;}
    constraint addr_cnstr {sa inside {[0:15]}; da inside {[0:15]};}
    constraint payload_cnstr { payload.size() inside {[2:4]};}
// Method prototype
    extern function new (string name = "Packet");
    extern function bit compare (Packet pkt2cmp, ref string message);
    extern function void display ( string prefix = "NOTE" );
    extern function Packet copy();
endclass: Packet

function Packet::new(string name);
    this.name = name;
endfunction: new
function bit Packet::compare(Packet pkt2cmp, ref string message);
    bit pass = 1;
    message = ""; // clear message ban ??u
    for (int i = 0; i < payload.size(); i++) begin
        if (payload.pop_back() == pkt2cmp.payload.pop_back())
            message = {message, $sformatf("Packet %0d: sent and received successfully\n", i)};
        else begin
            message = {message, $sformatf("Packet %0d: sent and received failed (expected: %0h, got: %0h)\n", i, pkt2cmp.payload.pop_back(), payload.pop_back())};
            pass = 0;
        end
    end
    return pass;
endfunction: compare
function void display (string prefix = "NOTE");
    $display("[%0t] Packet name: %s | SA: %0d | DA: %0d | Data: %p | Status: %s", $time, name, sa, da, payload, prefix);
endfunction: display
function Packet Packet::copy();
    Packet pkt_copy = new(this.name);
    pkt_copy.sa = this.sa;
    pkt_copy.da = this.da;
    foreach (this.payload[i])
        pkt_copy.payload.push_back(this.payload[i]);
    return pkt_copy;
endfunction: copy
`endif 
