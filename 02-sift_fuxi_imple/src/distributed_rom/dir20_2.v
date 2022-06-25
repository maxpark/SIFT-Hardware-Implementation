`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir20_2 
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

module dir20_2
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'ha;
            001: spo = 5'h9;
            002: spo = 5'h8;
            003: spo = 5'h7;
            004: spo = 5'h6;
            005: spo = 5'h6;
            006: spo = 5'h5;
            007: spo = 5'h4;
            008: spo = 5'h3;
            009: spo = 5'h2;
            010: spo = 5'h1;
            011: spo = 5'h0;
            012: spo = 5'h1f;
            013: spo = 5'h1e;
            014: spo = 5'h1d;
            015: spo = 5'h1c;
            016: spo = 5'ha;
            017: spo = 5'h9;
            018: spo = 5'h8;
            019: spo = 5'h7;
            020: spo = 5'h6;
            021: spo = 5'h5;
            022: spo = 5'h4;
            023: spo = 5'h3;
            024: spo = 5'h2;
            025: spo = 5'h1;
            026: spo = 5'h1;
            027: spo = 5'h0;
            028: spo = 5'h1f;
            029: spo = 5'h1e;
            030: spo = 5'h1d;
            031: spo = 5'h1c;
            032: spo = 5'ha;
            033: spo = 5'h9;
            034: spo = 5'h8;
            035: spo = 5'h7;
            036: spo = 5'h6;
            037: spo = 5'h5;
            038: spo = 5'h4;
            039: spo = 5'h3;
            040: spo = 5'h2;
            041: spo = 5'h1;
            042: spo = 5'h0;
            043: spo = 5'h1f;
            044: spo = 5'h1e;
            045: spo = 5'h1d;
            046: spo = 5'h1c;
            047: spo = 5'h1b;
            048: spo = 5'h9;
            049: spo = 5'h8;
            050: spo = 5'h7;
            051: spo = 5'h6;
            052: spo = 5'h5;
            053: spo = 5'h5;
            054: spo = 5'h4;
            055: spo = 5'h3;
            056: spo = 5'h2;
            057: spo = 5'h1;
            058: spo = 5'h0;
            059: spo = 5'h1f;
            060: spo = 5'h1e;
            061: spo = 5'h1d;
            062: spo = 5'h1c;
            063: spo = 5'h1b;
            064: spo = 5'h9;
            065: spo = 5'h8;
            066: spo = 5'h7;
            067: spo = 5'h6;
            068: spo = 5'h5;
            069: spo = 5'h4;
            070: spo = 5'h3;
            071: spo = 5'h2;
            072: spo = 5'h1;
            073: spo = 5'h0;
            074: spo = 5'h1f;
            075: spo = 5'h1f;
            076: spo = 5'h1e;
            077: spo = 5'h1d;
            078: spo = 5'h1c;
            079: spo = 5'h1b;
            080: spo = 5'h9;
            081: spo = 5'h8;
            082: spo = 5'h7;
            083: spo = 5'h6;
            084: spo = 5'h5;
            085: spo = 5'h4;
            086: spo = 5'h3;
            087: spo = 5'h2;
            088: spo = 5'h1;
            089: spo = 5'h0;
            090: spo = 5'h1f;
            091: spo = 5'h1e;
            092: spo = 5'h1d;
            093: spo = 5'h1c;
            094: spo = 5'h1b;
            095: spo = 5'h1a;
            096: spo = 5'h8;
            097: spo = 5'h7;
            098: spo = 5'h6;
            099: spo = 5'h5;
            100: spo = 5'h4;
            101: spo = 5'h4;
            102: spo = 5'h3;
            103: spo = 5'h2;
            104: spo = 5'h1;
            105: spo = 5'h0;
            106: spo = 5'h1f;
            107: spo = 5'h1e;
            108: spo = 5'h1d;
            109: spo = 5'h1c;
            110: spo = 5'h1b;
            111: spo = 5'h1a;
            112: spo = 5'h8;
            113: spo = 5'h7;
            114: spo = 5'h6;
            115: spo = 5'h5;
            116: spo = 5'h4;
            117: spo = 5'h3;
            118: spo = 5'h2;
            119: spo = 5'h1;
            120: spo = 5'h0;
            121: spo = 5'h1f;
            122: spo = 5'h1e;
            123: spo = 5'h1e;
            124: spo = 5'h1d;
            125: spo = 5'h1c;
            126: spo = 5'h1b;
            127: spo = 5'h1a;
            128: spo = 5'h8;
            129: spo = 5'h7;
            130: spo = 5'h6;
            131: spo = 5'h5;
            132: spo = 5'h4;
            133: spo = 5'h3;
            134: spo = 5'h2;
            135: spo = 5'h1;
            136: spo = 5'h0;
            137: spo = 5'h1f;
            138: spo = 5'h1e;
            139: spo = 5'h1d;
            140: spo = 5'h1c;
            141: spo = 5'h1b;
            142: spo = 5'h1a;
            143: spo = 5'h19;
            144: spo = 5'h7;
            145: spo = 5'h6;
            146: spo = 5'h5;
            147: spo = 5'h4;
            148: spo = 5'h3;
            149: spo = 5'h2;
            150: spo = 5'h2;
            151: spo = 5'h1;
            152: spo = 5'h0;
            153: spo = 5'h1f;
            154: spo = 5'h1e;
            155: spo = 5'h1d;
            156: spo = 5'h1c;
            157: spo = 5'h1b;
            158: spo = 5'h1a;
            159: spo = 5'h19;
            160: spo = 5'h7;
            161: spo = 5'h6;
            162: spo = 5'h5;
            163: spo = 5'h4;
            164: spo = 5'h3;
            165: spo = 5'h2;
            166: spo = 5'h1;
            167: spo = 5'h0;
            168: spo = 5'h1f;
            169: spo = 5'h1e;
            170: spo = 5'h1d;
            171: spo = 5'h1c;
            172: spo = 5'h1c;
            173: spo = 5'h1b;
            174: spo = 5'h1a;
            175: spo = 5'h19;
            176: spo = 5'h6;
            177: spo = 5'h6;
            178: spo = 5'h5;
            179: spo = 5'h4;
            180: spo = 5'h3;
            181: spo = 5'h2;
            182: spo = 5'h1;
            183: spo = 5'h0;
            184: spo = 5'h1f;
            185: spo = 5'h1e;
            186: spo = 5'h1d;
            187: spo = 5'h1c;
            188: spo = 5'h1b;
            189: spo = 5'h1a;
            190: spo = 5'h19;
            191: spo = 5'h18;
            192: spo = 5'h6;
            193: spo = 5'h5;
            194: spo = 5'h4;
            195: spo = 5'h3;
            196: spo = 5'h2;
            197: spo = 5'h1;
            198: spo = 5'h1;
            199: spo = 5'h0;
            200: spo = 5'h1f;
            201: spo = 5'h1e;
            202: spo = 5'h1d;
            203: spo = 5'h1c;
            204: spo = 5'h1b;
            205: spo = 5'h1a;
            206: spo = 5'h19;
            207: spo = 5'h18;
            208: spo = 5'h6;
            209: spo = 5'h5;
            210: spo = 5'h4;
            211: spo = 5'h3;
            212: spo = 5'h2;
            213: spo = 5'h1;
            214: spo = 5'h0;
            215: spo = 5'h1f;
            216: spo = 5'h1e;
            217: spo = 5'h1d;
            218: spo = 5'h1c;
            219: spo = 5'h1b;
            220: spo = 5'h1b;
            221: spo = 5'h1a;
            222: spo = 5'h19;
            223: spo = 5'h18;
            224: spo = 5'h5;
            225: spo = 5'h5;
            226: spo = 5'h4;
            227: spo = 5'h3;
            228: spo = 5'h2;
            229: spo = 5'h1;
            230: spo = 5'h0;
            231: spo = 5'h1f;
            232: spo = 5'h1e;
            233: spo = 5'h1d;
            234: spo = 5'h1c;
            235: spo = 5'h1b;
            236: spo = 5'h1a;
            237: spo = 5'h19;
            238: spo = 5'h18;
            239: spo = 5'h17;
            240: spo = 5'h5;
            241: spo = 5'h4;
            242: spo = 5'h3;
            243: spo = 5'h2;
            244: spo = 5'h1;
            245: spo = 5'h0;
            246: spo = 5'h1f;
            247: spo = 5'h1f;
            248: spo = 5'h1e;
            249: spo = 5'h1d;
            250: spo = 5'h1c;
            251: spo = 5'h1b;
            252: spo = 5'h1a;
            253: spo = 5'h19;
            254: spo = 5'h18;
            255: spo = 5'h17;
            default: spo = 5'h0;
		endcase
	end
endmodule