`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Input_Ports
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// The Input Ports of Router, contain of modules which receive data_in (din),
// is_in_frame_not (frame_n) from outside as spec and is_busy_to_x from Output_Ports as signals
// to know if that Output Port is busy since the connection is 1-1 as spec
// The Output of this module is signals called request_from_x, this will be sent to Output Ports 
// to request for connection 
// Dependencies: Input_ADDR_Receivers 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////


module Input_Ports#(
    parameter ADDR_WIDTH = 4,
    parameter OUTPUT_WIDTH = 16
)(
    input wire clk,
    input wire reset_n,
    input wire [OUTPUT_WIDTH - 1:0] din,
    input wire [OUTPUT_WIDTH - 1:0] frame_n,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_0,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_1,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_2,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_3,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_4,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_5,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_6,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_7,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_8,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_9,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_10,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_11,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_12,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_13,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_14,
    input wire [OUTPUT_WIDTH - 1:0] is_busy_to_15,
    output wire [OUTPUT_WIDTH - 1:0] request_from_0,
    output wire [OUTPUT_WIDTH - 1:0] request_from_1,
    output wire [OUTPUT_WIDTH - 1:0] request_from_2,
    output wire [OUTPUT_WIDTH - 1:0] request_from_3,
    output wire [OUTPUT_WIDTH - 1:0] request_from_4,
    output wire [OUTPUT_WIDTH - 1:0] request_from_5,
    output wire [OUTPUT_WIDTH - 1:0] request_from_6,
    output wire [OUTPUT_WIDTH - 1:0] request_from_7,
    output wire [OUTPUT_WIDTH - 1:0] request_from_8,
    output wire [OUTPUT_WIDTH - 1:0] request_from_9,
    output wire [OUTPUT_WIDTH - 1:0] request_from_10,
    output wire [OUTPUT_WIDTH - 1:0] request_from_11,
    output wire [OUTPUT_WIDTH - 1:0] request_from_12,
    output wire [OUTPUT_WIDTH - 1:0] request_from_13,
    output wire [OUTPUT_WIDTH - 1:0] request_from_14,
    output wire [OUTPUT_WIDTH - 1:0] request_from_15
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_0 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[0]),
        .frame_n(frame_n[0]),
        .is_busy(is_busy_to_0),
        .request(request_from_0)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_1 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[1]),
        .frame_n(frame_n[1]),
        .is_busy(is_busy_to_1),
        .request(request_from_1)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_2 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[2]),
        .frame_n(frame_n[2]),
        .is_busy(is_busy_to_2),
        .request(request_from_2)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_3 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[3]),
        .frame_n(frame_n[3]),
        .is_busy(is_busy_to_3),
        .request(request_from_3)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_4 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[4]),
        .frame_n(frame_n[4]),
        .is_busy(is_busy_to_4),
        .request(request_from_4)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_5 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[5]),
        .frame_n(frame_n[5]),
        .is_busy(is_busy_to_5),
        .request(request_from_5)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_6 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[6]),
        .frame_n(frame_n[6]),
        .is_busy(is_busy_to_6),
        .request(request_from_6)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_7 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[7]),
        .frame_n(frame_n[7]),
        .is_busy(is_busy_to_7),
        .request(request_from_7)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_8 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[8]),
        .frame_n(frame_n[8]),
        .is_busy(is_busy_to_8),
        .request(request_from_8)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_9 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[9]),
        .frame_n(frame_n[9]),
        .is_busy(is_busy_to_9),
        .request(request_from_9)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_10 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[10]),
        .frame_n(frame_n[10]),
        .is_busy(is_busy_to_10),
        .request(request_from_10)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_11 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[11]),
        .frame_n(frame_n[11]),
        .is_busy(is_busy_to_11),
        .request(request_from_11)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_12 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[12]),
        .frame_n(frame_n[12]),
        .is_busy(is_busy_to_12),
        .request(request_from_12)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_13 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[13]),
        .frame_n(frame_n[13]),
        .is_busy(is_busy_to_13),
        .request(request_from_13)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_14 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[14]),
        .frame_n(frame_n[14]),
        .is_busy(is_busy_to_14),
        .request(request_from_14)
    );
    Input_ADDR_Receiver #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH)
    ) IP_15 (
        .clk(clk),
        .reset_n(reset_n),
        .din(din[15]),
        .frame_n(frame_n[15]),
        .is_busy(is_busy_to_15),
        .request(request_from_15)
    );
endmodule
