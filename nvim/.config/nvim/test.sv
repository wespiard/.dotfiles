module test (
    input logic clk,
    input logic rst,
    input logic [2:0] a,
    output logic [2:0] c
);

  always_ff @(posedge clk) begin
    if (rst) begin
      c <= b;
    end
  end

endmodule
