`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir23_1 
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

module dir23_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h1f;
            001: spo = 5'h0;
            002: spo = 5'h1;
            003: spo = 5'h1;
            004: spo = 5'h2;
            005: spo = 5'h3;
            006: spo = 5'h4;
            007: spo = 5'h4;
            008: spo = 5'h5;
            009: spo = 5'h6;
            010: spo = 5'h7;
            011: spo = 5'h7;
            012: spo = 5'h8;
            013: spo = 5'h9;
            014: spo = 5'ha;
            015: spo = 5'hb;
            016: spo = 5'h1e;
            017: spo = 5'h1f;
            018: spo = 5'h0;
            019: spo = 5'h1;
            020: spo = 5'h1;
            021: spo = 5'h2;
            022: spo = 5'h3;
            023: spo = 5'h4;
            024: spo = 5'h4;
            025: spo = 5'h5;
            026: spo = 5'h6;
            027: spo = 5'h7;
            028: spo = 5'h8;
            029: spo = 5'h8;
            030: spo = 5'h9;
            031: spo = 5'ha;
            032: spo = 5'h1e;
            033: spo = 5'h1e;
            034: spo = 5'h1f;
            035: spo = 5'h0;
            036: spo = 5'h1;
            037: spo = 5'h2;
            038: spo = 5'h2;
            039: spo = 5'h3;
            040: spo = 5'h4;
            041: spo = 5'h5;
            042: spo = 5'h5;
            043: spo = 5'h6;
            044: spo = 5'h7;
            045: spo = 5'h8;
            046: spo = 5'h8;
            047: spo = 5'h9;
            048: spo = 5'h1d;
            049: spo = 5'h1e;
            050: spo = 5'h1f;
            051: spo = 5'h1f;
            052: spo = 5'h0;
            053: spo = 5'h1;
            054: spo = 5'h2;
            055: spo = 5'h2;
            056: spo = 5'h3;
            057: spo = 5'h4;
            058: spo = 5'h5;
            059: spo = 5'h6;
            060: spo = 5'h6;
            061: spo = 5'h7;
            062: spo = 5'h8;
            063: spo = 5'h9;
            064: spo = 5'h1c;
            065: spo = 5'h1d;
            066: spo = 5'h1e;
            067: spo = 5'h1f;
            068: spo = 5'h0;
            069: spo = 5'h0;
            070: spo = 5'h1;
            071: spo = 5'h2;
            072: spo = 5'h3;
            073: spo = 5'h3;
            074: spo = 5'h4;
            075: spo = 5'h5;
            076: spo = 5'h6;
            077: spo = 5'h6;
            078: spo = 5'h7;
            079: spo = 5'h8;
            080: spo = 5'h1c;
            081: spo = 5'h1d;
            082: spo = 5'h1d;
            083: spo = 5'h1e;
            084: spo = 5'h1f;
            085: spo = 5'h0;
            086: spo = 5'h0;
            087: spo = 5'h1;
            088: spo = 5'h2;
            089: spo = 5'h3;
            090: spo = 5'h3;
            091: spo = 5'h4;
            092: spo = 5'h5;
            093: spo = 5'h6;
            094: spo = 5'h7;
            095: spo = 5'h7;
            096: spo = 5'h1b;
            097: spo = 5'h1c;
            098: spo = 5'h1d;
            099: spo = 5'h1d;
            100: spo = 5'h1e;
            101: spo = 5'h1f;
            102: spo = 5'h0;
            103: spo = 5'h1;
            104: spo = 5'h1;
            105: spo = 5'h2;
            106: spo = 5'h3;
            107: spo = 5'h4;
            108: spo = 5'h4;
            109: spo = 5'h5;
            110: spo = 5'h6;
            111: spo = 5'h7;
            112: spo = 5'h1b;
            113: spo = 5'h1b;
            114: spo = 5'h1c;
            115: spo = 5'h1d;
            116: spo = 5'h1e;
            117: spo = 5'h1e;
            118: spo = 5'h1f;
            119: spo = 5'h0;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h3;
            124: spo = 5'h4;
            125: spo = 5'h4;
            126: spo = 5'h5;
            127: spo = 5'h6;
            128: spo = 5'h1a;
            129: spo = 5'h1b;
            130: spo = 5'h1b;
            131: spo = 5'h1c;
            132: spo = 5'h1d;
            133: spo = 5'h1e;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h2;
            140: spo = 5'h3;
            141: spo = 5'h4;
            142: spo = 5'h5;
            143: spo = 5'h5;
            144: spo = 5'h19;
            145: spo = 5'h1a;
            146: spo = 5'h1b;
            147: spo = 5'h1c;
            148: spo = 5'h1c;
            149: spo = 5'h1d;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h0;
            154: spo = 5'h1;
            155: spo = 5'h2;
            156: spo = 5'h2;
            157: spo = 5'h3;
            158: spo = 5'h4;
            159: spo = 5'h5;
            160: spo = 5'h19;
            161: spo = 5'h19;
            162: spo = 5'h1a;
            163: spo = 5'h1b;
            164: spo = 5'h1c;
            165: spo = 5'h1c;
            166: spo = 5'h1d;
            167: spo = 5'h1e;
            168: spo = 5'h1f;
            169: spo = 5'h1f;
            170: spo = 5'h0;
            171: spo = 5'h1;
            172: spo = 5'h2;
            173: spo = 5'h3;
            174: spo = 5'h3;
            175: spo = 5'h4;
            176: spo = 5'h18;
            177: spo = 5'h19;
            178: spo = 5'h19;
            179: spo = 5'h1a;
            180: spo = 5'h1b;
            181: spo = 5'h1c;
            182: spo = 5'h1d;
            183: spo = 5'h1d;
            184: spo = 5'h1e;
            185: spo = 5'h1f;
            186: spo = 5'h0;
            187: spo = 5'h0;
            188: spo = 5'h1;
            189: spo = 5'h2;
            190: spo = 5'h3;
            191: spo = 5'h3;
            192: spo = 5'h17;
            193: spo = 5'h18;
            194: spo = 5'h19;
            195: spo = 5'h1a;
            196: spo = 5'h1a;
            197: spo = 5'h1b;
            198: spo = 5'h1c;
            199: spo = 5'h1d;
            200: spo = 5'h1d;
            201: spo = 5'h1e;
            202: spo = 5'h1f;
            203: spo = 5'h0;
            204: spo = 5'h0;
            205: spo = 5'h1;
            206: spo = 5'h2;
            207: spo = 5'h3;
            208: spo = 5'h17;
            209: spo = 5'h17;
            210: spo = 5'h18;
            211: spo = 5'h19;
            212: spo = 5'h1a;
            213: spo = 5'h1a;
            214: spo = 5'h1b;
            215: spo = 5'h1c;
            216: spo = 5'h1d;
            217: spo = 5'h1e;
            218: spo = 5'h1e;
            219: spo = 5'h1f;
            220: spo = 5'h0;
            221: spo = 5'h1;
            222: spo = 5'h1;
            223: spo = 5'h2;
            224: spo = 5'h16;
            225: spo = 5'h17;
            226: spo = 5'h18;
            227: spo = 5'h18;
            228: spo = 5'h19;
            229: spo = 5'h1a;
            230: spo = 5'h1b;
            231: spo = 5'h1b;
            232: spo = 5'h1c;
            233: spo = 5'h1d;
            234: spo = 5'h1e;
            235: spo = 5'h1e;
            236: spo = 5'h1f;
            237: spo = 5'h0;
            238: spo = 5'h1;
            239: spo = 5'h2;
            240: spo = 5'h15;
            241: spo = 5'h16;
            242: spo = 5'h17;
            243: spo = 5'h18;
            244: spo = 5'h18;
            245: spo = 5'h19;
            246: spo = 5'h1a;
            247: spo = 5'h1b;
            248: spo = 5'h1c;
            249: spo = 5'h1c;
            250: spo = 5'h1d;
            251: spo = 5'h1e;
            252: spo = 5'h1f;
            253: spo = 5'h1f;
            254: spo = 5'h0;
            255: spo = 5'h1;
            default: spo = 5'h0;
		endcase
	end
endmodule