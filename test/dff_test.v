`ifndef dff
  `include "src/dff.v"
`endif

module dff_test;
  reg in, clk;
  wire out;

  dff u (in, clk, out);

  initial begin
    clk <= 0;
    in <= 0;

    #1;
    clk <= 1;

    #1;
    assert(out == 0);

    #1;
    clk <= 0;
    in <= 1;

    #1;
    assert(out == 0);

    #1;
    clk <= 1;

    #1;
    assert(out == 1);

    #1;
    clk <= 0;
    in <= 0;

    #1;
    assert(out == 1);

    #1;
    clk <= 1;
    in <= 0;

    #1;
    assert(out == 0);
  end
endmodule
