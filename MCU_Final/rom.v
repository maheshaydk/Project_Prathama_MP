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
  

    ROM[0]={10'd0,6'b101000};//MOV A,#0A
    ROM[1]=16'd10;
    ROM[2]={10'd0,6'b110100};//STE A,3FFE
    ROM[3]={1'b0,14'h3ffe,1'b1};
    ROM[4]={10'd0,6'b101000};//MOV A,#DD
    ROM[5]=16'hDD;
    ROM[6]={10'd0,6'b110100};//STE A,3FF7
    ROM[7]={1'b0,14'h3ff7,1'b1};
    
    

    ROM[8]={10'd0,6'b101000};//MOV A,#10
    ROM[9]=16'd10;
    ROM[10]={10'd0,6'b101010};//MOV C,#2
    ROM[11]=16'd2;
    ROM[12]={10'd0,6'b111101};//NAND A,C
    ROM[13]={8'b00000010,8'bx};
    
    
    
    
    ROM[200]={10'd0,6'b101001};//MOV A,#0A
    ROM[201]=16'd10;
    ROM[202]={10'd0,6'b101010};//MOV A,#0A
    ROM[203]=16'd10;
    ROM[204]={10'b0,6'b111010};
    ROM[205]={1'b1,12'd0,3'b0};

    
//  ROM[0]={10'd0,6'b101000};//MOV A,#20
//  ROM[1]=16'h0020;
//  ROM[2]={10'd0,6'b110100};//STE A,3FFE
//  ROM[3]={1'b0,14'h3ffe,1'b1};
//  ROM[4]={10'd0,6'b101000};//MOV A,#A
//  ROM[5]=16'h000A;
//  ROM[6]={10'd0,6'b110100};//STE A,3FF2
//  ROM[7]={1'b0,14'h3ff2,1'b1};
//  ROM[8]={10'd0,6'b101000};//MOV A,#2
//  ROM[9]=16'h0002;
//  ROM[10]={10'd0,6'b110100};//STE A,3FF2
//  ROM[11]={1'b0,14'h3ff2,1'b1};
//  ROM[12]={10'd0,6'b110000};//LDE B,3FF3
//  ROM[13]={1'b1,14'h3ff3,1'b1};
  
  
//  ROM[12]={10'd0,6'b101000};//MOV A,#1
//  ROM[13]=16'd1;
//  ROM[14]={10'd0,6'b110100};//STE A,3FF2
//  ROM[15]={1'b0,14'h3ff2,1'b1};
//  ROM[16]={10'd0,6'b110000};//LDE A,3FF1
//  ROM[17]={1'b0,14'h3ff1,1'b1};
//  ROM[18]={10'd0,6'b101010};//MOV C,#2
//  ROM[19]=16'd2;
//  ROM[20]={10'd0,6'b111101};//NAND A,C
//  ROM[21]={8'b00000010,8'bx};
//  ROM[22]={10'd0,6'b111101};//NOT A
//  ROM[23]={8'b11000000,8'bx};
//  ROM[24]={10'd0,6'b111110};//CMZ A
//  ROM[25]={5'b10000,11'bx};
//  ROM[26]={10'd0,6'b111000};//BZ 16
//  ROM[27]={1'b1,12'd16,3'bx};
//ROM[0]={10'd0,6'b101000};//MOV A,#10
//ROM[1]=16'd10;
//ROM[2]={10'd0,6'b101010};//MOV C,#2
//ROM[3]=16'd2;
//ROM[4]={10'd0,6'b111101};//NAND A,C
//ROM[5]={8'b00000010,8'bx};
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
