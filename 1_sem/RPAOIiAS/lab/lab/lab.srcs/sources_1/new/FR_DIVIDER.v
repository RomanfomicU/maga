`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 16:37:19
// Design Name: 
// Module Name: FR_DIVIDER
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


module FR_DIVIDER #(
    parameter DIVIDER = 100000
)(
    input CLK,
    input RST,
    output reg CEO
);

reg [$clog2(DIVIDER)-1:0] COUNTER;

always @(posedge CLK, posedge RST) begin
    if (RST) begin 
        COUNTER = 0;
        CEO = 0;
    end
    else if (COUNTER == DIVIDER - 1) begin
        COUNTER = 0;
        CEO = 1'b1;
    end 
    else begin
        COUNTER = COUNTER + 1;
        CEO = 1'b0;
    end 
end

endmodule
