`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 09:26:29
// Design Name: 
// Module Name: clock_divider
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


module Clock_divider(clock_in,clock_out);
input clock_in; // input clock on FPGA
output reg clock_out; // output clock after dividing the input clock by divisor
reg[15:0] counter=16'd0;
parameter DIVISOR = 16'd13312;

  always @(posedge clock_in)
  begin
  counter <= counter + 16'd1;
    if(counter>=(DIVISOR-1))
  counter <= 16'd0;
    clock_out <= (counter<DIVISOR/2.0)?1'b1:1'b0;
end
endmodule


