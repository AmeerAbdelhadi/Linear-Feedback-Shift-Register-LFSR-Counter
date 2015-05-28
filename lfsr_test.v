///////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012, Ameer M. Abdelhadi; ameer@ece.ubc.ca. All rights reserved. //
//                                                                                //
// Redistribution  and  use  in  source   and  binary  forms,   with  or  without //
// modification,  are permitted  provided that  the following conditions are met: //
//   * Redistributions   of  source   code  must  retain   the   above  copyright //
//     notice,  this   list   of   conditions   and   the  following  disclaimer. //
//   * Redistributions  in  binary  form  must  reproduce  the  above   copyright //
//     notice, this  list  of  conditions  and the  following  disclaimer in  the //
//     documentation and/or  other  materials  provided  with  the  distribution. //
//   * Neither the name of the University of British Columbia (UBC) nor the names //
//     of   its   contributors  may  be  used  to  endorse  or   promote products //
//     derived from  this  software without  specific  prior  written permission. //
//                                                                                //
// THIS  SOFTWARE IS  PROVIDED  BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" //
// AND  ANY EXPRESS  OR IMPLIED WARRANTIES,  INCLUDING,  BUT NOT LIMITED TO,  THE //
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE //
// DISCLAIMED.  IN NO  EVENT SHALL University of British Columbia (UBC) BE LIABLE //
// FOR ANY DIRECT,  INDIRECT,  INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL //
// DAMAGES  (INCLUDING,  BUT NOT LIMITED TO,  PROCUREMENT OF  SUBSTITUTE GOODS OR //
// SERVICES;  LOSS OF USE,  DATA,  OR PROFITS;  OR BUSINESS INTERRUPTION) HOWEVER //
// CAUSED AND ON ANY THEORY OF LIABILITY,  WHETHER IN CONTRACT, STRICT LIABILITY, //
// OR TORT  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE //
// OF  THIS SOFTWARE,  EVEN  IF  ADVISED  OF  THE  POSSIBILITY  OF  SUCH  DAMAGE. //
////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////
// lfsr_test.v: Test circuit for LFSR periodic counter;                           //
//              Using DE2-115 Development board / Cyclone IV                      //
//                                                                                //
// Ameer M.S. Abdelhadi (ameer@ece.ubc.ca; ameer.abdelhadi@gmail.com), Sept. 2012 //
////////////////////////////////////////////////////////////////////////////////////

// Test circuit for LFSR periodic counter


module lfsr_test(
  input         CLOCK_50, // 50Mhz input clock
  input  [3:0]  KEY     , // keys
  input  [17:0] SW      , // switches 
  output [8:0 ] LEDG    , // green leds
  output [17:0] LEDR    , // red leds
  output [6 :0] HEX0    , // 7-segment #0
  output [6 :0] HEX1    , // 7-segment #1
  output [6 :0] HEX2    , // 7-segment #2
  output [6 :0] HEX3    , // 7-segment #3
  output [6 :0] HEX4    , // 7-segment #4
  output [6 :0] HEX5    , // 7-segment #5
  output [6 :0] HEX6    , // 7-segment #6
  output [6 :0] HEX7      // 7-segment #7
);

  // WIDTH should be defined as a parameter before including lfsr_utils.vh
  localparam WIDTH = 32;
  `include "lfsr_utils.vh"
  `include "math_utils.vh"

  // debounce keys
  wire clk_key,rst_key;
  debouncer #(2,50,100) debouncer_00 (CLOCK_50,KEY[3:2],{clk_key,rst_key});
  assign LEDG[7:4] = {clk_key,KEY[3],rst_key,KEY[2]};

  // LFSR counter for 20 numbers from lfsr(40) to lfsr(49)
  wire [WIDTH-1:0] cnt;
  lfsr   #( .WIDTH(WIDTH         ),  // integer: register width, up to 168.
            .INIT (index2lfsr(40)),  // int/str: loaded when ald is high. defaults is all 1s. limited to 32 bits.
            .BOUND(index2lfsr(59)))  // bounded?
  lfsr_00 ( .clk  (clk_key       ),  // input  clock
            .enb  (SW[0]         ),  // clock enable
            .arst (rst_key       ),  // async load (loads initial number)
            .count(cnt           )); // output random count number
 
  hex7seg hex7seg_00 (cnt[3 :0 ],HEX0);
  hex7seg hex7seg_01 (cnt[7 :4 ],HEX1);
  hex7seg hes7seg_02 (cnt[11:8 ],HEX2); 
  hex7seg hex7seg_03 (cnt[15:12],HEX3);
  hex7seg hex7seg_04 (cnt[19:16],HEX4);
  hex7seg hex7seg_05 (cnt[23:20],HEX5);
  hex7seg hes7seg_06 (cnt[27:24],HEX6); 
  hex7seg hex7seg_07 (cnt[31:28],HEX7);

endmodule
