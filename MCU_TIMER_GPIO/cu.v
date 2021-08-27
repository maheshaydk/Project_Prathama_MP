`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2021 10:46:22
// Design Name: 
// Module Name: cu
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
//control unit
module cu(clk,reset,ready_ram,ready_rom,ready_ext_mem,ready_gpr,read,cs_ram,cs_rom,cs_ext_mem,cs_gpr,data,address);
input clk,reset,ready_ram,ready_rom,ready_ext_mem,ready_gpr;
output read,cs_ram,cs_rom,cs_ext_mem,cs_gpr;
output [15:0] address;
inout [15:0] data;
wire cs_dec,cs_fcu;
wire ready_dec,ready_fcu;
wire ready_bus,ready_eu,cs_eu,cs_biu,sel_fcu;
wire [1:0]sel_eu,sel_biu,op_sel;
//wire [15:0] bus;
wire reset,cout,c,z;
wire [15:0]fetch_address;
wire [31:0] ir;
reg cs_bu;
reg [1:0]flag;

//instantiation
decoder dec0(clk,cs_dec,ready_bus,ready_eu,ready_fcu,ir,ready_dec,cs_fcu,cs_biu,cs_eu,sel_fcu,sel_eu,sel_biu,flag);
biu biu0(ready_bus,read,cs_ram,cs_rom,cs_ext_mem,cs_gpr,cs_biu,clk, sel_biu,ir,sel_eu,op_sel,fetch_address,ready_ram,ready_rom,ready_ext_mem,ready_gpr,data,address);
eu eu0(ir,sel_eu,ready_bus,data,cs_eu,clk,ready_eu,op_sel,cs_biu,sel_biu,cout,c,z);
fcu fcu0(clk,reset,cs_fcu,sel_fcu,ready_fcu,fetch_address,ir,data,sel_biu,cs_biu,ready_bus);
cu2 cu2_0(clk,reset,ready_dec,ready_fcu,cs_fcu,sel_fcu,cs_dec);




always@(cs_biu)
begin
cs_bu=cs_biu;
end

always@*
begin
if(reset)
flag=2'd0;
else
begin
flag[1]=cout|c;
flag[0]=z;
end
end
endmodule