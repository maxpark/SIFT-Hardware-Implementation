`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:34:16 06/13/2022 
// Design Name: 
// Module Name:    dir27_1 
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

module dir27_1
(
    input   [7:0]       a,  // Addr.
	output  reg [4:0]	spo // Data.
);
	
	always @(*) begin
		case (a)
			000: spo = 5'h18;
            001: spo = 5'h19;
            002: spo = 5'h1a;
            003: spo = 5'h1b;
            004: spo = 5'h1c;
            005: spo = 5'h1d;
            006: spo = 5'h1e;
            007: spo = 5'h1f;
            008: spo = 5'h0;
            009: spo = 5'h1;
            010: spo = 5'h2;
            011: spo = 5'h3;
            012: spo = 5'h4;
            013: spo = 5'h5;
            014: spo = 5'h6;
            015: spo = 5'h7;
            016: spo = 5'h18;
            017: spo = 5'h19;
            018: spo = 5'h1a;
            019: spo = 5'h1b;
            020: spo = 5'h1c;
            021: spo = 5'h1d;
            022: spo = 5'h1e;
            023: spo = 5'h1f;
            024: spo = 5'h0;
            025: spo = 5'h1;
            026: spo = 5'h2;
            027: spo = 5'h3;
            028: spo = 5'h4;
            029: spo = 5'h5;
            030: spo = 5'h6;
            031: spo = 5'h7;
            032: spo = 5'h18;
            033: spo = 5'h19;
            034: spo = 5'h1a;
            035: spo = 5'h1b;
            036: spo = 5'h1c;
            037: spo = 5'h1d;
            038: spo = 5'h1e;
            039: spo = 5'h1f;
            040: spo = 5'h0;
            041: spo = 5'h1;
            042: spo = 5'h2;
            043: spo = 5'h3;
            044: spo = 5'h4;
            045: spo = 5'h5;
            046: spo = 5'h6;
            047: spo = 5'h7;
            048: spo = 5'h18;
            049: spo = 5'h19;
            050: spo = 5'h1a;
            051: spo = 5'h1b;
            052: spo = 5'h1c;
            053: spo = 5'h1d;
            054: spo = 5'h1e;
            055: spo = 5'h1f;
            056: spo = 5'h0;
            057: spo = 5'h1;
            058: spo = 5'h2;
            059: spo = 5'h3;
            060: spo = 5'h4;
            061: spo = 5'h5;
            062: spo = 5'h6;
            063: spo = 5'h7;
            064: spo = 5'h18;
            065: spo = 5'h19;
            066: spo = 5'h1a;
            067: spo = 5'h1b;
            068: spo = 5'h1c;
            069: spo = 5'h1d;
            070: spo = 5'h1e;
            071: spo = 5'h1f;
            072: spo = 5'h0;
            073: spo = 5'h1;
            074: spo = 5'h2;
            075: spo = 5'h3;
            076: spo = 5'h4;
            077: spo = 5'h5;
            078: spo = 5'h6;
            079: spo = 5'h7;
            080: spo = 5'h18;
            081: spo = 5'h19;
            082: spo = 5'h1a;
            083: spo = 5'h1b;
            084: spo = 5'h1c;
            085: spo = 5'h1d;
            086: spo = 5'h1e;
            087: spo = 5'h1f;
            088: spo = 5'h0;
            089: spo = 5'h1;
            090: spo = 5'h2;
            091: spo = 5'h3;
            092: spo = 5'h4;
            093: spo = 5'h5;
            094: spo = 5'h6;
            095: spo = 5'h7;
            096: spo = 5'h18;
            097: spo = 5'h19;
            098: spo = 5'h1a;
            099: spo = 5'h1b;
            100: spo = 5'h1c;
            101: spo = 5'h1d;
            102: spo = 5'h1e;
            103: spo = 5'h1f;
            104: spo = 5'h0;
            105: spo = 5'h1;
            106: spo = 5'h2;
            107: spo = 5'h3;
            108: spo = 5'h4;
            109: spo = 5'h5;
            110: spo = 5'h6;
            111: spo = 5'h7;
            112: spo = 5'h18;
            113: spo = 5'h19;
            114: spo = 5'h1a;
            115: spo = 5'h1b;
            116: spo = 5'h1c;
            117: spo = 5'h1d;
            118: spo = 5'h1e;
            119: spo = 5'h1f;
            120: spo = 5'h0;
            121: spo = 5'h1;
            122: spo = 5'h2;
            123: spo = 5'h3;
            124: spo = 5'h4;
            125: spo = 5'h5;
            126: spo = 5'h6;
            127: spo = 5'h7;
            128: spo = 5'h18;
            129: spo = 5'h19;
            130: spo = 5'h1a;
            131: spo = 5'h1b;
            132: spo = 5'h1c;
            133: spo = 5'h1d;
            134: spo = 5'h1e;
            135: spo = 5'h1f;
            136: spo = 5'h0;
            137: spo = 5'h1;
            138: spo = 5'h2;
            139: spo = 5'h3;
            140: spo = 5'h4;
            141: spo = 5'h5;
            142: spo = 5'h6;
            143: spo = 5'h7;
            144: spo = 5'h18;
            145: spo = 5'h19;
            146: spo = 5'h1a;
            147: spo = 5'h1b;
            148: spo = 5'h1c;
            149: spo = 5'h1d;
            150: spo = 5'h1e;
            151: spo = 5'h1f;
            152: spo = 5'h0;
            153: spo = 5'h1;
            154: spo = 5'h2;
            155: spo = 5'h3;
            156: spo = 5'h4;
            157: spo = 5'h5;
            158: spo = 5'h6;
            159: spo = 5'h7;
            160: spo = 5'h18;
            161: spo = 5'h19;
            162: spo = 5'h1a;
            163: spo = 5'h1b;
            164: spo = 5'h1c;
            165: spo = 5'h1d;
            166: spo = 5'h1e;
            167: spo = 5'h1f;
            168: spo = 5'h0;
            169: spo = 5'h1;
            170: spo = 5'h2;
            171: spo = 5'h3;
            172: spo = 5'h4;
            173: spo = 5'h5;
            174: spo = 5'h6;
            175: spo = 5'h7;
            176: spo = 5'h18;
            177: spo = 5'h19;
            178: spo = 5'h1a;
            179: spo = 5'h1b;
            180: spo = 5'h1c;
            181: spo = 5'h1d;
            182: spo = 5'h1e;
            183: spo = 5'h1f;
            184: spo = 5'h0;
            185: spo = 5'h1;
            186: spo = 5'h2;
            187: spo = 5'h3;
            188: spo = 5'h4;
            189: spo = 5'h5;
            190: spo = 5'h6;
            191: spo = 5'h7;
            192: spo = 5'h18;
            193: spo = 5'h19;
            194: spo = 5'h1a;
            195: spo = 5'h1b;
            196: spo = 5'h1c;
            197: spo = 5'h1d;
            198: spo = 5'h1e;
            199: spo = 5'h1f;
            200: spo = 5'h0;
            201: spo = 5'h1;
            202: spo = 5'h2;
            203: spo = 5'h3;
            204: spo = 5'h4;
            205: spo = 5'h5;
            206: spo = 5'h6;
            207: spo = 5'h7;
            208: spo = 5'h18;
            209: spo = 5'h19;
            210: spo = 5'h1a;
            211: spo = 5'h1b;
            212: spo = 5'h1c;
            213: spo = 5'h1d;
            214: spo = 5'h1e;
            215: spo = 5'h1f;
            216: spo = 5'h0;
            217: spo = 5'h1;
            218: spo = 5'h2;
            219: spo = 5'h3;
            220: spo = 5'h4;
            221: spo = 5'h5;
            222: spo = 5'h6;
            223: spo = 5'h7;
            224: spo = 5'h18;
            225: spo = 5'h19;
            226: spo = 5'h1a;
            227: spo = 5'h1b;
            228: spo = 5'h1c;
            229: spo = 5'h1d;
            230: spo = 5'h1e;
            231: spo = 5'h1f;
            232: spo = 5'h0;
            233: spo = 5'h1;
            234: spo = 5'h2;
            235: spo = 5'h3;
            236: spo = 5'h4;
            237: spo = 5'h5;
            238: spo = 5'h6;
            239: spo = 5'h7;
            240: spo = 5'h18;
            241: spo = 5'h19;
            242: spo = 5'h1a;
            243: spo = 5'h1b;
            244: spo = 5'h1c;
            245: spo = 5'h1d;
            246: spo = 5'h1e;
            247: spo = 5'h1f;
            248: spo = 5'h0;
            249: spo = 5'h1;
            250: spo = 5'h2;
            251: spo = 5'h3;
            252: spo = 5'h4;
            253: spo = 5'h5;
            254: spo = 5'h6;
            255: spo = 5'h7;
            default: spo = 5'h0;
		endcase
	end
endmodule