`ifndef ram64
  `include "src/ram64.v"
`endif

module ram64_test;
  reg [15:0] in;
  reg [5:0] address;
  reg load, clk;
  wire [15:0] out;

  ram64 u (in, address, load, clk, out);

  generate
    genvar i;

    for (i = 0; i <= 7'b0000001; i = i + 1) begin
      initial begin
        #(i * 9);
        in <= i[15:0];
        address <= i[5:0];
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
