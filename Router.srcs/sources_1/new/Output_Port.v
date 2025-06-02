`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Output Port
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// This module can be considered as single Output Port
// According to spec, the second phase will be called "send padding", whioh to my understanding is a connection confirmed phase
// At first, Output Port will receive request from Input Port after phase 1, then if that Output Port is free, it will set is_busy_to_x to 1, the signal will then travel back to that Input Port, go through a converter and allow Input Port to send datas
// This hardly called handshake method since there's no certain phase that Input Port and Output Port actually synchronize with eachother, but I learn about synchronization and handshake method after designed it
// According to spec, the final phase will be call "send data in", in which the Output Port receive the data directly from outside until the frame_n signal reset or the connetion breaks
// The main different in this design is that Output Port doesn't receive input datas from Input Port, the Input Port is designed just to receive address and let Output Port know which input to receive from
// This module contain of 2 submodules
// Dependencies: Output_Cell and Output Controller 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Output_Port#(
    parameter INPUT_WIDTH = 16
)(  
    input wire clk,
    input wire reset_n,
    input wire [INPUT_WIDTH - 1:0] din,
    input wire [INPUT_WIDTH - 1:0] valid_n,
    input wire [INPUT_WIDTH - 1:0] frame_n,
    input wire [INPUT_WIDTH - 1:0] request,
    output wire dout,
    output wire valido_n,
    output wire frameo_n,
    output wire [INPUT_WIDTH - 1:0] is_busy
    );
    wire [$clog2(INPUT_WIDTH) - 1:0] input_channel;
    wire out_enable;
    Output_Controller#(
        .INPUT_WIDTH(INPUT_WIDTH)
    )OP_CTRL(
        .clk(clk),
        .reset_n(reset_n),
        .frame_n(frame_n),
        .request(request),
        .out_enable(out_enable),
        .is_busy(is_busy),
        .input_channel(input_channel)
    );
    Output_Cell#(
        .Input_Quant(INPUT_WIDTH)
    )OP_CELL(
        .clk(clk),
        .reset_n(reset_n),
        .enable(out_enable),
        .Input_Channel(input_channel),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .dout(dout),
        .valido_n(valido_n),
        .frameo_n(frameo_n)
    );
endmodule
