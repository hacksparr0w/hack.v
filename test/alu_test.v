`ifndef alu
  `include "src/alu.v"
`endif

module alu_test;
  reg zx, nx, zy, ny, f, no;
  reg [15:0] x, y;
  wire zr, ng;
  wire [15:0] out;

  alu u (x, y, zx, nx, zy, ny, f, no, out, zr, ng);

  initial begin
    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 0;
    zy = 1;
    ny = 0;
    f = 1;
    no = 0;
    #1;
    assert(out == 0);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #1;
    assert(out == 1);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 1;
    ny = 0;
    f = 1;
    no = 0;
    #1;
    assert(out == 16'b1111111111111111);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 0;
    no = 0;
    #1;
    assert(out == x);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 0;
    no = 0;
    #1;
    assert(out == y);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 0;
    no = 1;
    #1;
    assert(out == ~x);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 0;
    no = 1;
    #1;
    assert(out == ~y);

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #1;
    assert(out == (~x + 16'b0000000000000001));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 1;
    #1;
    assert(out == (~y + 16'b0000000000000001));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 1;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #1;
    assert(out == (x + 16'b0000000000000001));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 1;
    f = 1;
    no = 1;
    #1;
    assert(out == (y + 16'b0000000000000001));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 1;
    no = 0;
    #1;
    assert(out == (x + 16'b1111111111111111));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 0;
    #1;
    assert(out == (y + 16'b1111111111111111));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 0;
    f = 1;
    no = 0;
    #1;
    assert(out == (x + y));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 1;
    #1;
    assert(out == (x + (~y + 16'b0000000000000001)));

    x = 16'b1010101010101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 1;
    f = 1;
    no = 1;
    #1;
    assert(out == (y + (~x + 16'b0000000000000001)));

    x = 16'b1010101110101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 0;
    f = 0;
    no = 0;
    #1;
    assert(out == (x & y));

    x = 16'b1010101100101010;
    y = 16'b0101010101010101;
    zx = 0;
    nx = 1;
    zy = 0;
    ny = 1;
    f = 0;
    no = 1;
    #1;
    assert(out == (x | y));
  end
endmodule
