`ifndef or8way
  `include "src/or8way.v"
`endif

module or8way_test;
  reg [7:0] in;
  wire out;

  reg [8:0] i;

  or8way g (in, out);

  initial begin
    for (i = 0; i <= 8'b11111111; i = i + 1) begin
      in = i;
      #1;
      assert(out == (i[0] | i[1] | i[2] | i[3] | i[4] | i[5] | i[6] | i[7]));
    end
  end
endmodule
