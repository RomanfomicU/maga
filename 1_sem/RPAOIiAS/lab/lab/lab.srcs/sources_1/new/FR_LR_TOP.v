`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 16:35:37
// Design Name: 
// Module Name: FR_LR_TOP
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


module FR_LR_TOP(
    input CLK,
    input SYS_NRST,
    input BTN_0,
    input BTN_1,
    input UART_RXD,
    output UART_TXD
    );

wire RST;
wire CE_1KHZ;

wire GEN_FRT_ERR;
wire GEN_PAR_ERR;

wire [3:0] HEX_DATA;
wire [7:0] ASCII_DATA;
wire HEX_FLG;

wire [3:0] DC_HEX_DATA;
wire [7:0] DC_ASCII_DATA;

wire [6:0] ADDR;
wire [7:0] DATA;

wire RX_DATA_EN;

wire [9:0] RX_DATA;
//wire [9:0] DATA_FSM;
wire [9:0] RX_DATA_ERR;
wire [7:0] TX_DATA;
wire RX_RDY;
wire [7:0] TX_RDY; 

reg [2:0] RST_SYNC = 3'b110;

//Sync RST
//--------------------------------------------
always @(posedge CLK, negedge SYS_NRST) begin
    if (~SYS_NRST)
        RST_SYNC <= 3'b001;
    else
        RST_SYNC <= {RST_SYNC[1:0], 1'b0};
end

assign RST = RST_SYNC[2];
//--------------------------------------------
//Divider 1kHz
FR_DIVIDER #(
    .DIVIDER(100000)
) div1khz(
    .CLK(CLK),
    .RST(RST),
    .CEO(CE_1kHz)
);
//--------------------------------------------
//----------------------------------------
//Filter BTN-0
M_BTN_FILTER_V10 filt_btn0(
  .CLK(CLK),                 // System Clock
  .CE(CE_1kHz),              // CE (1-2kHz - optimal)
  .BTN_IN(BTN_0),            // Asynch. Input From Button
  .RST(RST),                 // Asynch. Reset
  .BTN_OUT(GEN_FRT_ERR)     // Filtered Output
//  .BTN_CEO()                 // Clock Enable Pulse When L-H Transition
);
//----------------------------------------
//Filter BTN-1
M_BTN_FILTER_V10 filt_btn1(
  .CLK(CLK),                 // System Clock
  .CE(CE_1kHz),              // CE (1-2kHz - optimal)
  .BTN_IN(BTN_1),            // Asynch. Input From Button
  .RST(RST),                 // Asynch. Reset
  .BTN_OUT(GEN_PAR_ERR)     // Filtered Output
//  .BTN_CEO()                 // Clock Enable Pulse When L-H Transition
);
//-----------------------------------------
// CL GenErr
FR_GEN_ERR(
    .RX_DATA_T(RX_DATA),
    .GEN_FRT_ERR(GEN_FRT_ERR),
    .GEN_PAR_ERR(GEN_PAR_ERR),
    .DATA(RX_DATA_ERR)
);

// Контроллер UART
// ------------------------------------------------------
FR_UART uart(
    .CLK(CLK),
    .RST(RST),
    .RXD(UART_RXD),
    .TXD(UART_TXD),
    .RX_DATA_EN(RX_DATA_EN),
    .RX_DATA_T(RX_DATA),
    .TX_RDY_T(TX_RDY),
    .TX_DATA_R(TX_DATA),
    .TX_RDY_R(RX_RDY)
);

FR_DC_ASCII_HEX ascii_hex(
    .ASCII(ASCII_DATA),
    .HEX(DC_HEX_DATA),
    .HEX_FLG(HEX_FLG)
);

FR_DC_HEX_ASCII hex_ascii(
    .HEX(HEX_DATA),
    .ASCII(DC_ASCII_DATA)
);

FR_ROM rom(
    .ADDR(ADDR),
    .DATA(DATA)
);

FR_FSM fr_fsm(
    .CLK(CLK),
    .RST(RST),
    .RX_DATA_EN(RX_DATA_EN),
    .RX_DATA_R(RX_DATA_ERR),
    .TX_RDY_T(TX_RDY),
    .TX_DATA_T(TX_DATA),
    .TX_RDY_R(RX_RDY),
    .ASCII_DATA(ASCII_DATA),
    .HEX_FLG(HEX_FLG),
    .DC_HEX_DATA(DC_HEX_DATA),
    .HEX_DATA(HEX_DATA),
    .DC_ASCII_DATA(DC_ASCII_DATA),
    .ADDR(ADDR),
    .DATA(DATA)
);
endmodule

