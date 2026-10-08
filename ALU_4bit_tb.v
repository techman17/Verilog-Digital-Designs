`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2026 14:04:16
// Design Name: 
// Module Name: ALU_4bit_tb
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


module ALU_4bit_tb(

    );
    reg [2:0]s;
    reg [3:0]a;
    reg [3:0]b;
    wire [3:0]G;
    wire ZF,OF;
    integer i,j,k;
    ALU_4bit dut(s,a,b,G,ZF,OF);
    initial
        begin
            {s,a,b} = 0;
            end
    initial begin
        for(k=0;k<8;k=k+1) begin
            for(i=0;i<16;i=i+1) begin
                for(j=0;j<16;j=j+1) begin
                    #1;
                    a=i[3:0];
                    b=j[3:0];
                    s=k[2:0];
                    $display("s=%d a=%h b=%h G=%h ZF=%b OF=%b", s, a, b, G, ZF, OF);
                end
             end
        end
            
        $finish;
    end
endmodule
