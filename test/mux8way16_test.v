`ifndef mux8way16
  `include "src/mux8way16.v"
`endif

module mux8way16_test;
  reg [15:0] a;
  reg [15:0] b;
  reg [15:0] c;
  reg [15:0] d;
  reg [15:0] e;
  reg [15:0] f;
  reg [15:0] g;
  reg [15:0] h;
  reg [2:0] sel;
  wire [15:0] out;

  mux8way16 u (a, b, c, d, e, f, g, h, sel, out);

  initial begin
    a = 16'b0101010100000000;
    b = 16'b0101010111111111;
    c = 16'b1010101000000000;
    d = 16'b1010101011111111;
    e = 16'b0000000001010101;
    f = 16'b1111111101010101;
    g = 16'b0000000010101010;
    h = 16'b1111111110101010;
    sel = 3'b000;
    #1;
    assert(out == a);

    sel = 3'b001;
    #1;
    assert(out == b);

    sel = 3'b010;
    #1;
    assert(out == c);

    sel = 3'b011;
    #1
    assert(out == d);

    sel = 3'b100;
    #1
    assert(out == e);

    sel = 3'b101;
    #1
    assert(out == f);

    sel = 3'b110;
    #1
    assert(out == g);

    sel = 3'b111;
    #1
    assert(out == h);
  end
endmodule
