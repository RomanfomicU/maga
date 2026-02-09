`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 17:03:02
// Design Name: 
// Module Name: FR_ROM
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


module FR_ROM(
    input [6:0] ADDR,
    output [7:0] DATA
);

reg [7:0] ROM [0:127];

initial $readmemh("ROM0.mem", ROM);

assign DATA = ROM[ADDR];


endmodule
