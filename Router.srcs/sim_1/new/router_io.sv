`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: router_io
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// This module is a part of testbench, which represent a bus to connect testbench and design
// This module sample and drive all the signals of the main design (aka Router), synchronize them with clock through clocking block and arrange them into ports for different tasks
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
// 
//////////////////////////////////////////////////////////////////////////////////

interface router_io(
    input bit clock
);
    logic clk;
    assign clk = clock;
    logic reset_n;
    logic [15:0]frame_n;
    logic [15:0]valid_n;
    logic [15:0]din;
    logic [15:0]dout;
    logic [15:0]valido_n;
    logic [15:0]frameo_n;
    clocking router_cb @(posedge clock);
        default input #0 output #0;
        output reset_n;
        output din;
        output frame_n;
        output valid_n;
        input dout;
        input valido_n;
        input frameo_n;
    endclocking: router_cb
    modport Test (clocking router_cb, output reset_n);
    modport DUT (input reset_n,din,frame_n,valid_n, 
                 output dout,frameo_n,valido_n); 
    modport MONITOR (input reset_n,din,frame_n,valid_n,dout,frameo_n,valido_n);
endinterface: router_io