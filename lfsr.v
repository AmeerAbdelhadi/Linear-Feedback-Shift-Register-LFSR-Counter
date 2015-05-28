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
// lfsr.v: Linear Feedback Shift Register (LFSR);                                 //
//         A periodic random counter with asyncronous reset and upper bound       //
//                                                                                //
// Ameer M.S. Abdelhadi (ameer@ece.ubc.ca; ameer.abdelhadi@gmail.com), Sept. 2012 //
////////////////////////////////////////////////////////////////////////////////////

// LFSR - Linear Feedback Shift Register
// periodic counter with random count

module lfsr
 #( parameter            WIDTH = 16,  // integer: register width, up to 168.
    parameter  [WIDTH:1] INIT  = 0 ,  // initial value, loaded on reset / ignore if no reset
    parameter  [WIDTH:1] BOUND = 1 )  // upper bound ;count resets over this bound/ pass 1 if unbouned
  ( input                clk       ,  // input  clock
    input                enb       ,  // clock enable / provide constant 1'b1 if not required
    input                arst      ,  // async reset (loads initial number) / provide constant 1'b0 if not required
    output reg [WIDTH:1] count     ); // output lfsr count number

// WIDTH should be defined as a parameter before including lfsr_utils.vh
`include "lfsr_utils.vh"

// LFSR counter with asyncronous reset and upper bound
// a shift register with LFSR's feedback function as shiftin
always @(posedge clk or posedge arst)
  if (arst) count <= INIT;
  else if (enb) count <= ((BOUND!=1)&&(count==BOUND)) ? INIT : {count[WIDTH-1:1],lfsr_fb(count)} ;

endmodule
