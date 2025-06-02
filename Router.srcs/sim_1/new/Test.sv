`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2025 08:49:53 AM
// Design Name: 
// Module Name: Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


program automatic Test (router_io.Test rtr_io);
    bit [3:0] sa;
    bit [3:0] da;
    bit [7:0] payload[$];
    bit [7:0] valid_payload[$];
    logic [7:0] pkt2cmp_payload[$];
    initial begin
        reset();
        repeat(21) begin    
        gen();
        fork
            send();
            get_payload();
        join
        check();
        @(rtr_io.router_cb);
        end
    end
    task reset();
        rtr_io.reset_n <= 1;
        @(rtr_io.router_cb);
        rtr_io.reset_n <= 0;
        @(rtr_io.router_cb);
        rtr_io.reset_n <= 1;
        repeat(15) @(rtr_io.router_cb);
    endtask: reset
    task gen();
        sa = $urandom_range(0,15);
        da = $urandom_range(0,15);
        payload.delete();
//        valid_payload.delete();
        pkt2cmp_payload.delete();
        repeat($urandom_range(2,4)); begin
            payload.push_back($urandom($time));
//            valid_payload.push_back($urandom($time));
        end
    endtask: gen
    task send();
        rtr_io.router_cb.din <= 16'h0000;
        rtr_io.router_cb.valid_n <= 16'hffff;
        rtr_io.router_cb.frame_n <= 16'hffff;
        @(rtr_io.router_cb);
        send_addrs();
        send_pad();
        send_payload();
        @(rtr_io.router_cb);
        rtr_io.router_cb.frame_n[sa] <= 1;
        rtr_io.router_cb.valid_n[sa] <= 1;
    endtask: send
    task send_addrs();
        rtr_io.router_cb.frame_n[sa] <= 1'b0;
        @(rtr_io.router_cb);
        for(int i = 0; i < 4; i++) begin
            rtr_io.router_cb.din[sa] <= da[i];
            @(rtr_io.router_cb); 
        end
    endtask: send_addrs
    task send_pad();
        repeat(3) begin 
            rtr_io.router_cb.frame_n[sa] <= 0;
            @(rtr_io.router_cb);
        end
    endtask: send_pad
    task send_payload();
        bit [7:0] temp_payload;
//        bit [7:0] temp_valid_n;
        repeat(payload.size()) begin
            temp_payload = payload.pop_back();
//            temp_valid_n = valid_payload.pop_back(); 
            for(int j = 0; j < 8; j++) begin
                rtr_io.router_cb.valid_n[sa] <= 0;
                rtr_io.router_cb.din[sa] <= temp_payload[j];
                rtr_io.router_cb.frame_n[sa] <= 0;
                @(rtr_io.router_cb);
            end
        end
    endtask: send_payload
    task get_payload();
        bit [7:0] pkt2save;
        forever begin
            for (int j = 0; j < 8; j++) begin
                if(rtr_io.router_cb.frameo_n[da]);
                    break;
                pkt2save[j] = rtr_io.router_cb.dout[da];
            end
            pkt2cmp_payload.push_back(pkt2save);
            @(negedge rtr_io.router_cb.frameo_n[da]);
            if(rtr_io.router_cb.frameo_n[da]);
                break;
        end
    endtask: get_payload
    task check();
        bit is_right;
        for(int i = 0; i < payload.size(); i++) begin
            is_right = compare();
            if(is_right) $display("Packet: %d sent and received successfully", i);
            else $display("Packet: %d sent and received failed", i);
        end
    endtask: check
    function compare();
        if(pkt2cmp_payload.pop_back() == payload.pop_back()) return 1;
        else return 0;
    endfunction: compare
endprogram: Test
