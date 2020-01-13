module pciecfg
	import pciecfg_pkg::*;
(
	input wire clk,
	input wire rst,

	// data input
	input wire fifo_pciecfg_i_wr_en,
	output wire fifo_pciecfg_i_full,
	input FIFO_PCIECFG_T fifo_pciecfg_i_din,

	// data output
	input wire fifo_pciecfg_o_rd_en,
	output wire fifo_pciecfg_o_empty,
	output FIFO_PCIECFG_T fifo_pciecfg_o_dout
);

wire fifo_pciecfg_i_rd_en;
wire fifo_pciecfg_i_empty;
FIFO_PCIECFG_T fifo_pciecfg_i_dout;

wire fifo_pciecfg_o_wr_en;
wire fifo_pciecfg_o_full;
FIFO_PCIECFG_T fifo_pciecfg_o_din;

fifo_pciecfg fifo_pciecfg_in (
	.wr_en(fifo_pciecfg_i_wr_en),
	.full (fifo_pciecfg_i_full),
	.din  (fifo_pciecfg_i_din),

	.rd_en(fifo_pciecfg_i_rd_en),
	.empty(fifo_pciecfg_i_empty),
	.dout (fifo_pciecfg_i_dout),

	.*
);

pciecfg_core pciecfg_core0 (
	// data input
	.fifo_pciecfg_i_rd_en(fifo_pciecfg_i_rd_en),
	.fifo_pciecfg_i_empty(fifo_pciecfg_i_empty),
	.fifo_pciecfg_i_dout (fifo_pciecfg_i_dout),

	// data output
	.fifo_pciecfg_o_wr_en(fifo_pciecfg_o_wr_en),
	.fifo_pciecfg_o_full (fifo_pciecfg_o_full),
	.fifo_pciecfg_o_din  (fifo_pciecfg_o_din),

	.*
);

fifo_pciecfg fifo_pciecfg_out (
	.wr_en(fifo_pciecfg_o_wr_en),
	.full (fifo_pciecfg_o_full),
	.din  (fifo_pciecfg_o_din),

	.rd_en(fifo_pciecfg_o_rd_en),
	.empty(fifo_pciecfg_o_empty),
	.dout (fifo_pciecfg_o_dout),

	.*
);

endmodule
