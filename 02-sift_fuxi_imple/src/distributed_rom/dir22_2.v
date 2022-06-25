`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir22_2 
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

module dir22_2
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
            004: spo = 5'h8;
            005: spo = 5'h7;
            006: spo = 5'h7;
            007: spo = 5'h6;
            008: spo = 5'h5;
            009: spo = 5'h4;
            010: spo = 5'h4;
            011: spo = 5'h3;
            012: spo = 5'h2;
            013: spo = 5'h1;
            014: spo = 5'h1;
            015: spo = 5'h0;
            016: spo = 5'hb;
            017: spo = 5'ha;
            018: spo = 5'h9;
            019: spo = 5'h8;
            020: spo = 5'h8;
            021: spo = 5'h7;
            022: spo = 5'h6;
            023: spo = 5'h5;
            024: spo = 5'h4;
            025: spo = 5'h4;
            026: spo = 5'h3;
            027: spo = 5'h2;
            028: spo = 5'h1;
            029: spo = 5'h1;
            030: spo = 5'h0;
            031: spo = 5'h1f;
            032: spo = 5'ha;
            033: spo = 5'h9;
            034: spo = 5'h8;
            035: spo = 5'h8;
            036: spo = 5'h7;
            037: spo = 5'h6;
            038: spo = 5'h5;
            039: spo = 5'h5;
            040: spo = 5'h4;
            041: spo = 5'h3;
            042: spo = 5'h2;
            043: spo = 5'h2;
            044: spo = 5'h1;
            045: spo = 5'h0;
            046: spo = 5'h1f;
            047: spo = 5'h1e;
            048: spo = 5'h9;
            049: spo = 5'h9;
            050: spo = 5'h8;
            051: spo = 5'h7;
            052: spo = 5'h6;
            053: spo = 5'h6;
            054: spo = 5'h5;
            055: spo = 5'h4;
            056: spo = 5'h3;
            057: spo = 5'h2;
            058: spo = 5'h2;
            059: spo = 5'h1;
            060: spo = 5'h0;
            061: spo = 5'h1f;
            062: spo = 5'h1f;
            063: spo = 5'h1e;
            064: spo = 5'h9;
            065: spo = 5'h8;
            066: spo = 5'h7;
            067: spo = 5'h6;
            068: spo = 5'h6;
            069: spo = 5'h5;
            070: spo = 5'h4;
            071: spo = 5'h3;
            072: spo = 5'h3;
            073: spo = 5'h2;
            074: spo = 5'h1;
            075: spo = 5'h0;
            076: spo = 5'h0;
            077: spo = 5'h1f;
            078: spo = 5'h1e;
            079: spo = 5'h1d;
            080: spo = 5'h8;
            081: spo = 5'h7;
            082: spo = 5'h7;
            083: spo = 5'h6;
            084: spo = 5'h5;
            085: spo = 5'h4;
            086: spo = 5'h3;
            087: spo = 5'h3;
            088: spo = 5'h2;
            089: spo = 5'h1;
            090: spo = 5'h0;
            091: spo = 5'h0;
            092: spo = 5'h1f;
            093: spo = 5'h1e;
            094: spo = 5'h1d;
            095: spo = 5'h1d;
            096: spo = 5'h7;
            097: spo = 5'h7;
            098: spo = 5'h6;
            099: spo = 5'h5;
            100: spo = 5'h4;
            101: spo = 5'h4;
            102: spo = 5'h3;
            103: spo = 5'h2;
            104: spo = 5'h1;
            105: spo = 5'h1;
            106: spo = 5'h0;
            107: spo = 5'h1f;
            108: spo = 5'h1e;
            109: spo = 5'h1d;
            110: spo = 5'h1d;
            111: spo = 5'h1c;
            112: spo = 5'h7;
            113: spo = 5'h6;
            114: spo = 5'h5;
            115: spo = 5'h4;
            116: spo = 5'h4;
            117: spo = 5'h3;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h1;
            121: spo = 5'h0;
            122: spo = 5'h1f;
            123: spo = 5'h1e;
            124: spo = 5'h1e;
            125: spo = 5'h1d;
            126: spo = 5'h1c;
            127: spo = 5'h1b;
            128: spo = 5'h6;
            129: spo = 5'h5;
            130: spo = 5'h5;
            131: spo = 5'h4;
            132: spo = 5'h3;
            133: spo = 5'h2;
            134: spo = 5'h2;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1e;
            139: spo = 5'h1e;
            140: spo = 5'h1d;
            141: spo = 5'h1c;
            142: spo = 5'h1b;
            143: spo = 5'h1b;
            144: spo = 5'h5;
            145: spo = 5'h5;
            146: spo = 5'h4;
            147: spo = 5'h3;
            148: spo = 5'h2;
            149: spo = 5'h2;
            150: spo = 5'h1;
            151: spo = 5'h0;
            152: spo = 5'h1f;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1d;
            156: spo = 5'h1c;
            157: spo = 5'h1c;
            158: spo = 5'h1b;
            159: spo = 5'h1a;
            160: spo = 5'h5;
            161: spo = 5'h4;
            162: spo = 5'h3;
            163: spo = 5'h3;
            164: spo = 5'h2;
            165: spo = 5'h1;
            166: spo = 5'h0;
            167: spo = 5'h1f;
            168: spo = 5'h1f;
            169: spo = 5'h1e;
            170: spo = 5'h1d;
            171: spo = 5'h1c;
            172: spo = 5'h1c;
            173: spo = 5'h1b;
            174: spo = 5'h1a;
            175: spo = 5'h19;
            176: spo = 5'h4;
            177: spo = 5'h3;
            178: spo = 5'h3;
            179: spo = 5'h2;
            180: spo = 5'h1;
            181: spo = 5'h0;
            182: spo = 5'h0;
            183: spo = 5'h1f;
            184: spo = 5'h1e;
            185: spo = 5'h1d;
            186: spo = 5'h1d;
            187: spo = 5'h1c;
            188: spo = 5'h1b;
            189: spo = 5'h1a;
            190: spo = 5'h19;
            191: spo = 5'h19;
            192: spo = 5'h4;
            193: spo = 5'h3;
            194: spo = 5'h2;
            195: spo = 5'h1;
            196: spo = 5'h0;
            197: spo = 5'h0;
            198: spo = 5'h1f;
            199: spo = 5'h1e;
            200: spo = 5'h1d;
            201: spo = 5'h1d;
            202: spo = 5'h1c;
            203: spo = 5'h1b;
            204: spo = 5'h1a;
            205: spo = 5'h1a;
            206: spo = 5'h19;
            207: spo = 5'h18;
            208: spo = 5'h3;
            209: spo = 5'h2;
            210: spo = 5'h1;
            211: spo = 5'h1;
            212: spo = 5'h0;
            213: spo = 5'h1f;
            214: spo = 5'h1e;
            215: spo = 5'h1e;
            216: spo = 5'h1d;
            217: spo = 5'h1c;
            218: spo = 5'h1b;
            219: spo = 5'h1a;
            220: spo = 5'h1a;
            221: spo = 5'h19;
            222: spo = 5'h18;
            223: spo = 5'h17;
            224: spo = 5'h2;
            225: spo = 5'h2;
            226: spo = 5'h1;
            227: spo = 5'h0;
            228: spo = 5'h1f;
            229: spo = 5'h1e;
            230: spo = 5'h1e;
            231: spo = 5'h1d;
            232: spo = 5'h1c;
            233: spo = 5'h1b;
            234: spo = 5'h1b;
            235: spo = 5'h1a;
            236: spo = 5'h19;
            237: spo = 5'h18;
            238: spo = 5'h18;
            239: spo = 5'h17;
            240: spo = 5'h2;
            241: spo = 5'h1;
            242: spo = 5'h0;
            243: spo = 5'h1f;
            244: spo = 5'h1f;
            245: spo = 5'h1e;
            246: spo = 5'h1d;
            247: spo = 5'h1c;
            248: spo = 5'h1c;
            249: spo = 5'h1b;
            250: spo = 5'h1a;
            251: spo = 5'h19;
            252: spo = 5'h18;
            253: spo = 5'h18;
            254: spo = 5'h17;
            255: spo = 5'h16;
            default: spo = 5'h0;
		endcase
	end
endmodule