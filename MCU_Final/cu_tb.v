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
//reg [15:0] pinsel0;
//reg [15:0] pinsel1;
wire [15:0] pin;
reg [15:0] pin1;

//ire [1:0]fun0,fun1,fun2,fun3,fun4,fun5,fun6,fun7,fun8,fun9,fun10,fun11,fun12,fun13,fun14,fun15;

//reg pin_in;
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
#100 pin1[0] =0;
        #1000;
        pin1[0]=1;
 
#30000 $finish;
end
assign pin=pin1;
endmodule