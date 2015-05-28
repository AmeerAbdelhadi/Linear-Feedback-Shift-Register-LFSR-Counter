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
// debouncer.v: key debouncer/ glitch filter with clock divider using LFSR filter //
//                                                                                //
// Ameer M.S. Abdelhadi (ameer@ece.ubc.ca; ameer.abdelhadi@gmail.com), Sept. 2012 //
////////////////////////////////////////////////////////////////////////////////////

module debouncer
 #( parameter            WIDTH = 1  ,  // number of keys
    parameter            IFREQ = 50 ,  // input clock (iclk)frequency (MHz)
    parameter            SFREQ = 100)  // sampling freq.(Hz)/ depends on switch/user
  ( input                iclk       ,  // input clock 
    input      [WIDTH:1] ikey       ,  // input key
    output reg [WIDTH:1] dkey       ); // debounced key

  // include math_utils.vh for log2 function
  `include "math_utils.vh"

  // LFSR width to divide clock and recieve 100Hz sampling clock
  localparam LFSRW = log2(1000000*IFREQ/SFREQ);
  
  // lfsr counter for clock divide
  wire [18:0] cnt_lfsr;
  lfsr     #( .WIDTH(LFSRW   ),  // integer: register width, up to 168.
              .INIT (0       ),  // int/str: loaded when ald is high. defaults is all 1s. limited to 32 bits.
              .BOUND(1       ))  // bounded?
  lfsr_inst ( .clk  (iclk    ),  // input  clock
	           .enb  (1'b1    ),  // clock enable
              .arst (1'b0    ),  // async load (loads initial number)
              .count(cnt_lfsr)); // output random count number

  // register to filter hazards on comparator
  reg cnt_lfsr_0;
  always @(posedge iclk)
    cnt_lfsr_0 <= (cnt_lfsr=={LFSRW{1'b0}});

  // sample key value
  always @(posedge cnt_lfsr_0)
    dkey <= ~ikey;

endmodule
