`ifndef half_adder
  `include "src/half_adder.v"
`endif

`define inc16 1

module inc16 (input [15:0] in, output [15:0] out);
  wire c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r;

  half_adder u1 (in[0], 1'b1, out[0], c);
  half_adder u2 (in[1], c, out[1], d);
  half_adder u3 (in[2], d, out[2], e);
  half_adder u4 (in[3], e, out[3], f);
  half_adder u5 (in[4], f, out[4], g);
  half_adder u6 (in[5], g, out[5], h);
  half_adder u7 (in[6], h, out[6], i);
  half_adder u8 (in[7], i, out[7], j);
  half_adder u9 (in[8], j, out[8], k);
  half_adder u10 (in[9], k, out[9], l);
  half_adder u11 (in[10], l, out[10], m);
  half_adder u12 (in[11], m, out[11], n);
  half_adder u13 (in[12], n, out[12], o);
  half_adder u14 (in[13], o, out[13], p);
  half_adder u15 (in[14], p, out[14], q);
  half_adder u16 (in[15], q, out[15], r);
endmodule
