## Clock
set_property PACKAGE_PIN E3 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports CLK]

## Reset
set_property PACKAGE_PIN D4 [get_ports SYS_NRST]
set_property IOSTANDARD LVCMOS33 [get_ports SYS_NRST]

## Buttons
set_property PACKAGE_PIN C3 [get_ports BTN_0]
set_property IOSTANDARD LVCMOS33 [get_ports BTN_0]

set_property PACKAGE_PIN B3 [get_ports BTN_1]
set_property IOSTANDARD LVCMOS33 [get_ports BTN_1]

## UART RX
set_property PACKAGE_PIN A9 [get_ports UART_RXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_RXD]

## UART TX
set_property PACKAGE_PIN D10 [get_ports UART_TXD]
set_property IOSTANDARD LVCMOS33 [get_ports UART_TXD]
