`ifndef ram512
  `include "src/ram512.v"
`endif

module ram512_test;
  reg [15:0] in;
  reg [8:0] address;
  reg load, clk;
  wire [15:0] out;

  ram512 u (in, address, load, clk, out);

  generate
    genvar i;

    for (i = 0; i <= 10'b0111111111; i = i + 1) begin
      initial begin
        #(i * 9);
        in <= i;
        address <= i[8:0];
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
