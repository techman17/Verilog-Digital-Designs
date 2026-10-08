`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2026 02:50:25
// Design Name: 
// Module Name: ALU_4bit
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


module ALU_4bit(
    input [2:0]s, [3:0]a,[3:0]b, output  [3:0]G, output ZF,OF
    );
    wire [3:0]w0,w1,w2,w3,w4,w5,w6,w7;
    wire [31:0]io;
    assign w0 = a&b;
    assign w1 = a|b;
    assign w2 = a^b;
    assign w3 = ~a;
    assign w4 = a+b;
    assign w5 = a-b;
    assign w6 = a>>1;
    assign w7 = b>>1;
    
    assign io = {w7,w6,w5,w4,w3,w2,w1,w0};
    mux_8_1 m1(io,s,G);
    
    
    assign ZF = (G == 4'd0);
    assign OF = (s == 3'd4) ? ((a[3] == b[3]) && (G[3] != a[3]))
                : (s == 3'd5) ? ((a[3] != b[3]) && (G[3] != a[3]))
                : 1'b0;   
    
endmodule

module mux_8_1(
    input [31:0]i, [2:0]s, output reg [3:0]out
);
    always@(*)
    begin
        case(s) 
        0: out = i[3:0];
        1: out = i[7:4];
        2: out = i[11:8];
        3: out = i[15:12];
        4: out = i[19:16];
        5: out = i[23:20];
        6: out = i[27:24];
        7: out = i[31:28];
        default: out = 0;
        endcase
    end
    
endmodule

