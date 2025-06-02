`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Add_in
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// This module can be considered as a component which hold Address in phase 1
// This could also be considered as a register which hold data for 4 cycles, Reset, Load and Store base on Control Signals
// 
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////


module Add_in #(
    parameter ADDR_WIDTH = 4
)(
    input wire clk,
    input wire reset_n,
    input wire add_load,
    input wire add_store,
    input wire add_in,
    output reg [ADDR_WIDTH - 1:0] add_out
    );
    reg [ADDR_WIDTH - 1:0] add_mem;
    reg [$clog2(ADDR_WIDTH) - 1:0] index;
    initial begin
        add_out <= 0;
        index <= 2'b00;
        add_mem <= 4'b0000;
    end
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            index <= 2'b00;
            add_mem <= 4'b0000;
        end
        else begin
            if(add_store) begin
                add_mem[index] = add_in;
                index = index + 2'b01;
            end
        end
    end
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            add_out <= 0;
        end
        else begin
            if(add_load) begin
                add_out <= add_mem;
                index <= 0;
            end
        end
    end    
endmodule
