// This tests assigning value lists to packed arrays
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2012 by Iztok Jeras.

module test ();

   // parameters for array sizes
   localparam WA = 8;

   // 1D vectors
   logic [WA-1:0] vbg0, vbg1, vbg2, vbg3, vbg4;  // big    endian vector
   logic [0:WA-1] vlt0, vlt1, vlt2, vlt3, vlt4;  // little endian vector

   // error counter
   bit err = 0;

   initial begin
      vbg0 = '{ 3, 2, 1, 0, '0, '1, 1'b1, 1'b0};
      vbg1 = '{0:3, 1:2, 2:1, 3:0, 4:'0, 5:'1, 6:1'b1, 7:1'b0};
      vbg2 = '{default:'1};
      vbg3 = '{2:'1, default:'0};
      vbg4 = '{err+0, err+1, err+2, err+3, err+4, err+5, err+6, err+7};
      // check
      if (vbg0 !== 8'b10100110) begin $display("FAILED -- vbg0 = 'b%b", vbg0); err=1; end
      if (vbg1 !== 8'b01100101) begin $display("FAILED -- vbg1 = 'b%b", vbg1); err=1; end
      if (vbg2 !== 8'b11111111) begin $display("FAILED -- vbg2 = 'b%b", vbg2); err=1; end
      if (vbg3 !== 8'b00000100) begin $display("FAILED -- vbg3 = 'b%b", vbg3); err=1; end
      if (vbg4 !== 8'b01010101) begin $display("FAILED -- vbg4 = 'b%b", vbg4); err=1; end

      vlt0 = '{ 3, 2, 1, 0, '0, '1, 1'b1, 1'b0};
      vlt1 = '{0:3, 1:2, 2:1, 3:0, 4:'0, 5:'1, 6:1'b1, 7:1'b0};
      vlt2 = '{default:'1};
      vlt3 = '{2:'1, default:'0};
      vlt4 = '{err+0, err+1, err+2, err+3, err+4, err+5, err+6, err+7};
      // check
      if (vlt0 !== 8'b10100110) begin $display("FAILED -- vlt0 = 'b%b", vlt0); err=1; end
      if (vlt1 !== 8'b10100110) begin $display("FAILED -- vlt1 = 'b%b", vlt1); err=1; end
      if (vlt2 !== 8'b11111111) begin $display("FAILED -- vlt2 = 'b%b", vlt2); err=1; end
      if (vlt3 !== 8'b00100000) begin $display("FAILED -- vlt3 = 'b%b", vlt3); err=1; end
      if (vlt4 !== 8'b01010101) begin $display("FAILED -- vlt4 = 'b%b", vlt4); err=1; end

      if (!err) $display("PASSED");
   end

endmodule // test
