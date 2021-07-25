`ifndef ram16k_optimized
  `include "src/ram16k_optimized.v"
`endif

module ram4k_test;
  reg [15:0] in;
  reg [13:0] address;
  reg load, clk;
  wire [15:0] out;

  ram16k_optimized u (in, address, load, clk, out);

  generate
    genvar i;

    for (i = 0; i <= 15'b011111111111111; i = i + 1) begin
      initial begin
        #(i * 9);
        in <= i;
        address <= i[11:0];
        load <= 1;
        clk <= 0;

        #1;
        clk <= 1;

        #1;
        assert(out == i);

        #1;
        load <= 0;
        clk <= 0;

        #1;
        clk <= 1;

        #1;
        assert(out == i);

        #1;
        in <= 0;
        load <= 1;
        clk <= 0;

        #1;
        clk <= 1;

        #1;
        assert(out == 0);
      end
    end
  endgenerate
endmodule
