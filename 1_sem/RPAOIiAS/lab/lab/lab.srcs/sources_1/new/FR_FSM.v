`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 17:03:41
// Design Name: 
// Module Name: FR_FSM
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


module FR_FSM(
    input CLK,
    input RST,
    input RX_DATA_EN,
    input [9:0] RX_DATA_R,
    output reg TX_RDY_T,
    output reg [7:0] TX_DATA_T,
    input TX_RDY_R,
    output [7:0] ASCII_DATA,
    input HEX_FLG,
    input [3:0] DC_HEX_DATA,
    output reg [3:0] HEX_DATA,
    input [7:0] DC_ASCII_DATA,
    input [7:0] DATA,
    output reg [6:0] ADDR
);

reg [3:0] STATE;
reg [67:0] RES_REG;
reg [4:0] RES_CT;
reg [6:0] ERR_A0_MX;
reg [6:0] ERR_A1_MX;
reg [35:0] DATA_REG;
reg [3:0] DATA_CT;
reg [6:0] END_ADDR;
reg RES_FLG;

wire [6:0] RES_A0;
wire [6:0] RES_A1;

//---------------------------------
localparam IDLE = 4'd0,
           RDT = 4'd1,
           RCR = 4'd2,
           RLF = 4'd3,
           TRES = 4'd4,
           TMEM = 4'd5,
           TDT = 4'd6,
           TCR = 4'd7,
           TLF = 4'd8;
//-----------------------------------
assign ASCII_DATA = RX_DATA_R[7:0];
//-------------------------

always@(*)
    case(RES_CT)
        0: HEX_DATA = RES_REG[67:64];
        1: HEX_DATA = RES_REG[63:60];
        2: HEX_DATA = RES_REG[59:56];
        3: HEX_DATA = RES_REG[55:52];
        4: HEX_DATA = RES_REG[51:48];
        5: HEX_DATA = RES_REG[47:44];
        6: HEX_DATA = RES_REG[43:40];
        7: HEX_DATA = RES_REG[39:36];
        8: HEX_DATA = RES_REG[35:32];
        9: HEX_DATA = RES_REG[31:28];
        10: HEX_DATA = RES_REG[27:24];
        11: HEX_DATA = RES_REG[23:20];
        12: HEX_DATA = RES_REG[19:16];
        13: HEX_DATA = RES_REG[15:12];
        14: HEX_DATA = RES_REG[11:8];
        15: HEX_DATA = RES_REG[7:4];
        16: HEX_DATA = RES_REG[3:0];
        default: HEX_DATA = 4'b0;
    endcase    
//-------------------------
assign RES_A0 = 6'd0;    
assign RES_A1 = 6'd6;
//-------------------------    
always@(*)
    case(RX_DATA_R[9:8])
        2'b00: begin
            ERR_A0_MX = 7;
            ERR_A1_MX = 23;
        end
        2'b01: begin
            ERR_A0_MX = 24;
            ERR_A1_MX = 39;
        end        
        2'b10: begin
            ERR_A0_MX = 40;
            ERR_A1_MX = 61;
        end
        2'b11: begin
            ERR_A0_MX = 62;
            ERR_A1_MX = 71;
        end
    endcase
//-----------------------------------

always @(posedge CLK, posedge RST) begin 
    if (RST) begin
        TX_DATA_T <= 8'h00;
        TX_RDY_T <= 1'b0;
        DATA_CT <= {4{1'b0}};//ÂÎÏÐÎÑ!
        RES_CT <= {5{1'b0}};//ÂÎÏÐÎÑ!
        RES_REG <= {68{1'b1}};//ÂÎÏÐÎÑ!
        DATA_REG <= {36{1'b0}};//ÂÎÏÐÎÑ!
        ADDR <= {7{1'b0}};
        END_ADDR <= {7{1'b0}};
        RES_FLG <= 1'b0;
        STATE <= IDLE;
    end
    else case (STATE)
        IDLE: if (RX_DATA_EN) begin
            if (RX_DATA_R[9] | RX_DATA_R[8]) begin
                ADDR <= ERR_A0_MX;
                END_ADDR <= ERR_A1_MX;
                STATE <= TRES;
            end
            else if (HEX_FLG) begin
                ADDR <= RES_A0;
                END_ADDR <= RES_A1;
                DATA_REG <= {32'b0, DC_HEX_DATA};
                DATA_CT  <= 4'd1;
                STATE <= RDT;
            end
            else begin
                ADDR <= 7;
                END_ADDR <= 23;
                STATE <= TRES;
            end
        end
        RDT: if (RX_DATA_EN) begin
            if (HEX_FLG) begin 
                ADDR <= RES_A0;
                END_ADDR <= RES_A1;
                DATA_REG <= {DATA_REG[31:0], DC_HEX_DATA};
                DATA_CT <= DATA_CT + 1'b1;
                if (DATA_CT == 4'd8) begin
                    DATA_CT <= {4{1'b0}};
                    STATE <= RCR;
                end
            end
            else if (RX_DATA_R[9] | RX_DATA_R[8]) begin
                ADDR <= ERR_A0_MX;
                END_ADDR <= ERR_A1_MX;
                STATE <= TRES;
            end
            else begin
                ADDR <= 7;
                END_ADDR <= 23;
                STATE <= TRES;
            end
        end
        RCR: if (RX_DATA_EN) begin
            if (RX_DATA_R[7:0] == 8'h0D) begin 
                STATE <= RLF;
            end
            else if (RX_DATA_R[9] | RX_DATA_R[8] | RX_DATA_R[7:0] != 8'h0D) begin 
                ADDR <= ERR_A0_MX;
                END_ADDR <= ERR_A1_MX;
                STATE <= TRES;
            end
        end
        RLF: if (RX_DATA_EN) begin
            if (RX_DATA_R[7:0] == 8'h0A) begin 
                RES_REG <= RES_REG + DATA_REG;
                RES_FLG <= 1'b1;
                STATE <= TRES;
            end
            else if (RX_DATA_R[9] | RX_DATA_R[8] | RX_DATA_R[7:0] != 8'h0A) begin 
                ADDR <= ERR_A0_MX;
                END_ADDR <= ERR_A1_MX;
                STATE <= TRES;
            end
        end
        TRES: begin
            TX_DATA_T <= DATA;
            TX_RDY_T <= 1'b1;
            ADDR <= ADDR + 1'b1;
            STATE <= TMEM;
        end
        TMEM: if (TX_RDY_R) begin
            if (ADDR == END_ADDR + 1) begin 
                if (RES_FLG) begin
                    RES_FLG <= 1'b0;
                    TX_DATA_T <= DC_ASCII_DATA;
                    RES_CT <= RES_CT + 1'b1;
                    STATE <= TDT;
                end
                else begin 
                    TX_DATA_T <= 8'h0D;
                    STATE <= TCR;
                end
            end
            else begin
                TX_DATA_T <= DATA;
                ADDR <= ADDR + 1'b1;
            end
        end
        TDT: if (TX_RDY_R) begin
            if (RES_CT == 5'd17) begin //ÂÎÏÐÎÑ!
                TX_DATA_T <= 8'h0D;
                RES_CT <= {5{1'b0}}; //ÂÎÏÐÎÑ!
                STATE <= TCR;
            end
            else begin 
                TX_DATA_T <= DC_ASCII_DATA;
                RES_CT <= RES_CT + 1'b1;
            end
        end
        TCR: if (TX_RDY_R) begin
            TX_DATA_T <= 8'h0A;
            STATE <= TLF;
        end
        TLF: if (TX_RDY_R) begin
            TX_RDY_T <= 1'b0;
            STATE <= IDLE;
        end
    endcase
end
endmodule
