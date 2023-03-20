`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/13 21:20:03
// Design Name: 
// Module Name: dff
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

module dff(clk,rst,d,q);// sub module d flipflop
    input clk,rst;
    input [12:0]d;
    output [12:0]q;
    reg [12:0]q;
    
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