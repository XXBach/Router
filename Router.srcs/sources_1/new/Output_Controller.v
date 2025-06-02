`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Output Controller
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// This module can be considered as controller of a single Output Port with two task: Confirmed connection and Choose input for Output Ports
// For the first task: 
// This Module receives request signals from Input Ports and proceed it with a set of rules
// This rule set contains: Priority by sending port ( with Input Port 0 have the highest priority ), first come first serve and one-one connection at a time 
// In detail, the module receive request signals from Input Ports and frame_n from outside and proceed to decide whích input port get to connect to this Output Port, then send back the is_busy signal to confirm connection
// The connection won't break until frame_n is set
// For the second task:
// After connection confirmation, The Controller sends two control signals to Output Port, named out_enable ( enable output ) and input_channel ( choose input channel )
// The first one depends on frame_n, if the connection is in frame, this signal will be set
// The second one depends on request signals and the set of rules mentioned above
// As spec, there is a no buffer rules, so for instance two or more Input Channel want to connect, the reduntdant Channels' data will lost
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
// 
//////////////////////////////////////////////////////////////////////////////////


module Output_Controller#(
    parameter INPUT_WIDTH = 16
)(
    input wire clk,
    input wire reset_n,
    input wire [INPUT_WIDTH - 1:0] frame_n,
    input wire [INPUT_WIDTH - 1:0] request,
    output reg out_enable,
    output reg [INPUT_WIDTH - 1:0] is_busy,
    output reg [$clog2(INPUT_WIDTH) - 1:0] input_channel
    );
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            is_busy <= 16'h0000;
            input_channel <= 16'h0000;
            out_enable <= 1'b0;
        end
        else begin
            if(!is_busy) begin
                casex(~frame_n & request)
                    16'b1xxxxxxxxxxxxxxx: begin
                       input_channel <= 4'b1111;
                       is_busy <= 16'h7FFF;
                       out_enable <= 1'b1; 
                    end
                    16'b01xxxxxxxxxxxxxx: begin
                       input_channel <= 4'b1110;
                       is_busy <= 16'hBFFF;
                       out_enable <= 1'b1; 
                    end
                    16'b001xxxxxxxxxxxxx: begin
                       input_channel <= 4'b1101;
                       is_busy <= 16'hDFFF;
                       out_enable <= 1'b1; 
                    end
                    16'b0001xxxxxxxxxxxx: begin
                       input_channel <= 4'b1100;
                       is_busy <= 16'hEFFF;
                       out_enable <= 1'b1; 
                    end
                    16'b00001xxxxxxxxxxx: begin
                       input_channel <= 4'b1011;
                       is_busy <= 16'hF7FF;
                       out_enable <= 1'b1; 
                    end
                    16'b000001xxxxxxxxxxx: begin
                       input_channel <= 4'b1010;
                       is_busy <= 16'hFBFF;
                       out_enable <= 1'b1; 
                    end
                    16'b0000001xxxxxxxxx: begin
                       input_channel <= 4'b1001;
                       is_busy <= 16'hFDFF;
                       out_enable <= 1'b1; 
                    end
                    16'b00000001xxxxxxxx: begin
                       input_channel <= 4'b1000;
                       is_busy <= 16'hFEFF;
                       out_enable <= 1'b1; 
                    end
                    16'b000000001xxxxxxx: begin
                       input_channel <= 4'b0111;
                       is_busy <= 16'hFF7F;
                       out_enable <= 1'b1; 
                    end
                    16'b0000000001xxxxxx: begin
                       input_channel <= 4'b0110;
                       is_busy <= 16'hFFBF;
                       out_enable <= 1'b1; 
                    end
                    16'b00000000001xxxxx: begin
                       input_channel <= 4'b0101;
                       is_busy <= 16'hFFDF;
                       out_enable <= 1'b1; 
                    end
                    16'b000000000001xxxx: begin
                       input_channel <= 4'b0100;
                       is_busy <= 16'hFFEF;
                       out_enable <= 1'b1; 
                    end
                    16'b0000000000001xxx: begin
                       input_channel <= 4'b0011;
                       is_busy <= 16'hFFF7;
                       out_enable <= 1'b1; 
                    end
                    16'b00000000000001xx: begin
                       input_channel <= 4'b0010;
                       is_busy <= 16'hFFFB;
                       out_enable <= 1'b1; 
                    end
                    16'b000000000000001x: begin
                       input_channel <= 4'b0001;
                       is_busy <= 16'hFFFD;
                       out_enable <= 1'b1; 
                    end
                    16'b0000000000000001: begin
                       input_channel <= 4'b0000;
                       is_busy <= 16'hFFFE;
                       out_enable <= 1'b1; 
                    end
                    default: begin 
                        is_busy = 16'h0000;
                        input_channel <= 16'h0000;
                        out_enable <= 1'b0;     
                    end                                                                                                                                                                                                                                                                            
                endcase
            end
            else if(frame_n[input_channel]) begin
                is_busy = 16'h0000;
                input_channel <= 16'h0000;
                out_enable <= 1'b0;     
            end
        end
    end
endmodule
