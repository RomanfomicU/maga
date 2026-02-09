`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 16:40:07
// Design Name: 
// Module Name: FR_GEN_ERR
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


module FR_GEN_ERR(
    input [9:0] RX_DATA_T,
    input GEN_FRT_ERR,
    input GEN_PAR_ERR,
    output [9:0] DATA
    );
    
assign DATA[7:0] = RX_DATA_T[7:0];
assign DATA[8]   = RX_DATA_T[8] ^ GEN_PAR_ERR;
assign DATA[9]   = RX_DATA_T[9] ^ GEN_FRT_ERR;
endmodule
