`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir21_1 
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

module dir21_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h3;
            001: spo = 5'h3;
            002: spo = 5'h4;
            003: spo = 5'h4;
            004: spo = 5'h5;
            005: spo = 5'h5;
            006: spo = 5'h6;
            007: spo = 5'h6;
            008: spo = 5'h7;
            009: spo = 5'h7;
            010: spo = 5'h8;
            011: spo = 5'h8;
            012: spo = 5'h9;
            013: spo = 5'h9;
            014: spo = 5'ha;
            015: spo = 5'ha;
            016: spo = 5'h2;
            017: spo = 5'h3;
            018: spo = 5'h3;
            019: spo = 5'h4;
            020: spo = 5'h4;
            021: spo = 5'h5;
            022: spo = 5'h5;
            023: spo = 5'h6;
            024: spo = 5'h6;
            025: spo = 5'h7;
            026: spo = 5'h7;
            027: spo = 5'h8;
            028: spo = 5'h8;
            029: spo = 5'h9;
            030: spo = 5'h9;
            031: spo = 5'ha;
            032: spo = 5'h1;
            033: spo = 5'h2;
            034: spo = 5'h2;
            035: spo = 5'h3;
            036: spo = 5'h3;
            037: spo = 5'h4;
            038: spo = 5'h4;
            039: spo = 5'h5;
            040: spo = 5'h5;
            041: spo = 5'h6;
            042: spo = 5'h6;
            043: spo = 5'h7;
            044: spo = 5'h7;
            045: spo = 5'h8;
            046: spo = 5'h8;
            047: spo = 5'h9;
            048: spo = 5'h0;
            049: spo = 5'h1;
            050: spo = 5'h1;
            051: spo = 5'h2;
            052: spo = 5'h2;
            053: spo = 5'h3;
            054: spo = 5'h3;
            055: spo = 5'h4;
            056: spo = 5'h4;
            057: spo = 5'h5;
            058: spo = 5'h5;
            059: spo = 5'h6;
            060: spo = 5'h6;
            061: spo = 5'h7;
            062: spo = 5'h7;
            063: spo = 5'h8;
            064: spo = 5'h1f;
            065: spo = 5'h0;
            066: spo = 5'h0;
            067: spo = 5'h1;
            068: spo = 5'h1;
            069: spo = 5'h2;
            070: spo = 5'h2;
            071: spo = 5'h3;
            072: spo = 5'h3;
            073: spo = 5'h4;
            074: spo = 5'h4;
            075: spo = 5'h5;
            076: spo = 5'h5;
            077: spo = 5'h6;
            078: spo = 5'h6;
            079: spo = 5'h7;
            080: spo = 5'h1f;
            081: spo = 5'h1f;
            082: spo = 5'h0;
            083: spo = 5'h0;
            084: spo = 5'h1;
            085: spo = 5'h1;
            086: spo = 5'h2;
            087: spo = 5'h2;
            088: spo = 5'h3;
            089: spo = 5'h3;
            090: spo = 5'h4;
            091: spo = 5'h4;
            092: spo = 5'h5;
            093: spo = 5'h5;
            094: spo = 5'h6;
            095: spo = 5'h6;
            096: spo = 5'h1e;
            097: spo = 5'h1e;
            098: spo = 5'h1f;
            099: spo = 5'h1f;
            100: spo = 5'h0;
            101: spo = 5'h0;
            102: spo = 5'h1;
            103: spo = 5'h1;
            104: spo = 5'h2;
            105: spo = 5'h2;
            106: spo = 5'h3;
            107: spo = 5'h3;
            108: spo = 5'h4;
            109: spo = 5'h4;
            110: spo = 5'h5;
            111: spo = 5'h5;
            112: spo = 5'h1d;
            113: spo = 5'h1d;
            114: spo = 5'h1e;
            115: spo = 5'h1e;
            116: spo = 5'h1f;
            117: spo = 5'h1f;
            118: spo = 5'h0;
            119: spo = 5'h0;
            120: spo = 5'h1;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h2;
            124: spo = 5'h3;
            125: spo = 5'h3;
            126: spo = 5'h4;
            127: spo = 5'h4;
            128: spo = 5'h1c;
            129: spo = 5'h1c;
            130: spo = 5'h1d;
            131: spo = 5'h1d;
            132: spo = 5'h1e;
            133: spo = 5'h1e;
            134: spo = 5'h1f;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h1;
            139: spo = 5'h2;
            140: spo = 5'h2;
            141: spo = 5'h3;
            142: spo = 5'h3;
            143: spo = 5'h4;
            144: spo = 5'h1b;
            145: spo = 5'h1c;
            146: spo = 5'h1c;
            147: spo = 5'h1d;
            148: spo = 5'h1d;
            149: spo = 5'h1e;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h1f;
            153: spo = 5'h0;
            154: spo = 5'h0;
            155: spo = 5'h1;
            156: spo = 5'h1;
            157: spo = 5'h2;
            158: spo = 5'h2;
            159: spo = 5'h3;
            160: spo = 5'h1a;
            161: spo = 5'h1b;
            162: spo = 5'h1b;
            163: spo = 5'h1c;
            164: spo = 5'h1c;
            165: spo = 5'h1d;
            166: spo = 5'h1d;
            167: spo = 5'h1e;
            168: spo = 5'h1e;
            169: spo = 5'h1f;
            170: spo = 5'h1f;
            171: spo = 5'h0;
            172: spo = 5'h0;
            173: spo = 5'h1;
            174: spo = 5'h1;
            175: spo = 5'h2;
            176: spo = 5'h19;
            177: spo = 5'h1a;
            178: spo = 5'h1a;
            179: spo = 5'h1b;
            180: spo = 5'h1b;
            181: spo = 5'h1c;
            182: spo = 5'h1c;
            183: spo = 5'h1d;
            184: spo = 5'h1d;
            185: spo = 5'h1e;
            186: spo = 5'h1e;
            187: spo = 5'h1f;
            188: spo = 5'h1f;
            189: spo = 5'h0;
            190: spo = 5'h0;
            191: spo = 5'h1;
            192: spo = 5'h19;
            193: spo = 5'h19;
            194: spo = 5'h1a;
            195: spo = 5'h1a;
            196: spo = 5'h1b;
            197: spo = 5'h1b;
            198: spo = 5'h1c;
            199: spo = 5'h1c;
            200: spo = 5'h1d;
            201: spo = 5'h1d;
            202: spo = 5'h1e;
            203: spo = 5'h1e;
            204: spo = 5'h1f;
            205: spo = 5'h1f;
            206: spo = 5'h0;
            207: spo = 5'h0;
            208: spo = 5'h18;
            209: spo = 5'h18;
            210: spo = 5'h19;
            211: spo = 5'h19;
            212: spo = 5'h1a;
            213: spo = 5'h1a;
            214: spo = 5'h1b;
            215: spo = 5'h1b;
            216: spo = 5'h1c;
            217: spo = 5'h1c;
            218: spo = 5'h1d;
            219: spo = 5'h1d;
            220: spo = 5'h1e;
            221: spo = 5'h1e;
            222: spo = 5'h1f;
            223: spo = 5'h1f;
            224: spo = 5'h17;
            225: spo = 5'h17;
            226: spo = 5'h18;
            227: spo = 5'h18;
            228: spo = 5'h19;
            229: spo = 5'h19;
            230: spo = 5'h1a;
            231: spo = 5'h1a;
            232: spo = 5'h1b;
            233: spo = 5'h1b;
            234: spo = 5'h1c;
            235: spo = 5'h1c;
            236: spo = 5'h1d;
            237: spo = 5'h1d;
            238: spo = 5'h1e;
            239: spo = 5'h1e;
            240: spo = 5'h16;
            241: spo = 5'h16;
            242: spo = 5'h17;
            243: spo = 5'h17;
            244: spo = 5'h18;
            245: spo = 5'h18;
            246: spo = 5'h19;
            247: spo = 5'h19;
            248: spo = 5'h1a;
            249: spo = 5'h1a;
            250: spo = 5'h1b;
            251: spo = 5'h1b;
            252: spo = 5'h1c;
            253: spo = 5'h1c;
            254: spo = 5'h1d;
            255: spo = 5'h1d;
            default: spo = 5'h0;
		endcase
	end
endmodule