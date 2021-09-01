`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2021 10:47:55
// Design Name: 
// Module Name: main_ie
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


module main(mem,outf,int_0,int_1);
input [15:0]mem;
input int_0,int_1;
output[1:0]outf; 
reg [1:0]out;
reg [1:0]state;    
wire out_0,out_1;
assign outf=out;
initial 
    state=0;
    
always@*
    begin
        case(state)
            0:begin
            if(out_0==1)
                state=1;
            else if(out_1==1)
                state=2;        
            end
            1,2:begin
                if(mem[0]==0|mem[4]==0)
                    state=3;
            end 
            3:begin
                if(mem[0]==1|mem[4]==1)
                    state=0;
            end 
        endcase    
    end
    
always@(state)
    begin
        case(state)
            1:out=2'b10;
            2:out=2'b01;
            0,3:out=2'b00;
        endcase
    end 

interrupt IE0(mem[0],int_0,mem[2],mem[3],out_0);
interrupt IE1(mem[4],int_1,mem[6],mem[7],out_1);
endmodule
