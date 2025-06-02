`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 08:32:29 PM
// Design Name: 
// Module Name: Scoreboard
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

`ifndef INC_SCOREBOARD_SV
`define INC_SCOREBOARD_SV
class Scoreboard;
    string name;
    pkt_mbox driver_mbox;
    pkt_mbox receiver_mbox;
    int checked_count = 0;

    extern function new(string name = "SCOREBOARD");
    extern task check();

endclass: Scoreboard

function Scoreboard::new(string name);
    this.name = name;
endfunction: new

task Scoreboard::check();
    Packet pkt2cmp;
    Packet pkt_ref;
    Packet refPkt[$];
    string message;
    bit found;
    forever begin
        receiver_mbox.get(pkt2cmp);  // ch? nh?n packet t? Receiver
        checked_count++;

        while (driver_mbox.try_get(pkt_ref)) begin
            refPkt.push_back(pkt_ref);
        end

        found = 0;
        foreach (refPkt[i]) begin
            if (refPkt[i].da == pkt2cmp.da) begin
                found = 1;
                if (refPkt[i].compare(pkt2cmp, message)) begin
                    $display("[%0t] [Scoreboard] PASS:\n%s", $time, message);
                end else begin
                    $display("[%0t] [Scoreboard] FAIL:\n%s", $time, message);
                end
                refPkt.delete(i);  // ?ã so sánh xong, xóa ?i
                break;
            end
        end

        if (!found) begin
            $display("[%0t] [Scoreboard] ERROR: No reference Packet found for port %0d", $time, pkt2cmp.da);
        end

        if (run_for_n_packets > 0 && checked_count >= run_for_n_packets) begin
            -> DONE;
            break;
        end
    end
endtask: check
`endif

