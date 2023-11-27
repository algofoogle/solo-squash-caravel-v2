module user_project_wrapper (user_clock2,
    vdd,
    vss,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vdd;
 input vss;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [63:0] la_data_in;
 output [63:0] la_data_out;
 input [63:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;


 solo_squash_caravel_gf180 solo_squash_caravel_gf180 (.blue(io_out[15]),
    .debug_design_reset(io_out[19]),
    .debug_gpio_ready(io_out[20]),
    .down_key_n(io_in[11]),
    .ext_reset_n(io_in[8]),
    .gpio_ready(la_data_in[0]),
    .green(io_out[14]),
    .hsync(io_out[16]),
    .new_game_n(io_in[10]),
    .pause_n(io_in[9]),
    .red(io_out[13]),
    .speaker(io_out[18]),
    .up_key_n(io_in[12]),
    .vdd(vdd),
    .vss(vss),
    .vsync(io_out[17]),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .io_oeb({io_oeb[37],
    io_oeb[36],
    io_oeb[35],
    io_oeb[34],
    io_oeb[33],
    io_oeb[32],
    io_oeb[31],
    io_oeb[30],
    io_oeb[29],
    io_oeb[28],
    io_oeb[27],
    io_oeb[26],
    io_oeb[25],
    io_oeb[24],
    io_oeb[23],
    io_oeb[22],
    io_oeb[21],
    io_oeb[20],
    io_oeb[19],
    io_oeb[18],
    io_oeb[17],
    io_oeb[16],
    io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12],
    io_oeb[11],
    io_oeb[10],
    io_oeb[9],
    io_oeb[8],
    io_oeb[7],
    io_oeb[6],
    io_oeb[5],
    io_oeb[4],
    io_oeb[3],
    io_oeb[2],
    io_oeb[1],
    io_oeb[0]}));
endmodule
