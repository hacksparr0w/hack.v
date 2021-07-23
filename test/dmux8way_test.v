`ifndef dmux8way
  `include "src/dmux8way.v"
`endif

module dmux8way_test;
  reg in;
  reg [2:0] sel;
  wire a, b, c, d, e, f, g, h;

  dmux8way u (in, sel, a, b, c, d, e, f, g, h);

  initial begin
    in = 1;
    sel = 3'b000;
    #1;
    assert(a == 1);
    assert(b == 0);
    assert(c == 0);
    assert(d == 0);
    assert(e == 0);
    assert(f == 0);
    assert(g == 0);
    assert(h == 0);

    sel = 3'b001;
    #1;
    assert(a == 0);
    assert(b == 1);
    assert(c == 0);
    assert(d == 0);
    assert(e == 0);
    assert(f == 0);
    assert(g == 0);
    assert(h == 0);

    sel = 3'b010;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 1);
    assert(d == 0);
    assert(e == 0);
    assert(f == 0);
    assert(g == 0);
    assert(h == 0);

    sel = 3'b011;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 0);
    assert(d == 1);
    assert(e == 0);
    assert(f == 0);
    assert(g == 0);
    assert(h == 0);

    sel = 3'b100;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 0);
    assert(d == 0);
    assert(e == 1);
    assert(f == 0);
    assert(g == 0);
    assert(h == 0);

    sel = 3'b101;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 0);
    assert(d == 0);
    assert(e == 0);
    assert(f == 1);
    assert(g == 0);
    assert(h == 0);

    sel = 3'b110;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 0);
    assert(d == 0);
    assert(e == 0);
    assert(f == 0);
    assert(g == 1);
    assert(h == 0);

    sel = 3'b111;
    #1;
    assert(a == 0);
    assert(b == 0);
    assert(c == 0);
    assert(d == 0);
    assert(e == 0);
    assert(f == 0);
    assert(g == 0);
    assert(h == 1);
  end
endmodule
