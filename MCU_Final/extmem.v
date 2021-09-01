module ext_mem(clk,data,read,address,cs_ext_mem,ready_ext_mem,timerval,T_EN,T_FLAG,pinsel0,pinsel1,gp_mem,THR,UCR,RBR,USR,mem,Ireset2);
parameter data_width=16;
parameter address_width=16;
parameter memory_depth=2**4;
inout  [data_width-1:0]data,gp_mem;
input[address_width-1:0] address,USR,RBR;
input cs_ext_mem,read,clk,T_FLAG,Ireset2 ;
output [15:0] timerval,pinsel0,pinsel1,THR,UCR,mem;
output reg ready_ext_mem ;
inout T_EN;
reg [data_width-1:0] EXTMEM[memory_depth-1:0];
reg [data_width-1:0] data_1;
integer state=0;

always@(posedge clk)
begin
case(state)
0: begin
if(cs_ext_mem)
state=1;
else
state=0;
end
1:begin
if(~read)//write
state=2;
else//read
state=3;
end
2:state=0;
3:state=0;
endcase
end

always@(state)
case(state)
0:begin
ready_ext_mem=1;
data_1=16'bZ;
end
1:ready_ext_mem=0;
//write
2:begin
EXTMEM[address[3:0]]=data;
ready_ext_mem=1;
end
//read
3:begin
data_1=EXTMEM[address[3:0]];
ready_ext_mem=1;
end
endcase

assign data=(cs_ext_mem&read)?data_1:16'bZ;
assign timerval = EXTMEM[8];
assign T_EN=EXTMEM[9][1];
assign pinsel0= EXTMEM[14];
assign pinsel1=EXTMEM[13];
assign gp_mem=EXTMEM[15];
assign THR=EXTMEM[0];
assign UCR=EXTMEM[2];
assign mem=EXTMEM[7];
always@(T_FLAG)
begin
EXTMEM[9][0]=T_FLAG;
if(T_FLAG)
EXTMEM[9][1]=0;
end
always@(gp_mem)
EXTMEM[15]=gp_mem;

always@(USR)
EXTMEM[1]=USR;

always@(RBR)
EXTMEM[3]=RBR;
//always@(T_EN)
always@(posedge Ireset2)
begin
EXTMEM[7][0]=1'b0;
EXTMEM[7][4]=1'b0;
end
endmodule
