`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Router
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: Top module of Router Design, contain both sender and receiver of a router
//
// Dependencies: Input_Ports & Output_Ports
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// The idea of this design can be found in Idea.png
// This project is to learn about how to write testbench in SystemVerilog so the design would not be optimized
//////////////////////////////////////////////////////////////////////////////////


module Router #(
    parameter input_quant = 16,
    parameter output_quant = 16
)(
    input wire clk,
    input wire reset_n,
    input wire [input_quant - 1:0]frame_n,
    input wire [input_quant - 1:0]valid_n,
    input wire [input_quant - 1:0]din,
    output wire [output_quant - 1:0]dout,
    output wire [output_quant - 1:0]valido_n,
    output wire [output_quant - 1:0]frameo_n
);
    wire [output_quant - 1:0] is_busy_from_0;
    wire [output_quant - 1:0] is_busy_from_1;
    wire [output_quant - 1:0] is_busy_from_2;
    wire [output_quant - 1:0] is_busy_from_3;
    wire [output_quant - 1:0] is_busy_from_4;
    wire [output_quant - 1:0] is_busy_from_5;
    wire [output_quant - 1:0] is_busy_from_6;
    wire [output_quant - 1:0] is_busy_from_7;
    wire [output_quant - 1:0] is_busy_from_8;
    wire [output_quant - 1:0] is_busy_from_9;
    wire [output_quant - 1:0] is_busy_from_10;
    wire [output_quant - 1:0] is_busy_from_11;
    wire [output_quant - 1:0] is_busy_from_12;
    wire [output_quant - 1:0] is_busy_from_13;
    wire [output_quant - 1:0] is_busy_from_14;
    wire [output_quant - 1:0] is_busy_from_15;
    
    wire [output_quant - 1:0] is_busy_to_0;
    wire [output_quant - 1:0] is_busy_to_1;
    wire [output_quant - 1:0] is_busy_to_2;
    wire [output_quant - 1:0] is_busy_to_3;
    wire [output_quant - 1:0] is_busy_to_4;
    wire [output_quant - 1:0] is_busy_to_5;
    wire [output_quant - 1:0] is_busy_to_6;
    wire [output_quant - 1:0] is_busy_to_7;
    wire [output_quant - 1:0] is_busy_to_8;
    wire [output_quant - 1:0] is_busy_to_9;
    wire [output_quant - 1:0] is_busy_to_10;
    wire [output_quant - 1:0] is_busy_to_11;
    wire [output_quant - 1:0] is_busy_to_12;
    wire [output_quant - 1:0] is_busy_to_13;
    wire [output_quant - 1:0] is_busy_to_14;
    wire [output_quant - 1:0] is_busy_to_15;
    
    assign is_busy_to_0 = {is_busy_from_15[0],is_busy_from_14[0],is_busy_from_13[0],is_busy_from_12[0],is_busy_from_11[0],is_busy_from_10[0],is_busy_from_9[0],is_busy_from_8[0],is_busy_from_7[0],is_busy_from_6[0],is_busy_from_5[0],is_busy_from_4[0],is_busy_from_3[0],is_busy_from_2[0],is_busy_from_1[0],is_busy_from_0[0]};
    assign is_busy_to_1 = {is_busy_from_15[1],is_busy_from_14[1],is_busy_from_13[1],is_busy_from_12[1],is_busy_from_11[1],is_busy_from_10[1],is_busy_from_9[1],is_busy_from_8[1],is_busy_from_7[1],is_busy_from_6[1],is_busy_from_5[1],is_busy_from_4[1],is_busy_from_3[1],is_busy_from_2[1],is_busy_from_1[1],is_busy_from_0[1]};
    assign is_busy_to_2 = {is_busy_from_15[2],is_busy_from_14[2],is_busy_from_13[2],is_busy_from_12[2],is_busy_from_11[2],is_busy_from_10[2],is_busy_from_9[2],is_busy_from_8[2],is_busy_from_7[2],is_busy_from_6[2],is_busy_from_5[2],is_busy_from_4[2],is_busy_from_3[2],is_busy_from_2[2],is_busy_from_1[2],is_busy_from_0[2]};
    assign is_busy_to_3 = {is_busy_from_15[3],is_busy_from_14[3],is_busy_from_13[3],is_busy_from_12[3],is_busy_from_11[3],is_busy_from_10[3],is_busy_from_9[3],is_busy_from_8[3],is_busy_from_7[3],is_busy_from_6[3],is_busy_from_5[3],is_busy_from_4[3],is_busy_from_3[3],is_busy_from_2[3],is_busy_from_1[3],is_busy_from_0[3]};
    assign is_busy_to_4 = {is_busy_from_15[4],is_busy_from_14[4],is_busy_from_13[4],is_busy_from_12[4],is_busy_from_11[4],is_busy_from_10[4],is_busy_from_9[4],is_busy_from_8[4],is_busy_from_7[4],is_busy_from_6[4],is_busy_from_5[4],is_busy_from_4[4],is_busy_from_3[4],is_busy_from_2[4],is_busy_from_1[4],is_busy_from_0[4]};
    assign is_busy_to_5 = {is_busy_from_15[5],is_busy_from_14[5],is_busy_from_13[5],is_busy_from_12[5],is_busy_from_11[5],is_busy_from_10[5],is_busy_from_9[5],is_busy_from_8[5],is_busy_from_7[5],is_busy_from_6[5],is_busy_from_5[5],is_busy_from_4[5],is_busy_from_3[5],is_busy_from_2[5],is_busy_from_1[5],is_busy_from_0[5]};
    assign is_busy_to_6 = {is_busy_from_15[6],is_busy_from_14[6],is_busy_from_13[6],is_busy_from_12[6],is_busy_from_11[6],is_busy_from_10[6],is_busy_from_9[6],is_busy_from_8[6],is_busy_from_7[6],is_busy_from_6[6],is_busy_from_5[6],is_busy_from_4[6],is_busy_from_3[6],is_busy_from_2[6],is_busy_from_1[6],is_busy_from_0[6]};
    assign is_busy_to_7 = {is_busy_from_15[7],is_busy_from_14[7],is_busy_from_13[7],is_busy_from_12[7],is_busy_from_11[7],is_busy_from_10[7],is_busy_from_9[7],is_busy_from_8[7],is_busy_from_7[7],is_busy_from_6[7],is_busy_from_5[7],is_busy_from_4[7],is_busy_from_3[7],is_busy_from_2[7],is_busy_from_1[7],is_busy_from_0[7]};
    assign is_busy_to_8 = {is_busy_from_15[8],is_busy_from_14[8],is_busy_from_13[8],is_busy_from_12[8],is_busy_from_11[8],is_busy_from_10[8],is_busy_from_9[8],is_busy_from_8[8],is_busy_from_7[8],is_busy_from_6[8],is_busy_from_5[8],is_busy_from_4[8],is_busy_from_3[8],is_busy_from_2[8],is_busy_from_1[8],is_busy_from_0[8]};
    assign is_busy_to_9 = {is_busy_from_15[9],is_busy_from_14[9],is_busy_from_13[9],is_busy_from_12[9],is_busy_from_11[9],is_busy_from_10[9],is_busy_from_9[9],is_busy_from_8[9],is_busy_from_7[9],is_busy_from_6[9],is_busy_from_5[9],is_busy_from_4[9],is_busy_from_3[9],is_busy_from_2[9],is_busy_from_1[9],is_busy_from_0[9]};
    assign is_busy_to_10 = {is_busy_from_15[10],is_busy_from_14[10],is_busy_from_13[10],is_busy_from_12[10],is_busy_from_11[10],is_busy_from_10[10],is_busy_from_9[10],is_busy_from_8[10],is_busy_from_7[10],is_busy_from_6[10],is_busy_from_5[10],is_busy_from_4[10],is_busy_from_3[10],is_busy_from_2[10],is_busy_from_1[10],is_busy_from_0[10]};
    assign is_busy_to_11 = {is_busy_from_15[11],is_busy_from_14[11],is_busy_from_13[11],is_busy_from_12[11],is_busy_from_11[11],is_busy_from_10[11],is_busy_from_9[11],is_busy_from_8[11],is_busy_from_7[11],is_busy_from_6[11],is_busy_from_5[11],is_busy_from_4[11],is_busy_from_3[11],is_busy_from_2[11],is_busy_from_1[11],is_busy_from_0[11]};
    assign is_busy_to_12 = {is_busy_from_15[12],is_busy_from_14[12],is_busy_from_13[12],is_busy_from_12[12],is_busy_from_11[12],is_busy_from_10[12],is_busy_from_9[12],is_busy_from_8[12],is_busy_from_7[12],is_busy_from_6[12],is_busy_from_5[12],is_busy_from_4[12],is_busy_from_3[12],is_busy_from_2[12],is_busy_from_1[12],is_busy_from_0[12]};
    assign is_busy_to_13 = {is_busy_from_15[13],is_busy_from_14[13],is_busy_from_13[13],is_busy_from_12[13],is_busy_from_11[13],is_busy_from_10[13],is_busy_from_9[13],is_busy_from_8[13],is_busy_from_7[13],is_busy_from_6[13],is_busy_from_5[13],is_busy_from_4[13],is_busy_from_3[13],is_busy_from_2[13],is_busy_from_1[13],is_busy_from_0[13]};
    assign is_busy_to_14 = {is_busy_from_15[14],is_busy_from_14[14],is_busy_from_13[14],is_busy_from_12[14],is_busy_from_11[14],is_busy_from_10[14],is_busy_from_9[14],is_busy_from_8[14],is_busy_from_7[14],is_busy_from_6[14],is_busy_from_5[14],is_busy_from_4[14],is_busy_from_3[14],is_busy_from_2[14],is_busy_from_1[14],is_busy_from_0[14]};
    assign is_busy_to_15 = {is_busy_from_15[15],is_busy_from_14[15],is_busy_from_13[15],is_busy_from_12[15],is_busy_from_11[15],is_busy_from_10[15],is_busy_from_9[15],is_busy_from_8[15],is_busy_from_7[15],is_busy_from_6[15],is_busy_from_5[15],is_busy_from_4[15],is_busy_from_3[15],is_busy_from_2[15],is_busy_from_1[15],is_busy_from_0[15]};
                
    wire [input_quant - 1:0] request_from_0;
    wire [input_quant - 1:0] request_from_1;
    wire [input_quant - 1:0] request_from_2;
    wire [input_quant - 1:0] request_from_3;
    wire [input_quant - 1:0] request_from_4;
    wire [input_quant - 1:0] request_from_5;
    wire [input_quant - 1:0] request_from_6;
    wire [input_quant - 1:0] request_from_7;
    wire [input_quant - 1:0] request_from_8;
    wire [input_quant - 1:0] request_from_9;
    wire [input_quant - 1:0] request_from_10;
    wire [input_quant - 1:0] request_from_11;
    wire [input_quant - 1:0] request_from_12;
    wire [input_quant - 1:0] request_from_13;
    wire [input_quant - 1:0] request_from_14;
    wire [input_quant - 1:0] request_from_15;
    
    wire [input_quant - 1:0] request_to_0;
    wire [input_quant - 1:0] request_to_1;
    wire [input_quant - 1:0] request_to_2;
    wire [input_quant - 1:0] request_to_3;
    wire [input_quant - 1:0] request_to_4;
    wire [input_quant - 1:0] request_to_5;
    wire [input_quant - 1:0] request_to_6;
    wire [input_quant - 1:0] request_to_7;
    wire [input_quant - 1:0] request_to_8;
    wire [input_quant - 1:0] request_to_9;
    wire [input_quant - 1:0] request_to_10;
    wire [input_quant - 1:0] request_to_11;
    wire [input_quant - 1:0] request_to_12;
    wire [input_quant - 1:0] request_to_13;
    wire [input_quant - 1:0] request_to_14;
    wire [input_quant - 1:0] request_to_15;
    
    assign request_to_0 = {request_from_15[0],request_from_14[0],request_from_13[0],request_from_12[0],request_from_11[0],request_from_10[0],request_from_9[0],request_from_8[0],request_from_7[0],request_from_6[0],request_from_5[0],request_from_4[0],request_from_3[0],request_from_2[0],request_from_1[0],request_from_0[0]};
    assign request_to_1 = {request_from_15[1],request_from_14[1],request_from_13[1],request_from_12[1],request_from_11[1],request_from_10[1],request_from_9[1],request_from_8[1],request_from_7[1],request_from_6[1],request_from_5[1],request_from_4[1],request_from_3[1],request_from_2[1],request_from_1[1],request_from_0[1]};
    assign request_to_2 = {request_from_15[2],request_from_14[2],request_from_13[2],request_from_12[2],request_from_11[2],request_from_10[2],request_from_9[2],request_from_8[2],request_from_7[2],request_from_6[2],request_from_5[2],request_from_4[2],request_from_3[2],request_from_2[2],request_from_1[2],request_from_0[2]};
    assign request_to_3 = {request_from_15[3],request_from_14[3],request_from_13[3],request_from_12[3],request_from_11[3],request_from_10[3],request_from_9[3],request_from_8[3],request_from_7[3],request_from_6[3],request_from_5[3],request_from_4[3],request_from_3[3],request_from_2[3],request_from_1[3],request_from_0[3]};
    assign request_to_4 = {request_from_15[4],request_from_14[4],request_from_13[4],request_from_12[4],request_from_11[4],request_from_10[4],request_from_9[4],request_from_8[4],request_from_7[4],request_from_6[4],request_from_5[4],request_from_4[4],request_from_3[4],request_from_2[4],request_from_1[4],request_from_0[4]};
    assign request_to_5 = {request_from_15[5],request_from_14[5],request_from_13[5],request_from_12[5],request_from_11[5],request_from_10[5],request_from_9[5],request_from_8[5],request_from_7[5],request_from_6[5],request_from_5[5],request_from_4[5],request_from_3[5],request_from_2[5],request_from_1[5],request_from_0[5]};
    assign request_to_6 = {request_from_15[6],request_from_14[6],request_from_13[6],request_from_12[6],request_from_11[6],request_from_10[6],request_from_9[6],request_from_8[6],request_from_7[6],request_from_6[6],request_from_5[6],request_from_4[6],request_from_3[6],request_from_2[6],request_from_1[6],request_from_0[6]};
    assign request_to_7 = {request_from_15[7],request_from_14[7],request_from_13[7],request_from_12[7],request_from_11[7],request_from_10[7],request_from_9[7],request_from_8[7],request_from_7[7],request_from_6[7],request_from_5[7],request_from_4[7],request_from_3[7],request_from_2[7],request_from_1[7],request_from_0[7]};
    assign request_to_8 = {request_from_15[8],request_from_14[8],request_from_13[8],request_from_12[8],request_from_11[8],request_from_10[8],request_from_9[8],request_from_8[8],request_from_7[8],request_from_6[8],request_from_5[8],request_from_4[8],request_from_3[8],request_from_2[8],request_from_1[8],request_from_0[8]};
    assign request_to_9 = {request_from_15[9],request_from_14[9],request_from_13[9],request_from_12[9],request_from_11[9],request_from_10[9],request_from_9[9],request_from_8[9],request_from_7[9],request_from_6[9],request_from_5[9],request_from_4[9],request_from_3[9],request_from_2[9],request_from_1[9],request_from_0[9]};
    assign request_to_10 = {request_from_15[10],request_from_14[10],request_from_13[10],request_from_12[10],request_from_11[10],request_from_10[10],request_from_9[10],request_from_8[10],request_from_7[10],request_from_6[10],request_from_5[10],request_from_4[10],request_from_3[10],request_from_2[10],request_from_1[10],request_from_0[10]};
    assign request_to_11 = {request_from_15[11],request_from_14[11],request_from_13[11],request_from_12[11],request_from_11[11],request_from_10[11],request_from_9[11],request_from_8[11],request_from_7[11],request_from_6[11],request_from_5[11],request_from_4[11],request_from_3[11],request_from_2[11],request_from_1[11],request_from_0[11]};
    assign request_to_12 = {request_from_15[12],request_from_14[12],request_from_13[12],request_from_12[12],request_from_11[12],request_from_10[12],request_from_9[12],request_from_8[12],request_from_7[12],request_from_6[12],request_from_5[12],request_from_4[12],request_from_3[12],request_from_2[12],request_from_1[12],request_from_0[12]};
    assign request_to_13 = {request_from_15[13],request_from_14[13],request_from_13[13],request_from_12[13],request_from_11[13],request_from_10[13],request_from_9[13],request_from_8[13],request_from_7[13],request_from_6[13],request_from_5[13],request_from_4[13],request_from_3[13],request_from_2[13],request_from_1[13],request_from_0[13]};
    assign request_to_14 = {request_from_15[14],request_from_14[14],request_from_13[14],request_from_12[14],request_from_11[14],request_from_10[14],request_from_9[14],request_from_8[14],request_from_7[14],request_from_6[14],request_from_5[14],request_from_4[14],request_from_3[14],request_from_2[14],request_from_1[14],request_from_0[14]};
    assign request_to_15 = {request_from_15[15],request_from_14[15],request_from_13[15],request_from_12[15],request_from_11[15],request_from_10[15],request_from_9[15],request_from_8[15],request_from_7[15],request_from_6[15],request_from_5[15],request_from_4[15],request_from_3[15],request_from_2[15],request_from_1[15],request_from_0[15]};
    
    Input_Ports#(
        .ADDR_WIDTH($clog2(output_quant)),
        .OUTPUT_WIDTH(output_quant)
    )IP(
        .clk(clk),
        .reset_n(reset_n),
        .din(din),
        .frame_n(frame_n),
        .is_busy_to_0(is_busy_to_0),.is_busy_to_1(is_busy_to_1),
        .is_busy_to_2(is_busy_to_2),.is_busy_to_3(is_busy_to_3),
        .is_busy_to_4(is_busy_to_4),.is_busy_to_5(is_busy_to_5),
        .is_busy_to_6(is_busy_to_6),.is_busy_to_7(is_busy_to_7),
        .is_busy_to_8(is_busy_to_8),.is_busy_to_9(is_busy_to_9),
        .is_busy_to_10(is_busy_to_10),.is_busy_to_11(is_busy_to_11),
        .is_busy_to_12(is_busy_to_12),.is_busy_to_13(is_busy_to_13),
        .is_busy_to_14(is_busy_to_14),.is_busy_to_15(is_busy_to_15),
        .request_from_0(request_from_0),.request_from_1(request_from_1),
        .request_from_2(request_from_2),.request_from_3(request_from_3),
        .request_from_4(request_from_4),.request_from_5(request_from_5),
        .request_from_6(request_from_6),.request_from_7(request_from_7),
        .request_from_8(request_from_8),.request_from_9(request_from_9),
        .request_from_10(request_from_10),.request_from_11(request_from_11),
        .request_from_12(request_from_12),.request_from_13(request_from_13),
        .request_from_14(request_from_14),.request_from_15(request_from_15)
    );
    
    Output_Ports#(
        .INPUT_WIDTH(input_quant),
        .OUTPUT_WIDTH(output_quant)
    )OP(
        .clk(clk),
        .reset_n(reset_n),
        .din(din),
        .valid_n(valid_n),
        .frame_n(frame_n),
        .request_to_0(request_to_0),.request_to_1(request_to_1),
        .request_to_2(request_to_2),.request_to_3(request_to_3),
        .request_to_4(request_to_4),.request_to_5(request_to_5),
        .request_to_6(request_to_6),.request_to_7(request_to_7),
        .request_to_8(request_to_8),.request_to_9(request_to_9),
        .request_to_10(request_to_10),.request_to_11(request_to_11),
        .request_to_12(request_to_12),.request_to_13(request_to_13),
        .request_to_14(request_to_14),.request_to_15(request_to_15),
        .dout(dout),
        .valido_n(valido_n),
        .frameo_n(frameo_n),
        .is_busy_from_0(is_busy_from_0),.is_busy_from_1(is_busy_from_1),
        .is_busy_from_2(is_busy_from_2),.is_busy_from_3(is_busy_from_3),
        .is_busy_from_4(is_busy_from_4),.is_busy_from_5(is_busy_from_5),
        .is_busy_from_6(is_busy_from_6),.is_busy_from_7(is_busy_from_7),
        .is_busy_from_8(is_busy_from_8),.is_busy_from_9(is_busy_from_9),
        .is_busy_from_10(is_busy_from_10),.is_busy_from_11(is_busy_from_11),
        .is_busy_from_12(is_busy_from_12),.is_busy_from_13(is_busy_from_13),
        .is_busy_from_14(is_busy_from_14),.is_busy_from_15(is_busy_from_15)
    );
endmodule
