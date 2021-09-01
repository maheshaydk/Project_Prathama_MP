`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2021 10:52:08
// Design Name: 
// Module Name: stack
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


module stack(reset,clk,data,push,cs,ready);
parameter data_width=16;
parameter address_width=4;
parameter memory_depth=2**4;
//input  [data_width-1:0]pc_in2;
reg [address_width-1:0] sp;
input cs,push,clk,reset;
output reg ready ;
inout [data_width-1:0]data;
reg [data_width-1:0] STACK[memory_depth-1:0];
reg [data_width-1:0] data1;
integer state=0;

always@(posedge clk)
begin
case(state)
0: begin
if(reset)
state=0;
else
state=1;
end
1:begin
if(cs)
state=2;
else
state=1;
end
2:begin
if(push)//push
state=3;
else//pop
state=4;
end
3:begin
if(sp==4'b1110)
state=1;
else
state=5;
end
5:state=1;
4:begin
if(sp==4'b0000)
state=1;
else
state=6;
end
6:state=1;
endcase
end

always@(state)
begin
case(state)
0:begin
sp=0;
data1=16'bZ;
end
1:ready=1;
2:begin
ready=0;
end
//push
5:begin

STACK[sp]=data;
sp=sp+1;
ready=1;
end
//pop
6:begin
sp=sp-1;
data1=STACK[sp];
ready=1;
end
endcase
end
assign data=(~push)?data1:16'bZ;

endmodule

