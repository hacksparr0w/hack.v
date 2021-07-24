`ifndef bitg
  `include "src/bitg.v"
`endif

module bitg_test;
  reg in, load, clk;
  wire out;

  bitg u (in, load, clk, out);

  initial begin
    clk <= 0;
    in <= 0;
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
    in <= 1;
    load <= 1;

    #1;
    assert(out == 0);

    #1;
    clk <= 1;

    #1;
    assert(out == 1);

    #1;
    clk <= 0;
    load <= 0;
    in <= 0;

    #1;
    assert(out == 1);

    #1;
    clk <= 1;

    #1;
    assert(out == 1);

    #1;
    clk <= 0;

    #1;
    assert(out == 1);
  end
endmodule
