`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2021 09:28:32
// Design Name: 
// Module Name: shiftreg_piso
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


module Shiftregister_PISO(Clk, Parallel_In, Serial_Out,UCR,USR);
input Clk;
input [15:0] UCR = 16'h0000;
output [15:0] USR;
reg [15:0] usrg;
assign USR=usrg;
input [7:0]Parallel_In;
output reg Serial_Out=1'b1;
reg [9:0]tbr;
reg[3:0] count=0;
reg [7:0] Parallel_In_reg;
always@(UCR)
begin
if(UCR==16'h0005)
usrg=16'h0000;
end

always @(Parallel_In)
begin
Parallel_In_reg<=Parallel_In;
end
always@(UCR)
begin
tbr<={1'b0,Parallel_In_reg,1'b1};
end
always @(posedge Clk)
begin
if(UCR==16'h0001)
begin
  if(count<10)
  begin
    Serial_Out<=tbr[9];
    tbr<={tbr[8:0],1'b0};
    count=count+1;
  end
  else
  begin
     Serial_Out=1'b1;
     usrg[1:0]=2'd3;
     tbr=10'd0;
end
end
end

endmodule
