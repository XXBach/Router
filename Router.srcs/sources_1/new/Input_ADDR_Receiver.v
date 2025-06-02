`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Input_ADDR_Receiver
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// The module can be interpret as Input Address Receiver Port
// According to spec, the first phase will be address receiving, and decide whích output port should the packet be sent to
// The first phase will send the output address bit by bit in four cycles, because of that there need to be a register that can save address bit by bit, in this design, the Register is called Add_in
// After address fully received, the register will send the address to Input Controller, the module will decide if the signal that request connection to the output port that matched the address should be sent and when will it be
// by observing frame_n from outside and is_busy_from_x from Output_Ports
// Dependencies: Add_in ( Register ) and Input Controller 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Input_ADDR_Receiver#(
    parameter ADDR_WIDTH = 4,
    parameter OUTPUT_WIDTH = 16
)(
    input wire clk,
    input wire reset_n,
    input wire din,
    input wire frame_n,
    input wire [OUTPUT_WIDTH - 1:0] is_busy,
    output wire [OUTPUT_WIDTH - 1:0] request 
    );
    wire add_load;
    wire add_store;
    wire [ADDR_WIDTH - 1:0] add_out;
    Add_in#(
        .ADDR_WIDTH(ADDR_WIDTH)
    )Add_Receiver(
        .clk(clk),
        .reset_n(reset_n),
        .add_load(add_load),
        .add_store(add_store),
        .add_in(din),
        .add_out(add_out)
    );
    Input_Controller#(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    )Input_CTRL(
        .clk(clk),
        .reset_n(reset_n),
        .frame_n(frame_n),
        .Connect_ADDR(add_out),
        .is_busy(is_busy),
        .Fetch_ADDR(add_store),
        .Load_ADDR(add_load),
        .request(request)        
    );
endmodule
