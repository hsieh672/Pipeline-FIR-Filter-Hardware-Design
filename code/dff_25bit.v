`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/26 21:26:18
// Design Name: 
// Module Name: dff_25bit
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


module dff_25bit(clk,rst,d,q);// sub module d flipflop
    input clk,rst;
    input [25:0]d;
    output [25:0]q;
    reg [25:0]q;
    
    always@(posedge clk)
    begin
        if(rst==1)
        begin
            q=0;
        end
        else
        begin
            q=d;
        end
    end
endmodule
