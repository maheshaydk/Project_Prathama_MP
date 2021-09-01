`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2021 15:17:43
// Design Name: 
// Module Name: cu2
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
//fetch-decode
module cu2(clk,reset,ready_dec,ready_fcu,cs_fcu,sel_fcu,cs_dec,outf,cs_stack,sdata,push,ready_stack,Ireset1,Ireset2);
input clk,reset,ready_dec,ready_fcu,ready_stack;
output reg cs_fcu,sel_fcu,cs_dec,cs_stack,push,Ireset1,Ireset2;
input [1:0] outf;
output [15:0] sdata;
integer state=0;

always@(posedge clk)
begin
case(state)
0:begin
if(reset)
state=0;
else
state=1;
end
1:begin
if(outf==2'b0)
state=2;
else
state=6;
end
//fetch
2: state=3;
3:begin
if(ready_fcu)
state=4;
else
state=3;
end
4:state=5;
//decode
5:begin
if(ready_dec)
state=1;
else
state=5;
end
6:state=7;
7:begin
if(ready_stack)
state=2;
else
state=7;
end
endcase
end

always@(state)
begin
case(state)
0:begin
cs_fcu=1'bz;
cs_dec=1'bz;
end
1:cs_dec=1'bZ;
//fetch
2:begin
cs_fcu=1;
cs_dec=1'bZ;
sel_fcu=1;
cs_stack=1'bZ;
push=1'bZ;
 Ireset2=1'bz;//i change
Ireset1=1'bz;

end
//decode
4:begin
cs_dec=1;
cs_fcu=1'bZ;
end
6:begin
Ireset1=1'b1;
cs_stack=1;
push=1;
end
7:begin
   
    Ireset2=1'b1;//this makes pc =200;
    Ireset1<=1'b1;//i change

 end
endcase
end
endmodule
