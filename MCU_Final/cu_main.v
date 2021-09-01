module cu_main(clk,reset,pin);
input clk,reset;
inout [15:0] pin;
wire ready_ram,ready_rom,ready_ext_mem,ready_gpr;
wire read,cs_ram,cs_rom,cs_ext_mem,cs_gpr,T_EN,T_FLAG,uart_RX0,uart_TX0,IE0,IE1 ,uart_RX1,uart_TX1,Ireset;
wire [15:0] address,timerval;
wire [15:0] data,pinsel0,pinsel1,gp_mem,THR,UCR,RBR,USR,mem;
wire [1:0] outf;

cu cu0(clk,reset,ready_ram,ready_rom,ready_ext_mem,ready_gpr,read,cs_ram,cs_rom,cs_ext_mem,cs_gpr,data,address,outf,Ireset);
ext_mem emem0(clk,data,read,address,cs_ext_mem,ready_ext_mem,timerval,T_EN,T_FLAG,pinsel0,pinsel1,gp_mem,THR,UCR,RBR,USR,mem,Ireset);
gpr gpr0(clk, data,read,address,cs_gpr,ready_gpr);
ram ram0(clk,data,read,address,cs_ram,ready_ram);
rom rom0(cs_rom,clk,address,ready_rom,data);
timer timer0(timerval,clk,T_EN,T_FLAG);
GPIO g0(pin,pinsel0,pinsel1,gp_mem,uart_RX0,uart_TX0,IE0,IE1 ,uart_RX1,uart_TX1);
uart uart0(THR,uart_RX0,UCR,uart_TX0,clk,RBR,USR);
main IE(mem,outf,IE0,IE1);
endmodule
