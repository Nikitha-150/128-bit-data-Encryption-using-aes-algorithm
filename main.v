`timescale 1ns / 1ps
module main(data, key, en_key);
input [127:0] data, key;
output [127:0] en_key;
wire [127:0] en_key0, en_key1, en_key2, en_key3, en_key4, en_key5, en_key6, en_key7, en_key8;
wire [127:0] s_key0, s_key1, s_key2, s_key3, s_key4, s_key5, s_key6, s_key7, s_key8, s_key9;
wire [127:0] sh_key3, sh_key9;  // Only used in relevant rounds
wire [127:0] mx_key0, mx_key1, mx_key2, mx_key3, mx_key4, mx_key5, mx_key6, mx_key7, mx_key8;
wire [127:0] gen_key0, gen_key1, gen_key2, gen_key3, gen_key4, gen_key5, gen_key6, gen_key7, gen_key8, gen_key9;
wire [127:0] pr_key;

// Pre-round operation
assign pr_key = data ^ key;

// Round 1
sub_byte s0(pr_key, s_key0);
shift_row sh0(s_key0, sh_key0);
mix_col m0(s_key0, mx_key0);
key_gen k0(key, mx_key0, 32'h01000000, gen_key0, en_key0);

// Round 2
sub_byte s1(en_key0, s_key1);
shift_row sh1(s_key1, sh_key1);
mix_col m1(s_key1, mx_key1);
key_gen k1(gen_key0, mx_key1, 32'h02000000, gen_key1, en_key1);

// Round 3
sub_byte s2(en_key1, s_key2);
shift_row sh2(s_key2, sh_key2);
mix_col m2(s_key2, mx_key2);
key_gen k2(gen_key1, mx_key2, 32'h04000000, gen_key2, en_key2);

// Round 4
sub_byte s3(en_key2, s_key3);
shift_row sh3(s_key3, sh_key3);
mix_col m3(sh_key3, mx_key3);
key_gen k3(gen_key2, mx_key3, 32'h08000000, gen_key3, en_key3);

// Round 5
sub_byte s4(en_key3, s_key4);
shift_row sh4(s_key4, sh_key4);
mix_col m4(s_key4, mx_key4);
key_gen k4(gen_key3, mx_key4, 32'h10000000, gen_key4, en_key4);

// Round 6
sub_byte s5(en_key4, s_key5);
shift_row sh5(s_key5, sh_key5);
mix_col m5(s_key5, mx_key5);
key_gen k5(gen_key4, mx_key5, 32'h20000000, gen_key5, en_key5);

// Round 7
sub_byte s6(en_key5, s_key6);
shift_row sh6(s_key6, sh_key6);
mix_col m6(s_key6, mx_key6);
key_gen k6(gen_key5, mx_key6, 32'h40000000, gen_key6, en_key6);

// Round 8
sub_byte s7(en_key6, s_key7);
shift_row sh7(s_key7, sh_key7);
mix_col m7(s_key7, mx_key7);
key_gen k7(gen_key6, mx_key7, 32'h80000000, gen_key7, en_key7);

// Round 9
sub_byte s8(en_key7, s_key8);
shift_row sh8(s_key8, sh_key8);
mix_col m8(s_key8, mx_key8);
key_gen k8(gen_key7, mx_key8, 32'h1b000000, gen_key8, en_key8);

// Final Round
sub_byte s9(en_key8, s_key9);
shift_row sh9(s_key9, sh_key9);
key_gen k9(gen_key8, sh_key9, 32'h36000000, gen_key9, en_key);

endmodule
