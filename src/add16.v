`ifndef full_adder
  `include "src/full_adder.v"
`endif

`ifndef half_adder
  `include "src/half_adder.v"
`endif

`define add16 1

module add16 (input [15:0] a, input [15:0] b, output [15:0] out);
  wire c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r;

  half_adder u1 (a[0], b[0], out[0], c);
  full_adder u2 (a[1], b[1], c, out[1], d);
  full_adder u3 (a[2], b[2], d, out[2], e);
  full_adder u4 (a[3], b[3], e, out[3], f);
  full_adder u5 (a[4], b[4], f, out[4], g);
  full_adder u6 (a[5], b[5], g, out[5], h);
  full_adder u7 (a[6], b[6], h, out[6], i);
  full_adder u8 (a[7], b[7], i, out[7], j);
  full_adder u9 (a[8], b[8], j, out[8], k);
  full_adder u10 (a[9], b[9], k, out[9], l);
  full_adder u11 (a[10], b[10], l, out[10], m);
  full_adder u12 (a[11], b[11], m, out[11], n);
  full_adder u13 (a[12], b[12], n, out[12], o);
  full_adder u14 (a[13], b[13], o, out[13], p);
  full_adder u15 (a[14], b[14], p, out[14], q);
  full_adder u16 (a[15], b[15], q, out[15], r);
endmodule
