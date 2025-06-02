`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: router_test_top
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// This module is a top level module which call out testing task as Test.sv or test_advanced_tb.sv 
// Those two testbenches are similar not the same since use the information of two different specs to write but those specs come from the same idea
// The Test.sv file is the one that I wrote all the test into 1 module and ran successfully. All the task of other classes such as Driver, Generator, .... can be found in this file under tasks and functions form
// The test_advanced_tb.sv file is the one that I learn to classified specific tasks to simulate the environment around Router as real as posible
// Therefore, I haven't fully run and debug this test file yet
// However, I had done writing, classifying and connecting all the testbench classes, except functional coverage and assertion
// My next project would be RISCV, as I will design RISCV processor with RV32I standard, design testbench classes like I did in test_advanced
// I am aiming to fully design testbench with functional coverage, assertion and all, also fully design RISCV with pipeline and forwarding block  
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module router_test_top;
    parameter Simulation_Cycle = 100;
    bit SystemClock;
    router_io top_io(SystemClock);
//    Test t(top_io); // Test normal
    test_advanced_cb t (top_io); // Test advanced
    Router#(
        .input_quant(16),
        .output_quant(16)
    )dut(
        .reset_n(top_io.reset_n),
        .clk(top_io.clock),
        .din(top_io.din),
        .frame_n(top_io.frame_n),
        .valid_n(top_io.valid_n),
        .dout(top_io.dout),
        .valido_n(top_io.valido_n),
        .frameo_n(top_io.frameo_n)
    );
    initial begin
        SystemClock = 0;
        forever begin
            #(Simulation_Cycle/2) SystemClock = ~SystemClock;
        end
    end
endmodule
