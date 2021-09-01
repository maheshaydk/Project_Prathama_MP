`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 09:29:50
// Design Name: 
// Module Name: sipo
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

module sipo(Serial_In,clk,Parallel_Out,UCR,USR);
input clk;
input Serial_In;
input [15:0] UCR=16'h0000;
output [15:0] USR;
reg [15:0] usrr;
assign USR=usrr;
output [7:0]Parallel_Out;
wire [7:0]Parallel_Out;
reg [9:0]rbr;
reg [3:0] count=0;
always@(UCR)
begin
if(UCR==16'h000A)
usrr=16'h0000;
end

always@(posedge clk)
begin
if(UCR==16'h000A)
begin
usrr=16'h0000;
rbr<=10'd0;
end
else if(UCR==16'h0002)
begin
rbr <=rbr<<1;
rbr[0]<=Serial_In;
end
end
wire [15:0]usrr1;
assign Parallel_Out=rbr[8:1];
assign usrr1[3:2]=2'b11;
always@(Parallel_Out)
begin
    if(count<10)
    count=count+1;
    else
    usrr<=usrr1;
end

endmodule


