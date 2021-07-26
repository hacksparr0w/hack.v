`ifndef pc
  `include "src/pc.v"
`endif

`define pc 1

module pc_test;
  reg [15:0] in;
  reg inc, load, reset, clk;
  wire [15:0] out;

  pc u (in, inc, load, reset, clk, out);

  initial begin
    clk <= 0;
    in <= 16'b0000000000101111;
    inc <= 0;
    load <= 1;
    reset <= 0;

    #1;
    clk <= 1;

    #1;
    in <= 16'b0000001000001111;
    clk <= 0;
    load <= 0;

    assert(out == 16'b0000000000101111);

    #1;
    clk <= 1;
    reset <= 1;

    assert(out == 16'b0000000000101111);

    #1;
    clk <= 0;

    assert(out == 16'b0000000000101111);

    #1;
    clk <= 1;
    reset <= 0;

    assert(out == 16'b0000000000101111);

    #1;
    clk <= 0;

    assert(out == 0);

    #1;
    clk <= 1;
    inc <= 1;

    assert(out == 0);

    #1;
    clk <= 0;

    assert(out == 0);

    #1;
    clk <= 1;

    assert(out == 0);

    #1;
    clk <= 0;

    assert(out == 1);

    #1;
    clk <= 1;

    assert(out == 1);

    #1;
    clk <= 0;

    assert(out == 2);

    #1;
    clk <= 1;

    assert(out == 2);

    #1;
    clk <= 0;

    assert(out == 3);

    #1;
    clk <= 1;
    load <= 1;

    #1;
    clk <= 0;

    assert(out == 4);

    #1;
    clk <= 1;
    load <= 0;

    assert(out == 4);

    #1;
    clk <= 0;

    assert(out == 527);

    #1;
    clk <= 1;

    assert(out == 527);

    #1;
    clk <= 0;

    assert(out == 528);

    #1;
    clk <= 1;
    inc <= 0;

    assert(out == 528);

    #1;
    clk <= 0;

    assert(out == 529);

    #1;
    clk <= 1;

    assert(out == 529);

    #1;
    clk <= 0;

    assert(out == 529);

    #1;
    clk <= 1;

    assert(out == 529);

    #1;
    clk <= 0;

    assert(out == 529);

    #1;
    clk <= 1;

    assert(out == 529);

    #1;
    clk <= 0;

    assert(out == 529);
  end
endmodule
