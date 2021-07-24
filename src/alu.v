`ifndef add16
  `include "src/add16.v"
`endif

`ifndef and16
  `include "src/and16.v"
`endif

`ifndef mux16
  `include "src/mux16.v"
`endif

`ifndef not16
  `include "src/not16.v"
`endif

`ifndef notg
  `include "src/notg.v"
`endif

`ifndef or8way
  `include "src/or8way.v"
`endif

`ifndef org
  `include "src/org.v"
`endif

`define alu 1

module alu (
  input [15:0] x,
  input [15:0] y,
  input zx,
  input nx,
  input zy,
  input ny,
  input f,
  input no,
  output [15:0] out,
  output zr,
  output ng
);
  wire not_zx, not_zy;
  wire [15:0] not_zx16, not_zy16;
  wire [15:0] w1, w2, w3;
  wire [15:0] w4, w5, w6;
  wire [15:0] w7, w8, w9;
  wire [15:0] w10;
  wire w11, w12, w13;


  generate
    genvar i;

    for (i = 0; i < 16; i = i + 1) begin
      assign not_zx16[i] = not_zx;
      assign not_zy16[i] = not_zy;
    end
  endgenerate

  notg u1 (zx, not_zx);
  notg u2 (zy, not_zy);

  and16 u3 (x, not_zx16, w1);
  not16 u4 (w1, w2);
  mux16 u5 (w1, w2, nx, w3);

  and16 u6 (y, not_zy16, w4);
  not16 u7 (w4, w5);
  mux16 u8 (w4, w5, ny, w6);

  and16 u9 (w3, w6, w7);
  add16 u10 (w3, w6, w8);
  mux16 u11 (w7, w8, f, w9);

  not16 u12 (w9, w10);
  mux16 u13 (w9, w10, no, out);

  assign ng = out[15];

  or8way u14 (out[15:8], w11);
  or8way u15 (out[7:0], w12);
  org u16 (w11, w12, w13);
  notg u17 (w13, zr);
endmodule
