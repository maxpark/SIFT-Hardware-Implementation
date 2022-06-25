`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir23_2 
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

module dir23_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'hb;
            001: spo = 5'hb;
            002: spo = 5'ha;
            003: spo = 5'h9;
            004: spo = 5'h9;
            005: spo = 5'h8;
            006: spo = 5'h7;
            007: spo = 5'h7;
            008: spo = 5'h6;
            009: spo = 5'h5;
            010: spo = 5'h5;
            011: spo = 5'h4;
            012: spo = 5'h4;
            013: spo = 5'h3;
            014: spo = 5'h2;
            015: spo = 5'h2;
            016: spo = 5'hb;
            017: spo = 5'ha;
            018: spo = 5'h9;
            019: spo = 5'h9;
            020: spo = 5'h8;
            021: spo = 5'h7;
            022: spo = 5'h7;
            023: spo = 5'h6;
            024: spo = 5'h5;
            025: spo = 5'h5;
            026: spo = 5'h4;
            027: spo = 5'h3;
            028: spo = 5'h3;
            029: spo = 5'h2;
            030: spo = 5'h2;
            031: spo = 5'h1;
            032: spo = 5'ha;
            033: spo = 5'h9;
            034: spo = 5'h8;
            035: spo = 5'h8;
            036: spo = 5'h7;
            037: spo = 5'h7;
            038: spo = 5'h6;
            039: spo = 5'h5;
            040: spo = 5'h5;
            041: spo = 5'h4;
            042: spo = 5'h3;
            043: spo = 5'h3;
            044: spo = 5'h2;
            045: spo = 5'h1;
            046: spo = 5'h1;
            047: spo = 5'h0;
            048: spo = 5'h9;
            049: spo = 5'h8;
            050: spo = 5'h8;
            051: spo = 5'h7;
            052: spo = 5'h6;
            053: spo = 5'h6;
            054: spo = 5'h5;
            055: spo = 5'h4;
            056: spo = 5'h4;
            057: spo = 5'h3;
            058: spo = 5'h3;
            059: spo = 5'h2;
            060: spo = 5'h1;
            061: spo = 5'h1;
            062: spo = 5'h0;
            063: spo = 5'h1f;
            064: spo = 5'h8;
            065: spo = 5'h8;
            066: spo = 5'h7;
            067: spo = 5'h6;
            068: spo = 5'h6;
            069: spo = 5'h5;
            070: spo = 5'h4;
            071: spo = 5'h4;
            072: spo = 5'h3;
            073: spo = 5'h2;
            074: spo = 5'h2;
            075: spo = 5'h1;
            076: spo = 5'h0;
            077: spo = 5'h0;
            078: spo = 5'h1f;
            079: spo = 5'h1f;
            080: spo = 5'h7;
            081: spo = 5'h7;
            082: spo = 5'h6;
            083: spo = 5'h6;
            084: spo = 5'h5;
            085: spo = 5'h4;
            086: spo = 5'h4;
            087: spo = 5'h3;
            088: spo = 5'h2;
            089: spo = 5'h2;
            090: spo = 5'h1;
            091: spo = 5'h0;
            092: spo = 5'h0;
            093: spo = 5'h1f;
            094: spo = 5'h1e;
            095: spo = 5'h1e;
            096: spo = 5'h7;
            097: spo = 5'h6;
            098: spo = 5'h5;
            099: spo = 5'h5;
            100: spo = 5'h4;
            101: spo = 5'h3;
            102: spo = 5'h3;
            103: spo = 5'h2;
            104: spo = 5'h2;
            105: spo = 5'h1;
            106: spo = 5'h0;
            107: spo = 5'h0;
            108: spo = 5'h1f;
            109: spo = 5'h1e;
            110: spo = 5'h1e;
            111: spo = 5'h1d;
            112: spo = 5'h6;
            113: spo = 5'h5;
            114: spo = 5'h5;
            115: spo = 5'h4;
            116: spo = 5'h3;
            117: spo = 5'h3;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h0;
            122: spo = 5'h1f;
            123: spo = 5'h1f;
            124: spo = 5'h1e;
            125: spo = 5'h1e;
            126: spo = 5'h1d;
            127: spo = 5'h1c;
            128: spo = 5'h5;
            129: spo = 5'h4;
            130: spo = 5'h4;
            131: spo = 5'h3;
            132: spo = 5'h3;
            133: spo = 5'h2;
            134: spo = 5'h1;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1f;
            139: spo = 5'h1e;
            140: spo = 5'h1d;
            141: spo = 5'h1d;
            142: spo = 5'h1c;
            143: spo = 5'h1c;
            144: spo = 5'h4;
            145: spo = 5'h4;
            146: spo = 5'h3;
            147: spo = 5'h2;
            148: spo = 5'h2;
            149: spo = 5'h1;
            150: spo = 5'h1;
            151: spo = 5'h0;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1d;
            156: spo = 5'h1d;
            157: spo = 5'h1c;
            158: spo = 5'h1b;
            159: spo = 5'h1b;
            160: spo = 5'h4;
            161: spo = 5'h3;
            162: spo = 5'h2;
            163: spo = 5'h2;
            164: spo = 5'h1;
            165: spo = 5'h0;
            166: spo = 5'h0;
            167: spo = 5'h1f;
            168: spo = 5'h1e;
            169: spo = 5'h1e;
            170: spo = 5'h1d;
            171: spo = 5'h1d;
            172: spo = 5'h1c;
            173: spo = 5'h1b;
            174: spo = 5'h1b;
            175: spo = 5'h1a;
            176: spo = 5'h3;
            177: spo = 5'h2;
            178: spo = 5'h2;
            179: spo = 5'h1;
            180: spo = 5'h0;
            181: spo = 5'h0;
            182: spo = 5'h1f;
            183: spo = 5'h1e;
            184: spo = 5'h1e;
            185: spo = 5'h1d;
            186: spo = 5'h1c;
            187: spo = 5'h1c;
            188: spo = 5'h1b;
            189: spo = 5'h1a;
            190: spo = 5'h1a;
            191: spo = 5'h19;
            192: spo = 5'h2;
            193: spo = 5'h1;
            194: spo = 5'h1;
            195: spo = 5'h0;
            196: spo = 5'h0;
            197: spo = 5'h1f;
            198: spo = 5'h1e;
            199: spo = 5'h1e;
            200: spo = 5'h1d;
            201: spo = 5'h1c;
            202: spo = 5'h1c;
            203: spo = 5'h1b;
            204: spo = 5'h1a;
            205: spo = 5'h1a;
            206: spo = 5'h19;
            207: spo = 5'h18;
            208: spo = 5'h1;
            209: spo = 5'h1;
            210: spo = 5'h0;
            211: spo = 5'h1f;
            212: spo = 5'h1f;
            213: spo = 5'h1e;
            214: spo = 5'h1d;
            215: spo = 5'h1d;
            216: spo = 5'h1c;
            217: spo = 5'h1c;
            218: spo = 5'h1b;
            219: spo = 5'h1a;
            220: spo = 5'h1a;
            221: spo = 5'h19;
            222: spo = 5'h18;
            223: spo = 5'h18;
            224: spo = 5'h1;
            225: spo = 5'h0;
            226: spo = 5'h1f;
            227: spo = 5'h1f;
            228: spo = 5'h1e;
            229: spo = 5'h1d;
            230: spo = 5'h1d;
            231: spo = 5'h1c;
            232: spo = 5'h1b;
            233: spo = 5'h1b;
            234: spo = 5'h1a;
            235: spo = 5'h19;
            236: spo = 5'h19;
            237: spo = 5'h18;
            238: spo = 5'h18;
            239: spo = 5'h17;
            240: spo = 5'h0;
            241: spo = 5'h1f;
            242: spo = 5'h1e;
            243: spo = 5'h1e;
            244: spo = 5'h1d;
            245: spo = 5'h1d;
            246: spo = 5'h1c;
            247: spo = 5'h1b;
            248: spo = 5'h1b;
            249: spo = 5'h1a;
            250: spo = 5'h19;
            251: spo = 5'h19;
            252: spo = 5'h18;
            253: spo = 5'h17;
            254: spo = 5'h17;
            255: spo = 5'h16;
            default: spo = 5'h0;
		endcase
	end
endmodule