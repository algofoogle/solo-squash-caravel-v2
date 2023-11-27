// SPDX-FileCopyrightText: 2023 Anton Maurovic <anton@maurovic.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper (
`ifdef USE_POWER_PINS
    inout vdd,		// User area 5.0V supply
    inout vss,		// User area ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

    solo_squash_caravel_gf180 solo_squash_caravel_gf180(
    `ifdef USE_POWER_PINS
        .vdd(vdd),	// User area 1 1.8V power
        .vss(vss),	// User area 1 digital ground
    `endif
        .wb_clk_i           (wb_clk_i),
        .wb_rst_i           (wb_rst_i),
        .gpio_ready         (la_data_in[0]), // Input from LA controlled by VexRiscv.
        // IO input pads:
        .ext_reset_n        (io_in[8]),
        .pause_n            (io_in[9]),
        .new_game_n         (io_in[10]),
        .down_key_n         (io_in[11]),
        .up_key_n           (io_in[12]),
        // IO output pads:
        .red                (io_out[13]),
        .green              (io_out[14]),
        .blue               (io_out[15]),
        .hsync              (io_out[16]),
        .vsync              (io_out[17]),
        .speaker            (io_out[18]),
        // Debug outputs (also IO pads):
        .debug_design_reset (io_out[19]),
        .debug_gpio_ready   (io_out[20]),
        // OEBs:
        .io_oeb             (io_oeb)
    );

endmodule	// user_project_wrapper

`default_nettype wire
