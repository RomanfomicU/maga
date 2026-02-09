// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Fri Dec 26 13:29:56 2025
// Host        : DESKTOP-C8TK0HP running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/3BE3DA/maga/1_sem/RPAOIiAS/lab/lab/lab.sim/sim_1/impl/func/xsim/FR_LR_TOP_func_impl.v
// Design      : FR_LR_TOP
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FR_DIVIDER
   (CE_1kHz,
    CLK_IBUF_BUFG,
    Q);
  output CE_1kHz;
  input CLK_IBUF_BUFG;
  input [0:0]Q;

  wire CEO;
  wire CE_1kHz;
  wire CLK_IBUF_BUFG;
  wire [16:0]COUNTER;
  wire COUNTER0_carry__0_n_0;
  wire COUNTER0_carry__0_n_4;
  wire COUNTER0_carry__0_n_5;
  wire COUNTER0_carry__0_n_6;
  wire COUNTER0_carry__0_n_7;
  wire COUNTER0_carry__1_n_0;
  wire COUNTER0_carry__1_n_4;
  wire COUNTER0_carry__1_n_5;
  wire COUNTER0_carry__1_n_6;
  wire COUNTER0_carry__1_n_7;
  wire COUNTER0_carry__2_n_4;
  wire COUNTER0_carry__2_n_5;
  wire COUNTER0_carry__2_n_6;
  wire COUNTER0_carry__2_n_7;
  wire COUNTER0_carry_n_0;
  wire COUNTER0_carry_n_4;
  wire COUNTER0_carry_n_5;
  wire COUNTER0_carry_n_6;
  wire COUNTER0_carry_n_7;
  wire \COUNTER[16]_i_3_n_0 ;
  wire \COUNTER[16]_i_4_n_0 ;
  wire \COUNTER[16]_i_5_n_0 ;
  wire [16:0]COUNTER_0;
  wire [0:0]Q;
  wire [2:0]NLW_COUNTER0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_COUNTER0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_COUNTER0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_COUNTER0_carry__2_CO_UNCONNECTED;

  FDCE #(
    .INIT(1'b0)) 
    CEO_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(CEO),
        .Q(CE_1kHz));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry
       (.CI(1'b0),
        .CO({COUNTER0_carry_n_0,NLW_COUNTER0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(COUNTER[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry_n_4,COUNTER0_carry_n_5,COUNTER0_carry_n_6,COUNTER0_carry_n_7}),
        .S(COUNTER[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry__0
       (.CI(COUNTER0_carry_n_0),
        .CO({COUNTER0_carry__0_n_0,NLW_COUNTER0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry__0_n_4,COUNTER0_carry__0_n_5,COUNTER0_carry__0_n_6,COUNTER0_carry__0_n_7}),
        .S(COUNTER[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry__1
       (.CI(COUNTER0_carry__0_n_0),
        .CO({COUNTER0_carry__1_n_0,NLW_COUNTER0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry__1_n_4,COUNTER0_carry__1_n_5,COUNTER0_carry__1_n_6,COUNTER0_carry__1_n_7}),
        .S(COUNTER[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry__2
       (.CI(COUNTER0_carry__1_n_0),
        .CO(NLW_COUNTER0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry__2_n_4,COUNTER0_carry__2_n_5,COUNTER0_carry__2_n_6,COUNTER0_carry__2_n_7}),
        .S(COUNTER[16:13]));
  LUT1 #(
    .INIT(2'h1)) 
    \COUNTER[0]_i_1 
       (.I0(COUNTER[0]),
        .O(COUNTER_0[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[10]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__1_n_6),
        .O(COUNTER_0[10]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[11]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__1_n_5),
        .O(COUNTER_0[11]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[12]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__1_n_4),
        .O(COUNTER_0[12]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[13]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__2_n_7),
        .O(COUNTER_0[13]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[14]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__2_n_6),
        .O(COUNTER_0[14]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[15]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__2_n_5),
        .O(COUNTER_0[15]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[16]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__2_n_4),
        .O(COUNTER_0[16]));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \COUNTER[16]_i_2 
       (.I0(COUNTER[4]),
        .I1(COUNTER[3]),
        .I2(COUNTER[6]),
        .I3(COUNTER[5]),
        .I4(\COUNTER[16]_i_3_n_0 ),
        .I5(\COUNTER[16]_i_4_n_0 ),
        .O(CEO));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \COUNTER[16]_i_3 
       (.I0(COUNTER[0]),
        .I1(COUNTER[15]),
        .I2(COUNTER[16]),
        .I3(COUNTER[2]),
        .I4(COUNTER[1]),
        .O(\COUNTER[16]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF7FF)) 
    \COUNTER[16]_i_4 
       (.I0(COUNTER[9]),
        .I1(COUNTER[10]),
        .I2(COUNTER[8]),
        .I3(COUNTER[7]),
        .I4(\COUNTER[16]_i_5_n_0 ),
        .O(\COUNTER[16]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \COUNTER[16]_i_5 
       (.I0(COUNTER[12]),
        .I1(COUNTER[11]),
        .I2(COUNTER[14]),
        .I3(COUNTER[13]),
        .O(\COUNTER[16]_i_5_n_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[1]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry_n_7),
        .O(COUNTER_0[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[2]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry_n_6),
        .O(COUNTER_0[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[3]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry_n_5),
        .O(COUNTER_0[3]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[4]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry_n_4),
        .O(COUNTER_0[4]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[5]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__0_n_7),
        .O(COUNTER_0[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[6]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__0_n_6),
        .O(COUNTER_0[6]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[7]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__0_n_5),
        .O(COUNTER_0[7]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[8]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__0_n_4),
        .O(COUNTER_0[8]));
  (* OPT_MODIFIED = "RETARGET" *) 
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \COUNTER[9]_i_1 
       (.I0(CEO),
        .I1(COUNTER0_carry__1_n_7),
        .O(COUNTER_0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[0]),
        .Q(COUNTER[0]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[10]),
        .Q(COUNTER[10]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[11]),
        .Q(COUNTER[11]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[12]),
        .Q(COUNTER[12]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[13]),
        .Q(COUNTER[13]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[14]),
        .Q(COUNTER[14]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[15]),
        .Q(COUNTER[15]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[16] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[16]),
        .Q(COUNTER[16]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[1]),
        .Q(COUNTER[1]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[2]),
        .Q(COUNTER[2]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[3]),
        .Q(COUNTER[3]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[4]),
        .Q(COUNTER[4]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[5]),
        .Q(COUNTER[5]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[6]),
        .Q(COUNTER[6]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[7]),
        .Q(COUNTER[7]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[8]),
        .Q(COUNTER[8]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER_0[9]),
        .Q(COUNTER[9]));
endmodule

(* ORIG_REF_NAME = "FR_DIVIDER" *) 
module FR_DIVIDER__parameterized0
   (E,
    CEO_reg_0,
    TX_DATA_CT_0,
    \TX_SAMP_CT_reg[3] ,
    \TX_DATA_reg[0] ,
    \FSM_sequential_TX_STATE_reg[0] ,
    \FSM_sequential_TX_STATE_reg[1] ,
    \RX_SAMP_CT_reg[3] ,
    CEO_reg_1,
    \FSM_sequential_TX_STATE_reg[2] ,
    \FSM_sequential_RX_STATE_reg[2] ,
    \FSM_sequential_RX_STATE_reg[0] ,
    TX_RDY_R_reg,
    \FSM_sequential_RX_STATE_reg[0]_0 ,
    \FSM_sequential_RX_STATE_reg[0]_1 ,
    \FSM_sequential_RX_STATE_reg[0]_2 ,
    \FSM_sequential_TX_STATE_reg[1]_0 ,
    CEO_reg_2,
    \FSM_sequential_TX_STATE_reg[2]_0 ,
    CLK_IBUF_BUFG,
    Q,
    TXCT_R_reg,
    RXCT_R_reg,
    TX_STATE__0,
    TXD_reg,
    TXD_reg_0,
    TXD_reg_1,
    TX_DATA_CT,
    TX_RDY,
    TXCT_R_reg_0,
    \RX_DATA_T_reg[0] ,
    \RX_DATA_T_reg[0]_0 ,
    RX_STATE__0,
    RXCT_R_reg_0,
    RX_DATA_EN_reg,
    RX_RDY,
    \FSM_sequential_RX_STATE_reg[0]_3 );
  output [0:0]E;
  output [0:0]CEO_reg_0;
  output TX_DATA_CT_0;
  output \TX_SAMP_CT_reg[3] ;
  output \TX_DATA_reg[0] ;
  output [0:0]\FSM_sequential_TX_STATE_reg[0] ;
  output \FSM_sequential_TX_STATE_reg[1] ;
  output [0:0]\RX_SAMP_CT_reg[3] ;
  output CEO_reg_1;
  output \FSM_sequential_TX_STATE_reg[2] ;
  output \FSM_sequential_RX_STATE_reg[2] ;
  output \FSM_sequential_RX_STATE_reg[0] ;
  output TX_RDY_R_reg;
  output \FSM_sequential_RX_STATE_reg[0]_0 ;
  output \FSM_sequential_RX_STATE_reg[0]_1 ;
  output \FSM_sequential_RX_STATE_reg[0]_2 ;
  output \FSM_sequential_TX_STATE_reg[1]_0 ;
  output CEO_reg_2;
  output \FSM_sequential_TX_STATE_reg[2]_0 ;
  input CLK_IBUF_BUFG;
  input [0:0]Q;
  input TXCT_R_reg;
  input RXCT_R_reg;
  input [1:0]TX_STATE__0;
  input TXD_reg;
  input [0:0]TXD_reg_0;
  input TXD_reg_1;
  input [2:0]TX_DATA_CT;
  input TX_RDY;
  input [3:0]TXCT_R_reg_0;
  input [3:0]\RX_DATA_T_reg[0] ;
  input \RX_DATA_T_reg[0]_0 ;
  input [2:0]RX_STATE__0;
  input [0:0]RXCT_R_reg_0;
  input RX_DATA_EN_reg;
  input RX_RDY;
  input \FSM_sequential_RX_STATE_reg[0]_3 ;

  wire CEO;
  wire [0:0]CEO_reg_0;
  wire CEO_reg_1;
  wire CEO_reg_2;
  wire CLK_IBUF_BUFG;
  wire [12:0]COUNTER;
  wire COUNTER0_carry__0_n_0;
  wire COUNTER0_carry__0_n_4;
  wire COUNTER0_carry__0_n_5;
  wire COUNTER0_carry__0_n_6;
  wire COUNTER0_carry__0_n_7;
  wire COUNTER0_carry__1_n_4;
  wire COUNTER0_carry__1_n_5;
  wire COUNTER0_carry__1_n_6;
  wire COUNTER0_carry__1_n_7;
  wire COUNTER0_carry_n_0;
  wire COUNTER0_carry_n_4;
  wire COUNTER0_carry_n_5;
  wire COUNTER0_carry_n_6;
  wire COUNTER0_carry_n_7;
  wire \COUNTER[12]_i_2_n_0 ;
  wire \COUNTER[12]_i_3_n_0 ;
  wire \COUNTER_reg_n_0_[0] ;
  wire \COUNTER_reg_n_0_[10] ;
  wire \COUNTER_reg_n_0_[11] ;
  wire \COUNTER_reg_n_0_[12] ;
  wire \COUNTER_reg_n_0_[1] ;
  wire \COUNTER_reg_n_0_[2] ;
  wire \COUNTER_reg_n_0_[3] ;
  wire \COUNTER_reg_n_0_[4] ;
  wire \COUNTER_reg_n_0_[5] ;
  wire \COUNTER_reg_n_0_[6] ;
  wire \COUNTER_reg_n_0_[7] ;
  wire \COUNTER_reg_n_0_[8] ;
  wire \COUNTER_reg_n_0_[9] ;
  wire [0:0]E;
  wire \FSM_sequential_RX_STATE_reg[0] ;
  wire \FSM_sequential_RX_STATE_reg[0]_0 ;
  wire \FSM_sequential_RX_STATE_reg[0]_1 ;
  wire \FSM_sequential_RX_STATE_reg[0]_2 ;
  wire \FSM_sequential_RX_STATE_reg[0]_3 ;
  wire \FSM_sequential_RX_STATE_reg[2] ;
  wire \FSM_sequential_TX_STATE[2]_i_2_n_0 ;
  wire \FSM_sequential_TX_STATE[2]_i_3_n_0 ;
  wire \FSM_sequential_TX_STATE[2]_i_4_n_0 ;
  wire [0:0]\FSM_sequential_TX_STATE_reg[0] ;
  wire \FSM_sequential_TX_STATE_reg[1] ;
  wire \FSM_sequential_TX_STATE_reg[1]_0 ;
  wire \FSM_sequential_TX_STATE_reg[2] ;
  wire \FSM_sequential_TX_STATE_reg[2]_0 ;
  wire [0:0]Q;
  wire RXCT_R_reg;
  wire [0:0]RXCT_R_reg_0;
  wire RX_DATA_EN_reg;
  wire [3:0]\RX_DATA_T_reg[0] ;
  wire \RX_DATA_T_reg[0]_0 ;
  wire RX_RDY;
  wire [0:0]\RX_SAMP_CT_reg[3] ;
  wire [2:0]RX_STATE__0;
  wire TXCT_R;
  wire TXCT_R_reg;
  wire [3:0]TXCT_R_reg_0;
  wire TXD_reg;
  wire [0:0]TXD_reg_0;
  wire TXD_reg_1;
  wire [2:0]TX_DATA_CT;
  wire TX_DATA_CT_0;
  wire \TX_DATA_reg[0] ;
  wire TX_RDY;
  wire TX_RDY_R_reg;
  wire \TX_SAMP_CT_reg[3] ;
  wire [1:0]TX_STATE__0;
  wire UART_CE;
  wire [2:0]NLW_COUNTER0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_COUNTER0_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_COUNTER0_carry__1_CO_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    CEO_i_1__0
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .O(CEO));
  FDCE #(
    .INIT(1'b0)) 
    CEO_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(CEO),
        .Q(UART_CE));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry
       (.CI(1'b0),
        .CO({COUNTER0_carry_n_0,NLW_COUNTER0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\COUNTER_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry_n_4,COUNTER0_carry_n_5,COUNTER0_carry_n_6,COUNTER0_carry_n_7}),
        .S({\COUNTER_reg_n_0_[4] ,\COUNTER_reg_n_0_[3] ,\COUNTER_reg_n_0_[2] ,\COUNTER_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry__0
       (.CI(COUNTER0_carry_n_0),
        .CO({COUNTER0_carry__0_n_0,NLW_COUNTER0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry__0_n_4,COUNTER0_carry__0_n_5,COUNTER0_carry__0_n_6,COUNTER0_carry__0_n_7}),
        .S({\COUNTER_reg_n_0_[8] ,\COUNTER_reg_n_0_[7] ,\COUNTER_reg_n_0_[6] ,\COUNTER_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 COUNTER0_carry__1
       (.CI(COUNTER0_carry__0_n_0),
        .CO(NLW_COUNTER0_carry__1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({COUNTER0_carry__1_n_4,COUNTER0_carry__1_n_5,COUNTER0_carry__1_n_6,COUNTER0_carry__1_n_7}),
        .S({\COUNTER_reg_n_0_[12] ,\COUNTER_reg_n_0_[11] ,\COUNTER_reg_n_0_[10] ,\COUNTER_reg_n_0_[9] }));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \COUNTER[0]_i_1__0 
       (.I0(\COUNTER_reg_n_0_[0] ),
        .O(COUNTER[0]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[10]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__1_n_6),
        .O(COUNTER[10]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[11]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__1_n_5),
        .O(COUNTER[11]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[12]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__1_n_4),
        .O(COUNTER[12]));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \COUNTER[12]_i_2 
       (.I0(\COUNTER_reg_n_0_[4] ),
        .I1(\COUNTER_reg_n_0_[10] ),
        .I2(\COUNTER_reg_n_0_[5] ),
        .I3(\COUNTER_reg_n_0_[8] ),
        .I4(\COUNTER_reg_n_0_[7] ),
        .I5(\COUNTER_reg_n_0_[9] ),
        .O(\COUNTER[12]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFF7F)) 
    \COUNTER[12]_i_3 
       (.I0(\COUNTER_reg_n_0_[1] ),
        .I1(\COUNTER_reg_n_0_[2] ),
        .I2(\COUNTER_reg_n_0_[12] ),
        .I3(\COUNTER_reg_n_0_[11] ),
        .O(\COUNTER[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[1]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry_n_7),
        .O(COUNTER[1]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[2]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry_n_6),
        .O(COUNTER[2]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[3]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry_n_5),
        .O(COUNTER[3]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[4]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry_n_4),
        .O(COUNTER[4]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[5]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__0_n_7),
        .O(COUNTER[5]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[6]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__0_n_6),
        .O(COUNTER[6]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[7]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__0_n_5),
        .O(COUNTER[7]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[8]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__0_n_4),
        .O(COUNTER[8]));
  LUT6 #(
    .INIT(64'hFDFFFFFF00000000)) 
    \COUNTER[9]_i_1__0 
       (.I0(\COUNTER[12]_i_2_n_0 ),
        .I1(\COUNTER[12]_i_3_n_0 ),
        .I2(\COUNTER_reg_n_0_[3] ),
        .I3(\COUNTER_reg_n_0_[6] ),
        .I4(\COUNTER_reg_n_0_[0] ),
        .I5(COUNTER0_carry__1_n_7),
        .O(COUNTER[9]));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[0]),
        .Q(\COUNTER_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[10]),
        .Q(\COUNTER_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[11]),
        .Q(\COUNTER_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[12]),
        .Q(\COUNTER_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[1]),
        .Q(\COUNTER_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[2]),
        .Q(\COUNTER_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[3]),
        .Q(\COUNTER_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[4]),
        .Q(\COUNTER_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[5]),
        .Q(\COUNTER_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[6]),
        .Q(\COUNTER_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[7]),
        .Q(\COUNTER_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[8]),
        .Q(\COUNTER_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \COUNTER_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(COUNTER[9]),
        .Q(\COUNTER_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'hAAAB0555AAABAAAB)) 
    \FSM_sequential_RX_STATE[0]_i_1 
       (.I0(RX_STATE__0[0]),
        .I1(RXCT_R_reg_0),
        .I2(RX_STATE__0[2]),
        .I3(RX_STATE__0[1]),
        .I4(\FSM_sequential_RX_STATE_reg[0]_3 ),
        .I5(CEO_reg_1),
        .O(\FSM_sequential_RX_STATE_reg[0]_0 ));
  LUT6 #(
    .INIT(64'hBF000522BF00BF00)) 
    \FSM_sequential_RX_STATE[1]_i_1 
       (.I0(RX_STATE__0[0]),
        .I1(RXCT_R_reg_0),
        .I2(RX_STATE__0[2]),
        .I3(RX_STATE__0[1]),
        .I4(\FSM_sequential_RX_STATE_reg[0]_3 ),
        .I5(CEO_reg_1),
        .O(\FSM_sequential_RX_STATE_reg[0]_1 ));
  LUT6 #(
    .INIT(64'hB0F00A70B0F0B0F0)) 
    \FSM_sequential_RX_STATE[2]_i_1 
       (.I0(RX_STATE__0[0]),
        .I1(RXCT_R_reg_0),
        .I2(RX_STATE__0[2]),
        .I3(RX_STATE__0[1]),
        .I4(\FSM_sequential_RX_STATE_reg[0]_3 ),
        .I5(CEO_reg_1),
        .O(\FSM_sequential_RX_STATE_reg[0]_2 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \FSM_sequential_RX_STATE[2]_i_3 
       (.I0(UART_CE),
        .I1(\RX_DATA_T_reg[0] [0]),
        .I2(\RX_DATA_T_reg[0] [1]),
        .I3(\RX_DATA_T_reg[0] [2]),
        .I4(\RX_DATA_T_reg[0] [3]),
        .O(CEO_reg_1));
  (* \PinAttr:I4:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h00FF5B00)) 
    \FSM_sequential_TX_STATE[0]_i_1 
       (.I0(TX_STATE__0[1]),
        .I1(UART_CE),
        .I2(TXD_reg),
        .I3(\FSM_sequential_TX_STATE[2]_i_2_n_0 ),
        .I4(TX_STATE__0[0]),
        .O(\FSM_sequential_TX_STATE_reg[2]_0 ));
  (* \PinAttr:I2:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'h03FFF200)) 
    \FSM_sequential_TX_STATE[1]_i_1 
       (.I0(UART_CE),
        .I1(TX_STATE__0[1]),
        .I2(TX_STATE__0[0]),
        .I3(\FSM_sequential_TX_STATE[2]_i_2_n_0 ),
        .I4(TXD_reg),
        .O(CEO_reg_2));
  LUT4 #(
    .INIT(16'h5F80)) 
    \FSM_sequential_TX_STATE[2]_i_1 
       (.I0(TXD_reg),
        .I1(TX_STATE__0[0]),
        .I2(\FSM_sequential_TX_STATE[2]_i_2_n_0 ),
        .I3(TX_STATE__0[1]),
        .O(\FSM_sequential_TX_STATE_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFD5550000)) 
    \FSM_sequential_TX_STATE[2]_i_2 
       (.I0(TX_STATE__0[0]),
        .I1(TX_DATA_CT[1]),
        .I2(TX_DATA_CT[0]),
        .I3(TX_DATA_CT[2]),
        .I4(\FSM_sequential_TX_STATE[2]_i_3_n_0 ),
        .I5(\FSM_sequential_TX_STATE[2]_i_4_n_0 ),
        .O(\FSM_sequential_TX_STATE[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_TX_STATE[2]_i_3 
       (.I0(\TX_SAMP_CT_reg[3] ),
        .I1(TXD_reg),
        .I2(TX_STATE__0[1]),
        .O(\FSM_sequential_TX_STATE[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000F000FCC0FAA)) 
    \FSM_sequential_TX_STATE[2]_i_4 
       (.I0(TX_RDY),
        .I1(UART_CE),
        .I2(\TX_SAMP_CT_reg[3] ),
        .I3(TX_STATE__0[1]),
        .I4(TX_STATE__0[0]),
        .I5(TXD_reg),
        .O(\FSM_sequential_TX_STATE[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEFFFE2C002000)) 
    RXCT_R_i_1
       (.I0(RX_STATE__0[2]),
        .I1(RX_STATE__0[0]),
        .I2(RX_STATE__0[1]),
        .I3(RXCT_R_reg_0),
        .I4(CEO_reg_1),
        .I5(RXCT_R_reg),
        .O(\FSM_sequential_RX_STATE_reg[2] ));
  LUT6 #(
    .INIT(64'hFFFFFFCC30008000)) 
    RX_DATA_EN_i_1
       (.I0(CEO_reg_1),
        .I1(RX_STATE__0[0]),
        .I2(RXCT_R_reg_0),
        .I3(RX_STATE__0[2]),
        .I4(RX_STATE__0[1]),
        .I5(RX_DATA_EN_reg),
        .O(\FSM_sequential_RX_STATE_reg[0] ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \RX_DATA_T[7]_i_1 
       (.I0(\RX_DATA_T_reg[0] [3]),
        .I1(\RX_DATA_T_reg[0] [2]),
        .I2(\RX_DATA_T_reg[0] [1]),
        .I3(\RX_DATA_T_reg[0] [0]),
        .I4(UART_CE),
        .I5(\RX_DATA_T_reg[0]_0 ),
        .O(\RX_SAMP_CT_reg[3] ));
  LUT2 #(
    .INIT(4'hE)) 
    \RX_SAMP_CT[3]_i_1 
       (.I0(UART_CE),
        .I1(RXCT_R_reg),
        .O(CEO_reg_0));
  LUT5 #(
    .INIT(32'h04FF0400)) 
    TXCT_R_i_1
       (.I0(\TX_SAMP_CT_reg[3] ),
        .I1(TX_STATE__0[1]),
        .I2(TX_STATE__0[0]),
        .I3(TXCT_R),
        .I4(TXCT_R_reg),
        .O(\FSM_sequential_TX_STATE_reg[2] ));
  LUT6 #(
    .INIT(64'h00300E0E00000000)) 
    TXCT_R_i_2
       (.I0(TX_RDY),
        .I1(TX_STATE__0[0]),
        .I2(TX_STATE__0[1]),
        .I3(\TX_SAMP_CT_reg[3] ),
        .I4(TXD_reg),
        .I5(UART_CE),
        .O(TXCT_R));
  LUT6 #(
    .INIT(64'h050400005F5E5F5E)) 
    TXD_i_1
       (.I0(TXD_reg),
        .I1(TX_RDY),
        .I2(TX_STATE__0[1]),
        .I3(TX_STATE__0[0]),
        .I4(UART_CE),
        .I5(\TX_SAMP_CT_reg[3] ),
        .O(\FSM_sequential_TX_STATE_reg[1] ));
  LUT6 #(
    .INIT(64'h00002A2A00FF0000)) 
    TXD_i_2
       (.I0(TXD_reg_0),
        .I1(TX_STATE__0[0]),
        .I2(TXD_reg_1),
        .I3(\TX_SAMP_CT_reg[3] ),
        .I4(TX_STATE__0[1]),
        .I5(TXD_reg),
        .O(\TX_DATA_reg[0] ));
  LUT5 #(
    .INIT(32'h00040F04)) 
    \TX_DATA[6]_i_1 
       (.I0(TX_STATE__0[0]),
        .I1(TX_RDY),
        .I2(TX_STATE__0[1]),
        .I3(TXD_reg),
        .I4(\TX_SAMP_CT_reg[3] ),
        .O(\FSM_sequential_TX_STATE_reg[0] ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \TX_DATA[6]_i_3 
       (.I0(TXCT_R_reg_0[3]),
        .I1(TXCT_R_reg_0[0]),
        .I2(TXCT_R_reg_0[1]),
        .I3(TXCT_R_reg_0[2]),
        .I4(UART_CE),
        .O(\TX_SAMP_CT_reg[3] ));
  LUT4 #(
    .INIT(16'h0040)) 
    \TX_DATA_CT[2]_i_2 
       (.I0(TX_STATE__0[1]),
        .I1(TXD_reg),
        .I2(TX_STATE__0[0]),
        .I3(\TX_SAMP_CT_reg[3] ),
        .O(TX_DATA_CT_0));
  LUT6 #(
    .INIT(64'hAAAAAFAAAAA2AAA2)) 
    TX_RDY_R_i_1
       (.I0(RX_RDY),
        .I1(TX_RDY),
        .I2(TX_STATE__0[0]),
        .I3(TX_STATE__0[1]),
        .I4(\TX_SAMP_CT_reg[3] ),
        .I5(TXD_reg),
        .O(TX_RDY_R_reg));
  LUT2 #(
    .INIT(4'hE)) 
    \TX_SAMP_CT[3]_i_1 
       (.I0(TXCT_R_reg),
        .I1(UART_CE),
        .O(E));
endmodule

module FR_FSM
   (TX_RDY,
    \FSM_sequential_STATE_reg[1]_0 ,
    \FSM_sequential_STATE_reg[3]_0 ,
    \FSM_sequential_STATE_reg[3]_1 ,
    \FSM_sequential_STATE_reg[1]_1 ,
    \ADDR_reg[3]_0 ,
    \FSM_sequential_STATE_reg[1]_2 ,
    \TX_DATA_T_reg[6]_0 ,
    \TX_DATA_T_reg[5]_0 ,
    CLK_IBUF_BUFG,
    Q,
    \ADDR_reg[4]_0 ,
    \ADDR_reg[4]_1 ,
    \ADDR_reg[0]_0 ,
    \ADDR_reg[0]_1 ,
    \FSM_sequential_STATE_reg[0]_0 ,
    \FSM_sequential_STATE_reg[0]_1 ,
    RX_DATA_EN,
    D,
    \ADDR_reg[5]_0 ,
    GEN_PAR_ERR,
    RX_DATA,
    \ADDR_reg[2]_0 ,
    GEN_FRT_ERR,
    \ADDR_reg_rep[3]_0 ,
    RX_RDY,
    \RES_REG_reg[0]_0 ,
    \ADDR_reg[0]_2 ,
    \DATA_REG_reg[3]_0 ,
    TX_STATE__0,
    \ADDR_reg_rep[3]_1 ,
    E);
  output TX_RDY;
  output \FSM_sequential_STATE_reg[1]_0 ;
  output [2:0]\FSM_sequential_STATE_reg[3]_0 ;
  output \FSM_sequential_STATE_reg[3]_1 ;
  output \FSM_sequential_STATE_reg[1]_1 ;
  output \ADDR_reg[3]_0 ;
  output \FSM_sequential_STATE_reg[1]_2 ;
  output [0:0]\TX_DATA_T_reg[6]_0 ;
  output [5:0]\TX_DATA_T_reg[5]_0 ;
  input CLK_IBUF_BUFG;
  input [0:0]Q;
  input \ADDR_reg[4]_0 ;
  input \ADDR_reg[4]_1 ;
  input \ADDR_reg[0]_0 ;
  input \ADDR_reg[0]_1 ;
  input \FSM_sequential_STATE_reg[0]_0 ;
  input \FSM_sequential_STATE_reg[0]_1 ;
  input RX_DATA_EN;
  input [3:0]D;
  input \ADDR_reg[5]_0 ;
  input GEN_PAR_ERR;
  input [1:0]RX_DATA;
  input \ADDR_reg[2]_0 ;
  input GEN_FRT_ERR;
  input \ADDR_reg_rep[3]_0 ;
  input RX_RDY;
  input \RES_REG_reg[0]_0 ;
  input \ADDR_reg[0]_2 ;
  input [3:0]\DATA_REG_reg[3]_0 ;
  input [0:0]TX_STATE__0;
  input [0:0]\ADDR_reg_rep[3]_1 ;
  input [0:0]E;

  wire [6:0]ADDR;
  wire \ADDR_reg[0]_0 ;
  wire \ADDR_reg[0]_1 ;
  wire \ADDR_reg[0]_2 ;
  wire \ADDR_reg[2]_0 ;
  wire \ADDR_reg[3]_0 ;
  wire \ADDR_reg[4]_0 ;
  wire \ADDR_reg[4]_1 ;
  wire \ADDR_reg[5]_0 ;
  wire \ADDR_reg_rep[3]_0 ;
  wire [0:0]\ADDR_reg_rep[3]_1 ;
  wire \ADDR_reg_rep_n_0_[0] ;
  wire \ADDR_reg_rep_n_0_[1] ;
  wire \ADDR_reg_rep_n_0_[2] ;
  wire \ADDR_reg_rep_n_0_[3] ;
  wire \ADDR_reg_rep_n_0_[4] ;
  wire \ADDR_reg_rep_n_0_[5] ;
  wire \ADDR_reg_rep_n_0_[6] ;
  wire \ADDR_rep[0]_i_1_n_0 ;
  wire \ADDR_rep[1]_i_1_n_0 ;
  wire \ADDR_rep[2]_i_1_n_0 ;
  wire \ADDR_rep[2]_i_2_n_0 ;
  wire \ADDR_rep[2]_i_3_n_0 ;
  wire \ADDR_rep[4]_i_1_n_0 ;
  wire \ADDR_rep[4]_i_2_n_0 ;
  wire \ADDR_rep[5]_i_1_n_0 ;
  wire \ADDR_rep[5]_i_3_n_0 ;
  wire \ADDR_rep[6]_i_1_n_0 ;
  wire \ADDR_rep[6]_i_2_n_0 ;
  wire \ADDR_rep[6]_i_3_n_0 ;
  wire \ADDR_rep[6]_i_4_n_0 ;
  wire \ADDR_rep[6]_i_5_n_0 ;
  wire \ADDR_rep[6]_i_6_n_0 ;
  wire CLK_IBUF_BUFG;
  wire [3:0]D;
  wire [3:1]DATA_CT;
  wire \DATA_CT[0]_i_1_n_0 ;
  wire \DATA_CT_reg_n_0_[0] ;
  wire \DATA_CT_reg_n_0_[1] ;
  wire \DATA_CT_reg_n_0_[2] ;
  wire \DATA_CT_reg_n_0_[3] ;
  wire [35:4]DATA_REG;
  wire \DATA_REG[35]_i_1_n_0 ;
  wire [3:0]\DATA_REG_reg[3]_0 ;
  wire \DATA_REG_reg_n_0_[0] ;
  wire \DATA_REG_reg_n_0_[10] ;
  wire \DATA_REG_reg_n_0_[11] ;
  wire \DATA_REG_reg_n_0_[12] ;
  wire \DATA_REG_reg_n_0_[13] ;
  wire \DATA_REG_reg_n_0_[14] ;
  wire \DATA_REG_reg_n_0_[15] ;
  wire \DATA_REG_reg_n_0_[16] ;
  wire \DATA_REG_reg_n_0_[17] ;
  wire \DATA_REG_reg_n_0_[18] ;
  wire \DATA_REG_reg_n_0_[19] ;
  wire \DATA_REG_reg_n_0_[1] ;
  wire \DATA_REG_reg_n_0_[20] ;
  wire \DATA_REG_reg_n_0_[21] ;
  wire \DATA_REG_reg_n_0_[22] ;
  wire \DATA_REG_reg_n_0_[23] ;
  wire \DATA_REG_reg_n_0_[24] ;
  wire \DATA_REG_reg_n_0_[25] ;
  wire \DATA_REG_reg_n_0_[26] ;
  wire \DATA_REG_reg_n_0_[27] ;
  wire \DATA_REG_reg_n_0_[28] ;
  wire \DATA_REG_reg_n_0_[29] ;
  wire \DATA_REG_reg_n_0_[2] ;
  wire \DATA_REG_reg_n_0_[30] ;
  wire \DATA_REG_reg_n_0_[31] ;
  wire \DATA_REG_reg_n_0_[32] ;
  wire \DATA_REG_reg_n_0_[33] ;
  wire \DATA_REG_reg_n_0_[34] ;
  wire \DATA_REG_reg_n_0_[35] ;
  wire \DATA_REG_reg_n_0_[3] ;
  wire \DATA_REG_reg_n_0_[4] ;
  wire \DATA_REG_reg_n_0_[5] ;
  wire \DATA_REG_reg_n_0_[6] ;
  wire \DATA_REG_reg_n_0_[7] ;
  wire \DATA_REG_reg_n_0_[8] ;
  wire \DATA_REG_reg_n_0_[9] ;
  wire [0:0]E;
  wire [5:0]END_ADDR;
  wire \END_ADDR[2]_i_1_n_0 ;
  wire \END_ADDR_reg_n_0_[0] ;
  wire \END_ADDR_reg_n_0_[1] ;
  wire \END_ADDR_reg_n_0_[2] ;
  wire \END_ADDR_reg_n_0_[3] ;
  wire \END_ADDR_reg_n_0_[4] ;
  wire \END_ADDR_reg_n_0_[5] ;
  wire \END_ADDR_reg_n_0_[6] ;
  wire \FSM_sequential_STATE[0]_i_2_n_0 ;
  wire \FSM_sequential_STATE[0]_i_3_n_0 ;
  wire \FSM_sequential_STATE[0]_i_4_n_0 ;
  wire \FSM_sequential_STATE[2]_i_3_n_0 ;
  wire \FSM_sequential_STATE[3]_i_10_n_0 ;
  wire \FSM_sequential_STATE[3]_i_11_n_0 ;
  wire \FSM_sequential_STATE[3]_i_12_n_0 ;
  wire \FSM_sequential_STATE[3]_i_13_n_0 ;
  wire \FSM_sequential_STATE[3]_i_14_n_0 ;
  wire \FSM_sequential_STATE[3]_i_1_n_0 ;
  wire \FSM_sequential_STATE[3]_i_3_n_0 ;
  wire \FSM_sequential_STATE[3]_i_4_n_0 ;
  wire \FSM_sequential_STATE[3]_i_5_n_0 ;
  wire \FSM_sequential_STATE[3]_i_6_n_0 ;
  wire \FSM_sequential_STATE[3]_i_8_n_0 ;
  wire \FSM_sequential_STATE[3]_i_9_n_0 ;
  wire \FSM_sequential_STATE_reg[0]_0 ;
  wire \FSM_sequential_STATE_reg[0]_1 ;
  wire \FSM_sequential_STATE_reg[1]_0 ;
  wire \FSM_sequential_STATE_reg[1]_1 ;
  wire \FSM_sequential_STATE_reg[1]_2 ;
  wire [2:0]\FSM_sequential_STATE_reg[3]_0 ;
  wire \FSM_sequential_STATE_reg[3]_1 ;
  wire GEN_FRT_ERR;
  wire GEN_PAR_ERR;
  wire [0:0]Q;
  wire [4:0]RES_CT;
  wire \RES_CT[1]_i_2_n_0 ;
  wire \RES_CT[2]_i_1_n_0 ;
  wire \RES_CT[3]_i_1_n_0 ;
  wire \RES_CT[4]_i_1_n_0 ;
  wire \RES_CT[4]_i_3_n_0 ;
  wire \RES_CT_reg_n_0_[0] ;
  wire \RES_CT_reg_n_0_[1] ;
  wire \RES_CT_reg_n_0_[2] ;
  wire \RES_CT_reg_n_0_[3] ;
  wire \RES_CT_reg_n_0_[4] ;
  wire RES_FLG_i_1_n_0;
  wire RES_FLG_reg_n_0;
  wire RES_REG;
  wire \RES_REG[0]_i_4_n_0 ;
  wire \RES_REG[0]_i_5_n_0 ;
  wire \RES_REG[0]_i_6_n_0 ;
  wire \RES_REG[0]_i_7_n_0 ;
  wire \RES_REG[12]_i_2_n_0 ;
  wire \RES_REG[12]_i_3_n_0 ;
  wire \RES_REG[12]_i_4_n_0 ;
  wire \RES_REG[12]_i_5_n_0 ;
  wire \RES_REG[16]_i_2_n_0 ;
  wire \RES_REG[16]_i_3_n_0 ;
  wire \RES_REG[16]_i_4_n_0 ;
  wire \RES_REG[16]_i_5_n_0 ;
  wire \RES_REG[20]_i_2_n_0 ;
  wire \RES_REG[20]_i_3_n_0 ;
  wire \RES_REG[20]_i_4_n_0 ;
  wire \RES_REG[20]_i_5_n_0 ;
  wire \RES_REG[24]_i_2_n_0 ;
  wire \RES_REG[24]_i_3_n_0 ;
  wire \RES_REG[24]_i_4_n_0 ;
  wire \RES_REG[24]_i_5_n_0 ;
  wire \RES_REG[28]_i_2_n_0 ;
  wire \RES_REG[28]_i_3_n_0 ;
  wire \RES_REG[28]_i_4_n_0 ;
  wire \RES_REG[28]_i_5_n_0 ;
  wire \RES_REG[32]_i_2_n_0 ;
  wire \RES_REG[32]_i_3_n_0 ;
  wire \RES_REG[32]_i_4_n_0 ;
  wire \RES_REG[32]_i_5_n_0 ;
  wire \RES_REG[4]_i_2_n_0 ;
  wire \RES_REG[4]_i_3_n_0 ;
  wire \RES_REG[4]_i_4_n_0 ;
  wire \RES_REG[4]_i_5_n_0 ;
  wire \RES_REG[8]_i_2_n_0 ;
  wire \RES_REG[8]_i_3_n_0 ;
  wire \RES_REG[8]_i_4_n_0 ;
  wire \RES_REG[8]_i_5_n_0 ;
  wire \RES_REG_reg[0]_0 ;
  wire \RES_REG_reg[0]_i_2_n_0 ;
  wire \RES_REG_reg[0]_i_2_n_4 ;
  wire \RES_REG_reg[0]_i_2_n_5 ;
  wire \RES_REG_reg[0]_i_2_n_6 ;
  wire \RES_REG_reg[0]_i_2_n_7 ;
  wire \RES_REG_reg[12]_i_1_n_0 ;
  wire \RES_REG_reg[12]_i_1_n_4 ;
  wire \RES_REG_reg[12]_i_1_n_5 ;
  wire \RES_REG_reg[12]_i_1_n_6 ;
  wire \RES_REG_reg[12]_i_1_n_7 ;
  wire \RES_REG_reg[16]_i_1_n_0 ;
  wire \RES_REG_reg[16]_i_1_n_4 ;
  wire \RES_REG_reg[16]_i_1_n_5 ;
  wire \RES_REG_reg[16]_i_1_n_6 ;
  wire \RES_REG_reg[16]_i_1_n_7 ;
  wire \RES_REG_reg[20]_i_1_n_0 ;
  wire \RES_REG_reg[20]_i_1_n_4 ;
  wire \RES_REG_reg[20]_i_1_n_5 ;
  wire \RES_REG_reg[20]_i_1_n_6 ;
  wire \RES_REG_reg[20]_i_1_n_7 ;
  wire \RES_REG_reg[24]_i_1_n_0 ;
  wire \RES_REG_reg[24]_i_1_n_4 ;
  wire \RES_REG_reg[24]_i_1_n_5 ;
  wire \RES_REG_reg[24]_i_1_n_6 ;
  wire \RES_REG_reg[24]_i_1_n_7 ;
  wire \RES_REG_reg[28]_i_1_n_0 ;
  wire \RES_REG_reg[28]_i_1_n_4 ;
  wire \RES_REG_reg[28]_i_1_n_5 ;
  wire \RES_REG_reg[28]_i_1_n_6 ;
  wire \RES_REG_reg[28]_i_1_n_7 ;
  wire \RES_REG_reg[32]_i_1_n_0 ;
  wire \RES_REG_reg[32]_i_1_n_4 ;
  wire \RES_REG_reg[32]_i_1_n_5 ;
  wire \RES_REG_reg[32]_i_1_n_6 ;
  wire \RES_REG_reg[32]_i_1_n_7 ;
  wire \RES_REG_reg[36]_i_1_n_0 ;
  wire \RES_REG_reg[36]_i_1_n_4 ;
  wire \RES_REG_reg[36]_i_1_n_5 ;
  wire \RES_REG_reg[36]_i_1_n_6 ;
  wire \RES_REG_reg[36]_i_1_n_7 ;
  wire \RES_REG_reg[40]_i_1_n_0 ;
  wire \RES_REG_reg[40]_i_1_n_4 ;
  wire \RES_REG_reg[40]_i_1_n_5 ;
  wire \RES_REG_reg[40]_i_1_n_6 ;
  wire \RES_REG_reg[40]_i_1_n_7 ;
  wire \RES_REG_reg[44]_i_1_n_0 ;
  wire \RES_REG_reg[44]_i_1_n_4 ;
  wire \RES_REG_reg[44]_i_1_n_5 ;
  wire \RES_REG_reg[44]_i_1_n_6 ;
  wire \RES_REG_reg[44]_i_1_n_7 ;
  wire \RES_REG_reg[48]_i_1_n_0 ;
  wire \RES_REG_reg[48]_i_1_n_4 ;
  wire \RES_REG_reg[48]_i_1_n_5 ;
  wire \RES_REG_reg[48]_i_1_n_6 ;
  wire \RES_REG_reg[48]_i_1_n_7 ;
  wire \RES_REG_reg[4]_i_1_n_0 ;
  wire \RES_REG_reg[4]_i_1_n_4 ;
  wire \RES_REG_reg[4]_i_1_n_5 ;
  wire \RES_REG_reg[4]_i_1_n_6 ;
  wire \RES_REG_reg[4]_i_1_n_7 ;
  wire \RES_REG_reg[52]_i_1_n_0 ;
  wire \RES_REG_reg[52]_i_1_n_4 ;
  wire \RES_REG_reg[52]_i_1_n_5 ;
  wire \RES_REG_reg[52]_i_1_n_6 ;
  wire \RES_REG_reg[52]_i_1_n_7 ;
  wire \RES_REG_reg[56]_i_1_n_0 ;
  wire \RES_REG_reg[56]_i_1_n_4 ;
  wire \RES_REG_reg[56]_i_1_n_5 ;
  wire \RES_REG_reg[56]_i_1_n_6 ;
  wire \RES_REG_reg[56]_i_1_n_7 ;
  wire \RES_REG_reg[60]_i_1_n_0 ;
  wire \RES_REG_reg[60]_i_1_n_4 ;
  wire \RES_REG_reg[60]_i_1_n_5 ;
  wire \RES_REG_reg[60]_i_1_n_6 ;
  wire \RES_REG_reg[60]_i_1_n_7 ;
  wire \RES_REG_reg[64]_i_1_n_4 ;
  wire \RES_REG_reg[64]_i_1_n_5 ;
  wire \RES_REG_reg[64]_i_1_n_6 ;
  wire \RES_REG_reg[64]_i_1_n_7 ;
  wire \RES_REG_reg[8]_i_1_n_0 ;
  wire \RES_REG_reg[8]_i_1_n_4 ;
  wire \RES_REG_reg[8]_i_1_n_5 ;
  wire \RES_REG_reg[8]_i_1_n_6 ;
  wire \RES_REG_reg[8]_i_1_n_7 ;
  wire \RES_REG_reg_n_0_[0] ;
  wire \RES_REG_reg_n_0_[1] ;
  wire \RES_REG_reg_n_0_[2] ;
  wire \RES_REG_reg_n_0_[3] ;
  wire [1:0]RX_DATA;
  wire RX_DATA_EN;
  wire RX_RDY;
  wire [2:2]STATE__0;
  wire [3:0]STATE__1;
  wire [6:6]TX_DATA_T;
  wire \TX_DATA_T[0]_i_1_n_0 ;
  wire \TX_DATA_T[0]_i_2_n_0 ;
  wire \TX_DATA_T[0]_i_3_n_0 ;
  wire \TX_DATA_T[1]_i_1_n_0 ;
  wire \TX_DATA_T[1]_i_3_n_0 ;
  wire \TX_DATA_T[2]_i_10_n_0 ;
  wire \TX_DATA_T[2]_i_11_n_0 ;
  wire \TX_DATA_T[2]_i_12_n_0 ;
  wire \TX_DATA_T[2]_i_13_n_0 ;
  wire \TX_DATA_T[2]_i_1_n_0 ;
  wire \TX_DATA_T[2]_i_3_n_0 ;
  wire \TX_DATA_T[2]_i_4_n_0 ;
  wire \TX_DATA_T[2]_i_5_n_0 ;
  wire \TX_DATA_T[2]_i_7_n_0 ;
  wire \TX_DATA_T[3]_i_1_n_0 ;
  wire \TX_DATA_T[3]_i_2_n_0 ;
  wire \TX_DATA_T[4]_i_1_n_0 ;
  wire \TX_DATA_T[4]_i_2_n_0 ;
  wire \TX_DATA_T[5]_i_1_n_0 ;
  wire \TX_DATA_T[5]_i_2_n_0 ;
  wire \TX_DATA_T[5]_i_3_n_0 ;
  wire \TX_DATA_T[6]_i_10_n_0 ;
  wire \TX_DATA_T[6]_i_11_n_0 ;
  wire \TX_DATA_T[6]_i_12_n_0 ;
  wire \TX_DATA_T[6]_i_13_n_0 ;
  wire \TX_DATA_T[6]_i_16_n_0 ;
  wire \TX_DATA_T[6]_i_19_n_0 ;
  wire \TX_DATA_T[6]_i_1_n_0 ;
  wire \TX_DATA_T[6]_i_22_n_0 ;
  wire \TX_DATA_T[6]_i_23_n_0 ;
  wire \TX_DATA_T[6]_i_24_n_0 ;
  wire \TX_DATA_T[6]_i_25_n_0 ;
  wire \TX_DATA_T[6]_i_26_n_0 ;
  wire \TX_DATA_T[6]_i_27_n_0 ;
  wire \TX_DATA_T[6]_i_28_n_0 ;
  wire \TX_DATA_T[6]_i_29_n_0 ;
  wire \TX_DATA_T[6]_i_2_n_0 ;
  wire \TX_DATA_T[6]_i_30_n_0 ;
  wire \TX_DATA_T[6]_i_31_n_0 ;
  wire \TX_DATA_T[6]_i_32_n_0 ;
  wire \TX_DATA_T[6]_i_33_n_0 ;
  wire \TX_DATA_T[6]_i_4_n_0 ;
  wire \TX_DATA_T[6]_i_5_n_0 ;
  wire \TX_DATA_T[6]_i_6_n_0 ;
  wire \TX_DATA_T[6]_i_7_n_0 ;
  wire \TX_DATA_T[6]_i_8_n_0 ;
  wire \TX_DATA_T[6]_i_9_n_0 ;
  wire \TX_DATA_T_reg[0]_i_4_n_0 ;
  wire \TX_DATA_T_reg[1]_i_2_n_0 ;
  wire \TX_DATA_T_reg[2]_i_6_n_0 ;
  wire \TX_DATA_T_reg[2]_i_8_n_0 ;
  wire \TX_DATA_T_reg[2]_i_9_n_0 ;
  wire \TX_DATA_T_reg[3]_i_3_n_0 ;
  wire [5:0]\TX_DATA_T_reg[5]_0 ;
  wire [0:0]\TX_DATA_T_reg[6]_0 ;
  wire \TX_DATA_T_reg[6]_i_14_n_0 ;
  wire \TX_DATA_T_reg[6]_i_15_n_0 ;
  wire \TX_DATA_T_reg[6]_i_17_n_0 ;
  wire \TX_DATA_T_reg[6]_i_18_n_0 ;
  wire \TX_DATA_T_reg[6]_i_20_n_0 ;
  wire \TX_DATA_T_reg[6]_i_21_n_0 ;
  wire \TX_DATA_T_reg[6]_i_3_n_0 ;
  wire TX_RDY;
  wire TX_RDY_T_i_1_n_0;
  wire [0:0]TX_STATE__0;
  wire [3:0]data0;
  wire [3:0]data1;
  wire [3:0]data10;
  wire [3:0]data11;
  wire [3:0]data12;
  wire [3:0]data13;
  wire [3:0]data14;
  wire [3:0]data15;
  wire [3:0]data2;
  wire [3:0]data3;
  wire [3:0]data4;
  wire [3:0]data5;
  wire [3:0]data6;
  wire [3:0]data7;
  wire [3:0]data8;
  wire [3:0]data9;
  wire g0_b0_n_0;
  wire g0_b1_n_0;
  wire g0_b2_n_0;
  wire g0_b3_n_0;
  wire g0_b4_n_0;
  wire g0_b5_n_0;
  wire g0_b6_n_0;
  wire g1_b0_n_0;
  wire g1_b1_n_0;
  wire g1_b2_n_0;
  wire g1_b3_n_0;
  wire g1_b4_n_0;
  wire g1_b6_n_0;
  wire [2:0]\NLW_RES_REG_reg[0]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[16]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[24]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[28]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[32]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[36]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[40]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[44]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[48]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[52]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[56]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[60]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_RES_REG_reg[64]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_RES_REG_reg[8]_i_1_CO_UNCONNECTED ;

  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[0]_i_1_n_0 ),
        .Q(ADDR[0]));
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[1]_i_1_n_0 ),
        .Q(ADDR[1]));
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[2]_i_1_n_0 ),
        .Q(ADDR[2]));
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_reg_rep[3]_1 ),
        .Q(ADDR[3]));
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[4]_i_1_n_0 ),
        .Q(ADDR[4]));
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[5]_i_1_n_0 ),
        .Q(ADDR[5]));
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[6]_i_2_n_0 ),
        .Q(ADDR[6]));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[0]_i_1_n_0 ),
        .Q(\ADDR_reg_rep_n_0_[0] ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[1]_i_1_n_0 ),
        .Q(\ADDR_reg_rep_n_0_[1] ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[2]_i_1_n_0 ),
        .Q(\ADDR_reg_rep_n_0_[2] ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_reg_rep[3]_1 ),
        .Q(\ADDR_reg_rep_n_0_[3] ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[4]_i_1_n_0 ),
        .Q(\ADDR_reg_rep_n_0_[4] ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[5]_i_1_n_0 ),
        .Q(\ADDR_reg_rep_n_0_[5] ));
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \ADDR_reg_rep[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(\ADDR_rep[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\ADDR_rep[6]_i_2_n_0 ),
        .Q(\ADDR_reg_rep_n_0_[6] ));
  LUT6 #(
    .INIT(64'h0000033303000322)) 
    \ADDR_rep[0]_i_1 
       (.I0(\ADDR_reg[0]_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I2(ADDR[0]),
        .I3(STATE__0),
        .I4(\ADDR_reg[0]_1 ),
        .I5(\FSM_sequential_STATE_reg[3]_0 [1]),
        .O(\ADDR_rep[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002202222)) 
    \ADDR_rep[1]_i_1 
       (.I0(\ADDR_rep[2]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I2(ADDR[0]),
        .I3(ADDR[1]),
        .I4(STATE__0),
        .I5(\ADDR_reg[2]_0 ),
        .O(\ADDR_rep[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000002202222)) 
    \ADDR_rep[2]_i_1 
       (.I0(\ADDR_rep[2]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I2(ADDR[2]),
        .I3(\ADDR_rep[2]_i_3_n_0 ),
        .I4(STATE__0),
        .I5(\ADDR_reg[2]_0 ),
        .O(\ADDR_rep[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h30C4C430FFFFFFFF)) 
    \ADDR_rep[2]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\ADDR_reg[5]_0 ),
        .I2(\ADDR_reg[0]_0 ),
        .I3(RX_DATA[0]),
        .I4(GEN_PAR_ERR),
        .I5(\FSM_sequential_STATE_reg[1]_2 ),
        .O(\ADDR_rep[2]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \ADDR_rep[2]_i_3 
       (.I0(ADDR[0]),
        .I1(ADDR[1]),
        .O(\ADDR_rep[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \ADDR_rep[3]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(STATE__0),
        .O(\FSM_sequential_STATE_reg[1]_2 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF95550000)) 
    \ADDR_rep[3]_i_3 
       (.I0(ADDR[3]),
        .I1(ADDR[0]),
        .I2(ADDR[1]),
        .I3(ADDR[2]),
        .I4(STATE__0),
        .I5(\ADDR_reg_rep[3]_0 ),
        .O(\ADDR_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h000000000F000E0A)) 
    \ADDR_rep[4]_i_1 
       (.I0(STATE__0),
        .I1(\ADDR_reg[4]_0 ),
        .I2(\ADDR_rep[4]_i_2_n_0 ),
        .I3(\ADDR_reg[4]_1 ),
        .I4(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I5(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\ADDR_rep[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h800000002AAAAAAA)) 
    \ADDR_rep[4]_i_2 
       (.I0(STATE__0),
        .I1(ADDR[3]),
        .I2(ADDR[0]),
        .I3(ADDR[1]),
        .I4(ADDR[2]),
        .I5(ADDR[4]),
        .O(\ADDR_rep[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00CF000000C800C8)) 
    \ADDR_rep[5]_i_1 
       (.I0(\ADDR_reg[4]_0 ),
        .I1(\ADDR_reg[5]_0 ),
        .I2(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I3(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I4(\ADDR_rep[5]_i_3_n_0 ),
        .I5(STATE__0),
        .O(\ADDR_rep[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \ADDR_rep[5]_i_3 
       (.I0(ADDR[5]),
        .I1(ADDR[3]),
        .I2(ADDR[0]),
        .I3(ADDR[1]),
        .I4(ADDR[2]),
        .I5(ADDR[4]),
        .O(\ADDR_rep[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h50505050D0DDD0D0)) 
    \ADDR_rep[6]_i_1 
       (.I0(\ADDR_rep[6]_i_3_n_0 ),
        .I1(\ADDR_rep[6]_i_4_n_0 ),
        .I2(\ADDR_rep[6]_i_5_n_0 ),
        .I3(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I4(RX_RDY),
        .I5(\FSM_sequential_STATE_reg[3]_0 [1]),
        .O(\ADDR_rep[6]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "190" *) 
  LUT5 #(
    .INIT(32'h14440000)) 
    \ADDR_rep[6]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(ADDR[6]),
        .I2(\ADDR_rep[6]_i_6_n_0 ),
        .I3(ADDR[5]),
        .I4(STATE__0),
        .O(\ADDR_rep[6]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFF1)) 
    \ADDR_rep[6]_i_3 
       (.I0(RX_DATA_EN),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(STATE__0),
        .I3(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\ADDR_rep[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \ADDR_rep[6]_i_4 
       (.I0(STATE__0),
        .I1(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\ADDR_rep[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h005500553F770C77)) 
    \ADDR_rep[6]_i_5 
       (.I0(STATE__0),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I2(\ADDR_reg[0]_2 ),
        .I3(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I4(RX_DATA_EN),
        .I5(\FSM_sequential_STATE_reg[0]_1 ),
        .O(\ADDR_rep[6]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \ADDR_rep[6]_i_6 
       (.I0(ADDR[4]),
        .I1(ADDR[2]),
        .I2(ADDR[1]),
        .I3(ADDR[0]),
        .I4(ADDR[3]),
        .O(\ADDR_rep[6]_i_6_n_0 ));
  (* \PinAttr:I3:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h00FBFFFF)) 
    \DATA_CT[0]_i_1 
       (.I0(\DATA_CT_reg_n_0_[2] ),
        .I1(\DATA_CT_reg_n_0_[3] ),
        .I2(\DATA_CT_reg_n_0_[1] ),
        .I3(\DATA_CT_reg_n_0_[0] ),
        .I4(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(\DATA_CT[0]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \DATA_CT[1]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\DATA_CT_reg_n_0_[0] ),
        .I2(\DATA_CT_reg_n_0_[1] ),
        .O(DATA_CT[1]));
  (* \PinAttr:I3:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \DATA_CT[2]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\DATA_CT_reg_n_0_[2] ),
        .I2(\DATA_CT_reg_n_0_[1] ),
        .I3(\DATA_CT_reg_n_0_[0] ),
        .O(DATA_CT[2]));
  (* \PinAttr:I1:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h2A80A800)) 
    \DATA_CT[3]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\DATA_CT_reg_n_0_[0] ),
        .I2(\DATA_CT_reg_n_0_[1] ),
        .I3(\DATA_CT_reg_n_0_[3] ),
        .I4(\DATA_CT_reg_n_0_[2] ),
        .O(DATA_CT[3]));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_CT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(\DATA_CT[0]_i_1_n_0 ),
        .Q(\DATA_CT_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_CT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_CT[1]),
        .Q(\DATA_CT_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_CT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_CT[2]),
        .Q(\DATA_CT_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_CT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_CT[3]),
        .Q(\DATA_CT_reg_n_0_[3] ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[10]_i_1 
       (.I0(\DATA_REG_reg_n_0_[6] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[10]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[11]_i_1 
       (.I0(\DATA_REG_reg_n_0_[7] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[11]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[12]_i_1 
       (.I0(\DATA_REG_reg_n_0_[8] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[12]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[13]_i_1 
       (.I0(\DATA_REG_reg_n_0_[9] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[13]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[14]_i_1 
       (.I0(\DATA_REG_reg_n_0_[10] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[14]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[15]_i_1 
       (.I0(\DATA_REG_reg_n_0_[11] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[15]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[16]_i_1 
       (.I0(\DATA_REG_reg_n_0_[12] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[16]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[17]_i_1 
       (.I0(\DATA_REG_reg_n_0_[13] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[17]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[18]_i_1 
       (.I0(\DATA_REG_reg_n_0_[14] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[18]));
  (* \PinAttr:I0:HOLD_DETOUR  = "156" *) 
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[19]_i_1 
       (.I0(\DATA_REG_reg_n_0_[15] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[19]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[20]_i_1 
       (.I0(\DATA_REG_reg_n_0_[16] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[20]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[21]_i_1 
       (.I0(\DATA_REG_reg_n_0_[17] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[21]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[22]_i_1 
       (.I0(\DATA_REG_reg_n_0_[18] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[22]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[23]_i_1 
       (.I0(\DATA_REG_reg_n_0_[19] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[23]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[24]_i_1 
       (.I0(\DATA_REG_reg_n_0_[20] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[24]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[25]_i_1 
       (.I0(\DATA_REG_reg_n_0_[21] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[25]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[26]_i_1 
       (.I0(\DATA_REG_reg_n_0_[22] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[26]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[27]_i_1 
       (.I0(\DATA_REG_reg_n_0_[23] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[27]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[28]_i_1 
       (.I0(\DATA_REG_reg_n_0_[24] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[28]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[29]_i_1 
       (.I0(\DATA_REG_reg_n_0_[25] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[29]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[30]_i_1 
       (.I0(\DATA_REG_reg_n_0_[26] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[30]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[31]_i_1 
       (.I0(\DATA_REG_reg_n_0_[27] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[31]));
  (* \PinAttr:I0:HOLD_DETOUR  = "178" *) 
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[32]_i_1 
       (.I0(\DATA_REG_reg_n_0_[28] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[32]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[33]_i_1 
       (.I0(\DATA_REG_reg_n_0_[29] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[33]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[34]_i_1 
       (.I0(\DATA_REG_reg_n_0_[30] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[34]));
  LUT4 #(
    .INIT(16'h0002)) 
    \DATA_REG[35]_i_1 
       (.I0(RX_DATA_EN),
        .I1(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I2(STATE__0),
        .I3(\FSM_sequential_STATE[2]_i_3_n_0 ),
        .O(\DATA_REG[35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[35]_i_2 
       (.I0(\DATA_REG_reg_n_0_[31] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[35]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[4]_i_1 
       (.I0(\DATA_REG_reg_n_0_[0] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[4]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[5]_i_1 
       (.I0(\DATA_REG_reg_n_0_[1] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[5]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[6]_i_1 
       (.I0(\DATA_REG_reg_n_0_[2] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[6]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[7]_i_1 
       (.I0(\DATA_REG_reg_n_0_[3] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[7]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[8]_i_1 
       (.I0(\DATA_REG_reg_n_0_[4] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[8]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \DATA_REG[9]_i_1 
       (.I0(\DATA_REG_reg_n_0_[5] ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(DATA_REG[9]));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(\DATA_REG_reg[3]_0 [0]),
        .Q(\DATA_REG_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[10]),
        .Q(\DATA_REG_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[11]),
        .Q(\DATA_REG_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[12]),
        .Q(\DATA_REG_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[13]),
        .Q(\DATA_REG_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[14]),
        .Q(\DATA_REG_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[15]),
        .Q(\DATA_REG_reg_n_0_[15] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[16] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[16]),
        .Q(\DATA_REG_reg_n_0_[16] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[17] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[17]),
        .Q(\DATA_REG_reg_n_0_[17] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[18] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[18]),
        .Q(\DATA_REG_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[19] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[19]),
        .Q(\DATA_REG_reg_n_0_[19] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(\DATA_REG_reg[3]_0 [1]),
        .Q(\DATA_REG_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[20] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[20]),
        .Q(\DATA_REG_reg_n_0_[20] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[21] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[21]),
        .Q(\DATA_REG_reg_n_0_[21] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[22] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[22]),
        .Q(\DATA_REG_reg_n_0_[22] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[23] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[23]),
        .Q(\DATA_REG_reg_n_0_[23] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[24] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[24]),
        .Q(\DATA_REG_reg_n_0_[24] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[25] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[25]),
        .Q(\DATA_REG_reg_n_0_[25] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[26] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[26]),
        .Q(\DATA_REG_reg_n_0_[26] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[27] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[27]),
        .Q(\DATA_REG_reg_n_0_[27] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[28] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[28]),
        .Q(\DATA_REG_reg_n_0_[28] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[29] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[29]),
        .Q(\DATA_REG_reg_n_0_[29] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(\DATA_REG_reg[3]_0 [2]),
        .Q(\DATA_REG_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[30] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[30]),
        .Q(\DATA_REG_reg_n_0_[30] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[31] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[31]),
        .Q(\DATA_REG_reg_n_0_[31] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[32] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[32]),
        .Q(\DATA_REG_reg_n_0_[32] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[33] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[33]),
        .Q(\DATA_REG_reg_n_0_[33] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[34] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[34]),
        .Q(\DATA_REG_reg_n_0_[34] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[35] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[35]),
        .Q(\DATA_REG_reg_n_0_[35] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(\DATA_REG_reg[3]_0 [3]),
        .Q(\DATA_REG_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[4]),
        .Q(\DATA_REG_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[5]),
        .Q(\DATA_REG_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[6]),
        .Q(\DATA_REG_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[7]),
        .Q(\DATA_REG_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[8]),
        .Q(\DATA_REG_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \DATA_REG_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(\DATA_REG[35]_i_1_n_0 ),
        .CLR(Q),
        .D(DATA_REG[9]),
        .Q(\DATA_REG_reg_n_0_[9] ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \END_ADDR[0]_i_1 
       (.I0(\FSM_sequential_STATE[2]_i_3_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(END_ADDR[0]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \END_ADDR[2]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\END_ADDR[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000028828228)) 
    \END_ADDR[5]_i_1 
       (.I0(\FSM_sequential_STATE_reg[1]_1 ),
        .I1(RX_DATA[0]),
        .I2(GEN_PAR_ERR),
        .I3(RX_DATA[1]),
        .I4(GEN_FRT_ERR),
        .I5(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(END_ADDR[5]));
  LUT3 #(
    .INIT(8'hFB)) 
    \END_ADDR[6]_i_4 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I2(\ADDR_reg[0]_0 ),
        .O(\FSM_sequential_STATE_reg[1]_1 ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(END_ADDR[0]),
        .Q(\END_ADDR_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(D[0]),
        .Q(\END_ADDR_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(\END_ADDR[2]_i_1_n_0 ),
        .Q(\END_ADDR_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(D[1]),
        .Q(\END_ADDR_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(D[2]),
        .Q(\END_ADDR_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(END_ADDR[5]),
        .Q(\END_ADDR_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \END_ADDR_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(Q),
        .D(D[3]),
        .Q(\END_ADDR_reg_n_0_[6] ));
  LUT6 #(
    .INIT(64'hFFFFF88888888888)) 
    \FSM_sequential_STATE[0]_i_1 
       (.I0(\FSM_sequential_STATE[0]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE[0]_i_3_n_0 ),
        .I2(\FSM_sequential_STATE[0]_i_4_n_0 ),
        .I3(\FSM_sequential_STATE_reg[0]_0 ),
        .I4(\FSM_sequential_STATE_reg[0]_1 ),
        .I5(\FSM_sequential_STATE_reg[3]_1 ),
        .O(STATE__1[0]));
  LUT4 #(
    .INIT(16'h0444)) 
    \FSM_sequential_STATE[0]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(STATE__0),
        .I2(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I3(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(\FSM_sequential_STATE[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_sequential_STATE[0]_i_3 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(RES_FLG_reg_n_0),
        .O(\FSM_sequential_STATE[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_STATE[0]_i_4 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .O(\FSM_sequential_STATE[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_sequential_STATE[0]_i_6 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(STATE__0),
        .O(\FSM_sequential_STATE_reg[3]_1 ));
  LUT6 #(
    .INIT(64'h00005A5A0000FF03)) 
    \FSM_sequential_STATE[1]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\ADDR_reg[4]_0 ),
        .I2(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I3(\FSM_sequential_STATE_reg[0]_1 ),
        .I4(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I5(STATE__0),
        .O(STATE__1[1]));
  LUT6 #(
    .INIT(64'h0000770F00007700)) 
    \FSM_sequential_STATE[2]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(\FSM_sequential_STATE_reg[0]_1 ),
        .I3(STATE__0),
        .I4(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I5(\FSM_sequential_STATE[2]_i_3_n_0 ),
        .O(STATE__1[2]));
  LUT6 #(
    .INIT(64'hFDFCFDFDFDFDFDFC)) 
    \FSM_sequential_STATE[2]_i_3 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(\ADDR_reg[0]_0 ),
        .I3(\ADDR_reg[5]_0 ),
        .I4(GEN_PAR_ERR),
        .I5(RX_DATA[0]),
        .O(\FSM_sequential_STATE[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF4F4F4F4FFFFFFF4)) 
    \FSM_sequential_STATE[3]_i_1 
       (.I0(\FSM_sequential_STATE[3]_i_3_n_0 ),
        .I1(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I2(\FSM_sequential_STATE[3]_i_5_n_0 ),
        .I3(\FSM_sequential_STATE[3]_i_6_n_0 ),
        .I4(\ADDR_reg[4]_0 ),
        .I5(\FSM_sequential_STATE[3]_i_8_n_0 ),
        .O(\FSM_sequential_STATE[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \FSM_sequential_STATE[3]_i_10 
       (.I0(\END_ADDR_reg_n_0_[4] ),
        .I1(\END_ADDR_reg_n_0_[2] ),
        .I2(\END_ADDR_reg_n_0_[0] ),
        .I3(\END_ADDR_reg_n_0_[1] ),
        .I4(\END_ADDR_reg_n_0_[3] ),
        .O(\FSM_sequential_STATE[3]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hE77BBDDE)) 
    \FSM_sequential_STATE[3]_i_11 
       (.I0(ADDR[4]),
        .I1(\END_ADDR_reg_n_0_[5] ),
        .I2(\FSM_sequential_STATE[3]_i_14_n_0 ),
        .I3(\END_ADDR_reg_n_0_[4] ),
        .I4(ADDR[5]),
        .O(\FSM_sequential_STATE[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF6F669F99FFFF)) 
    \FSM_sequential_STATE[3]_i_12 
       (.I0(\END_ADDR_reg_n_0_[1] ),
        .I1(ADDR[1]),
        .I2(ADDR[6]),
        .I3(\END_ADDR_reg_n_0_[6] ),
        .I4(\END_ADDR_reg_n_0_[0] ),
        .I5(ADDR[0]),
        .O(\FSM_sequential_STATE[3]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_sequential_STATE[3]_i_13 
       (.I0(\END_ADDR_reg_n_0_[1] ),
        .I1(\END_ADDR_reg_n_0_[0] ),
        .O(\FSM_sequential_STATE[3]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_sequential_STATE[3]_i_14 
       (.I0(\END_ADDR_reg_n_0_[3] ),
        .I1(\END_ADDR_reg_n_0_[1] ),
        .I2(\END_ADDR_reg_n_0_[0] ),
        .I3(\END_ADDR_reg_n_0_[2] ),
        .O(\FSM_sequential_STATE[3]_i_14_n_0 ));
  LUT4 #(
    .INIT(16'h4000)) 
    \FSM_sequential_STATE[3]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(STATE__0),
        .I2(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I3(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(STATE__1[3]));
  LUT4 #(
    .INIT(16'hFFDF)) 
    \FSM_sequential_STATE[3]_i_3 
       (.I0(RX_RDY),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(STATE__0),
        .I3(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\FSM_sequential_STATE[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000015401515)) 
    \FSM_sequential_STATE[3]_i_4 
       (.I0(\FSM_sequential_STATE[3]_i_9_n_0 ),
        .I1(\FSM_sequential_STATE[3]_i_10_n_0 ),
        .I2(\END_ADDR_reg_n_0_[5] ),
        .I3(\END_ADDR_reg_n_0_[6] ),
        .I4(ADDR[6]),
        .I5(\FSM_sequential_STATE[3]_i_11_n_0 ),
        .O(\FSM_sequential_STATE[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00C5030000000000)) 
    \FSM_sequential_STATE[3]_i_5 
       (.I0(\RES_CT[1]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I3(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I4(STATE__0),
        .I5(RX_RDY),
        .O(\FSM_sequential_STATE[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAABA)) 
    \FSM_sequential_STATE[3]_i_6 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(\DATA_CT_reg_n_0_[2] ),
        .I2(\DATA_CT_reg_n_0_[3] ),
        .I3(\DATA_CT_reg_n_0_[1] ),
        .I4(\DATA_CT_reg_n_0_[0] ),
        .O(\FSM_sequential_STATE[3]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF3A3)) 
    \FSM_sequential_STATE[3]_i_8 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(RX_DATA_EN),
        .I2(STATE__0),
        .I3(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I4(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\FSM_sequential_STATE[3]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFF9F6FFF6FFFFF6)) 
    \FSM_sequential_STATE[3]_i_9 
       (.I0(\END_ADDR_reg_n_0_[3] ),
        .I1(ADDR[3]),
        .I2(\FSM_sequential_STATE[3]_i_12_n_0 ),
        .I3(ADDR[2]),
        .I4(\FSM_sequential_STATE[3]_i_13_n_0 ),
        .I5(\END_ADDR_reg_n_0_[2] ),
        .O(\FSM_sequential_STATE[3]_i_9_n_0 ));
  (* FSM_ENCODED_STATES = "TRES:0100,RLF:0011,RCR:0010,RDT:0001,IDLE:0000,TCR:0111,TDT:0110,TLF:1000,TMEM:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_STATE_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .CLR(Q),
        .D(STATE__1[0]),
        .Q(\FSM_sequential_STATE_reg[3]_0 [0]));
  (* FSM_ENCODED_STATES = "TRES:0100,RLF:0011,RCR:0010,RDT:0001,IDLE:0000,TCR:0111,TDT:0110,TLF:1000,TMEM:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_STATE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .CLR(Q),
        .D(STATE__1[1]),
        .Q(\FSM_sequential_STATE_reg[3]_0 [1]));
  (* FSM_ENCODED_STATES = "TRES:0100,RLF:0011,RCR:0010,RDT:0001,IDLE:0000,TCR:0111,TDT:0110,TLF:1000,TMEM:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_STATE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .CLR(Q),
        .D(STATE__1[2]),
        .Q(STATE__0));
  (* FSM_ENCODED_STATES = "TRES:0100,RLF:0011,RCR:0010,RDT:0001,IDLE:0000,TCR:0111,TDT:0110,TLF:1000,TMEM:0101" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_STATE_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FSM_sequential_STATE[3]_i_1_n_0 ),
        .CLR(Q),
        .D(STATE__1[3]),
        .Q(\FSM_sequential_STATE_reg[3]_0 [2]));
  LUT2 #(
    .INIT(4'h1)) 
    \RES_CT[0]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(\RES_CT_reg_n_0_[0] ),
        .O(RES_CT[0]));
  LUT5 #(
    .INIT(32'h00545400)) 
    \RES_CT[1]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I2(\RES_CT[1]_i_2_n_0 ),
        .I3(\RES_CT_reg_n_0_[0] ),
        .I4(\RES_CT_reg_n_0_[1] ),
        .O(RES_CT[1]));
  LUT5 #(
    .INIT(32'hFEFFFFFF)) 
    \RES_CT[1]_i_2 
       (.I0(\RES_CT_reg_n_0_[1] ),
        .I1(\RES_CT_reg_n_0_[3] ),
        .I2(\RES_CT_reg_n_0_[2] ),
        .I3(\RES_CT_reg_n_0_[4] ),
        .I4(\RES_CT_reg_n_0_[0] ),
        .O(\RES_CT[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \RES_CT[2]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(\RES_CT_reg_n_0_[1] ),
        .I2(\RES_CT_reg_n_0_[0] ),
        .I3(\RES_CT_reg_n_0_[2] ),
        .O(\RES_CT[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \RES_CT[3]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(\RES_CT_reg_n_0_[0] ),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(\RES_CT_reg_n_0_[2] ),
        .I4(\RES_CT_reg_n_0_[3] ),
        .O(\RES_CT[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0080F00000000000)) 
    \RES_CT[4]_i_1 
       (.I0(\FSM_sequential_STATE[3]_i_4_n_0 ),
        .I1(RES_FLG_reg_n_0),
        .I2(\ADDR_rep[6]_i_4_n_0 ),
        .I3(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I4(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I5(RX_RDY),
        .O(\RES_CT[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \RES_CT[4]_i_2 
       (.I0(\RES_CT[4]_i_3_n_0 ),
        .I1(\RES_CT_reg_n_0_[3] ),
        .I2(\RES_CT_reg_n_0_[2] ),
        .I3(\RES_CT_reg_n_0_[1] ),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(\RES_CT_reg_n_0_[4] ),
        .O(RES_CT[4]));
  LUT3 #(
    .INIT(8'h0E)) 
    \RES_CT[4]_i_3 
       (.I0(\RES_CT[1]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I2(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\RES_CT[4]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \RES_CT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\RES_CT[4]_i_1_n_0 ),
        .CLR(Q),
        .D(RES_CT[0]),
        .Q(\RES_CT_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \RES_CT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\RES_CT[4]_i_1_n_0 ),
        .CLR(Q),
        .D(RES_CT[1]),
        .Q(\RES_CT_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \RES_CT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\RES_CT[4]_i_1_n_0 ),
        .CLR(Q),
        .D(\RES_CT[2]_i_1_n_0 ),
        .Q(\RES_CT_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \RES_CT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\RES_CT[4]_i_1_n_0 ),
        .CLR(Q),
        .D(\RES_CT[3]_i_1_n_0 ),
        .Q(\RES_CT_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \RES_CT_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\RES_CT[4]_i_1_n_0 ),
        .CLR(Q),
        .D(RES_CT[4]),
        .Q(\RES_CT_reg_n_0_[4] ));
  LUT6 #(
    .INIT(64'h8F8F80808F888080)) 
    RES_FLG_i_1
       (.I0(\FSM_sequential_STATE_reg[3]_1 ),
        .I1(RX_DATA_EN),
        .I2(RES_REG),
        .I3(\FSM_sequential_STATE[3]_i_3_n_0 ),
        .I4(RES_FLG_reg_n_0),
        .I5(\TX_DATA_T[6]_i_4_n_0 ),
        .O(RES_FLG_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    RES_FLG_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(RES_FLG_i_1_n_0),
        .Q(RES_FLG_reg_n_0));
  LUT6 #(
    .INIT(64'h0000008000000000)) 
    \RES_REG[0]_i_1 
       (.I0(\RES_REG_reg[0]_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I2(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I3(STATE__0),
        .I4(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I5(RX_DATA_EN),
        .O(RES_REG));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[0]_i_4 
       (.I0(\DATA_REG_reg_n_0_[3] ),
        .I1(\RES_REG_reg_n_0_[3] ),
        .O(\RES_REG[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[0]_i_5 
       (.I0(\DATA_REG_reg_n_0_[2] ),
        .I1(\RES_REG_reg_n_0_[2] ),
        .O(\RES_REG[0]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[0]_i_6 
       (.I0(\DATA_REG_reg_n_0_[1] ),
        .I1(\RES_REG_reg_n_0_[1] ),
        .O(\RES_REG[0]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[0]_i_7 
       (.I0(\DATA_REG_reg_n_0_[0] ),
        .I1(\RES_REG_reg_n_0_[0] ),
        .O(\RES_REG[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[12]_i_2 
       (.I0(\DATA_REG_reg_n_0_[15] ),
        .I1(data13[3]),
        .O(\RES_REG[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[12]_i_3 
       (.I0(\DATA_REG_reg_n_0_[14] ),
        .I1(data13[2]),
        .O(\RES_REG[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[12]_i_4 
       (.I0(\DATA_REG_reg_n_0_[13] ),
        .I1(data13[1]),
        .O(\RES_REG[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[12]_i_5 
       (.I0(\DATA_REG_reg_n_0_[12] ),
        .I1(data13[0]),
        .O(\RES_REG[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[16]_i_2 
       (.I0(\DATA_REG_reg_n_0_[19] ),
        .I1(data12[3]),
        .O(\RES_REG[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[16]_i_3 
       (.I0(\DATA_REG_reg_n_0_[18] ),
        .I1(data12[2]),
        .O(\RES_REG[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[16]_i_4 
       (.I0(\DATA_REG_reg_n_0_[17] ),
        .I1(data12[1]),
        .O(\RES_REG[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[16]_i_5 
       (.I0(\DATA_REG_reg_n_0_[16] ),
        .I1(data12[0]),
        .O(\RES_REG[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[20]_i_2 
       (.I0(\DATA_REG_reg_n_0_[23] ),
        .I1(data11[3]),
        .O(\RES_REG[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[20]_i_3 
       (.I0(\DATA_REG_reg_n_0_[22] ),
        .I1(data11[2]),
        .O(\RES_REG[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[20]_i_4 
       (.I0(\DATA_REG_reg_n_0_[21] ),
        .I1(data11[1]),
        .O(\RES_REG[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[20]_i_5 
       (.I0(\DATA_REG_reg_n_0_[20] ),
        .I1(data11[0]),
        .O(\RES_REG[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[24]_i_2 
       (.I0(\DATA_REG_reg_n_0_[27] ),
        .I1(data10[3]),
        .O(\RES_REG[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[24]_i_3 
       (.I0(\DATA_REG_reg_n_0_[26] ),
        .I1(data10[2]),
        .O(\RES_REG[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[24]_i_4 
       (.I0(\DATA_REG_reg_n_0_[25] ),
        .I1(data10[1]),
        .O(\RES_REG[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[24]_i_5 
       (.I0(\DATA_REG_reg_n_0_[24] ),
        .I1(data10[0]),
        .O(\RES_REG[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[28]_i_2 
       (.I0(\DATA_REG_reg_n_0_[31] ),
        .I1(data9[3]),
        .O(\RES_REG[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[28]_i_3 
       (.I0(\DATA_REG_reg_n_0_[30] ),
        .I1(data9[2]),
        .O(\RES_REG[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[28]_i_4 
       (.I0(\DATA_REG_reg_n_0_[29] ),
        .I1(data9[1]),
        .O(\RES_REG[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[28]_i_5 
       (.I0(\DATA_REG_reg_n_0_[28] ),
        .I1(data9[0]),
        .O(\RES_REG[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[32]_i_2 
       (.I0(\DATA_REG_reg_n_0_[35] ),
        .I1(data8[3]),
        .O(\RES_REG[32]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[32]_i_3 
       (.I0(\DATA_REG_reg_n_0_[34] ),
        .I1(data8[2]),
        .O(\RES_REG[32]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[32]_i_4 
       (.I0(\DATA_REG_reg_n_0_[33] ),
        .I1(data8[1]),
        .O(\RES_REG[32]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[32]_i_5 
       (.I0(\DATA_REG_reg_n_0_[32] ),
        .I1(data8[0]),
        .O(\RES_REG[32]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[4]_i_2 
       (.I0(\DATA_REG_reg_n_0_[7] ),
        .I1(data15[3]),
        .O(\RES_REG[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[4]_i_3 
       (.I0(\DATA_REG_reg_n_0_[6] ),
        .I1(data15[2]),
        .O(\RES_REG[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[4]_i_4 
       (.I0(\DATA_REG_reg_n_0_[5] ),
        .I1(data15[1]),
        .O(\RES_REG[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[4]_i_5 
       (.I0(\DATA_REG_reg_n_0_[4] ),
        .I1(data15[0]),
        .O(\RES_REG[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[8]_i_2 
       (.I0(\DATA_REG_reg_n_0_[11] ),
        .I1(data14[3]),
        .O(\RES_REG[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[8]_i_3 
       (.I0(\DATA_REG_reg_n_0_[10] ),
        .I1(data14[2]),
        .O(\RES_REG[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[8]_i_4 
       (.I0(\DATA_REG_reg_n_0_[9] ),
        .I1(data14[1]),
        .O(\RES_REG[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \RES_REG[8]_i_5 
       (.I0(\DATA_REG_reg_n_0_[8] ),
        .I1(data14[0]),
        .O(\RES_REG[8]_i_5_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[0]_i_2_n_7 ),
        .PRE(Q),
        .Q(\RES_REG_reg_n_0_[0] ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[0]_i_2 
       (.CI(1'b0),
        .CO({\RES_REG_reg[0]_i_2_n_0 ,\NLW_RES_REG_reg[0]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[3] ,\DATA_REG_reg_n_0_[2] ,\DATA_REG_reg_n_0_[1] ,\DATA_REG_reg_n_0_[0] }),
        .O({\RES_REG_reg[0]_i_2_n_4 ,\RES_REG_reg[0]_i_2_n_5 ,\RES_REG_reg[0]_i_2_n_6 ,\RES_REG_reg[0]_i_2_n_7 }),
        .S({\RES_REG[0]_i_4_n_0 ,\RES_REG[0]_i_5_n_0 ,\RES_REG[0]_i_6_n_0 ,\RES_REG[0]_i_7_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[10] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[8]_i_1_n_5 ),
        .PRE(Q),
        .Q(data14[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[11] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[8]_i_1_n_4 ),
        .PRE(Q),
        .Q(data14[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[12] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[12]_i_1_n_7 ),
        .PRE(Q),
        .Q(data13[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[12]_i_1 
       (.CI(\RES_REG_reg[8]_i_1_n_0 ),
        .CO({\RES_REG_reg[12]_i_1_n_0 ,\NLW_RES_REG_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[15] ,\DATA_REG_reg_n_0_[14] ,\DATA_REG_reg_n_0_[13] ,\DATA_REG_reg_n_0_[12] }),
        .O({\RES_REG_reg[12]_i_1_n_4 ,\RES_REG_reg[12]_i_1_n_5 ,\RES_REG_reg[12]_i_1_n_6 ,\RES_REG_reg[12]_i_1_n_7 }),
        .S({\RES_REG[12]_i_2_n_0 ,\RES_REG[12]_i_3_n_0 ,\RES_REG[12]_i_4_n_0 ,\RES_REG[12]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[13] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[12]_i_1_n_6 ),
        .PRE(Q),
        .Q(data13[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[14] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[12]_i_1_n_5 ),
        .PRE(Q),
        .Q(data13[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[15] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[12]_i_1_n_4 ),
        .PRE(Q),
        .Q(data13[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[16] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[16]_i_1_n_7 ),
        .PRE(Q),
        .Q(data12[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[16]_i_1 
       (.CI(\RES_REG_reg[12]_i_1_n_0 ),
        .CO({\RES_REG_reg[16]_i_1_n_0 ,\NLW_RES_REG_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[19] ,\DATA_REG_reg_n_0_[18] ,\DATA_REG_reg_n_0_[17] ,\DATA_REG_reg_n_0_[16] }),
        .O({\RES_REG_reg[16]_i_1_n_4 ,\RES_REG_reg[16]_i_1_n_5 ,\RES_REG_reg[16]_i_1_n_6 ,\RES_REG_reg[16]_i_1_n_7 }),
        .S({\RES_REG[16]_i_2_n_0 ,\RES_REG[16]_i_3_n_0 ,\RES_REG[16]_i_4_n_0 ,\RES_REG[16]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[17] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[16]_i_1_n_6 ),
        .PRE(Q),
        .Q(data12[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[18] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[16]_i_1_n_5 ),
        .PRE(Q),
        .Q(data12[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[19] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[16]_i_1_n_4 ),
        .PRE(Q),
        .Q(data12[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[0]_i_2_n_6 ),
        .PRE(Q),
        .Q(\RES_REG_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[20] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[20]_i_1_n_7 ),
        .PRE(Q),
        .Q(data11[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[20]_i_1 
       (.CI(\RES_REG_reg[16]_i_1_n_0 ),
        .CO({\RES_REG_reg[20]_i_1_n_0 ,\NLW_RES_REG_reg[20]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[23] ,\DATA_REG_reg_n_0_[22] ,\DATA_REG_reg_n_0_[21] ,\DATA_REG_reg_n_0_[20] }),
        .O({\RES_REG_reg[20]_i_1_n_4 ,\RES_REG_reg[20]_i_1_n_5 ,\RES_REG_reg[20]_i_1_n_6 ,\RES_REG_reg[20]_i_1_n_7 }),
        .S({\RES_REG[20]_i_2_n_0 ,\RES_REG[20]_i_3_n_0 ,\RES_REG[20]_i_4_n_0 ,\RES_REG[20]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[21] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[20]_i_1_n_6 ),
        .PRE(Q),
        .Q(data11[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[22] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[20]_i_1_n_5 ),
        .PRE(Q),
        .Q(data11[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[23] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[20]_i_1_n_4 ),
        .PRE(Q),
        .Q(data11[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[24] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[24]_i_1_n_7 ),
        .PRE(Q),
        .Q(data10[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[24]_i_1 
       (.CI(\RES_REG_reg[20]_i_1_n_0 ),
        .CO({\RES_REG_reg[24]_i_1_n_0 ,\NLW_RES_REG_reg[24]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[27] ,\DATA_REG_reg_n_0_[26] ,\DATA_REG_reg_n_0_[25] ,\DATA_REG_reg_n_0_[24] }),
        .O({\RES_REG_reg[24]_i_1_n_4 ,\RES_REG_reg[24]_i_1_n_5 ,\RES_REG_reg[24]_i_1_n_6 ,\RES_REG_reg[24]_i_1_n_7 }),
        .S({\RES_REG[24]_i_2_n_0 ,\RES_REG[24]_i_3_n_0 ,\RES_REG[24]_i_4_n_0 ,\RES_REG[24]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[25] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[24]_i_1_n_6 ),
        .PRE(Q),
        .Q(data10[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[26] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[24]_i_1_n_5 ),
        .PRE(Q),
        .Q(data10[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[27] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[24]_i_1_n_4 ),
        .PRE(Q),
        .Q(data10[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[28] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[28]_i_1_n_7 ),
        .PRE(Q),
        .Q(data9[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[28]_i_1 
       (.CI(\RES_REG_reg[24]_i_1_n_0 ),
        .CO({\RES_REG_reg[28]_i_1_n_0 ,\NLW_RES_REG_reg[28]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[31] ,\DATA_REG_reg_n_0_[30] ,\DATA_REG_reg_n_0_[29] ,\DATA_REG_reg_n_0_[28] }),
        .O({\RES_REG_reg[28]_i_1_n_4 ,\RES_REG_reg[28]_i_1_n_5 ,\RES_REG_reg[28]_i_1_n_6 ,\RES_REG_reg[28]_i_1_n_7 }),
        .S({\RES_REG[28]_i_2_n_0 ,\RES_REG[28]_i_3_n_0 ,\RES_REG[28]_i_4_n_0 ,\RES_REG[28]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[29] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[28]_i_1_n_6 ),
        .PRE(Q),
        .Q(data9[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[0]_i_2_n_5 ),
        .PRE(Q),
        .Q(\RES_REG_reg_n_0_[2] ));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[30] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[28]_i_1_n_5 ),
        .PRE(Q),
        .Q(data9[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[31] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[28]_i_1_n_4 ),
        .PRE(Q),
        .Q(data9[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[32] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[32]_i_1_n_7 ),
        .PRE(Q),
        .Q(data8[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[32]_i_1 
       (.CI(\RES_REG_reg[28]_i_1_n_0 ),
        .CO({\RES_REG_reg[32]_i_1_n_0 ,\NLW_RES_REG_reg[32]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[35] ,\DATA_REG_reg_n_0_[34] ,\DATA_REG_reg_n_0_[33] ,\DATA_REG_reg_n_0_[32] }),
        .O({\RES_REG_reg[32]_i_1_n_4 ,\RES_REG_reg[32]_i_1_n_5 ,\RES_REG_reg[32]_i_1_n_6 ,\RES_REG_reg[32]_i_1_n_7 }),
        .S({\RES_REG[32]_i_2_n_0 ,\RES_REG[32]_i_3_n_0 ,\RES_REG[32]_i_4_n_0 ,\RES_REG[32]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[33] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[32]_i_1_n_6 ),
        .PRE(Q),
        .Q(data8[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[34] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[32]_i_1_n_5 ),
        .PRE(Q),
        .Q(data8[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[35] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[32]_i_1_n_4 ),
        .PRE(Q),
        .Q(data8[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[36] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[36]_i_1_n_7 ),
        .PRE(Q),
        .Q(data7[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[36]_i_1 
       (.CI(\RES_REG_reg[32]_i_1_n_0 ),
        .CO({\RES_REG_reg[36]_i_1_n_0 ,\NLW_RES_REG_reg[36]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[36]_i_1_n_4 ,\RES_REG_reg[36]_i_1_n_5 ,\RES_REG_reg[36]_i_1_n_6 ,\RES_REG_reg[36]_i_1_n_7 }),
        .S(data7));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[37] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[36]_i_1_n_6 ),
        .PRE(Q),
        .Q(data7[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[38] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[36]_i_1_n_5 ),
        .PRE(Q),
        .Q(data7[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[39] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[36]_i_1_n_4 ),
        .PRE(Q),
        .Q(data7[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[0]_i_2_n_4 ),
        .PRE(Q),
        .Q(\RES_REG_reg_n_0_[3] ));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[40] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[40]_i_1_n_7 ),
        .PRE(Q),
        .Q(data6[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[40]_i_1 
       (.CI(\RES_REG_reg[36]_i_1_n_0 ),
        .CO({\RES_REG_reg[40]_i_1_n_0 ,\NLW_RES_REG_reg[40]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[40]_i_1_n_4 ,\RES_REG_reg[40]_i_1_n_5 ,\RES_REG_reg[40]_i_1_n_6 ,\RES_REG_reg[40]_i_1_n_7 }),
        .S(data6));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[41] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[40]_i_1_n_6 ),
        .PRE(Q),
        .Q(data6[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[42] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[40]_i_1_n_5 ),
        .PRE(Q),
        .Q(data6[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[43] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[40]_i_1_n_4 ),
        .PRE(Q),
        .Q(data6[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[44] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[44]_i_1_n_7 ),
        .PRE(Q),
        .Q(data5[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[44]_i_1 
       (.CI(\RES_REG_reg[40]_i_1_n_0 ),
        .CO({\RES_REG_reg[44]_i_1_n_0 ,\NLW_RES_REG_reg[44]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[44]_i_1_n_4 ,\RES_REG_reg[44]_i_1_n_5 ,\RES_REG_reg[44]_i_1_n_6 ,\RES_REG_reg[44]_i_1_n_7 }),
        .S(data5));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[45] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[44]_i_1_n_6 ),
        .PRE(Q),
        .Q(data5[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[46] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[44]_i_1_n_5 ),
        .PRE(Q),
        .Q(data5[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[47] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[44]_i_1_n_4 ),
        .PRE(Q),
        .Q(data5[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[48] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[48]_i_1_n_7 ),
        .PRE(Q),
        .Q(data4[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[48]_i_1 
       (.CI(\RES_REG_reg[44]_i_1_n_0 ),
        .CO({\RES_REG_reg[48]_i_1_n_0 ,\NLW_RES_REG_reg[48]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[48]_i_1_n_4 ,\RES_REG_reg[48]_i_1_n_5 ,\RES_REG_reg[48]_i_1_n_6 ,\RES_REG_reg[48]_i_1_n_7 }),
        .S(data4));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[49] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[48]_i_1_n_6 ),
        .PRE(Q),
        .Q(data4[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[4]_i_1_n_7 ),
        .PRE(Q),
        .Q(data15[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[4]_i_1 
       (.CI(\RES_REG_reg[0]_i_2_n_0 ),
        .CO({\RES_REG_reg[4]_i_1_n_0 ,\NLW_RES_REG_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[7] ,\DATA_REG_reg_n_0_[6] ,\DATA_REG_reg_n_0_[5] ,\DATA_REG_reg_n_0_[4] }),
        .O({\RES_REG_reg[4]_i_1_n_4 ,\RES_REG_reg[4]_i_1_n_5 ,\RES_REG_reg[4]_i_1_n_6 ,\RES_REG_reg[4]_i_1_n_7 }),
        .S({\RES_REG[4]_i_2_n_0 ,\RES_REG[4]_i_3_n_0 ,\RES_REG[4]_i_4_n_0 ,\RES_REG[4]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[50] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[48]_i_1_n_5 ),
        .PRE(Q),
        .Q(data4[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[51] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[48]_i_1_n_4 ),
        .PRE(Q),
        .Q(data4[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[52] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[52]_i_1_n_7 ),
        .PRE(Q),
        .Q(data3[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[52]_i_1 
       (.CI(\RES_REG_reg[48]_i_1_n_0 ),
        .CO({\RES_REG_reg[52]_i_1_n_0 ,\NLW_RES_REG_reg[52]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[52]_i_1_n_4 ,\RES_REG_reg[52]_i_1_n_5 ,\RES_REG_reg[52]_i_1_n_6 ,\RES_REG_reg[52]_i_1_n_7 }),
        .S(data3));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[53] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[52]_i_1_n_6 ),
        .PRE(Q),
        .Q(data3[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[54] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[52]_i_1_n_5 ),
        .PRE(Q),
        .Q(data3[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[55] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[52]_i_1_n_4 ),
        .PRE(Q),
        .Q(data3[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[56] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[56]_i_1_n_7 ),
        .PRE(Q),
        .Q(data2[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[56]_i_1 
       (.CI(\RES_REG_reg[52]_i_1_n_0 ),
        .CO({\RES_REG_reg[56]_i_1_n_0 ,\NLW_RES_REG_reg[56]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[56]_i_1_n_4 ,\RES_REG_reg[56]_i_1_n_5 ,\RES_REG_reg[56]_i_1_n_6 ,\RES_REG_reg[56]_i_1_n_7 }),
        .S(data2));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[57] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[56]_i_1_n_6 ),
        .PRE(Q),
        .Q(data2[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[58] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[56]_i_1_n_5 ),
        .PRE(Q),
        .Q(data2[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[59] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[56]_i_1_n_4 ),
        .PRE(Q),
        .Q(data2[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[4]_i_1_n_6 ),
        .PRE(Q),
        .Q(data15[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[60] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[60]_i_1_n_7 ),
        .PRE(Q),
        .Q(data1[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[60]_i_1 
       (.CI(\RES_REG_reg[56]_i_1_n_0 ),
        .CO({\RES_REG_reg[60]_i_1_n_0 ,\NLW_RES_REG_reg[60]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[60]_i_1_n_4 ,\RES_REG_reg[60]_i_1_n_5 ,\RES_REG_reg[60]_i_1_n_6 ,\RES_REG_reg[60]_i_1_n_7 }),
        .S(data1));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[61] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[60]_i_1_n_6 ),
        .PRE(Q),
        .Q(data1[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[62] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[60]_i_1_n_5 ),
        .PRE(Q),
        .Q(data1[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[63] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[60]_i_1_n_4 ),
        .PRE(Q),
        .Q(data1[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[64] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[64]_i_1_n_7 ),
        .PRE(Q),
        .Q(data0[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[64]_i_1 
       (.CI(\RES_REG_reg[60]_i_1_n_0 ),
        .CO(\NLW_RES_REG_reg[64]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\RES_REG_reg[64]_i_1_n_4 ,\RES_REG_reg[64]_i_1_n_5 ,\RES_REG_reg[64]_i_1_n_6 ,\RES_REG_reg[64]_i_1_n_7 }),
        .S(data0));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[65] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[64]_i_1_n_6 ),
        .PRE(Q),
        .Q(data0[1]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[66] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[64]_i_1_n_5 ),
        .PRE(Q),
        .Q(data0[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[67] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[64]_i_1_n_4 ),
        .PRE(Q),
        .Q(data0[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[4]_i_1_n_5 ),
        .PRE(Q),
        .Q(data15[2]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[4]_i_1_n_4 ),
        .PRE(Q),
        .Q(data15[3]));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[8]_i_1_n_7 ),
        .PRE(Q),
        .Q(data14[0]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \RES_REG_reg[8]_i_1 
       (.CI(\RES_REG_reg[4]_i_1_n_0 ),
        .CO({\RES_REG_reg[8]_i_1_n_0 ,\NLW_RES_REG_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\DATA_REG_reg_n_0_[11] ,\DATA_REG_reg_n_0_[10] ,\DATA_REG_reg_n_0_[9] ,\DATA_REG_reg_n_0_[8] }),
        .O({\RES_REG_reg[8]_i_1_n_4 ,\RES_REG_reg[8]_i_1_n_5 ,\RES_REG_reg[8]_i_1_n_6 ,\RES_REG_reg[8]_i_1_n_7 }),
        .S({\RES_REG[8]_i_2_n_0 ,\RES_REG[8]_i_3_n_0 ,\RES_REG[8]_i_4_n_0 ,\RES_REG[8]_i_5_n_0 }));
  FDPE #(
    .INIT(1'b1)) 
    \RES_REG_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(RES_REG),
        .D(\RES_REG_reg[8]_i_1_n_6 ),
        .PRE(Q),
        .Q(data14[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \TX_DATA[6]_i_2 
       (.I0(TX_DATA_T),
        .I1(TX_STATE__0),
        .O(\TX_DATA_T_reg[6]_0 ));
  LUT6 #(
    .INIT(64'hFFFFB0FFF0F0B0B0)) 
    \TX_DATA_T[0]_i_1 
       (.I0(\TX_DATA_T[6]_i_4_n_0 ),
        .I1(RES_FLG_reg_n_0),
        .I2(\TX_DATA_T[0]_i_2_n_0 ),
        .I3(\RES_CT[1]_i_2_n_0 ),
        .I4(\TX_DATA_T[0]_i_3_n_0 ),
        .I5(\FSM_sequential_STATE_reg[1]_0 ),
        .O(\TX_DATA_T[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444444444544444)) 
    \TX_DATA_T[0]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(\TX_DATA_T_reg[0]_i_4_n_0 ),
        .I2(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I3(\FSM_sequential_STATE[3]_i_11_n_0 ),
        .I4(\TX_DATA_T[6]_i_9_n_0 ),
        .I5(\FSM_sequential_STATE[3]_i_9_n_0 ),
        .O(\TX_DATA_T[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1FE0)) 
    \TX_DATA_T[0]_i_3 
       (.I0(\TX_DATA_T[6]_i_12_n_0 ),
        .I1(\TX_DATA_T[6]_i_11_n_0 ),
        .I2(\TX_DATA_T[6]_i_10_n_0 ),
        .I3(\TX_DATA_T[2]_i_5_n_0 ),
        .O(\TX_DATA_T[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE4A0FF00E4A0)) 
    \TX_DATA_T[1]_i_1 
       (.I0(\TX_DATA_T[6]_i_4_n_0 ),
        .I1(RES_FLG_reg_n_0),
        .I2(\TX_DATA_T_reg[1]_i_2_n_0 ),
        .I3(\TX_DATA_T[1]_i_3_n_0 ),
        .I4(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I5(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(\TX_DATA_T[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hCF20)) 
    \TX_DATA_T[1]_i_3 
       (.I0(\TX_DATA_T[6]_i_12_n_0 ),
        .I1(\TX_DATA_T[2]_i_5_n_0 ),
        .I2(\TX_DATA_T[6]_i_10_n_0 ),
        .I3(\TX_DATA_T[6]_i_11_n_0 ),
        .O(\TX_DATA_T[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFF4FFCCCC4444)) 
    \TX_DATA_T[2]_i_1 
       (.I0(\RES_CT[1]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[1]_0 ),
        .I2(\TX_DATA_T[6]_i_4_n_0 ),
        .I3(RES_FLG_reg_n_0),
        .I4(\TX_DATA_T[2]_i_3_n_0 ),
        .I5(\TX_DATA_T[2]_i_4_n_0 ),
        .O(\TX_DATA_T[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[2]_i_10 
       (.I0(data11[0]),
        .I1(data10[0]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data9[0]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data8[0]),
        .O(\TX_DATA_T[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[2]_i_11 
       (.I0(data15[0]),
        .I1(data14[0]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data13[0]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data12[0]),
        .O(\TX_DATA_T[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[2]_i_12 
       (.I0(data3[0]),
        .I1(data2[0]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data1[0]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data0[0]),
        .O(\TX_DATA_T[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[2]_i_13 
       (.I0(data7[0]),
        .I1(data6[0]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data5[0]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data4[0]),
        .O(\TX_DATA_T[2]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \TX_DATA_T[2]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(\FSM_sequential_STATE_reg[1]_0 ));
  LUT4 #(
    .INIT(16'hAA8A)) 
    \TX_DATA_T[2]_i_3 
       (.I0(\TX_DATA_T[6]_i_12_n_0 ),
        .I1(\TX_DATA_T[2]_i_5_n_0 ),
        .I2(\TX_DATA_T[6]_i_10_n_0 ),
        .I3(\TX_DATA_T[6]_i_11_n_0 ),
        .O(\TX_DATA_T[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h4444444444544444)) 
    \TX_DATA_T[2]_i_4 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I1(\TX_DATA_T_reg[2]_i_6_n_0 ),
        .I2(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I3(\FSM_sequential_STATE[3]_i_11_n_0 ),
        .I4(\TX_DATA_T[6]_i_9_n_0 ),
        .I5(\FSM_sequential_STATE[3]_i_9_n_0 ),
        .O(\TX_DATA_T[2]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \TX_DATA_T[2]_i_5 
       (.I0(\TX_DATA_T[2]_i_7_n_0 ),
        .I1(\RES_CT_reg_n_0_[4] ),
        .I2(\TX_DATA_T_reg[2]_i_8_n_0 ),
        .I3(\RES_CT_reg_n_0_[3] ),
        .I4(\TX_DATA_T_reg[2]_i_9_n_0 ),
        .O(\TX_DATA_T[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \TX_DATA_T[2]_i_7 
       (.I0(\RES_CT_reg_n_0_[3] ),
        .I1(\RES_CT_reg_n_0_[0] ),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(\RES_CT_reg_n_0_[2] ),
        .I4(\RES_REG_reg_n_0_[0] ),
        .O(\TX_DATA_T[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hEEAEEE00EEAEEEAE)) 
    \TX_DATA_T[3]_i_1 
       (.I0(\TX_DATA_T[3]_i_2_n_0 ),
        .I1(\TX_DATA_T[6]_i_5_n_0 ),
        .I2(\TX_DATA_T[6]_i_6_n_0 ),
        .I3(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I4(\TX_DATA_T_reg[3]_i_3_n_0 ),
        .I5(\TX_DATA_T[6]_i_4_n_0 ),
        .O(\TX_DATA_T[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \TX_DATA_T[3]_i_2 
       (.I0(\TX_DATA_T[6]_i_10_n_0 ),
        .I1(\TX_DATA_T[6]_i_11_n_0 ),
        .I2(\TX_DATA_T[6]_i_12_n_0 ),
        .O(\TX_DATA_T[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBB8B888B888B88)) 
    \TX_DATA_T[4]_i_1 
       (.I0(\TX_DATA_T[5]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(\TX_DATA_T[6]_i_7_n_0 ),
        .I3(\TX_DATA_T[6]_i_6_n_0 ),
        .I4(\TX_DATA_T[6]_i_4_n_0 ),
        .I5(\TX_DATA_T[4]_i_2_n_0 ),
        .O(\TX_DATA_T[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_DATA_T[4]_i_2 
       (.I0(g1_b4_n_0),
        .I1(\ADDR_reg_rep_n_0_[6] ),
        .I2(g0_b4_n_0),
        .O(\TX_DATA_T[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hB888BBBBB888B888)) 
    \TX_DATA_T[5]_i_1 
       (.I0(\TX_DATA_T[5]_i_2_n_0 ),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(\TX_DATA_T[6]_i_4_n_0 ),
        .I3(\TX_DATA_T[5]_i_3_n_0 ),
        .I4(\TX_DATA_T[6]_i_7_n_0 ),
        .I5(\TX_DATA_T[6]_i_6_n_0 ),
        .O(\TX_DATA_T[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h04040444)) 
    \TX_DATA_T[5]_i_2 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\RES_CT[1]_i_2_n_0 ),
        .I2(\TX_DATA_T[6]_i_10_n_0 ),
        .I3(\TX_DATA_T[6]_i_11_n_0 ),
        .I4(\TX_DATA_T[6]_i_12_n_0 ),
        .O(\TX_DATA_T[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_DATA_T[5]_i_3 
       (.I0(g1_b4_n_0),
        .I1(\ADDR_reg_rep_n_0_[6] ),
        .I2(g0_b5_n_0),
        .O(\TX_DATA_T[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h0000F100)) 
    \TX_DATA_T[6]_i_1 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I2(RX_RDY),
        .I3(STATE__0),
        .I4(\FSM_sequential_STATE_reg[3]_0 [2]),
        .O(\TX_DATA_T[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \TX_DATA_T[6]_i_10 
       (.I0(\TX_DATA_T[6]_i_13_n_0 ),
        .I1(\RES_CT_reg_n_0_[4] ),
        .I2(\TX_DATA_T_reg[6]_i_14_n_0 ),
        .I3(\RES_CT_reg_n_0_[3] ),
        .I4(\TX_DATA_T_reg[6]_i_15_n_0 ),
        .O(\TX_DATA_T[6]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \TX_DATA_T[6]_i_11 
       (.I0(\TX_DATA_T[6]_i_16_n_0 ),
        .I1(\RES_CT_reg_n_0_[4] ),
        .I2(\TX_DATA_T_reg[6]_i_17_n_0 ),
        .I3(\RES_CT_reg_n_0_[3] ),
        .I4(\TX_DATA_T_reg[6]_i_18_n_0 ),
        .O(\TX_DATA_T[6]_i_11_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \TX_DATA_T[6]_i_12 
       (.I0(\TX_DATA_T[6]_i_19_n_0 ),
        .I1(\RES_CT_reg_n_0_[4] ),
        .I2(\TX_DATA_T_reg[6]_i_20_n_0 ),
        .I3(\RES_CT_reg_n_0_[3] ),
        .I4(\TX_DATA_T_reg[6]_i_21_n_0 ),
        .O(\TX_DATA_T[6]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \TX_DATA_T[6]_i_13 
       (.I0(\RES_CT_reg_n_0_[3] ),
        .I1(\RES_CT_reg_n_0_[2] ),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(\RES_CT_reg_n_0_[0] ),
        .I4(\RES_REG_reg_n_0_[3] ),
        .O(\TX_DATA_T[6]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \TX_DATA_T[6]_i_16 
       (.I0(\RES_CT_reg_n_0_[3] ),
        .I1(\RES_CT_reg_n_0_[0] ),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(\RES_CT_reg_n_0_[2] ),
        .I4(\RES_REG_reg_n_0_[1] ),
        .O(\TX_DATA_T[6]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \TX_DATA_T[6]_i_19 
       (.I0(\RES_CT_reg_n_0_[3] ),
        .I1(\RES_CT_reg_n_0_[0] ),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(\RES_CT_reg_n_0_[2] ),
        .I4(\RES_REG_reg_n_0_[2] ),
        .O(\TX_DATA_T[6]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h0FFF0F8F00880088)) 
    \TX_DATA_T[6]_i_2 
       (.I0(\TX_DATA_T_reg[6]_i_3_n_0 ),
        .I1(\TX_DATA_T[6]_i_4_n_0 ),
        .I2(\TX_DATA_T[6]_i_5_n_0 ),
        .I3(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I4(\TX_DATA_T[6]_i_6_n_0 ),
        .I5(\TX_DATA_T[6]_i_7_n_0 ),
        .O(\TX_DATA_T[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_22 
       (.I0(data11[3]),
        .I1(data10[3]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data9[3]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data8[3]),
        .O(\TX_DATA_T[6]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_23 
       (.I0(data15[3]),
        .I1(data14[3]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data13[3]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data12[3]),
        .O(\TX_DATA_T[6]_i_23_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_24 
       (.I0(data3[3]),
        .I1(data2[3]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data1[3]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data0[3]),
        .O(\TX_DATA_T[6]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_25 
       (.I0(data7[3]),
        .I1(data6[3]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data5[3]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data4[3]),
        .O(\TX_DATA_T[6]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_26 
       (.I0(data11[1]),
        .I1(data10[1]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data9[1]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data8[1]),
        .O(\TX_DATA_T[6]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_27 
       (.I0(data15[1]),
        .I1(data14[1]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data13[1]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data12[1]),
        .O(\TX_DATA_T[6]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_28 
       (.I0(data3[1]),
        .I1(data2[1]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data1[1]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data0[1]),
        .O(\TX_DATA_T[6]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_29 
       (.I0(data7[1]),
        .I1(data6[1]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data5[1]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data4[1]),
        .O(\TX_DATA_T[6]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_30 
       (.I0(data11[2]),
        .I1(data10[2]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data9[2]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data8[2]),
        .O(\TX_DATA_T[6]_i_30_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_31 
       (.I0(data15[2]),
        .I1(data14[2]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data13[2]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data12[2]),
        .O(\TX_DATA_T[6]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_32 
       (.I0(data3[2]),
        .I1(data2[2]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data1[2]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data0[2]),
        .O(\TX_DATA_T[6]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \TX_DATA_T[6]_i_33 
       (.I0(data7[2]),
        .I1(data6[2]),
        .I2(\RES_CT_reg_n_0_[1] ),
        .I3(data5[2]),
        .I4(\RES_CT_reg_n_0_[0] ),
        .I5(data4[2]),
        .O(\TX_DATA_T[6]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFDDFDFFDF)) 
    \TX_DATA_T[6]_i_4 
       (.I0(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I1(\FSM_sequential_STATE[3]_i_11_n_0 ),
        .I2(ADDR[6]),
        .I3(\END_ADDR_reg_n_0_[6] ),
        .I4(\TX_DATA_T[6]_i_8_n_0 ),
        .I5(\FSM_sequential_STATE[3]_i_9_n_0 ),
        .O(\TX_DATA_T[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000008FFFFFFFF)) 
    \TX_DATA_T[6]_i_5 
       (.I0(\RES_CT_reg_n_0_[0] ),
        .I1(\RES_CT_reg_n_0_[4] ),
        .I2(\RES_CT_reg_n_0_[2] ),
        .I3(\RES_CT_reg_n_0_[3] ),
        .I4(\RES_CT_reg_n_0_[1] ),
        .I5(\FSM_sequential_STATE_reg[1]_0 ),
        .O(\TX_DATA_T[6]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h04000000)) 
    \TX_DATA_T[6]_i_6 
       (.I0(\FSM_sequential_STATE[3]_i_11_n_0 ),
        .I1(\TX_DATA_T[6]_i_9_n_0 ),
        .I2(\FSM_sequential_STATE[3]_i_9_n_0 ),
        .I3(RES_FLG_reg_n_0),
        .I4(\FSM_sequential_STATE_reg[3]_0 [0]),
        .O(\TX_DATA_T[6]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \TX_DATA_T[6]_i_7 
       (.I0(\TX_DATA_T[6]_i_10_n_0 ),
        .I1(\TX_DATA_T[6]_i_11_n_0 ),
        .I2(\TX_DATA_T[6]_i_12_n_0 ),
        .O(\TX_DATA_T[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \TX_DATA_T[6]_i_8 
       (.I0(\END_ADDR_reg_n_0_[5] ),
        .I1(\END_ADDR_reg_n_0_[3] ),
        .I2(\END_ADDR_reg_n_0_[1] ),
        .I3(\END_ADDR_reg_n_0_[0] ),
        .I4(\END_ADDR_reg_n_0_[2] ),
        .I5(\END_ADDR_reg_n_0_[4] ),
        .O(\TX_DATA_T[6]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'h7877)) 
    \TX_DATA_T[6]_i_9 
       (.I0(\FSM_sequential_STATE[3]_i_10_n_0 ),
        .I1(\END_ADDR_reg_n_0_[5] ),
        .I2(\END_ADDR_reg_n_0_[6] ),
        .I3(ADDR[6]),
        .O(\TX_DATA_T[6]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[0]_i_1_n_0 ),
        .Q(\TX_DATA_T_reg[5]_0 [0]));
  MUXF7 \TX_DATA_T_reg[0]_i_4 
       (.I0(g0_b0_n_0),
        .I1(g1_b0_n_0),
        .O(\TX_DATA_T_reg[0]_i_4_n_0 ),
        .S(\ADDR_reg_rep_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[1]_i_1_n_0 ),
        .Q(\TX_DATA_T_reg[5]_0 [1]));
  MUXF7 \TX_DATA_T_reg[1]_i_2 
       (.I0(g0_b1_n_0),
        .I1(g1_b1_n_0),
        .O(\TX_DATA_T_reg[1]_i_2_n_0 ),
        .S(\ADDR_reg_rep_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[2]_i_1_n_0 ),
        .Q(\TX_DATA_T_reg[5]_0 [2]));
  MUXF7 \TX_DATA_T_reg[2]_i_6 
       (.I0(g0_b2_n_0),
        .I1(g1_b2_n_0),
        .O(\TX_DATA_T_reg[2]_i_6_n_0 ),
        .S(\ADDR_reg_rep_n_0_[6] ));
  MUXF7 \TX_DATA_T_reg[2]_i_8 
       (.I0(\TX_DATA_T[2]_i_10_n_0 ),
        .I1(\TX_DATA_T[2]_i_11_n_0 ),
        .O(\TX_DATA_T_reg[2]_i_8_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[2]_i_9 
       (.I0(\TX_DATA_T[2]_i_12_n_0 ),
        .I1(\TX_DATA_T[2]_i_13_n_0 ),
        .O(\TX_DATA_T_reg[2]_i_9_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[3]_i_1_n_0 ),
        .Q(\TX_DATA_T_reg[5]_0 [3]));
  MUXF7 \TX_DATA_T_reg[3]_i_3 
       (.I0(g0_b3_n_0),
        .I1(g1_b3_n_0),
        .O(\TX_DATA_T_reg[3]_i_3_n_0 ),
        .S(\ADDR_reg_rep_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[4]_i_1_n_0 ),
        .Q(\TX_DATA_T_reg[5]_0 [4]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[5]_i_1_n_0 ),
        .Q(\TX_DATA_T_reg[5]_0 [5]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_T_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(\TX_DATA_T[6]_i_1_n_0 ),
        .CLR(Q),
        .D(\TX_DATA_T[6]_i_2_n_0 ),
        .Q(TX_DATA_T));
  MUXF7 \TX_DATA_T_reg[6]_i_14 
       (.I0(\TX_DATA_T[6]_i_22_n_0 ),
        .I1(\TX_DATA_T[6]_i_23_n_0 ),
        .O(\TX_DATA_T_reg[6]_i_14_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[6]_i_15 
       (.I0(\TX_DATA_T[6]_i_24_n_0 ),
        .I1(\TX_DATA_T[6]_i_25_n_0 ),
        .O(\TX_DATA_T_reg[6]_i_15_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[6]_i_17 
       (.I0(\TX_DATA_T[6]_i_26_n_0 ),
        .I1(\TX_DATA_T[6]_i_27_n_0 ),
        .O(\TX_DATA_T_reg[6]_i_17_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[6]_i_18 
       (.I0(\TX_DATA_T[6]_i_28_n_0 ),
        .I1(\TX_DATA_T[6]_i_29_n_0 ),
        .O(\TX_DATA_T_reg[6]_i_18_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[6]_i_20 
       (.I0(\TX_DATA_T[6]_i_30_n_0 ),
        .I1(\TX_DATA_T[6]_i_31_n_0 ),
        .O(\TX_DATA_T_reg[6]_i_20_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[6]_i_21 
       (.I0(\TX_DATA_T[6]_i_32_n_0 ),
        .I1(\TX_DATA_T[6]_i_33_n_0 ),
        .O(\TX_DATA_T_reg[6]_i_21_n_0 ),
        .S(\RES_CT_reg_n_0_[2] ));
  MUXF7 \TX_DATA_T_reg[6]_i_3 
       (.I0(g0_b6_n_0),
        .I1(g1_b6_n_0),
        .O(\TX_DATA_T_reg[6]_i_3_n_0 ),
        .S(\ADDR_reg_rep_n_0_[6] ));
  LUT6 #(
    .INIT(64'hFFFFFFDF00000044)) 
    TX_RDY_T_i_1
       (.I0(\FSM_sequential_STATE_reg[3]_0 [2]),
        .I1(STATE__0),
        .I2(RX_RDY),
        .I3(\FSM_sequential_STATE_reg[3]_0 [0]),
        .I4(\FSM_sequential_STATE_reg[3]_0 [1]),
        .I5(TX_RDY),
        .O(TX_RDY_T_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    TX_RDY_T_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(TX_RDY_T_i_1_n_0),
        .Q(TX_RDY));
  LUT6 #(
    .INIT(64'h4D46A93549A344CE)) 
    g0_b0
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b0_n_0));
  LUT6 #(
    .INIT(64'h9001DE408600FF05)) 
    g0_b1
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b1_n_0));
  LUT6 #(
    .INIT(64'h64AAE992095564FA)) 
    g0_b2
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b2_n_0));
  LUT6 #(
    .INIT(64'h0002A80508015450)) 
    g0_b3
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b3_n_0));
  LUT6 #(
    .INIT(64'hB48916D6A6449B2D)) 
    g0_b4
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b4_n_0));
  LUT6 #(
    .INIT(64'h7297EEC93E5D3072)) 
    g0_b5
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b5_n_0));
  LUT6 #(
    .INIT(64'hFDEFDFF7E7F7EFBF)) 
    g0_b6
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g0_b6_n_0));
  LUT6 #(
    .INIT(64'h0000000000000032)) 
    g1_b0
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g1_b0_n_0));
  LUT6 #(
    .INIT(64'h000000000000004F)) 
    g1_b1
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g1_b1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000092)) 
    g1_b2
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g1_b2_n_0));
  LUT5 #(
    .INIT(32'h00000002)) 
    g1_b3
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[2] ),
        .I2(\ADDR_reg_rep_n_0_[3] ),
        .I3(\ADDR_reg_rep_n_0_[4] ),
        .I4(\ADDR_reg_rep_n_0_[5] ),
        .O(g1_b3_n_0));
  LUT5 #(
    .INIT(32'h0000000D)) 
    g1_b4
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[3] ),
        .I3(\ADDR_reg_rep_n_0_[4] ),
        .I4(\ADDR_reg_rep_n_0_[5] ),
        .O(g1_b4_n_0));
  LUT6 #(
    .INIT(64'h00000000000000F7)) 
    g1_b6
       (.I0(\ADDR_reg_rep_n_0_[0] ),
        .I1(\ADDR_reg_rep_n_0_[1] ),
        .I2(\ADDR_reg_rep_n_0_[2] ),
        .I3(\ADDR_reg_rep_n_0_[3] ),
        .I4(\ADDR_reg_rep_n_0_[4] ),
        .I5(\ADDR_reg_rep_n_0_[5] ),
        .O(g1_b6_n_0));
endmodule

(* ECO_CHECKSUM = "73bdf109" *) 
(* NotValidForBitStream *)
module FR_LR_TOP
   (CLK,
    SYS_NRST,
    BTN_0,
    BTN_1,
    UART_RXD,
    UART_TXD);
  input CLK;
  input SYS_NRST;
  input BTN_0;
  input BTN_1;
  input UART_RXD;
  output UART_TXD;

  wire BTN_0;
  wire BTN_0_IBUF;
  wire BTN_1;
  wire BTN_1_IBUF;
  wire CE_1kHz;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire [3:0]DATA_REG;
  wire [4:1]END_ADDR;
  wire GEN_FRT_ERR;
  wire GEN_PAR_ERR;
  wire RST;
  wire [1:0]RST_SYNC;
  wire \RST_SYNC[2]_i_1_n_0 ;
  wire [9:8]RX_DATA;
  wire RX_DATA_EN;
  wire RX_RDY;
  wire [3:0]STATE__0;
  wire SYS_NRST;
  wire SYS_NRST_IBUF;
  wire [6:6]TX_DATA;
  wire [5:0]TX_DATA_T;
  wire TX_RDY;
  wire [1:1]TX_STATE__0;
  wire UART_RXD;
  wire UART_RXD_IBUF;
  wire UART_TXD;
  wire UART_TXD_OBUF;
  wire filt_btn0_n_1;
  wire filt_btn1_n_1;
  wire fr_fsm_n_1;
  wire fr_fsm_n_5;
  wire fr_fsm_n_6;
  wire fr_fsm_n_7;
  wire fr_fsm_n_8;
  wire uart_n_10;
  wire uart_n_19;
  wire uart_n_20;
  wire uart_n_21;
  wire uart_n_22;
  wire uart_n_23;
  wire uart_n_24;
  wire uart_n_3;
  wire uart_n_4;
  wire uart_n_7;
  wire uart_n_8;
  wire uart_n_9;

  IBUF #(
    .CCIO_EN("TRUE")) 
    BTN_0_IBUF_inst
       (.I(BTN_0),
        .O(BTN_0_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    BTN_1_IBUF_inst
       (.I(BTN_1),
        .O(BTN_1_IBUF));
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF #(
    .CCIO_EN("TRUE")) 
    CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \RST_SYNC[2]_i_1 
       (.I0(SYS_NRST_IBUF),
        .O(\RST_SYNC[2]_i_1_n_0 ));
  FDPE #(
    .INIT(1'b0)) 
    \RST_SYNC_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\RST_SYNC[2]_i_1_n_0 ),
        .Q(RST_SYNC[0]));
  FDCE #(
    .INIT(1'b1)) 
    \RST_SYNC_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\RST_SYNC[2]_i_1_n_0 ),
        .D(RST_SYNC[0]),
        .Q(RST_SYNC[1]));
  FDCE #(
    .INIT(1'b1)) 
    \RST_SYNC_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\RST_SYNC[2]_i_1_n_0 ),
        .D(RST_SYNC[1]),
        .Q(RST));
  IBUF #(
    .CCIO_EN("TRUE")) 
    SYS_NRST_IBUF_inst
       (.I(SYS_NRST),
        .O(SYS_NRST_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    UART_RXD_IBUF_inst
       (.I(UART_RXD),
        .O(UART_RXD_IBUF));
  OBUF UART_TXD_OBUF_inst
       (.I(UART_TXD_OBUF),
        .O(UART_TXD));
  FR_DIVIDER div1khz
       (.CE_1kHz(CE_1kHz),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .Q(RST));
  M_BTN_FILTER_V10 filt_btn0
       (.BTN_0_IBUF(BTN_0_IBUF),
        .BTN_S2_reg_0(filt_btn0_n_1),
        .CE_1kHz(CE_1kHz),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .GEN_FRT_ERR(GEN_FRT_ERR),
        .Q(RST),
        .RX_DATA(RX_DATA[9]));
  M_BTN_FILTER_V10_0 filt_btn1
       (.BTN_1_IBUF(BTN_1_IBUF),
        .BTN_S2_reg_0(filt_btn1_n_1),
        .CE_1kHz(CE_1kHz),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .GEN_PAR_ERR(GEN_PAR_ERR),
        .Q(RST),
        .RX_DATA(RX_DATA[8]));
  FR_FSM fr_fsm
       (.\ADDR_reg[0]_0 (uart_n_8),
        .\ADDR_reg[0]_1 (uart_n_9),
        .\ADDR_reg[0]_2 (uart_n_21),
        .\ADDR_reg[2]_0 (uart_n_23),
        .\ADDR_reg[3]_0 (fr_fsm_n_7),
        .\ADDR_reg[4]_0 (uart_n_4),
        .\ADDR_reg[4]_1 (filt_btn1_n_1),
        .\ADDR_reg[5]_0 (filt_btn0_n_1),
        .\ADDR_reg_rep[3]_0 (uart_n_24),
        .\ADDR_reg_rep[3]_1 (uart_n_3),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .D({uart_n_10,END_ADDR[4:3],END_ADDR[1]}),
        .\DATA_REG_reg[3]_0 (DATA_REG),
        .E(uart_n_19),
        .\FSM_sequential_STATE_reg[0]_0 (uart_n_7),
        .\FSM_sequential_STATE_reg[0]_1 (uart_n_20),
        .\FSM_sequential_STATE_reg[1]_0 (fr_fsm_n_1),
        .\FSM_sequential_STATE_reg[1]_1 (fr_fsm_n_6),
        .\FSM_sequential_STATE_reg[1]_2 (fr_fsm_n_8),
        .\FSM_sequential_STATE_reg[3]_0 ({STATE__0[3],STATE__0[1:0]}),
        .\FSM_sequential_STATE_reg[3]_1 (fr_fsm_n_5),
        .GEN_FRT_ERR(GEN_FRT_ERR),
        .GEN_PAR_ERR(GEN_PAR_ERR),
        .Q(RST),
        .\RES_REG_reg[0]_0 (uart_n_22),
        .RX_DATA(RX_DATA),
        .RX_DATA_EN(RX_DATA_EN),
        .RX_RDY(RX_RDY),
        .\TX_DATA_T_reg[5]_0 (TX_DATA_T),
        .\TX_DATA_T_reg[6]_0 (TX_DATA),
        .TX_RDY(TX_RDY),
        .TX_STATE__0(TX_STATE__0));
  FR_UART uart
       (.\ADDR_reg_rep[3] (fr_fsm_n_8),
        .\ADDR_reg_rep[3]_0 (filt_btn0_n_1),
        .\ADDR_reg_rep[3]_1 (fr_fsm_n_7),
        .BTN_S2_reg(uart_n_3),
        .BTN_S2_reg_0(uart_n_7),
        .BTN_S2_reg_1(uart_n_23),
        .BTN_S2_reg_2(uart_n_24),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .D({uart_n_10,END_ADDR[4:3],END_ADDR[1]}),
        .E(uart_n_19),
        .\END_ADDR_reg[3] (fr_fsm_n_6),
        .\END_ADDR_reg[3]_0 ({STATE__0[3],STATE__0[1:0]}),
        .\END_ADDR_reg[6] (fr_fsm_n_5),
        .\END_ADDR_reg[6]_0 (fr_fsm_n_1),
        .\FSM_sequential_STATE_reg[0] (uart_n_4),
        .\FSM_sequential_TX_STATE_reg[1]_0 (TX_STATE__0),
        .GEN_FRT_ERR(GEN_FRT_ERR),
        .GEN_PAR_ERR(GEN_PAR_ERR),
        .Q(RST),
        .RX_DATA_EN(RX_DATA_EN),
        .\RX_DATA_T_reg[1]_0 (uart_n_20),
        .\RX_DATA_T_reg[2]_0 (uart_n_22),
        .\RX_DATA_T_reg[3]_0 (uart_n_21),
        .\RX_DATA_T_reg[4]_0 (uart_n_8),
        .\RX_DATA_T_reg[4]_1 (DATA_REG),
        .\RX_DATA_T_reg[8]_0 (uart_n_9),
        .\RX_DATA_T_reg[9]_0 (RX_DATA),
        .RX_RDY(RX_RDY),
        .\SYNC_reg[0]_0 (UART_RXD_IBUF),
        .\TX_DATA_reg[5]_0 (TX_DATA_T),
        .\TX_DATA_reg[6]_0 (TX_DATA),
        .TX_RDY(TX_RDY),
        .UART_TXD_OBUF(UART_TXD_OBUF));
endmodule

module FR_UART
   (UART_TXD_OBUF,
    RX_DATA_EN,
    RX_RDY,
    BTN_S2_reg,
    \FSM_sequential_STATE_reg[0] ,
    \RX_DATA_T_reg[9]_0 ,
    BTN_S2_reg_0,
    \RX_DATA_T_reg[4]_0 ,
    \RX_DATA_T_reg[8]_0 ,
    D,
    \RX_DATA_T_reg[4]_1 ,
    \FSM_sequential_TX_STATE_reg[1]_0 ,
    E,
    \RX_DATA_T_reg[1]_0 ,
    \RX_DATA_T_reg[3]_0 ,
    \RX_DATA_T_reg[2]_0 ,
    BTN_S2_reg_1,
    BTN_S2_reg_2,
    CLK_IBUF_BUFG,
    Q,
    GEN_PAR_ERR,
    \ADDR_reg_rep[3] ,
    \ADDR_reg_rep[3]_0 ,
    \ADDR_reg_rep[3]_1 ,
    GEN_FRT_ERR,
    \END_ADDR_reg[3] ,
    \END_ADDR_reg[3]_0 ,
    TX_RDY,
    \END_ADDR_reg[6] ,
    \END_ADDR_reg[6]_0 ,
    \TX_DATA_reg[6]_0 ,
    \TX_DATA_reg[5]_0 ,
    \SYNC_reg[0]_0 );
  output UART_TXD_OBUF;
  output RX_DATA_EN;
  output RX_RDY;
  output [0:0]BTN_S2_reg;
  output \FSM_sequential_STATE_reg[0] ;
  output [1:0]\RX_DATA_T_reg[9]_0 ;
  output BTN_S2_reg_0;
  output \RX_DATA_T_reg[4]_0 ;
  output \RX_DATA_T_reg[8]_0 ;
  output [3:0]D;
  output [3:0]\RX_DATA_T_reg[4]_1 ;
  output [0:0]\FSM_sequential_TX_STATE_reg[1]_0 ;
  output [0:0]E;
  output \RX_DATA_T_reg[1]_0 ;
  output \RX_DATA_T_reg[3]_0 ;
  output \RX_DATA_T_reg[2]_0 ;
  output BTN_S2_reg_1;
  output BTN_S2_reg_2;
  input CLK_IBUF_BUFG;
  input [0:0]Q;
  input GEN_PAR_ERR;
  input \ADDR_reg_rep[3] ;
  input \ADDR_reg_rep[3]_0 ;
  input \ADDR_reg_rep[3]_1 ;
  input GEN_FRT_ERR;
  input \END_ADDR_reg[3] ;
  input [2:0]\END_ADDR_reg[3]_0 ;
  input TX_RDY;
  input \END_ADDR_reg[6] ;
  input \END_ADDR_reg[6]_0 ;
  input [0:0]\TX_DATA_reg[6]_0 ;
  input [5:0]\TX_DATA_reg[5]_0 ;
  input [0:0]\SYNC_reg[0]_0 ;

  wire \ADDR_reg_rep[3] ;
  wire \ADDR_reg_rep[3]_0 ;
  wire \ADDR_reg_rep[3]_1 ;
  wire \ADDR_rep[0]_i_4_n_0 ;
  wire [0:0]BTN_S2_reg;
  wire BTN_S2_reg_0;
  wire BTN_S2_reg_1;
  wire BTN_S2_reg_2;
  wire CLK_IBUF_BUFG;
  wire [3:0]D;
  wire \DATA_REG[0]_i_2_n_0 ;
  wire \DATA_REG[1]_i_2_n_0 ;
  wire \DATA_REG[2]_i_2_n_0 ;
  wire \DATA_REG[3]_i_2_n_0 ;
  wire \DATA_REG[3]_i_3_n_0 ;
  wire [0:0]E;
  wire \END_ADDR[4]_i_2_n_0 ;
  wire \END_ADDR_reg[3] ;
  wire [2:0]\END_ADDR_reg[3]_0 ;
  wire \END_ADDR_reg[6] ;
  wire \END_ADDR_reg[6]_0 ;
  wire \FSM_sequential_RX_STATE[2]_i_2_n_0 ;
  wire \FSM_sequential_STATE[2]_i_4_n_0 ;
  wire \FSM_sequential_STATE_reg[0] ;
  wire [0:0]\FSM_sequential_TX_STATE_reg[1]_0 ;
  wire GEN_FRT_ERR;
  wire GEN_PAR_ERR;
  wire [0:0]Q;
  wire RXCT_R_reg_n_0;
  wire RXD_RG;
  wire [7:0]RX_DATA;
  wire [2:0]RX_DATA_CT;
  wire \RX_DATA_CT[0]_i_1_n_0 ;
  wire \RX_DATA_CT[1]_i_1_n_0 ;
  wire \RX_DATA_CT[2]_i_1_n_0 ;
  wire RX_DATA_EN;
  wire \RX_DATA_T[0]_i_1_n_0 ;
  wire \RX_DATA_T[1]_i_1_n_0 ;
  wire \RX_DATA_T[2]_i_1_n_0 ;
  wire \RX_DATA_T[3]_i_1_n_0 ;
  wire \RX_DATA_T[4]_i_1_n_0 ;
  wire \RX_DATA_T[5]_i_1_n_0 ;
  wire \RX_DATA_T[6]_i_1_n_0 ;
  wire \RX_DATA_T[7]_i_2_n_0 ;
  wire \RX_DATA_T[7]_i_3_n_0 ;
  wire \RX_DATA_T[8]_i_1_n_0 ;
  wire \RX_DATA_T[9]_i_1_n_0 ;
  wire \RX_DATA_T_reg[1]_0 ;
  wire \RX_DATA_T_reg[2]_0 ;
  wire \RX_DATA_T_reg[3]_0 ;
  wire \RX_DATA_T_reg[4]_0 ;
  wire [3:0]\RX_DATA_T_reg[4]_1 ;
  wire \RX_DATA_T_reg[8]_0 ;
  wire [1:0]\RX_DATA_T_reg[9]_0 ;
  wire RX_RDY;
  wire \RX_SAMP_CT[2]_i_1_n_0 ;
  wire \RX_SAMP_CT[3]_i_2_n_0 ;
  wire [3:0]RX_SAMP_CT_reg;
  wire [2:0]RX_STATE__0;
  wire [1:0]SYNC;
  wire [0:0]\SYNC_reg[0]_0 ;
  wire TXCT_R_reg_n_0;
  wire TXD_i_3_n_0;
  wire [5:0]TX_DATA;
  wire TX_DATA_1;
  wire [2:0]TX_DATA_CT;
  wire \TX_DATA_CT[0]_i_1_n_0 ;
  wire \TX_DATA_CT[1]_i_1_n_0 ;
  wire \TX_DATA_CT[2]_i_1_n_0 ;
  wire TX_DATA_CT_0;
  wire [5:0]\TX_DATA_reg[5]_0 ;
  wire [0:0]\TX_DATA_reg[6]_0 ;
  wire \TX_DATA_reg_n_0_[0] ;
  wire \TX_DATA_reg_n_0_[1] ;
  wire \TX_DATA_reg_n_0_[2] ;
  wire \TX_DATA_reg_n_0_[3] ;
  wire \TX_DATA_reg_n_0_[4] ;
  wire \TX_DATA_reg_n_0_[5] ;
  wire \TX_DATA_reg_n_0_[6] ;
  wire TX_RDY;
  wire \TX_SAMP_CT[2]_i_1_n_0 ;
  wire \TX_SAMP_CT[3]_i_2_n_0 ;
  wire [3:0]TX_SAMP_CT_reg;
  wire [2:0]TX_STATE__0;
  wire UART_TXD_OBUF;
  wire div1khz_n_0;
  wire div1khz_n_1;
  wire div1khz_n_10;
  wire div1khz_n_11;
  wire div1khz_n_12;
  wire div1khz_n_13;
  wire div1khz_n_14;
  wire div1khz_n_15;
  wire div1khz_n_16;
  wire div1khz_n_17;
  wire div1khz_n_18;
  wire div1khz_n_3;
  wire div1khz_n_4;
  wire div1khz_n_6;
  wire div1khz_n_7;
  wire div1khz_n_8;
  wire div1khz_n_9;
  wire [1:0]p_0_in__1;
  wire [1:0]p_0_in__2;

  LUT6 #(
    .INIT(64'hFFFFFD00FFFFFFFF)) 
    \ADDR_rep[0]_i_2 
       (.I0(RX_DATA[4]),
        .I1(RX_DATA[1]),
        .I2(RX_DATA[2]),
        .I3(RX_DATA[3]),
        .I4(RX_DATA[7]),
        .I5(\ADDR_rep[0]_i_4_n_0 ),
        .O(\RX_DATA_T_reg[4]_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \ADDR_rep[0]_i_3 
       (.I0(\RX_DATA_T_reg[9]_0 [0]),
        .I1(GEN_PAR_ERR),
        .I2(\RX_DATA_T_reg[9]_0 [1]),
        .I3(GEN_FRT_ERR),
        .O(\RX_DATA_T_reg[8]_0 ));
  LUT6 #(
    .INIT(64'h007E007EFF000000)) 
    \ADDR_rep[0]_i_4 
       (.I0(RX_DATA[0]),
        .I1(RX_DATA[1]),
        .I2(RX_DATA[2]),
        .I3(RX_DATA[4]),
        .I4(RX_DATA[5]),
        .I5(RX_DATA[6]),
        .O(\ADDR_rep[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h69960000)) 
    \ADDR_rep[2]_i_4 
       (.I0(GEN_FRT_ERR),
        .I1(\RX_DATA_T_reg[9]_0 [1]),
        .I2(GEN_PAR_ERR),
        .I3(\RX_DATA_T_reg[9]_0 [0]),
        .I4(\END_ADDR_reg[3]_0 [1]),
        .O(BTN_S2_reg_1));
  LUT6 #(
    .INIT(64'h00000000AAFF28FF)) 
    \ADDR_rep[3]_i_1 
       (.I0(\FSM_sequential_STATE_reg[0] ),
        .I1(GEN_PAR_ERR),
        .I2(\RX_DATA_T_reg[9]_0 [0]),
        .I3(\ADDR_reg_rep[3] ),
        .I4(\ADDR_reg_rep[3]_0 ),
        .I5(\ADDR_reg_rep[3]_1 ),
        .O(BTN_S2_reg));
  LUT6 #(
    .INIT(64'hF9F0F0F0F0F0F9F0)) 
    \ADDR_rep[3]_i_4 
       (.I0(GEN_PAR_ERR),
        .I1(\RX_DATA_T_reg[9]_0 [0]),
        .I2(\END_ADDR_reg[3]_0 [2]),
        .I3(\END_ADDR_reg[3]_0 [1]),
        .I4(\RX_DATA_T_reg[9]_0 [1]),
        .I5(GEN_FRT_ERR),
        .O(BTN_S2_reg_2));
  LUT5 #(
    .INIT(32'h00001115)) 
    \DATA_REG[0]_i_1 
       (.I0(RX_DATA[7]),
        .I1(RX_DATA[3]),
        .I2(RX_DATA[2]),
        .I3(RX_DATA[1]),
        .I4(\DATA_REG[0]_i_2_n_0 ),
        .O(\RX_DATA_T_reg[4]_1 [0]));
  LUT6 #(
    .INIT(64'hFF0FFFFFF1FFF1FF)) 
    \DATA_REG[0]_i_2 
       (.I0(RX_DATA[1]),
        .I1(RX_DATA[2]),
        .I2(RX_DATA[0]),
        .I3(RX_DATA[6]),
        .I4(RX_DATA[5]),
        .I5(RX_DATA[4]),
        .O(\DATA_REG[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0202800008088000)) 
    \DATA_REG[1]_i_1 
       (.I0(\DATA_REG[1]_i_2_n_0 ),
        .I1(RX_DATA[1]),
        .I2(RX_DATA[4]),
        .I3(RX_DATA[5]),
        .I4(RX_DATA[6]),
        .I5(RX_DATA[0]),
        .O(\RX_DATA_T_reg[4]_1 [1]));
  LUT3 #(
    .INIT(8'h01)) 
    \DATA_REG[1]_i_2 
       (.I0(RX_DATA[3]),
        .I1(RX_DATA[7]),
        .I2(\END_ADDR_reg[3]_0 [2]),
        .O(\DATA_REG[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h02020200)) 
    \DATA_REG[2]_i_1 
       (.I0(\DATA_REG[2]_i_2_n_0 ),
        .I1(RX_DATA[3]),
        .I2(RX_DATA[7]),
        .I3(RX_DATA[2]),
        .I4(RX_DATA[0]),
        .O(\RX_DATA_T_reg[4]_1 [2]));
  LUT6 #(
    .INIT(64'h0A3000F00AF00030)) 
    \DATA_REG[2]_i_2 
       (.I0(RX_DATA[5]),
        .I1(RX_DATA[0]),
        .I2(RX_DATA[6]),
        .I3(RX_DATA[4]),
        .I4(RX_DATA[2]),
        .I5(RX_DATA[1]),
        .O(\DATA_REG[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000C00088888888)) 
    \DATA_REG[3]_i_1 
       (.I0(\DATA_REG[3]_i_2_n_0 ),
        .I1(\DATA_REG[3]_i_3_n_0 ),
        .I2(RX_DATA[4]),
        .I3(RX_DATA[5]),
        .I4(RX_DATA[6]),
        .I5(RX_DATA[3]),
        .O(\RX_DATA_T_reg[4]_1 [3]));
  LUT5 #(
    .INIT(32'h10303020)) 
    \DATA_REG[3]_i_2 
       (.I0(RX_DATA[2]),
        .I1(RX_DATA[4]),
        .I2(RX_DATA[6]),
        .I3(RX_DATA[1]),
        .I4(RX_DATA[0]),
        .O(\DATA_REG[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0000001F)) 
    \DATA_REG[3]_i_3 
       (.I0(RX_DATA[1]),
        .I1(RX_DATA[2]),
        .I2(RX_DATA[3]),
        .I3(RX_DATA[7]),
        .I4(\END_ADDR_reg[3]_0 [2]),
        .O(\DATA_REG[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF6F6FFF)) 
    \END_ADDR[1]_i_1 
       (.I0(GEN_PAR_ERR),
        .I1(\RX_DATA_T_reg[9]_0 [0]),
        .I2(\END_ADDR_reg[3] ),
        .I3(\RX_DATA_T_reg[9]_0 [1]),
        .I4(GEN_FRT_ERR),
        .I5(\END_ADDR_reg[3]_0 [2]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0000000060000060)) 
    \END_ADDR[3]_i_1 
       (.I0(GEN_FRT_ERR),
        .I1(\RX_DATA_T_reg[9]_0 [1]),
        .I2(\END_ADDR_reg[3] ),
        .I3(GEN_PAR_ERR),
        .I4(\RX_DATA_T_reg[9]_0 [0]),
        .I5(\END_ADDR_reg[3]_0 [2]),
        .O(D[1]));
  LUT5 #(
    .INIT(32'h0000D00D)) 
    \END_ADDR[4]_i_1 
       (.I0(\END_ADDR[4]_i_2_n_0 ),
        .I1(\END_ADDR_reg[3]_0 [1]),
        .I2(GEN_PAR_ERR),
        .I3(\RX_DATA_T_reg[9]_0 [0]),
        .I4(\END_ADDR_reg[3]_0 [2]),
        .O(D[2]));
  LUT4 #(
    .INIT(16'h00EB)) 
    \END_ADDR[4]_i_2 
       (.I0(\END_ADDR_reg[3]_0 [0]),
        .I1(GEN_FRT_ERR),
        .I2(\RX_DATA_T_reg[9]_0 [1]),
        .I3(\RX_DATA_T_reg[4]_0 ),
        .O(\END_ADDR[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1555004000000000)) 
    \END_ADDR[6]_i_1 
       (.I0(\RX_DATA_T_reg[1]_0 ),
        .I1(\END_ADDR_reg[3]_0 [1]),
        .I2(\END_ADDR_reg[3]_0 [0]),
        .I3(\RX_DATA_T_reg[3]_0 ),
        .I4(RX_DATA_EN),
        .I5(\END_ADDR_reg[6] ),
        .O(E));
  LUT6 #(
    .INIT(64'h0000006000600000)) 
    \END_ADDR[6]_i_2 
       (.I0(GEN_FRT_ERR),
        .I1(\RX_DATA_T_reg[9]_0 [1]),
        .I2(\END_ADDR_reg[3] ),
        .I3(\END_ADDR_reg[3]_0 [2]),
        .I4(GEN_PAR_ERR),
        .I5(\RX_DATA_T_reg[9]_0 [0]),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h00080000FFFFFFFF)) 
    \END_ADDR[6]_i_3 
       (.I0(RX_DATA[3]),
        .I1(RX_DATA[1]),
        .I2(RX_DATA[0]),
        .I3(RX_DATA[2]),
        .I4(\FSM_sequential_STATE[2]_i_4_n_0 ),
        .I5(RX_DATA_EN),
        .O(\RX_DATA_T_reg[3]_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000007F00FF)) 
    \FSM_sequential_RX_STATE[2]_i_2 
       (.I0(RX_DATA_CT[2]),
        .I1(RX_DATA_CT[0]),
        .I2(RX_DATA_CT[1]),
        .I3(RX_STATE__0[0]),
        .I4(RX_STATE__0[1]),
        .I5(RX_STATE__0[2]),
        .O(\FSM_sequential_RX_STATE[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "RSTRB:001,RPARB:011,RSTB1:100,RSTB2:101,RDT:010,WEND:110,IDLE:000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_RX_STATE_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_13),
        .Q(RX_STATE__0[0]));
  (* FSM_ENCODED_STATES = "RSTRB:001,RPARB:011,RSTB1:100,RSTB2:101,RDT:010,WEND:110,IDLE:000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_RX_STATE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_14),
        .Q(RX_STATE__0[1]));
  (* FSM_ENCODED_STATES = "RSTRB:001,RPARB:011,RSTB1:100,RSTB2:101,RDT:010,WEND:110,IDLE:000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_RX_STATE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_15),
        .Q(RX_STATE__0[2]));
  LUT5 #(
    .INIT(32'h41000041)) 
    \FSM_sequential_STATE[0]_i_5 
       (.I0(\RX_DATA_T_reg[4]_0 ),
        .I1(GEN_FRT_ERR),
        .I2(\RX_DATA_T_reg[9]_0 [1]),
        .I3(GEN_PAR_ERR),
        .I4(\RX_DATA_T_reg[9]_0 [0]),
        .O(BTN_S2_reg_0));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \FSM_sequential_STATE[2]_i_2 
       (.I0(\FSM_sequential_STATE[2]_i_4_n_0 ),
        .I1(\END_ADDR_reg[6]_0 ),
        .I2(RX_DATA[1]),
        .I3(RX_DATA[0]),
        .I4(RX_DATA[3]),
        .I5(RX_DATA[2]),
        .O(\RX_DATA_T_reg[1]_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_sequential_STATE[2]_i_4 
       (.I0(RX_DATA[7]),
        .I1(RX_DATA[4]),
        .I2(RX_DATA[5]),
        .I3(RX_DATA[6]),
        .O(\FSM_sequential_STATE[2]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \FSM_sequential_STATE[3]_i_7 
       (.I0(\RX_DATA_T_reg[4]_0 ),
        .I1(\END_ADDR_reg[3]_0 [0]),
        .O(\FSM_sequential_STATE_reg[0] ));
  (* FSM_ENCODED_STATES = "IDLE:000,TDT:011,TPARB:100,TSTB1:101,TSTB2:110,WCE:001,TSTRB:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_TX_STATE_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_18),
        .Q(TX_STATE__0[0]));
  (* FSM_ENCODED_STATES = "IDLE:000,TDT:011,TPARB:100,TSTB1:101,TSTB2:110,WCE:001,TSTRB:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_TX_STATE_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_17),
        .Q(\FSM_sequential_TX_STATE_reg[1]_0 ));
  (* FSM_ENCODED_STATES = "IDLE:000,TDT:011,TPARB:100,TSTB1:101,TSTB2:110,WCE:001,TSTRB:010" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_TX_STATE_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_16),
        .Q(TX_STATE__0[2]));
  LUT5 #(
    .INIT(32'h02000000)) 
    \RES_REG[0]_i_3 
       (.I0(\FSM_sequential_STATE[2]_i_4_n_0 ),
        .I1(RX_DATA[2]),
        .I2(RX_DATA[0]),
        .I3(RX_DATA[1]),
        .I4(RX_DATA[3]),
        .O(\RX_DATA_T_reg[2]_0 ));
  FDPE #(
    .INIT(1'b1)) 
    RXCT_R_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(div1khz_n_10),
        .PRE(Q),
        .Q(RXCT_R_reg_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \RX_DATA_CT[0]_i_1 
       (.I0(RX_DATA_CT[0]),
        .O(\RX_DATA_CT[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \RX_DATA_CT[1]_i_1 
       (.I0(RX_DATA_CT[1]),
        .I1(RX_DATA_CT[0]),
        .O(\RX_DATA_CT[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \RX_DATA_CT[2]_i_1 
       (.I0(RX_DATA_CT[2]),
        .I1(RX_DATA_CT[0]),
        .I2(RX_DATA_CT[1]),
        .O(\RX_DATA_CT[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_CT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_CT[0]_i_1_n_0 ),
        .Q(RX_DATA_CT[0]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_CT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_CT[1]_i_1_n_0 ),
        .Q(RX_DATA_CT[1]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_CT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_CT[2]_i_1_n_0 ),
        .Q(RX_DATA_CT[2]));
  FDCE #(
    .INIT(1'b0)) 
    RX_DATA_EN_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(div1khz_n_11),
        .Q(RX_DATA_EN));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RX_DATA_T[0]_i_1 
       (.I0(RX_DATA[1]),
        .I1(RX_STATE__0[2]),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[0]),
        .O(\RX_DATA_T[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RX_DATA_T[1]_i_1 
       (.I0(RX_DATA[2]),
        .I1(RX_STATE__0[2]),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[0]),
        .O(\RX_DATA_T[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \RX_DATA_T[2]_i_1 
       (.I0(RX_STATE__0[2]),
        .I1(RX_STATE__0[1]),
        .I2(RX_STATE__0[0]),
        .I3(RX_DATA[3]),
        .O(\RX_DATA_T[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RX_DATA_T[3]_i_1 
       (.I0(RX_DATA[4]),
        .I1(RX_STATE__0[2]),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[0]),
        .O(\RX_DATA_T[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RX_DATA_T[4]_i_1 
       (.I0(RX_DATA[5]),
        .I1(RX_STATE__0[2]),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[0]),
        .O(\RX_DATA_T[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RX_DATA_T[5]_i_1 
       (.I0(RX_DATA[6]),
        .I1(RX_STATE__0[2]),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[0]),
        .O(\RX_DATA_T[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \RX_DATA_T[6]_i_1 
       (.I0(RX_DATA[7]),
        .I1(RX_STATE__0[2]),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[0]),
        .O(\RX_DATA_T[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0040)) 
    \RX_DATA_T[7]_i_2 
       (.I0(RX_STATE__0[0]),
        .I1(RXD_RG),
        .I2(RX_STATE__0[1]),
        .I3(RX_STATE__0[2]),
        .O(\RX_DATA_T[7]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \RX_DATA_T[7]_i_3 
       (.I0(RX_STATE__0[0]),
        .I1(RX_STATE__0[1]),
        .I2(RX_STATE__0[2]),
        .O(\RX_DATA_T[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \RX_DATA_T[8]_i_1 
       (.I0(RXD_RG),
        .I1(div1khz_n_8),
        .I2(RX_STATE__0[2]),
        .I3(RX_STATE__0[1]),
        .I4(RX_STATE__0[0]),
        .I5(\RX_DATA_T_reg[9]_0 [0]),
        .O(\RX_DATA_T[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFBEFFFE04040000)) 
    \RX_DATA_T[9]_i_1 
       (.I0(RX_STATE__0[1]),
        .I1(RX_STATE__0[2]),
        .I2(RXD_RG),
        .I3(RX_STATE__0[0]),
        .I4(div1khz_n_8),
        .I5(\RX_DATA_T_reg[9]_0 [1]),
        .O(\RX_DATA_T[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[0]_i_1_n_0 ),
        .Q(RX_DATA[0]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[1]_i_1_n_0 ),
        .Q(RX_DATA[1]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[2]_i_1_n_0 ),
        .Q(RX_DATA[2]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[3]_i_1_n_0 ),
        .Q(RX_DATA[3]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[4]_i_1_n_0 ),
        .Q(RX_DATA[4]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[5]_i_1_n_0 ),
        .Q(RX_DATA[5]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[6]_i_1_n_0 ),
        .Q(RX_DATA[6]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[7] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_7),
        .CLR(Q),
        .D(\RX_DATA_T[7]_i_2_n_0 ),
        .Q(RX_DATA[7]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[8] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(\RX_DATA_T[8]_i_1_n_0 ),
        .Q(\RX_DATA_T_reg[9]_0 [0]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_DATA_T_reg[9] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(\RX_DATA_T[9]_i_1_n_0 ),
        .Q(\RX_DATA_T_reg[9]_0 [1]));
  (* \PinAttr:I1:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \RX_SAMP_CT[0]_i_1 
       (.I0(RXCT_R_reg_n_0),
        .I1(RX_SAMP_CT_reg[0]),
        .O(p_0_in__2[0]));
  (* \PinAttr:I0:HOLD_DETOUR  = "192" *) 
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \RX_SAMP_CT[1]_i_1 
       (.I0(RX_SAMP_CT_reg[0]),
        .I1(RX_SAMP_CT_reg[1]),
        .I2(RXCT_R_reg_n_0),
        .O(p_0_in__2[1]));
  (* \PinAttr:I2:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \RX_SAMP_CT[2]_i_1 
       (.I0(RXCT_R_reg_n_0),
        .I1(RX_SAMP_CT_reg[1]),
        .I2(RX_SAMP_CT_reg[0]),
        .I3(RX_SAMP_CT_reg[2]),
        .O(\RX_SAMP_CT[2]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "193" *) 
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \RX_SAMP_CT[3]_i_2 
       (.I0(RXCT_R_reg_n_0),
        .I1(RX_SAMP_CT_reg[0]),
        .I2(RX_SAMP_CT_reg[1]),
        .I3(RX_SAMP_CT_reg[2]),
        .I4(RX_SAMP_CT_reg[3]),
        .O(\RX_SAMP_CT[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \RX_SAMP_CT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_1),
        .CLR(Q),
        .D(p_0_in__2[0]),
        .Q(RX_SAMP_CT_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_SAMP_CT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_1),
        .CLR(Q),
        .D(p_0_in__2[1]),
        .Q(RX_SAMP_CT_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_SAMP_CT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_1),
        .CLR(Q),
        .D(\RX_SAMP_CT[2]_i_1_n_0 ),
        .Q(RX_SAMP_CT_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \RX_SAMP_CT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_1),
        .CLR(Q),
        .D(\RX_SAMP_CT[3]_i_2_n_0 ),
        .Q(RX_SAMP_CT_reg[3]));
  FDPE #(
    .INIT(1'b1)) 
    \SYNC_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\SYNC_reg[0]_0 ),
        .PRE(Q),
        .Q(SYNC[0]));
  FDPE #(
    .INIT(1'b1)) 
    \SYNC_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SYNC[0]),
        .PRE(Q),
        .Q(SYNC[1]));
  FDPE #(
    .INIT(1'b1)) 
    \SYNC_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(SYNC[1]),
        .PRE(Q),
        .Q(RXD_RG));
  FDPE #(
    .INIT(1'b1)) 
    TXCT_R_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(div1khz_n_9),
        .PRE(Q),
        .Q(TXCT_R_reg_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    TXD_i_3
       (.I0(TX_DATA_CT[2]),
        .I1(TX_DATA_CT[0]),
        .I2(TX_DATA_CT[1]),
        .O(TXD_i_3_n_0));
  FDPE #(
    .INIT(1'b1)) 
    TXD_reg
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_6),
        .D(div1khz_n_4),
        .PRE(Q),
        .Q(UART_TXD_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \TX_DATA[0]_i_1 
       (.I0(\TX_DATA_reg[5]_0 [0]),
        .I1(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I2(\TX_DATA_reg_n_0_[1] ),
        .O(TX_DATA[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \TX_DATA[1]_i_1 
       (.I0(\TX_DATA_reg[5]_0 [1]),
        .I1(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I2(\TX_DATA_reg_n_0_[2] ),
        .O(TX_DATA[1]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \TX_DATA[2]_i_1 
       (.I0(\TX_DATA_reg[5]_0 [2]),
        .I1(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I2(\TX_DATA_reg_n_0_[3] ),
        .O(TX_DATA[2]));
  (* \PinAttr:I2:HOLD_DETOUR  = "195" *) 
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \TX_DATA[3]_i_1 
       (.I0(\TX_DATA_reg[5]_0 [3]),
        .I1(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I2(\TX_DATA_reg_n_0_[4] ),
        .O(TX_DATA[3]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \TX_DATA[4]_i_1 
       (.I0(\TX_DATA_reg[5]_0 [4]),
        .I1(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I2(\TX_DATA_reg_n_0_[5] ),
        .O(TX_DATA[4]));
  (* \PinAttr:I2:HOLD_DETOUR  = "195" *) 
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \TX_DATA[5]_i_1 
       (.I0(\TX_DATA_reg[5]_0 [5]),
        .I1(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I2(\TX_DATA_reg_n_0_[6] ),
        .O(TX_DATA[5]));
  LUT5 #(
    .INIT(32'hFFBF0040)) 
    \TX_DATA_CT[0]_i_1 
       (.I0(div1khz_n_3),
        .I1(TX_STATE__0[0]),
        .I2(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I3(TX_STATE__0[2]),
        .I4(TX_DATA_CT[0]),
        .O(\TX_DATA_CT[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFDFFF00002000)) 
    \TX_DATA_CT[1]_i_1 
       (.I0(TX_DATA_CT[0]),
        .I1(TX_STATE__0[2]),
        .I2(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .I3(TX_STATE__0[0]),
        .I4(div1khz_n_3),
        .I5(TX_DATA_CT[1]),
        .O(\TX_DATA_CT[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \TX_DATA_CT[2]_i_1 
       (.I0(TX_DATA_CT[0]),
        .I1(TX_DATA_CT[1]),
        .I2(TX_DATA_CT_0),
        .I3(TX_DATA_CT[2]),
        .O(\TX_DATA_CT[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_CT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(\TX_DATA_CT[0]_i_1_n_0 ),
        .Q(TX_DATA_CT[0]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_CT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(\TX_DATA_CT[1]_i_1_n_0 ),
        .Q(TX_DATA_CT[1]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_CT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(\TX_DATA_CT[2]_i_1_n_0 ),
        .Q(TX_DATA_CT[2]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(TX_DATA[0]),
        .Q(\TX_DATA_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(TX_DATA[1]),
        .Q(\TX_DATA_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(TX_DATA[2]),
        .Q(\TX_DATA_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(TX_DATA[3]),
        .Q(\TX_DATA_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(TX_DATA[4]),
        .Q(\TX_DATA_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[5] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(TX_DATA[5]),
        .Q(\TX_DATA_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_DATA_reg[6] 
       (.C(CLK_IBUF_BUFG),
        .CE(TX_DATA_1),
        .CLR(Q),
        .D(\TX_DATA_reg[6]_0 ),
        .Q(\TX_DATA_reg_n_0_[6] ));
  FDPE #(
    .INIT(1'b1)) 
    TX_RDY_R_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(div1khz_n_12),
        .PRE(Q),
        .Q(RX_RDY));
  (* \PinAttr:I1:HOLD_DETOUR  = "191" *) 
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \TX_SAMP_CT[0]_i_1 
       (.I0(TXCT_R_reg_n_0),
        .I1(TX_SAMP_CT_reg[0]),
        .O(p_0_in__1[0]));
  (* \PinAttr:I0:HOLD_DETOUR  = "191" *) 
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \TX_SAMP_CT[1]_i_1 
       (.I0(TX_SAMP_CT_reg[0]),
        .I1(TX_SAMP_CT_reg[1]),
        .I2(TXCT_R_reg_n_0),
        .O(p_0_in__1[1]));
  (* \PinAttr:I2:HOLD_DETOUR  = "195" *) 
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \TX_SAMP_CT[2]_i_1 
       (.I0(TXCT_R_reg_n_0),
        .I1(TX_SAMP_CT_reg[1]),
        .I2(TX_SAMP_CT_reg[0]),
        .I3(TX_SAMP_CT_reg[2]),
        .O(\TX_SAMP_CT[2]_i_1_n_0 ));
  (* \PinAttr:I1:HOLD_DETOUR  = "195" *) 
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'h15554000)) 
    \TX_SAMP_CT[3]_i_2 
       (.I0(TXCT_R_reg_n_0),
        .I1(TX_SAMP_CT_reg[0]),
        .I2(TX_SAMP_CT_reg[1]),
        .I3(TX_SAMP_CT_reg[2]),
        .I4(TX_SAMP_CT_reg[3]),
        .O(\TX_SAMP_CT[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \TX_SAMP_CT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_0),
        .CLR(Q),
        .D(p_0_in__1[0]),
        .Q(TX_SAMP_CT_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_SAMP_CT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_0),
        .CLR(Q),
        .D(p_0_in__1[1]),
        .Q(TX_SAMP_CT_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_SAMP_CT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_0),
        .CLR(Q),
        .D(\TX_SAMP_CT[2]_i_1_n_0 ),
        .Q(TX_SAMP_CT_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \TX_SAMP_CT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(div1khz_n_0),
        .CLR(Q),
        .D(\TX_SAMP_CT[3]_i_2_n_0 ),
        .Q(TX_SAMP_CT_reg[3]));
  FR_DIVIDER__parameterized0 div1khz
       (.CEO_reg_0(div1khz_n_1),
        .CEO_reg_1(div1khz_n_8),
        .CEO_reg_2(div1khz_n_17),
        .CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .E(div1khz_n_0),
        .\FSM_sequential_RX_STATE_reg[0] (div1khz_n_11),
        .\FSM_sequential_RX_STATE_reg[0]_0 (div1khz_n_13),
        .\FSM_sequential_RX_STATE_reg[0]_1 (div1khz_n_14),
        .\FSM_sequential_RX_STATE_reg[0]_2 (div1khz_n_15),
        .\FSM_sequential_RX_STATE_reg[0]_3 (\FSM_sequential_RX_STATE[2]_i_2_n_0 ),
        .\FSM_sequential_RX_STATE_reg[2] (div1khz_n_10),
        .\FSM_sequential_TX_STATE_reg[0] (TX_DATA_1),
        .\FSM_sequential_TX_STATE_reg[1] (div1khz_n_6),
        .\FSM_sequential_TX_STATE_reg[1]_0 (div1khz_n_16),
        .\FSM_sequential_TX_STATE_reg[2] (div1khz_n_9),
        .\FSM_sequential_TX_STATE_reg[2]_0 (div1khz_n_18),
        .Q(Q),
        .RXCT_R_reg(RXCT_R_reg_n_0),
        .RXCT_R_reg_0(RXD_RG),
        .RX_DATA_EN_reg(RX_DATA_EN),
        .\RX_DATA_T_reg[0] (RX_SAMP_CT_reg),
        .\RX_DATA_T_reg[0]_0 (\RX_DATA_T[7]_i_3_n_0 ),
        .RX_RDY(RX_RDY),
        .\RX_SAMP_CT_reg[3] (div1khz_n_7),
        .RX_STATE__0(RX_STATE__0),
        .TXCT_R_reg(TXCT_R_reg_n_0),
        .TXCT_R_reg_0(TX_SAMP_CT_reg),
        .TXD_reg(\FSM_sequential_TX_STATE_reg[1]_0 ),
        .TXD_reg_0(\TX_DATA_reg_n_0_[0] ),
        .TXD_reg_1(TXD_i_3_n_0),
        .TX_DATA_CT(TX_DATA_CT),
        .TX_DATA_CT_0(TX_DATA_CT_0),
        .\TX_DATA_reg[0] (div1khz_n_4),
        .TX_RDY(TX_RDY),
        .TX_RDY_R_reg(div1khz_n_12),
        .\TX_SAMP_CT_reg[3] (div1khz_n_3),
        .TX_STATE__0({TX_STATE__0[2],TX_STATE__0[0]}));
endmodule

module M_BTN_FILTER_V10
   (GEN_FRT_ERR,
    BTN_S2_reg_0,
    BTN_0_IBUF,
    CLK_IBUF_BUFG,
    Q,
    RX_DATA,
    CE_1kHz);
  output GEN_FRT_ERR;
  output BTN_S2_reg_0;
  input BTN_0_IBUF;
  input CLK_IBUF_BUFG;
  input [0:0]Q;
  input [0:0]RX_DATA;
  input CE_1kHz;

  wire BTN_0_IBUF;
  wire BTN_D;
  wire BTN_S1;
  wire BTN_S2_i_1_n_0;
  wire BTN_S2_i_2_n_0;
  wire BTN_S2_reg_0;
  wire CE_1kHz;
  wire CLK_IBUF_BUFG;
  wire \FLTR_CNT[3]_i_1_n_0 ;
  wire [3:0]FLTR_CNT_reg;
  wire GEN_FRT_ERR;
  wire [0:0]Q;
  wire [0:0]RX_DATA;
  wire [3:0]p_0_in;

  LUT2 #(
    .INIT(4'h6)) 
    \ADDR_rep[5]_i_2 
       (.I0(GEN_FRT_ERR),
        .I1(RX_DATA),
        .O(BTN_S2_reg_0));
  FDCE #(
    .INIT(1'b0)) 
    BTN_D_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(BTN_0_IBUF),
        .Q(BTN_D));
  FDCE #(
    .INIT(1'b0)) 
    BTN_S1_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(BTN_D),
        .Q(BTN_S1));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    BTN_S2_i_1
       (.I0(BTN_S1),
        .I1(CE_1kHz),
        .I2(BTN_S2_i_2_n_0),
        .I3(FLTR_CNT_reg[3]),
        .I4(GEN_FRT_ERR),
        .O(BTN_S2_i_1_n_0));
  (* \PinAttr:I0:HOLD_DETOUR  = "179" *) 
  LUT3 #(
    .INIT(8'h80)) 
    BTN_S2_i_2
       (.I0(FLTR_CNT_reg[0]),
        .I1(FLTR_CNT_reg[1]),
        .I2(FLTR_CNT_reg[2]),
        .O(BTN_S2_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    BTN_S2_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(BTN_S2_i_1_n_0),
        .Q(GEN_FRT_ERR));
  (* \PinAttr:I2:HOLD_DETOUR  = "179" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \FLTR_CNT[0]_i_1 
       (.I0(BTN_S1),
        .I1(GEN_FRT_ERR),
        .I2(FLTR_CNT_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0660)) 
    \FLTR_CNT[1]_i_1 
       (.I0(BTN_S1),
        .I1(GEN_FRT_ERR),
        .I2(FLTR_CNT_reg[0]),
        .I3(FLTR_CNT_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h06666000)) 
    \FLTR_CNT[2]_i_1 
       (.I0(BTN_S1),
        .I1(GEN_FRT_ERR),
        .I2(FLTR_CNT_reg[1]),
        .I3(FLTR_CNT_reg[0]),
        .I4(FLTR_CNT_reg[2]),
        .O(p_0_in[2]));
  LUT3 #(
    .INIT(8'hEB)) 
    \FLTR_CNT[3]_i_1 
       (.I0(CE_1kHz),
        .I1(BTN_S1),
        .I2(GEN_FRT_ERR),
        .O(\FLTR_CNT[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0666666660000000)) 
    \FLTR_CNT[3]_i_2 
       (.I0(BTN_S1),
        .I1(GEN_FRT_ERR),
        .I2(FLTR_CNT_reg[0]),
        .I3(FLTR_CNT_reg[1]),
        .I4(FLTR_CNT_reg[2]),
        .I5(FLTR_CNT_reg[3]),
        .O(p_0_in[3]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1_n_0 ),
        .CLR(Q),
        .D(p_0_in[0]),
        .Q(FLTR_CNT_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1_n_0 ),
        .CLR(Q),
        .D(p_0_in[1]),
        .Q(FLTR_CNT_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1_n_0 ),
        .CLR(Q),
        .D(p_0_in[2]),
        .Q(FLTR_CNT_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1_n_0 ),
        .CLR(Q),
        .D(p_0_in[3]),
        .Q(FLTR_CNT_reg[3]));
endmodule

(* ORIG_REF_NAME = "M_BTN_FILTER_V10" *) 
module M_BTN_FILTER_V10_0
   (GEN_PAR_ERR,
    BTN_S2_reg_0,
    BTN_1_IBUF,
    CLK_IBUF_BUFG,
    Q,
    RX_DATA,
    CE_1kHz);
  output GEN_PAR_ERR;
  output BTN_S2_reg_0;
  input BTN_1_IBUF;
  input CLK_IBUF_BUFG;
  input [0:0]Q;
  input [0:0]RX_DATA;
  input CE_1kHz;

  wire BTN_1_IBUF;
  wire BTN_D_reg_n_0;
  wire BTN_S1;
  wire BTN_S2_i_1__0_n_0;
  wire BTN_S2_i_2__0_n_0;
  wire BTN_S2_reg_0;
  wire CE_1kHz;
  wire CLK_IBUF_BUFG;
  wire \FLTR_CNT[3]_i_1__0_n_0 ;
  wire [3:0]FLTR_CNT_reg;
  wire GEN_PAR_ERR;
  wire [0:0]Q;
  wire [0:0]RX_DATA;
  wire [3:0]p_0_in__0;

  LUT2 #(
    .INIT(4'h6)) 
    \ADDR_rep[4]_i_3 
       (.I0(GEN_PAR_ERR),
        .I1(RX_DATA),
        .O(BTN_S2_reg_0));
  FDCE #(
    .INIT(1'b0)) 
    BTN_D_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(BTN_1_IBUF),
        .Q(BTN_D_reg_n_0));
  FDCE #(
    .INIT(1'b0)) 
    BTN_S1_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(BTN_D_reg_n_0),
        .Q(BTN_S1));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    BTN_S2_i_1__0
       (.I0(BTN_S1),
        .I1(CE_1kHz),
        .I2(BTN_S2_i_2__0_n_0),
        .I3(FLTR_CNT_reg[3]),
        .I4(GEN_PAR_ERR),
        .O(BTN_S2_i_1__0_n_0));
  LUT3 #(
    .INIT(8'h80)) 
    BTN_S2_i_2__0
       (.I0(FLTR_CNT_reg[0]),
        .I1(FLTR_CNT_reg[1]),
        .I2(FLTR_CNT_reg[2]),
        .O(BTN_S2_i_2__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    BTN_S2_reg
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q),
        .D(BTN_S2_i_1__0_n_0),
        .Q(GEN_PAR_ERR));
  LUT3 #(
    .INIT(8'h06)) 
    \FLTR_CNT[0]_i_1__0 
       (.I0(BTN_S1),
        .I1(GEN_PAR_ERR),
        .I2(FLTR_CNT_reg[0]),
        .O(p_0_in__0[0]));
  (* \PinAttr:I2:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0660)) 
    \FLTR_CNT[1]_i_1__0 
       (.I0(BTN_S1),
        .I1(GEN_PAR_ERR),
        .I2(FLTR_CNT_reg[0]),
        .I3(FLTR_CNT_reg[1]),
        .O(p_0_in__0[1]));
  (* \PinAttr:I3:HOLD_DETOUR  = "194" *) 
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h06666000)) 
    \FLTR_CNT[2]_i_1__0 
       (.I0(BTN_S1),
        .I1(GEN_PAR_ERR),
        .I2(FLTR_CNT_reg[1]),
        .I3(FLTR_CNT_reg[0]),
        .I4(FLTR_CNT_reg[2]),
        .O(p_0_in__0[2]));
  LUT3 #(
    .INIT(8'hEB)) 
    \FLTR_CNT[3]_i_1__0 
       (.I0(CE_1kHz),
        .I1(BTN_S1),
        .I2(GEN_PAR_ERR),
        .O(\FLTR_CNT[3]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0666666660000000)) 
    \FLTR_CNT[3]_i_2__0 
       (.I0(BTN_S1),
        .I1(GEN_PAR_ERR),
        .I2(FLTR_CNT_reg[0]),
        .I3(FLTR_CNT_reg[1]),
        .I4(FLTR_CNT_reg[2]),
        .I5(FLTR_CNT_reg[3]),
        .O(p_0_in__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1__0_n_0 ),
        .CLR(Q),
        .D(p_0_in__0[0]),
        .Q(FLTR_CNT_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1__0_n_0 ),
        .CLR(Q),
        .D(p_0_in__0[1]),
        .Q(FLTR_CNT_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1__0_n_0 ),
        .CLR(Q),
        .D(p_0_in__0[2]),
        .Q(FLTR_CNT_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \FLTR_CNT_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(\FLTR_CNT[3]_i_1__0_n_0 ),
        .CLR(Q),
        .D(p_0_in__0[3]),
        .Q(FLTR_CNT_reg[3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
