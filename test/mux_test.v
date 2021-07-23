`include "src/mux.v"

module mux_test;
  reg a, b, sel;
  wire out;

  mux g (a, b, sel, out);

  initial begin
    {a, b, sel} = 3'b000;
    #20;
    assert(out == 0);

    {a, b, sel} = 3'b001;
    #20;
    assert(out == 0);

    {a, b, sel} = 3'b010;
    #20;
    assert(out == 0);

    {a, b, sel} = 3'b011;
    #20;
    assert(out == 1);

    {a, b, sel} = 3'b100;
    #20;
    assert(out == 1);

    {a, b, sel} = 3'b101;
    #20;
    assert(out == 0);

    {a, b, sel} = 3'b110;
    #20;
    assert(out == 1);

    {a, b, sel} = 3'b111;
    #20;
    assert(out == 1);
  end
endmodule
