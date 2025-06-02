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
// This module can be considered as single real Output Port for datas, this module's only task is receive control signals and datas then push the data out
// This Module receives control signals contain of input choosing, output enable from it's controller and is data valid ( valid_n ) from outside to control where and when it should let the input data out  
// This Module can also be considered as registers with some logic to control it 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////


module Output_Cell#(
    parameter Input_Quant = 16
)(
    input wire clk,
    input wire reset_n,
    input wire enable,
    input wire [$clog2(Input_Quant) - 1:0] Input_Channel,
    input wire [Input_Quant - 1:0] din,
    input wire [Input_Quant - 1:0] valid_n,
    input wire [Input_Quant - 1:0] frame_n,
    output reg dout,
    output reg valido_n,
    output reg frameo_n
    );
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            dout <= 0;
            valido_n <= 1;
            frameo_n <= 1;
        end
        else begin
            if(enable) begin
                if(!valid_n[Input_Channel]) begin
                    dout <= din[Input_Channel];
                    valido_n <= valid_n[Input_Channel];
                    frameo_n <= frame_n[Input_Channel];
                end
                else begin
                    dout <= 1'bx;
                    valido_n <= 1'b1;
                    frameo_n <= 1'b1;
                end
             end
             else begin
                dout <= 1'b0;
                valido_n <= 1'b1;
                frameo_n <= 1'b1;
             end
        end
    end
endmodule
