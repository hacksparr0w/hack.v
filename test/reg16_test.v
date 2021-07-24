`ifndef reg16
  `include "src/reg16.v"
`endif

module reg16_test;
  reg [15:0] in;
  reg load, clk;
  wire [15:0] out;

  reg16 u (in, load, clk, out);

  initial begin
    clk <= 0;
    in <= 16'b0000000000000000;
    load <= 1;

    #1;
    clk <= 1;

    #1;
    assert(out == 0);

    #1;
    clk <= 0;

    #1;
    assert(out == 0);

    #1;
    clk <= 1;
    load <= 0;

    #1;
    assert(out == 0);

    #1;
    clk <= 0;
    in <= 16'b1111111111111111;
    load <= 1;

    #1;
    assert(out == 0);

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b1111111111111111);

    #1;
    clk <= 0;
    load <= 0;
    in <= 0;

    #1;
    assert(out == 16'b1111111111111111);

    #1;
    clk <= 1;

    #1;
    assert(out == 16'b1111111111111111);

    #1;
    clk <= 0;

    #1;
    assert(out == 16'b1111111111111111);
  end
endmodule
