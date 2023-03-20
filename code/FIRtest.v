`timescale 1ns / 1ps

module FIRtest(clk,rst,x,dataout);
    input signed [12:0]x;
    input clk,rst;
    output signed [12:0]dataout;

    wire signed [25:0]m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25,m26,m27,m28,m29,m30,m31,m32,m33,m34;
    wire signed [12:0]d_1,d_2,d_3,d_4,d_5,d_6,d_7,d_8,d_9,d_10,d_11,d_12,d_13,d_14,d_15,d_16,d_17,d_18,d_19,d_20,d_21,d_22,d_23,d_24,d_25,d_26,d_27,d_28,d_29,d_30,d_31,d_32,d_33;
    wire signed [25:0]d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,d17,d18,d19,d20,d21,d22,d23,d24,d25,d26,d27,d28,d29,d30,d31,d32;
    wire signed [25:0] datasave;
    wire signed [12:0] dp_1,dp_2,dp_3,dp_4,dp_5,dp_6,dp_7,dp_8,dp_9,dp_10,dp_11,dp_12,dp_13,dp_14,dp_15,dp_16,dp_17,dp_18,dp_19,dp_20,dp_21,dp_22,dp_23,dp_24,dp_25,dp_26,dp_27,dp_28,dp_29,dp_30,dp_31,dp_32,dp_33;
    wire signed [25:0] dpa_1,dpa_2,dpa_3,dpa_4,dpa_5,dpa_6,dpa_7,dpa_8,dpa_9,dpa_10,dpa_11,dpa_12,dpa_13,dpa_14,dpa_15,dpa_16,dpa_17,dpa_18,dpa_19,dpa_20,dpa_21,dpa_22,dpa_23,dpa_24,dpa_25,dpa_26,dpa_27,dpa_28,dpa_29,dpa_30,dpa_31,dpa_32,dpa_33;
    
    reg signed [12:0] h0 = -13'd7;
    reg signed [12:0] h1 = 13'd13;
    reg signed [12:0] h2 = 13'd15;
    reg signed [12:0] h3 = -13'd6;
    reg signed [12:0] h4 = -13'd25;
    reg signed [12:0] h5 = -13'd2;
    reg signed [12:0] h6 = 13'd36;
    reg signed [12:0] h7 = 13'd19;
    reg signed [12:0] h8 = -13'd44;
    reg signed [12:0] h9 = -13'd51;
    reg signed [12:0] h10 = 13'd41;
    reg signed [12:0] h11 = 13'd98;
    reg signed [12:0] h12 = -13'd16;
    reg signed [12:0] h13 = -13'd176;
    reg signed [12:0] h14 = -13'd72;
    reg signed [12:0] h15 = 13'd380;
    reg signed [12:0] h16 = 13'd824;
                                 
    multi mu1(clk,rst,h0,x,m1);
    dff u1(clk,rst,x,d_1);
    dff up1(clk,rst,d_1,dp_1);// pipeline
    dff_25bit upa1(clk,rst,m1,dpa_1); // pipeline    
    
    multi mu2(clk,rst,h1,dp_1,m2);  
    adder ad1(clk,rst,dpa_1,m2,d1);
     
    dff u2(clk,rst,d_1,d_2);
    dff up2(clk,rst,d_2,dp_2);// pipeline
    dff_25bit upa2(clk,rst,d1,dpa_2); // pipeline    
    
    multi mu3(clk,rst,h2,dp_2,m3);
    adder ad2(clk,rst,dpa_2,m3,d2);
    
    dff u3(clk,rst,d_2,d_3);
    dff up3(clk,rst,d_3,dp_3);// pipeline
    dff_25bit upa3(clk,rst,d2,dpa_3); // pipeline    

    multi mu4(clk,rst,h3,dp_3,m4);
    adder ad3(clk,rst,dpa_3,m4,d3);
    
    dff u4(clk,rst,d_3,d_4);
    dff up4(clk,rst,d_4,dp_4);// pipeline
    dff_25bit upa4(clk,rst,d3,dpa_4); // pipeline    

    multi mu5(clk,rst,h4,dp_4,m5);
    adder ad4(clk,rst,dpa_4,m5,d4);
    
    dff u5(clk,rst,d_4,d_5);
    dff up5(clk,rst,d_5,dp_5);// pipeline
    dff_25bit upa5(clk,rst,d4,dpa_5); // pipeline    
    
    multi mu6(clk,rst,h5,dp_5,m6);
    adder ad5(clk,rst,dpa_5,m6,d5);
    
    dff u6(clk,rst,d_5,d_6);
    dff up6(clk,rst,d_6,dp_6);// pipeline
    dff_25bit upa6(clk,rst,d5,dpa_6); // pipeline    
    
    multi mu7(clk,rst,h6,dp_6,m7);   
    adder ad6(clk,rst,dpa_6,m7,d6);
    
    dff u7(clk,rst,d_6,d_7);
    dff up7(clk,rst,d_7,dp_7);// pipeline
    dff_25bit upa7(clk,rst,d6,dpa_7); // pipeline    
    
    multi mu8(clk,rst,h7,dp_7,m8);   
    adder ad7(clk,rst,dpa_7,m8,d7);
    
    dff u8(clk,rst,d_7,d_8);
    dff up8(clk,rst,d_8,dp_8);// pipeline
    dff_25bit upa8(clk,rst,d7,dpa_8); // pipeline    
    
    multi mu9(clk,rst,h8,dp_8,m9);
    adder ad8(clk,rst,dpa_8,m9,d8);
    
    dff u9(clk,rst,d_8,d_9);
    dff up9(clk,rst,d_9,dp_9);// pipeline
    dff_25bit upa9(clk,rst,d8,dpa_9); // pipeline    
    
    multi mu10(clk,rst,h9,dp_9,m10);
    adder ad9(clk,rst,dpa_9,m10,d9);
    
    dff u10(clk,rst,d_9,d_10);
    dff up10(clk,rst,d_10,dp_10);// pipeline
    dff_25bit upa10(clk,rst,d9,dpa_10); // pipeline    
    
    multi mu11(clk,rst,h10,dp_10,m11);    
    adder ad10(clk,rst,dpa_10,m11,d10);
    
    dff u11(clk,rst,d_10,d_11);
    dff up11(clk,rst,d_11,dp_11);// pipeline
    dff_25bit upa11(clk,rst,d10,dpa_11); // pipeline    
    
    multi mu12(clk,rst,h11,dp_11,m12);
    adder ad11(clk,rst,dpa_11,m12,d11);
    
    dff u12(clk,rst,d_11,d_12);
    dff up12(clk,rst,d_12,dp_12);// pipeline
    dff_25bit upa12(clk,rst,d11,dpa_12); // pipeline    
    
    multi mu13(clk,rst,h12,dp_12,m13);
    adder ad12(clk,rst,dpa_12,m13,d12);
    
    dff u13(clk,rst,d_12,d_13);
    dff up13(clk,rst,d_13,dp_13);// pipeline
    dff_25bit upa13(clk,rst,d12,dpa_13); // pipeline    
    
    multi mu14(clk,rst,h13,dp_13,m14);
    adder ad13(clk,rst,dpa_13,m14,d13);
    
    dff u14(clk,rst,d_13,d_14);
    dff up14(clk,rst,d_14,dp_14);// pipeline
    dff_25bit upa14(clk,rst,d13,dpa_14); // pipeline    
    
    multi mu15(clk,rst,h14,dp_14,m15);
    adder ad14(clk,rst,dpa_14,m15,d14);
    
    dff u15(clk,rst,d_14,d_15);
    dff up15(clk,rst,d_15,dp_15);// pipeline
    dff_25bit upa15(clk,rst,d14,dpa_15); // pipeline    
    
    multi mu16(clk,rst,h15,dp_15,m16);
    adder ad15(clk,rst,dpa_15,m16,d15);
    
    dff u16(clk,rst,d_15,d_16);
    dff up16(clk,rst,d_16,dp_16);// pipeline
    dff_25bit upa16(clk,rst,d15,dpa_16); // pipeline    
    
    multi mu17(clk,rst,h16,dp_16,m17);
    adder ad16(clk,rst,dpa_16,m17,d16);
    
    dff u17(clk,rst,d_16,d_17);
    dff up17(clk,rst,d_17,dp_17);// pipeline
    dff_25bit upa17(clk,rst,d16,dpa_17); // pipeline    
    
    multi mu18(clk,rst,h16,dp_17,m18);
    adder ad17(clk,rst,dpa_17,m18,d17);
    
    dff u18(clk,rst,d_17,d_18);
    dff up18(clk,rst,d_18,dp_18);// pipeline
    dff_25bit upa18(clk,rst,d17,dpa_18); // pipeline    
    
    multi mu19(clk,rst,h15,dp_18,m19);
    adder ad18(clk,rst,dpa_18,m19,d18);
    
    dff u19(clk,rst,d_18,d_19);
    dff up19(clk,rst,d_19,dp_19);// pipeline
    dff_25bit upa19(clk,rst,d18,dpa_19); // pipeline    
    
    multi mu20(clk,rst,h14,dp_19,m20);
    adder ad19(clk,rst,dpa_19,m20,d19);
    
    dff u20(clk,rst,d_19,d_20);
    dff up20(clk,rst,d_20,dp_20);// pipeline
    dff_25bit upa20(clk,rst,d19,dpa_20); // pipeline    
    
    multi mu21(clk,rst,h13,dp_20,m21);
    adder ad20(clk,rst,dpa_20,m21,d20);
    
    dff u21(clk,rst,d_20,d_21);
    dff up21(clk,rst,d_21,dp_21);// pipeline
    dff_25bit upa21(clk,rst,d20,dpa_21); // pipeline    
    
    multi mu22(clk,rst,h12,dp_21,m22);
    adder ad21(clk,rst,dpa_21,m22,d21);
    
    dff u22(clk,rst,d_21,d_22);
    dff up22(clk,rst,d_22,dp_22);// pipeline
    dff_25bit upa22(clk,rst,d21,dpa_22); // pipeline    
    
    multi mu23(clk,rst,h11,dp_22,m23);
    adder ad22(clk,rst,dpa_22,m23,d22);
    
    dff u23(clk,rst,d_22,d_23);
    dff up23(clk,rst,d_23,dp_23);// pipeline
    dff_25bit upa23(clk,rst,d22,dpa_23); // pipeline    
    
    multi mu24(clk,rst,h10,dp_23,m24);
    adder ad23(clk,rst,dpa_23,m24,d23);
    
    dff u24(clk,rst,d_23,d_24);
    dff up24(clk,rst,d_24,dp_24);// pipeline
    dff_25bit upa24(clk,rst,d23,dpa_24); // pipeline    
    
    multi mu25(clk,rst,h9,dp_24,m25);
    adder ad24(clk,rst,dpa_24,m25,d24);
    
    dff u25(clk,rst,d_24,d_25);
    dff up25(clk,rst,d_25,dp_25);// pipeline
    dff_25bit upa25(clk,rst,d24,dpa_25); // pipeline    
    
    multi mu26(clk,rst,h8,dp_25,m26);
    adder ad25(clk,rst,dpa_25,m26,d25);
    
    dff u26(clk,rst,d_25,d_26);
    dff up26(clk,rst,d_26,dp_26);// pipeline
    dff_25bit upa26(clk,rst,d25,dpa_26); // pipeline    
    
    multi mu27(clk,rst,h7,dp_26,m27);
    adder ad26(clk,rst,dpa_26,m27,d26);
    
    dff u27(clk,rst,d_26,d_27);
    dff up27(clk,rst,d_27,dp_27);// pipeline
    dff_25bit upa27(clk,rst,d26,dpa_27); // pipeline    
    
    multi mu28(clk,rst,h6,dp_27,m28);
    adder ad27(clk,rst,dpa_27,m28,d27);
    
    dff u28(clk,rst,d_27,d_28);
    dff up28(clk,rst,d_28,dp_28);// pipeline
    dff_25bit upa28(clk,rst,d27,dpa_28); // pipeline    
    
    multi mu29(clk,rst,h5,dp_28,m29);
    adder ad28(clk,rst,dpa_28,m29,d28);
    
    dff u29(clk,rst,d_28,d_29);
    dff up29(clk,rst,d_29,dp_29);// pipeline
    dff_25bit upa29(clk,rst,d28,dpa_29); // pipeline    
    
    multi mu30(clk,rst,h4,dp_29,m30);
    adder ad29(clk,rst,dpa_29,m30,d29);
    
    dff u30(clk,rst,d_29,d_30);
    dff up30(clk,rst,d_30,dp_30);// pipeline
    dff_25bit upa30(clk,rst,d29,dpa_30); // pipeline    
    
    multi mu31(clk,rst,h3,dp_30,m31);
    adder ad30(clk,rst,dpa_30,m31,d30);
    
    dff u31(clk,rst,d_30,d_31);
    dff up31(clk,rst,d_31,dp_31);// pipeline
    dff_25bit upa31(clk,rst,d30,dpa_31); // pipeline    
    
    multi mu32(clk,rst,h2,dp_31,m32);
    adder ad31(clk,rst,dpa_31,m32,d31);
    
    dff u32(clk,rst,d_31,d_32);
    dff up32(clk,rst,d_32,dp_32);// pipeline
    dff_25bit upa32(clk,rst,d31,dpa_32); // pipeline    
    
    multi mu33(clk,rst,h1,dp_32,m33);
    adder ad32(clk,rst,dpa_32,m33,d32);
    
    dff u33(clk,rst,d_32,d_33);
    dff up33(clk,rst,d_33,dp_33);// pipeline
    dff_25bit upa33(clk,rst,d32,dpa_33); // pipeline    
    
    multi mu34(clk,rst,h0,dp_33,m34);
    adder ad33(clk,rst,dpa_33,m34,datasave);
    
    
    assign dataout = datasave >> 11 ;
    
endmodule