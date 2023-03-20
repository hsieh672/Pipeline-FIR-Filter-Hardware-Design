`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/16 22:43:20
// Design Name: 
// Module Name: mul
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


module mul(
    input [12:0] din1,
    input [12:0] din2,
    output reg [25:0] dout
    );
    integer i;
    
    always@(*)
    begin
        dout = 0;
        for(i = 0; i < 13; i = i + 1)
        begin
            if(din2[i] == 1)
            begin
                dout = (din1 << i) + dout;
            end
            else
                dout = dout;
        end
    end
    
endmodule

