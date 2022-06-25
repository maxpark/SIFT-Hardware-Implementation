`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir5_2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module dir5_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h15;
            001: spo = 5'h15;
            002: spo = 5'h16;
            003: spo = 5'h17;
            004: spo = 5'h17;
            005: spo = 5'h18;
            006: spo = 5'h19;
            007: spo = 5'h19;
            008: spo = 5'h1a;
            009: spo = 5'h1b;
            010: spo = 5'h1b;
            011: spo = 5'h1c;
            012: spo = 5'h1c;
            013: spo = 5'h1d;
            014: spo = 5'h1e;
            015: spo = 5'h1e;
            016: spo = 5'h15;
            017: spo = 5'h16;
            018: spo = 5'h17;
            019: spo = 5'h17;
            020: spo = 5'h18;
            021: spo = 5'h19;
            022: spo = 5'h19;
            023: spo = 5'h1a;
            024: spo = 5'h1b;
            025: spo = 5'h1b;
            026: spo = 5'h1c;
            027: spo = 5'h1d;
            028: spo = 5'h1d;
            029: spo = 5'h1e;
            030: spo = 5'h1e;
            031: spo = 5'h1f;
            032: spo = 5'h16;
            033: spo = 5'h17;
            034: spo = 5'h18;
            035: spo = 5'h18;
            036: spo = 5'h19;
            037: spo = 5'h19;
            038: spo = 5'h1a;
            039: spo = 5'h1b;
            040: spo = 5'h1b;
            041: spo = 5'h1c;
            042: spo = 5'h1d;
            043: spo = 5'h1d;
            044: spo = 5'h1e;
            045: spo = 5'h1f;
            046: spo = 5'h1f;
            047: spo = 5'h0;
            048: spo = 5'h17;
            049: spo = 5'h18;
            050: spo = 5'h18;
            051: spo = 5'h19;
            052: spo = 5'h1a;
            053: spo = 5'h1a;
            054: spo = 5'h1b;
            055: spo = 5'h1c;
            056: spo = 5'h1c;
            057: spo = 5'h1d;
            058: spo = 5'h1d;
            059: spo = 5'h1e;
            060: spo = 5'h1f;
            061: spo = 5'h1f;
            062: spo = 5'h0;
            063: spo = 5'h1;
            064: spo = 5'h18;
            065: spo = 5'h18;
            066: spo = 5'h19;
            067: spo = 5'h1a;
            068: spo = 5'h1a;
            069: spo = 5'h1b;
            070: spo = 5'h1c;
            071: spo = 5'h1c;
            072: spo = 5'h1d;
            073: spo = 5'h1e;
            074: spo = 5'h1e;
            075: spo = 5'h1f;
            076: spo = 5'h0;
            077: spo = 5'h0;
            078: spo = 5'h1;
            079: spo = 5'h1;
            080: spo = 5'h19;
            081: spo = 5'h19;
            082: spo = 5'h1a;
            083: spo = 5'h1a;
            084: spo = 5'h1b;
            085: spo = 5'h1c;
            086: spo = 5'h1c;
            087: spo = 5'h1d;
            088: spo = 5'h1e;
            089: spo = 5'h1e;
            090: spo = 5'h1f;
            091: spo = 5'h0;
            092: spo = 5'h0;
            093: spo = 5'h1;
            094: spo = 5'h2;
            095: spo = 5'h2;
            096: spo = 5'h19;
            097: spo = 5'h1a;
            098: spo = 5'h1b;
            099: spo = 5'h1b;
            100: spo = 5'h1c;
            101: spo = 5'h1d;
            102: spo = 5'h1d;
            103: spo = 5'h1e;
            104: spo = 5'h1e;
            105: spo = 5'h1f;
            106: spo = 5'h0;
            107: spo = 5'h0;
            108: spo = 5'h1;
            109: spo = 5'h2;
            110: spo = 5'h2;
            111: spo = 5'h3;
            112: spo = 5'h1a;
            113: spo = 5'h1b;
            114: spo = 5'h1b;
            115: spo = 5'h1c;
            116: spo = 5'h1d;
            117: spo = 5'h1d;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h1f;
            121: spo = 5'h0;
            122: spo = 5'h1;
            123: spo = 5'h1;
            124: spo = 5'h2;
            125: spo = 5'h2;
            126: spo = 5'h3;
            127: spo = 5'h4;
            128: spo = 5'h1b;
            129: spo = 5'h1c;
            130: spo = 5'h1c;
            131: spo = 5'h1d;
            132: spo = 5'h1d;
            133: spo = 5'h1e;
            134: spo = 5'h1f;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h1;
            139: spo = 5'h2;
            140: spo = 5'h3;
            141: spo = 5'h3;
            142: spo = 5'h4;
            143: spo = 5'h4;
            144: spo = 5'h1c;
            145: spo = 5'h1c;
            146: spo = 5'h1d;
            147: spo = 5'h1e;
            148: spo = 5'h1e;
            149: spo = 5'h1f;
            150: spo = 5'h1f;
            151: spo = 5'h0;
            152: spo = 5'h1;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h3;
            156: spo = 5'h3;
            157: spo = 5'h4;
            158: spo = 5'h5;
            159: spo = 5'h5;
            160: spo = 5'h1c;
            161: spo = 5'h1d;
            162: spo = 5'h1e;
            163: spo = 5'h1e;
            164: spo = 5'h1f;
            165: spo = 5'h0;
            166: spo = 5'h0;
            167: spo = 5'h1;
            168: spo = 5'h2;
            169: spo = 5'h2;
            170: spo = 5'h3;
            171: spo = 5'h3;
            172: spo = 5'h4;
            173: spo = 5'h5;
            174: spo = 5'h5;
            175: spo = 5'h6;
            176: spo = 5'h1d;
            177: spo = 5'h1e;
            178: spo = 5'h1e;
            179: spo = 5'h1f;
            180: spo = 5'h0;
            181: spo = 5'h0;
            182: spo = 5'h1;
            183: spo = 5'h2;
            184: spo = 5'h2;
            185: spo = 5'h3;
            186: spo = 5'h4;
            187: spo = 5'h4;
            188: spo = 5'h5;
            189: spo = 5'h6;
            190: spo = 5'h6;
            191: spo = 5'h7;
            192: spo = 5'h1e;
            193: spo = 5'h1f;
            194: spo = 5'h1f;
            195: spo = 5'h0;
            196: spo = 5'h0;
            197: spo = 5'h1;
            198: spo = 5'h2;
            199: spo = 5'h2;
            200: spo = 5'h3;
            201: spo = 5'h4;
            202: spo = 5'h4;
            203: spo = 5'h5;
            204: spo = 5'h6;
            205: spo = 5'h6;
            206: spo = 5'h7;
            207: spo = 5'h8;
            208: spo = 5'h1f;
            209: spo = 5'h1f;
            210: spo = 5'h0;
            211: spo = 5'h1;
            212: spo = 5'h1;
            213: spo = 5'h2;
            214: spo = 5'h3;
            215: spo = 5'h3;
            216: spo = 5'h4;
            217: spo = 5'h4;
            218: spo = 5'h5;
            219: spo = 5'h6;
            220: spo = 5'h6;
            221: spo = 5'h7;
            222: spo = 5'h8;
            223: spo = 5'h8;
            224: spo = 5'h1f;
            225: spo = 5'h0;
            226: spo = 5'h1;
            227: spo = 5'h1;
            228: spo = 5'h2;
            229: spo = 5'h3;
            230: spo = 5'h3;
            231: spo = 5'h4;
            232: spo = 5'h5;
            233: spo = 5'h5;
            234: spo = 5'h6;
            235: spo = 5'h7;
            236: spo = 5'h7;
            237: spo = 5'h8;
            238: spo = 5'h8;
            239: spo = 5'h9;
            240: spo = 5'h0;
            241: spo = 5'h1;
            242: spo = 5'h2;
            243: spo = 5'h2;
            244: spo = 5'h3;
            245: spo = 5'h3;
            246: spo = 5'h4;
            247: spo = 5'h5;
            248: spo = 5'h5;
            249: spo = 5'h6;
            250: spo = 5'h7;
            251: spo = 5'h7;
            252: spo = 5'h8;
            253: spo = 5'h9;
            254: spo = 5'h9;
            255: spo = 5'ha;
            default: spo = 5'h0;
		endcase
	end
endmodule