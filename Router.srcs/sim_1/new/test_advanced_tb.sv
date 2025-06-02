`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 08:58:54 PM
// Design Name: 
// Module Name: test_advanced_tb
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


program automatic test_advanced_tb (router_io.Test rtr_io);
    int run_for_n_packets;
    int TRACE_ON = 0;
    
    `include "Packet.sv"
    `include "Driver.sv"
    `include "Receiver.sv"
    `include "Generator.sv"
    `include "Scoreboard.sv"
    
    semaphore  sem[];
    Driver     drvr[];
    Receiver   rcvr[];
    Generator  gen;
    Scoreboard sb;
    
    initial begin
        run_for_n_packets = 2000;
        sem = new[16];
        drvr = new[16];
        rcvr = new[16];
        gen = new();
        sb = new();
        foreach (sem[i])
            sem[i] = new(1);
        foreach (drvr[i])
            drvr[i] = new($sformatf("drvr[%0d]",i),i,sem,gen.out_box[i],sb.driver_mbox,rtr_io);
        foreach (rcvr[i])
            rcvr[i] = new($sformatf("rcvr[%0d]",i),i,sb.receiver_mbox,rtr_io);
        reset();
        gen.start();
        sb.start();
        foreach(drvr[i])
            drvr[i].start();
        foreach(rcvr[i])
            rcvr[i].start();
        wait(sb.DONE.triggered);
    end 
    task reset();
        if (TRACE_ON) $display("[TRACE]%t %m", $realtime);
        rtr_io.reset_n <= 1;
        rtr_io.cb.frame_n <= 1;
        rtr_io.cb.valid_n <= 1;
        @(rtr_io.router_cb);
        rtr_io.reset_n <= 0;
        @(rtr_io.router_cb);
        rtr_io.reset_n <= 1;
        repeat(15) @(rtr_io.router_cb);
    endtask: reset
endprogram: test_advanced_tb
