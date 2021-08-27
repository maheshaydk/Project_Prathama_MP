`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 11:25:26
// Design Name: 
// Module Name: cu_tb
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
//test_bench
module cutb;
reg clk,reset;
wire pin;
reg pin_in;
cu_main t1(clk,reset,pin);

initial
begin
  $dumpfile("dump.vcd"); $dumpvars;
clk=1'b0;
forever #5 clk=~clk;
end
//assign pin=16'd255;
initial
begin
reset=1;
#10;
reset=0;
#300000 $finish;
end
endmodule