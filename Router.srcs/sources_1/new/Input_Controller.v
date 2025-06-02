`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Information Technology (UIT)
// Engineer: Nguyen Tran Xuan Bach
// 
// Create Date: 03/11/2025 06:01:32 PM
// Design Name: Router
// Module Name: Input Controller
// Project Name: Router
// Target Devices: Virtex-7 VC707 Evaluation Platform
// Tool Versions: Vivado 2024.1
// Description: 
// This module can be considered as controller of a single Input Port, Designed in FSM with 5 states
// State 0: Stable state, waiting for the Port's frame_n to reset
// State 1: Fetch Address state, this Controller will send control signal to register Add_in to start the address fetching procedure, because the address has 4 bit and will be transmited one bit per clock so this state will be transfer after 4 clocks
// State 2: Load Address state, this Module will send Load_Address signal to register Add_in to Load full address from it
// State 3: Send Request state, Input Controller will send request signal to Output Controller depends on the address it loaded from previous state
// State 4: Waiting Respond state, Input Controller wait to receive Respond from Output Controller, if the Respond mean "Connect success" then this state will be hold to continue connection, if not, the state will be back to state 0
// Dependencies:  
// 
// Revision:
// Revision 0.01 - File Created
// 
//////////////////////////////////////////////////////////////////////////////////


module Input_Controller #(
    parameter ADDR_WIDTH = 4,
    parameter OUTPUT_WIDTH = 16
)(
    input wire clk,
    input wire reset_n,
    input wire frame_n,
    input wire [ADDR_WIDTH - 1:0] Connect_ADDR,
    input wire [OUTPUT_WIDTH - 1:0] is_busy,
    output reg Fetch_ADDR,
    output reg Load_ADDR,
    output reg [OUTPUT_WIDTH - 1:0] request 
    );
    reg [2:0] current_state;
    reg [2:0] next_state;
    reg [2:0] addr_counter;
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            current_state = 3'b000;
            addr_counter = 3'b000;
        end
        else begin        
            current_state = next_state;
            if(current_state == 3'b001 && addr_counter < 3'b100) begin
                addr_counter = addr_counter + 3'b001;
            end
            else if(current_state == 3'b001 && addr_counter >= 3'b100) begin
                addr_counter = 3'b000;
            end
        end
    end
    always@(*) begin
        case(current_state) 
            3'b000: begin //stable
                addr_counter = 0;
                if(!frame_n) next_state = 3'b001;
                else next_state = 3'b000;
            end
            3'b001: begin // ADDR_Fetch
                if(frame_n == 0 && addr_counter >= 3'b100) begin
                    next_state = 3'b010;
                    addr_counter = 0;
                end
                else if(frame_n == 0 && addr_counter < 3'b100) begin
                    next_state = 3'b001;
                end
                else next_state = 3'b000;
            end
            3'b010: begin //ADDR_Receive
                if(!frame_n) next_state = 3'b011;
                else next_state = 3'b000;
            end
            3'b011: begin // Send Request
                if(!frame_n) next_state = 3'b100;
                else next_state = 3'b000;
            end
            3'b100: begin // Respond waiting
                if(frame_n == 0 && is_busy[Connect_ADDR] == 0) next_state = 3'b100;
                else next_state = 3'b000;
            end
            default: next_state = 3'b000;
        endcase
    end
    always@(*) begin
        Fetch_ADDR = 0;
        Load_ADDR = 0;
        request = 16'h0000;
        if(current_state == 3'b001) begin
            Fetch_ADDR = 1;
        end
        if(current_state == 3'b010) begin
            Load_ADDR = 1;
        end
        if(current_state == 3'b011 || current_state == 3'b100) begin
            request[Connect_ADDR] = 1;
        end
    end
endmodule
