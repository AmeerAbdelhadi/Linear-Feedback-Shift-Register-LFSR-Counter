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
// lfsr_utils.vh: LFSR functions:                                                 //
// 1. lfsr_fb   : returns LFSR's feedback bit to use in LFSR counters             //
// 2. index2lfsr: converts an index (order) to a corresponding LFSR number        //
//                for generating intial and bounding LFSR numbers                 //
//                                                                                //
// Include where function are required;                                           //
// WIDTH should be defined as a parameter before including this file              //
//                                                                                //
// Ameer M.S. Abdelhadi (ameer@ece.ubc.ca; ameer.abdelhadi@gmail.com), Sept. 2012 //
////////////////////////////////////////////////////////////////////////////////////


// returns LFSR's feedback bit
function  lfsr_fb;
  input [WIDTH:1] cnt;
begin
  // decoding q feedback signal
  case (WIDTH)   
    2      : lfsr_fb = !(cnt[2  ]^cnt[1  ]                                );
    3      : lfsr_fb = !(cnt[3  ]^cnt[2  ]                                );
    4      : lfsr_fb = !(cnt[4  ]^cnt[3  ]                                );
    5      : lfsr_fb = !(cnt[5  ]^cnt[3  ]                                );
    6      : lfsr_fb = !(cnt[6  ]^cnt[5  ]                                );
    7      : lfsr_fb = !(cnt[7  ]^cnt[6  ]                                );
    8      : lfsr_fb = !(cnt[8  ]^cnt[6  ]^cnt[5  ]^cnt[4  ]              );
    9      : lfsr_fb = !(cnt[9  ]^cnt[5  ]                                );
    10     : lfsr_fb = !(cnt[10 ]^cnt[7  ]                                );
    11     : lfsr_fb = !(cnt[11 ]^cnt[9  ]                                );
    12     : lfsr_fb = !(cnt[12 ]^cnt[6  ]^cnt[4  ]^cnt[1  ]              );
    13     : lfsr_fb = !(cnt[13 ]^cnt[4  ]^cnt[3  ]^cnt[1  ]              );
    14     : lfsr_fb = !(cnt[14 ]^cnt[5  ]^cnt[3  ]^cnt[1  ]              );
    15     : lfsr_fb = !(cnt[15 ]^cnt[14 ]                                );
    16     : lfsr_fb = !(cnt[16 ]^cnt[15 ]^cnt[13 ]^cnt[4  ]              );
    17     : lfsr_fb = !(cnt[17 ]^cnt[14 ]                                );
    18     : lfsr_fb = !(cnt[18 ]^cnt[11 ]                                );
    19     : lfsr_fb = !(cnt[19 ]^cnt[6  ]^cnt[2  ]^cnt[1  ]              );
    20     : lfsr_fb = !(cnt[20 ]^cnt[17 ]                                );
    21     : lfsr_fb = !(cnt[21 ]^cnt[19 ]                                );
    22     : lfsr_fb = !(cnt[22 ]^cnt[21 ]                                );
    23     : lfsr_fb = !(cnt[23 ]^cnt[18 ]                                );
    24     : lfsr_fb = !(cnt[24 ]^cnt[23 ]^cnt[22 ]^cnt[17 ]              );
    25     : lfsr_fb = !(cnt[25 ]^cnt[22 ]                                );
    26     : lfsr_fb = !(cnt[26 ]^cnt[6  ]^cnt[2  ]^cnt[1  ]              );
    27     : lfsr_fb = !(cnt[27 ]^cnt[5  ]^cnt[2  ]^cnt[1  ]              );
    28     : lfsr_fb = !(cnt[28 ]^cnt[25 ]                                );
    29     : lfsr_fb = !(cnt[29 ]^cnt[27 ]                                );
    30     : lfsr_fb = !(cnt[30 ]^cnt[6  ]^cnt[4  ]^cnt[1  ]              );
    31     : lfsr_fb = !(cnt[31 ]^cnt[28 ]                                );
    32     : lfsr_fb = !(cnt[32 ]^cnt[22 ]^cnt[2  ]^cnt[1  ]              );
    33     : lfsr_fb = !(cnt[33 ]^cnt[20 ]                                );
    34     : lfsr_fb = !(cnt[34 ]^cnt[27 ]^cnt[2  ]^cnt[1  ]              );
    35     : lfsr_fb = !(cnt[35 ]^cnt[33 ]                                );
    36     : lfsr_fb = !(cnt[36 ]^cnt[25 ]                                );
    37     : lfsr_fb = !(cnt[37 ]^cnt[5  ]^cnt[4  ]^cnt[3  ]^cnt[2]^cnt[1]);
    38     : lfsr_fb = !(cnt[38 ]^cnt[6  ]^cnt[5  ]^cnt[1  ]              );
    39     : lfsr_fb = !(cnt[39 ]^cnt[35 ]                                );
    40     : lfsr_fb = !(cnt[40 ]^cnt[38 ]^cnt[21 ]^cnt[19 ]              );
    41     : lfsr_fb = !(cnt[41 ]^cnt[38 ]                                );
    42     : lfsr_fb = !(cnt[42 ]^cnt[41 ]^cnt[20 ]^cnt[19 ]              );
    43     : lfsr_fb = !(cnt[43 ]^cnt[42 ]^cnt[38 ]^cnt[37 ]              );
    44     : lfsr_fb = !(cnt[44 ]^cnt[43 ]^cnt[18 ]^cnt[17 ]              );
    45     : lfsr_fb = !(cnt[45 ]^cnt[44 ]^cnt[42 ]^cnt[41 ]              );
    46     : lfsr_fb = !(cnt[46 ]^cnt[45 ]^cnt[26 ]^cnt[25 ]              );
    47     : lfsr_fb = !(cnt[47 ]^cnt[42 ]                                );
    48     : lfsr_fb = !(cnt[48 ]^cnt[47 ]^cnt[21 ]^cnt[20 ]              );
    49     : lfsr_fb = !(cnt[49 ]^cnt[40 ]                                );
    50     : lfsr_fb = !(cnt[50 ]^cnt[49 ]^cnt[24 ]^cnt[23 ]              );
    51     : lfsr_fb = !(cnt[51 ]^cnt[50 ]^cnt[36 ]^cnt[35 ]              );
    52     : lfsr_fb = !(cnt[52 ]^cnt[49 ]                                );
    53     : lfsr_fb = !(cnt[53 ]^cnt[52 ]^cnt[38 ]^cnt[37 ]              );
    54     : lfsr_fb = !(cnt[54 ]^cnt[53 ]^cnt[18 ]^cnt[17 ]              );
    55     : lfsr_fb = !(cnt[55 ]^cnt[31 ]                                );
    56     : lfsr_fb = !(cnt[56 ]^cnt[55 ]^cnt[35 ]^cnt[34 ]              );
    57     : lfsr_fb = !(cnt[57 ]^cnt[50 ]                                );
    58     : lfsr_fb = !(cnt[58 ]^cnt[39 ]                                );
    59     : lfsr_fb = !(cnt[59 ]^cnt[58 ]^cnt[38 ]^cnt[37 ]              );
    60     : lfsr_fb = !(cnt[60 ]^cnt[59 ]                                );
    61     : lfsr_fb = !(cnt[61 ]^cnt[60 ]^cnt[46 ]^cnt[45 ]              );
    62     : lfsr_fb = !(cnt[62 ]^cnt[61 ]^cnt[6  ]^cnt[5  ]              );
    63     : lfsr_fb = !(cnt[63 ]^cnt[62 ]                                );
    64     : lfsr_fb = !(cnt[64 ]^cnt[63 ]^cnt[61 ]^cnt[60 ]              );
    65     : lfsr_fb = !(cnt[65 ]^cnt[47 ]                                );
    66     : lfsr_fb = !(cnt[66 ]^cnt[65 ]^cnt[57 ]^cnt[56 ]              );
    67     : lfsr_fb = !(cnt[67 ]^cnt[66 ]^cnt[58 ]^cnt[57 ]              );
    68     : lfsr_fb = !(cnt[68 ]^cnt[59 ]                                );
    69     : lfsr_fb = !(cnt[69 ]^cnt[67 ]^cnt[42 ]^cnt[40 ]              );
    70     : lfsr_fb = !(cnt[70 ]^cnt[69 ]^cnt[55 ]^cnt[54 ]              );
    71     : lfsr_fb = !(cnt[71 ]^cnt[65 ]                                );
    72     : lfsr_fb = !(cnt[72 ]^cnt[66 ]^cnt[25 ]^cnt[19 ]              );
    73     : lfsr_fb = !(cnt[73 ]^cnt[48 ]                                );
    74     : lfsr_fb = !(cnt[74 ]^cnt[73 ]^cnt[59 ]^cnt[58 ]              );
    75     : lfsr_fb = !(cnt[75 ]^cnt[74 ]^cnt[65 ]^cnt[64 ]              );
    76     : lfsr_fb = !(cnt[76 ]^cnt[75 ]^cnt[41 ]^cnt[40 ]              );
    77     : lfsr_fb = !(cnt[77 ]^cnt[76 ]^cnt[47 ]^cnt[46 ]              );
    78     : lfsr_fb = !(cnt[78 ]^cnt[77 ]^cnt[59 ]^cnt[58 ]              );
    79     : lfsr_fb = !(cnt[79 ]^cnt[70 ]                                );
    80     : lfsr_fb = !(cnt[80 ]^cnt[79 ]^cnt[43 ]^cnt[42 ]              );
    81     : lfsr_fb = !(cnt[81 ]^cnt[77 ]                                );
    82     : lfsr_fb = !(cnt[82 ]^cnt[79 ]^cnt[47 ]^cnt[44 ]              );
    83     : lfsr_fb = !(cnt[83 ]^cnt[82 ]^cnt[38 ]^cnt[37 ]              );
    84     : lfsr_fb = !(cnt[84 ]^cnt[71 ]                                );
    85     : lfsr_fb = !(cnt[85 ]^cnt[84 ]^cnt[58 ]^cnt[57 ]              );
    86     : lfsr_fb = !(cnt[86 ]^cnt[85 ]^cnt[74 ]^cnt[73 ]              );
    87     : lfsr_fb = !(cnt[87 ]^cnt[74 ]                                );
    88     : lfsr_fb = !(cnt[88 ]^cnt[87 ]^cnt[17 ]^cnt[16 ]              );
    89     : lfsr_fb = !(cnt[89 ]^cnt[51 ]                                );
    90     : lfsr_fb = !(cnt[90 ]^cnt[89 ]^cnt[72 ]^cnt[71 ]              );
    91     : lfsr_fb = !(cnt[91 ]^cnt[90 ]^cnt[8  ]^cnt[7  ]              );
    92     : lfsr_fb = !(cnt[92 ]^cnt[91 ]^cnt[80 ]^cnt[79 ]              );
    93     : lfsr_fb = !(cnt[93 ]^cnt[91 ]                                );
    94     : lfsr_fb = !(cnt[94 ]^cnt[73 ]                                );
    95     : lfsr_fb = !(cnt[95 ]^cnt[84 ]                                );
    96     : lfsr_fb = !(cnt[96 ]^cnt[94 ]^cnt[49 ]^cnt[47 ]              );
    97     : lfsr_fb = !(cnt[97 ]^cnt[91 ]                                );
    98     : lfsr_fb = !(cnt[98 ]^cnt[87 ]                                );
    99     : lfsr_fb = !(cnt[99 ]^cnt[97 ]^cnt[54 ]^cnt[52 ]              );
    100    : lfsr_fb = !(cnt[100]^cnt[63 ]                                );
    101    : lfsr_fb = !(cnt[101]^cnt[100]^cnt[95 ]^cnt[94 ]              );
    102    : lfsr_fb = !(cnt[102]^cnt[101]^cnt[36 ]^cnt[35 ]              );
    103    : lfsr_fb = !(cnt[103]^cnt[94 ]                                );
    104    : lfsr_fb = !(cnt[104]^cnt[103]^cnt[94 ]^cnt[93 ]              );
    105    : lfsr_fb = !(cnt[105]^cnt[89 ]                                );
    106    : lfsr_fb = !(cnt[106]^cnt[91 ]                                );
    107    : lfsr_fb = !(cnt[107]^cnt[105]^cnt[44 ]^cnt[42 ]              );
    108    : lfsr_fb = !(cnt[108]^cnt[77 ]                                );
    109    : lfsr_fb = !(cnt[109]^cnt[108]^cnt[103]^cnt[102]              );
    110    : lfsr_fb = !(cnt[110]^cnt[109]^cnt[98 ]^cnt[97 ]              );
    111    : lfsr_fb = !(cnt[111]^cnt[101]                                );
    112    : lfsr_fb = !(cnt[112]^cnt[110]^cnt[69 ]^cnt[67 ]              );
    113    : lfsr_fb = !(cnt[113]^cnt[104]                                );
    114    : lfsr_fb = !(cnt[114]^cnt[113]^cnt[33 ]^cnt[32 ]              );
    115    : lfsr_fb = !(cnt[115]^cnt[114]^cnt[101]^cnt[100]              );
    116    : lfsr_fb = !(cnt[116]^cnt[115]^cnt[46 ]^cnt[45 ]              );
    117    : lfsr_fb = !(cnt[117]^cnt[115]^cnt[99 ]^cnt[97 ]              );
    118    : lfsr_fb = !(cnt[118]^cnt[85 ]                                );
    119    : lfsr_fb = !(cnt[119]^cnt[111]                                );
    120    : lfsr_fb = !(cnt[120]^cnt[113]^cnt[9  ]^cnt[2  ]              );
    121    : lfsr_fb = !(cnt[121]^cnt[103]                                );
    122    : lfsr_fb = !(cnt[122]^cnt[121]^cnt[63 ]^cnt[62 ]              );
    123    : lfsr_fb = !(cnt[123]^cnt[121]                                );
    124    : lfsr_fb = !(cnt[124]^cnt[87 ]                                );
    125    : lfsr_fb = !(cnt[125]^cnt[124]^cnt[18 ]^cnt[17 ]              );
    126    : lfsr_fb = !(cnt[126]^cnt[125]^cnt[90 ]^cnt[89 ]              );
    127    : lfsr_fb = !(cnt[127]^cnt[126]                                );
    128    : lfsr_fb = !(cnt[128]^cnt[126]^cnt[101]^cnt[99 ]              );
    129    : lfsr_fb = !(cnt[129]^cnt[124]                                );
    130    : lfsr_fb = !(cnt[130]^cnt[127]                                );
    131    : lfsr_fb = !(cnt[131]^cnt[130]^cnt[84 ]^cnt[83 ]              );
    132    : lfsr_fb = !(cnt[132]^cnt[103]                                );
    133    : lfsr_fb = !(cnt[133]^cnt[132]^cnt[82 ]^cnt[81 ]              );
    134    : lfsr_fb = !(cnt[134]^cnt[77 ]                                );
    135    : lfsr_fb = !(cnt[135]^cnt[124]                                );
    136    : lfsr_fb = !(cnt[136]^cnt[135]^cnt[11 ]^cnt[10 ]              );
    137    : lfsr_fb = !(cnt[137]^cnt[116]                                );
    138    : lfsr_fb = !(cnt[138]^cnt[137]^cnt[131]^cnt[130]              );
    139    : lfsr_fb = !(cnt[139]^cnt[136]^cnt[134]^cnt[131]              );
    140    : lfsr_fb = !(cnt[140]^cnt[111]                                );
    141    : lfsr_fb = !(cnt[141]^cnt[140]^cnt[110]^cnt[109]              );
    142    : lfsr_fb = !(cnt[142]^cnt[121]                                );
    143    : lfsr_fb = !(cnt[143]^cnt[142]^cnt[123]^cnt[122]              );
    144    : lfsr_fb = !(cnt[144]^cnt[143]^cnt[75 ]^cnt[74 ]              );
    145    : lfsr_fb = !(cnt[145]^cnt[93 ]                                );
    146    : lfsr_fb = !(cnt[146]^cnt[145]^cnt[87 ]^cnt[86 ]              );
    147    : lfsr_fb = !(cnt[147]^cnt[146]^cnt[110]^cnt[109]              );
    148    : lfsr_fb = !(cnt[148]^cnt[121]                                );
    149    : lfsr_fb = !(cnt[149]^cnt[148]^cnt[40 ]^cnt[39 ]              );
    150    : lfsr_fb = !(cnt[150]^cnt[97 ]                                );
    151    : lfsr_fb = !(cnt[151]^cnt[148]                                );
    152    : lfsr_fb = !(cnt[152]^cnt[151]^cnt[87 ]^cnt[86 ]              );
    153    : lfsr_fb = !(cnt[153]^cnt[152]                                );
    154    : lfsr_fb = !(cnt[154]^cnt[152]^cnt[27 ]^cnt[25 ]              );
    155    : lfsr_fb = !(cnt[155]^cnt[154]^cnt[124]^cnt[123]              );
    156    : lfsr_fb = !(cnt[156]^cnt[155]^cnt[41 ]^cnt[40 ]              );
    157    : lfsr_fb = !(cnt[157]^cnt[156]^cnt[131]^cnt[130]              );
    158    : lfsr_fb = !(cnt[158]^cnt[157]^cnt[132]^cnt[131]              );
    159    : lfsr_fb = !(cnt[159]^cnt[128]                                );
    160    : lfsr_fb = !(cnt[160]^cnt[159]^cnt[142]^cnt[141]              );
    161    : lfsr_fb = !(cnt[161]^cnt[143]                                );
    162    : lfsr_fb = !(cnt[162]^cnt[161]^cnt[75 ]^cnt[74 ]              );
    163    : lfsr_fb = !(cnt[163]^cnt[162]^cnt[104]^cnt[103]              );
    164    : lfsr_fb = !(cnt[164]^cnt[163]^cnt[151]^cnt[150]              );
    165    : lfsr_fb = !(cnt[165]^cnt[164]^cnt[135]^cnt[134]              );
    166    : lfsr_fb = !(cnt[166]^cnt[165]^cnt[128]^cnt[127]              );
    167    : lfsr_fb = !(cnt[167]^cnt[161]                                );
    168    : lfsr_fb = !(cnt[168]^cnt[166]^cnt[153]^cnt[151]              );
	 default: lfsr_fb = 1'bx                                                ;
  endcase
end
endfunction

// convert a counting index (order) to ca orresponding LFSR number
function [WIDTH:1] index2lfsr;
  input [WIDTH:1] index;
begin
  reg [WIDTH:1] lfsr,i;
  lfsr = {WIDTH{1'b0}};
  for (i=1;i<=index;i=i+1)
    lfsr = {lfsr[WIDTH-1:1],lfsr_fb(lfsr)};
  index2lfsr = lfsr;
end
endfunction
