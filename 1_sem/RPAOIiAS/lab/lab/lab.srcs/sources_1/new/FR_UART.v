`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 16:41:22
// Design Name: 
// Module Name: FR_UART
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


module FR_UART(
    input CLK,
    input RST,
    input RXD,
    output reg TXD,
    output reg RX_DATA_EN,
    output reg [9:0] RX_DATA_T,
    input TX_RDY_T,
    input [7:0] TX_DATA_R,
    output reg TX_RDY_R
    );
    
 reg [2:0] SYNC;
 reg [2:0] RX_STATE;
 reg [2:0] TX_STATE;
 reg [2:0] RX_DATA_CT;
 reg [2:0] TX_DATA_CT;
 reg [3:0] RX_SAMP_CT;
 reg [3:0] TX_SAMP_CT;
 reg [7:0] TX_DATA;
 reg TX_PAR_BIT_RG;
 reg RXCT_R;
 reg TXCT_R;
 
 wire RXD_RG;
 wire UART_CE;
 wire RX_CE;
 wire TX_CE;
//------------------------------------------
 localparam IDLE = 3'd0,
            RSTRB = 3'd1,
            RDT = 3'd2,
            RPARB = 3'd3,
            RSTB1 = 3'd4,
            RSTB2 = 3'd5,
            WEND = 3'd6;
 
 //------------------------------------------
 localparam WCE = 3'd1,
           TSTRB = 3'd2,
           TDT = 3'd3,
           TPARB = 3'd4,
           TSTB1 = 3'd5,
           TSTB2 = 3'd6;
 //------------------------------------------
 //Sync
 always@(posedge CLK, posedge RST)
    if(RST)
        SYNC <= 3'b111;
    else
        SYNC <= {SYNC[1:0], RXD};
 
assign RXD_RG = SYNC[2];
//--------------------------------------------
//Äåëèòåëü ÷àñòîòû
FR_DIVIDER #(
    .DIVIDER(5208)
)div1khz(
    .CLK(CLK),
    .RST(RST),
    .CEO(UART_CE)
);    
//--------------------------------------------
//RX_FSM
 always@(posedge CLK, posedge RST)
    if(RST)begin
        RX_STATE <= IDLE;
        RX_DATA_EN <= 1'b0;
        RX_DATA_T <= 10'h000;
        RX_DATA_CT <= {3{1'b0}};
        RXCT_R <= 1'b1;
   end
   else
    case(RX_STATE)
        IDLE: begin
            if(~RXD_RG) begin
                RX_DATA_EN <= 1'b0;
                RX_DATA_T[9] <= 1'b0;
                RXCT_R <= 1'b0;
                RX_STATE <= RSTRB;
            end
            else
                RX_DATA_EN <= 1'b0;
        end
        
        RSTRB: begin
            if(RX_CE) begin
                if(RXD_RG) begin
                    RXCT_R <= 1'b1;
                    RX_STATE <= IDLE;
                end
                else
                    RX_STATE <= RDT;
            end
        end
        
        RDT: begin
            if(RX_CE) begin
                if (RX_DATA_CT == 4'h7) RX_STATE <= RPARB;
                RX_DATA_T[7:0] <= {RXD_RG, RX_DATA_T[7:1]};
                RX_DATA_CT <= RX_DATA_CT + 1'b1;
          
            end
        end
        
        RPARB: begin
            if(RX_CE) begin
                RX_DATA_T[8] <= RXD_RG ^ 1'b0;
                RX_STATE <= RSTB1;
            end
        end
        
        RSTB1: begin
            if (RX_CE) begin
                RX_DATA_T[9] <= ~RXD_RG;
                RX_STATE <= RSTB2;
            end
        end
        
        RSTB2: begin
            if (RX_CE) begin
                if (RXD_RG) begin
                    RX_DATA_EN <= 1'b1;
                    RXCT_R <= 1'b1;
                    RX_STATE <= IDLE;
                end
                else begin
                    RX_DATA_T[9] <= 1'b1; // framing error: ñòîï-áèò 2 = 0
                    RX_STATE <= WEND;
                end
            end
        end
        
        WEND: begin
            if(RXD_RG) begin
                 RX_DATA_EN <= 1'b1;
                 RXCT_R <= 1'b1;
                 RX_STATE <= IDLE;
            end
        end
    endcase
//----------------------------------------
//TX-FSM
always@(posedge CLK,posedge RST) begin
  if(RST) begin
    TX_STATE <= IDLE;
    TX_DATA <= 8'h00;
    TX_PAR_BIT_RG <= 1'b0;
    TX_RDY_R <= 1'b1;
    TX_DATA_CT <= 3'b000;
    TXD <= 1'b1;
    TXCT_R <= 1'b1;
  end
  else case (TX_STATE) 
        IDLE: if (TX_RDY_T) begin
            TX_DATA <= TX_DATA_R;
            TX_PAR_BIT_RG <= 0; //ÌÅÃÀ ÂÎÏÐÎÑ
            TX_RDY_R <= 1'b0;
            if (UART_CE) begin
                TXD <= 1'b0;
                TXCT_R <= 1'b0;
                TX_STATE <= TSTRB;
            end
            else TX_STATE <= WCE;
        end
        WCE: if (UART_CE) begin
            TXD <= 1'b0;
            TXCT_R <= 1'b0;
            TX_STATE <= TSTRB;
        end
        TSTRB: if (TX_CE) begin
            TXD <= TX_DATA[0];
            TX_DATA <= {1'b0, TX_DATA[7:1]};
            TX_STATE <= TDT;
        end
        TDT: if (TX_CE) begin
            TX_DATA <= {1'b0, TX_DATA[7:1]};
            TX_DATA_CT <= TX_DATA_CT + 1'b1;
            if (TX_DATA_CT == 3'd7) begin
                TXD <= TX_PAR_BIT_RG;
                TX_STATE <= TPARB;
            end
            else begin 
                TXD <= TX_DATA[0];
            end
        end
        TPARB: if (TX_CE) begin
            TXD <= 1'b1;
            TX_STATE <= TSTB1;
        end
        TSTB1: if (TX_CE) begin
            TXD <= 1'b1;
            TX_STATE <= TSTB2;
        end
        TSTB2: if (TX_CE) begin
            TX_RDY_R <= 1'b1;
            TXCT_R <= 1'b1;
            TX_STATE <= IDLE;
        end
    endcase
end
  
//--------------------------------------------
//RX-SAMP-CT
always@(posedge CLK, posedge RST)
    if(RST)
        RX_SAMP_CT <= 0;
    else if (RXCT_R)
        RX_SAMP_CT <= 0;
    else if (UART_CE)
        RX_SAMP_CT <= RX_SAMP_CT + 1'b1;
        
assign RX_CE = (RX_SAMP_CT == 4'd7) & UART_CE;
//--------------------------------------------
//TX-SAMP-CT
always@(posedge CLK, posedge RST)
    if(RST)
        TX_SAMP_CT <= 0;
    else if (TXCT_R)
        TX_SAMP_CT <= 0;
    else if (UART_CE)
        TX_SAMP_CT <= TX_SAMP_CT + 1'b1;
        
assign TX_CE = (TX_SAMP_CT == 4'd15) & UART_CE;
endmodule
