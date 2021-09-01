`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 09:30:54
// Design Name: 
// Module Name: uart
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

module uart(Parallel_In,Serial_In,UCR,Serial_Out,clock_in,Parallel_Out,USR);
input [7:0]Parallel_In;
input [15:0] UCR;
output [15:0] USR;
//reg [15:0] usrg;
//input load;
input Serial_In;
output Serial_Out;
wire clock_out;
wire [15:0] USR1,USR2;
//wire [15:0] USR;
reg clk,Clk;
input clock_in;
output [7:0] Parallel_Out;

//wire [9:0] tbuf;
//reg [15:0] sr=16'h000A;
Clock_divider c1 (clock_in,clock_out);
Shiftregister_PISO s1 (Clk, Parallel_In, Serial_Out,UCR,USR1);
sipo d2(Serial_In,clk,Parallel_Out,UCR,USR2);
//reg stop,start;
assign USR=USR2;

always @(clock_in)
begin
clk=clock_out;
end

always @(clock_in)
begin
Clk=clock_out;
end

endmodule