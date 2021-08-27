`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2021 10:06:56
// Design Name: 
// Module Name: rom
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
//read only memory
module rom(input cs,clk,input [15:0] address,output reg ready,output reg [15:0] data);
reg [15:0] ROM[0:(2**12-1)];
integer state=0;

initial
  begin
  ROM[0]={10'd0,6'b101000};//MOV A,#1
  ROM[1]=16'd1;
  ROM[2]={10'd0,6'b110100};//STE A,3FFE
  ROM[3]={1'b0,14'd16382,1'b1};
  ROM[4]={10'd0,6'b110100};//STE A,3FFF
  ROM[5]={1'b0,14'd16383,1'b1};
  
  ROM[6]={10'd0,6'b101010};//MOV C,#10
  ROM[7]=16'd1500;
  
  ROM[8]={10'd0,6'b101000};//MOV A,#10
  ROM[9]=16'hffff;
  ROM[10]={10'd0,6'b110100};//STE A,3FF8
  ROM[11]={1'b0,14'b11111111111000,1'b1};
  ROM[12]={10'd0,6'b101000};//MOV A,#2
  ROM[13]=16'd2;
  ROM[14]={10'd0,6'b110100};//STE A,3FF9
  ROM[15]={1'b0,14'b11111111111001,1'b1};
  ROM[16]={10'd0,6'b101001};//MOV B,#3
  ROM[17]=16'd1;
  ROM[18]={10'd0,6'b110000};//LDE A,3FF9
  ROM[19]={1'b0,14'b11111111111001,1'b1};
  ROM[20]={10'd0,6'b111110};//CMP A,B
  ROM[21]={7'd0,1'b1,8'bx};
  ROM[22]={10'd0,6'b111001};//BNZ 10
  ROM[23]={1'b0,12'd12,3'bx};
  
  ROM[24]={10'd0,6'b001010};//SUB C,#1
  ROM[25]=16'd1;
  ROM[26]={10'd0,6'b111110};//CMZ C
  ROM[27]={5'b10010,11'bx};
  ROM[28]={10'd0,6'b111001};//BNZ 8
  ROM[29]={1'b0,12'd8,3'bx};
  
  ROM[30]={10'd0,6'b101000};//MOV A,#0
  ROM[31]=16'd0;
  ROM[32]={10'd0,6'b110100};//STE A,3FFF
  ROM[33]={1'b0,14'd16383,1'b1};
  
   ROM[34]={10'd0,6'b101010};//MOV C,#10
   ROM[35]=16'd1500;
   
  ROM[36]={10'd0,6'b101000};//MOV A,#10
  ROM[37]=16'hffff;
  ROM[38]={10'd0,6'b110100};//STE A,3FF8
  ROM[39]={1'b0,14'b11111111111000,1'b1};
  ROM[40]={10'd0,6'b101000};//MOV A,#2
  ROM[41]=16'd2;
  ROM[42]={10'd0,6'b110100};//STE A,3FF9
  ROM[43]={1'b0,14'b11111111111001,1'b1};
  ROM[44]={10'd0,6'b101001};//MOV B,#3
  ROM[45]=16'd1;
  ROM[46]={10'd0,6'b110000};//LDE A,3FF9
  ROM[47]={1'b0,14'b11111111111001,1'b1};
  ROM[48]={10'd0,6'b111110};//CMP A,B
  ROM[49]={7'd0,1'b1,8'bx};
  ROM[50]={10'd0,6'b111001};//BNZ 10
  ROM[51]={1'b0,12'd40,3'bx};
  
   ROM[52]={10'd0,6'b001010};//SUB C,#1
   ROM[53]=16'd1;
   ROM[54]={10'd0,6'b111110};//CMZ C
   ROM[55]={5'b10010,11'bx};
   ROM[56]={10'd0,6'b111001};//BNZ 8
   ROM[57]={1'b0,12'd36,3'bx};
  
  ROM[58]={10'd0,6'b111000};//B 4
  ROM[59]={1'b0,12'd4,3'bx};
end

always@ (posedge clk)
begin
case(state)
0:begin
if(cs)
state=1;
else
state=0;
end
1:state=2;//read
2:state=0;
endcase
end

always@(state)
begin
case(state)
0:begin
ready=1;
data=16'bZ;
end
1:ready=0;
//read
2:begin
data=ROM[address[11:0]];
ready=1;
end
endcase
end
endmodule
