`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Output_Ports
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// The Output Ports of Router, contain of modules which receive data_in (din), is_not_valid (valid_n)
// is_not_in_frame (frame_n) from outside as spec and request_from_x from Input_Ports as signals
// to know if which Input Port is requesting for connection.
// The request_from_x will be rearranged so each Output Port can receive their own request signals
// The Output of this module is signals called is_busy_from_x, this will be sent to Input Ports
// whichever port get to be connected and whichever don't 
// Dependencies: Output_Ports 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Output_Ports#(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = 16
)(
    input wire clk,
    input wire reset_n,
    input wire [INPUT_WIDTH - 1:0] din,
    input wire [INPUT_WIDTH - 1:0] valid_n,
    input wire [INPUT_WIDTH - 1:0] frame_n,
    input wire [INPUT_WIDTH - 1:0] request_to_0,
    input wire [INPUT_WIDTH - 1:0] request_to_1,
    input wire [INPUT_WIDTH - 1:0] request_to_2,
    input wire [INPUT_WIDTH - 1:0] request_to_3,
    input wire [INPUT_WIDTH - 1:0] request_to_4,
    input wire [INPUT_WIDTH - 1:0] request_to_5,
    input wire [INPUT_WIDTH - 1:0] request_to_6,
    input wire [INPUT_WIDTH - 1:0] request_to_7,
    input wire [INPUT_WIDTH - 1:0] request_to_8,
    input wire [INPUT_WIDTH - 1:0] request_to_9,
    input wire [INPUT_WIDTH - 1:0] request_to_10,
    input wire [INPUT_WIDTH - 1:0] request_to_11,
    input wire [INPUT_WIDTH - 1:0] request_to_12,
    input wire [INPUT_WIDTH - 1:0] request_to_13,
    input wire [INPUT_WIDTH - 1:0] request_to_14,
    input wire [INPUT_WIDTH - 1:0] request_to_15,
    output wire [OUTPUT_WIDTH - 1:0] dout,
    output wire [OUTPUT_WIDTH - 1:0] valido_n,
    output wire [OUTPUT_WIDTH - 1:0] frameo_n,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_0,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_1,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_2,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_3,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_4,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_5,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_6,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_7,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_8,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_9,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_10,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_11,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_12,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_13,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_14,
    output wire [OUTPUT_WIDTH - 1:0] is_busy_from_15
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_0 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_0),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_0),
        .dout(dout[0]),
        .valido_n(valido_n[0]),
        .frameo_n(frameo_n[0])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_1 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_1),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_1),
        .dout(dout[1]),
        .valido_n(valido_n[1]),
        .frameo_n(frameo_n[1])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_2 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_2),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_2),
        .dout(dout[2]),
        .valido_n(valido_n[2]),
        .frameo_n(frameo_n[2])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_3 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_3),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_3),
        .dout(dout[3]),
        .valido_n(valido_n[3]),
        .frameo_n(frameo_n[3])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_4 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_4),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_4),
        .dout(dout[4]),
        .valido_n(valido_n[4]),
        .frameo_n(frameo_n[4])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_5 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_5),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_5),
        .dout(dout[5]),
        .valido_n(valido_n[5]),
        .frameo_n(frameo_n[5])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_6 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_6),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_6),
        .dout(dout[6]),
        .valido_n(valido_n[6]),
        .frameo_n(frameo_n[6])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_7 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_7),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_7),
        .dout(dout[7]),
        .valido_n(valido_n[7]),
        .frameo_n(frameo_n[7])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_8 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_8),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_8),
        .dout(dout[8]),
        .valido_n(valido_n[8]),
        .frameo_n(frameo_n[8])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_9 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_9),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_9),
        .dout(dout[9]),
        .valido_n(valido_n[9]),
        .frameo_n(frameo_n[9])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_10 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_10),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_10),
        .dout(dout[10]),
        .valido_n(valido_n[10]),
        .frameo_n(frameo_n[10])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_11 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_11),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_11),
        .dout(dout[11]),
        .valido_n(valido_n[11]),
        .frameo_n(frameo_n[11])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_12 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_12),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_12),
        .dout(dout[12]),
        .valido_n(valido_n[12]),
        .frameo_n(frameo_n[12])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_13 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_13),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_13),
        .dout(dout[13]),
        .valido_n(valido_n[13]),
        .frameo_n(frameo_n[13])
    );
        Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_14 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_14),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_14),
        .dout(dout[14]),
        .valido_n(valido_n[14]),
        .frameo_n(frameo_n[14])
    );
    Output_Port #(.INPUT_WIDTH(INPUT_WIDTH)) OP_15 (
        .clk(clk),
        .reset_n(reset_n),
        .request(request_to_15),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .is_busy(is_busy_from_15),
        .dout(dout[15]),
        .valido_n(valido_n[15]),
        .frameo_n(frameo_n[15])
    );
endmodule
