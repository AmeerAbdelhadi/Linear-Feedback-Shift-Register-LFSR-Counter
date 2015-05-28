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
//        math_utils.v: math precompile definitions (macros) and functions        //
//                                                                                //
// Ameer M.S. Abdelhadi (ameer@ece.ubc.ca; ameer.abdelhadi@gmail.com), June  2012 //
////////////////////////////////////////////////////////////////////////////////////


// Math utilities

/////////////////
// definitions //
////////////////

// define once
`ifndef __MATH_V__
`define __MATH_V__

// pack 2-D array into 1-D
// works with Synopsys, but not with ncverilog
`define PKARRAY(PKWID,PKLEN,PKSRC,PKDST) \
          genvar pki; generate for(pki=0;pki<(PKLEN);pki=pki+1) begin:PKARRi; \
            assign PKDST[((PKWID)*pki+((PKWID)-1)):((PKWID)*pki)] = PKSRC[pki][((PKWID)-1):0]; \
          end; endgenerate

// unpack 1-D array into 2-D
// works with Synopsys, but not with ncverilog
`define UPARRAY(PKWID,PKLEN,PKSRC,PKDST) \
          genvar upi; generate for(upi=0;upi<(PKLEN);upi=upi+1) begin:UPARRi; \
            assign PKDST[upi][((PKWID)-1):0] = PKSRC[((PKWID)*upi+((PKWID)-1)):((PKWID)*upi)]; \
          end; endgenerate

`endif //__MATH_V__

///////////////
// functions //
///////////////

// ceiling of log2
function integer log2;
  input integer n;
begin
  if (n>1) n = n-1;
  for(log2=0; n>0; log2=log2+1) n = n>>1;
end
endfunction

// floor of log2
function integer log2f;
  input integer n;
begin
  for(log2f=0; n>1; log2f=log2f+1) n = n>>1;
end
endfunction

// factorial (n!)
function integer fact;
  input integer n;
  integer       i;
begin
  fact = 1;
  for(i=2; i<=n; i=i+1) fact=fact*i;
end
endfunction
