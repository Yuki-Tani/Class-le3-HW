package assmebler;

public class AssemblerOfSIMPLE {

	StringBuffer buffer;

	public AssemblerOfSIMPLE() {
		buffer = new StringBuffer();
	}

	public String assemble(String mnemonic) {

		String[] element = mnemonic.split("[\\s,()$]+", 0);
		int length = element.length;

		// mnemonic length check
		if (length <= 0 || length >= 5) {
			return "ERROR_01";
		}

		buffer = new StringBuffer();
		String order = element[0].toUpperCase();
		String op1 = (length >= 2) ? element[1] : "0";
		String op2 = (length >= 3) ? element[2] : "0";
		String op3 = (length >= 4) ? element[3] : "0";

		// opcode number check
		try {
			int op1_ = Integer.parseInt(op1);
			int op2_ = Integer.parseInt(op2);
			int op3_ = Integer.parseInt(op3);
			
//			if(op1_<0 || op2_<0 || op3_<0) return "ERROR_02";
			op1 = Integer.toBinaryString(op1_);
			op2 = Integer.toBinaryString(op2_);
			op3 = Integer.toBinaryString(op3_);

		} catch (NumberFormatException e) {
			return "ERROR_02";
		}

		// test
		System.out.println("\nLength:" + element.length);
		System.out.println("- order:" + order);
		System.out.println("- op1:" + op1);
		System.out.println("- op2:" + op2);
		System.out.println("- op3:" + op3 + "\n");

		boolean fin = false;
		String mc15_14, mc13_11, mc10_8, mc7_4, mc3_0;

		// ////////////////////////////
		// R
		mc15_14 = "11";
		mc13_11 = op2;
		mc10_8 = op1;
		mc7_4 = "READY";
		mc3_0 = "0000";

		if (order.equals("ADD")) {
			mc7_4 = "0000";
			fin = true;
		} else if (order.equals("SUB")) {
			mc7_4 = "0001";
			fin = true;
		} else if (order.equals("AND")) {
			mc7_4 = "0010";
			fin = true;
		} else if (order.equals("OR")) {
			mc7_4 = "0011";
			fin = true;
		} else if (order.equals("XOR")) {
			mc7_4 = "0100";
			fin = true;
		} else if (order.equals("CMP")) {
			mc7_4 = "0101";
			fin = true;
		} else if (order.equals("MOV")) {
			mc7_4 = "0110";
			fin = true;
		} else {

			mc13_11 = "000";
			mc3_0 = op2;

			if (order.equals("SLL")) {
				mc7_4 = "1000";
				fin = true;
			} else if (order.equals("SLR")) {
				mc7_4 = "1001";
				fin = true;
			} else if (order.equals("SRL")) {
				mc7_4 = "1010";
				fin = true;
			} else if (order.equals("SRA")) {
				mc7_4 = "1011";
				fin = true;
			}
		}
		if (fin) {
			if (length != 3)
				return "ERROR_03";
			mc13_11 = form(mc13_11, 3);
			mc10_8 = form(mc10_8, 3);
			mc3_0 = form(mc3_0, 4);
			
			String ans = (mc15_14 + mc13_11 + mc10_8 + mc7_4 + mc3_0);
			return (ans.length() == 16) ? ans : "ERROR_04";
		}
		// //////////////////////////////////
		// in/out

		mc15_14 = "11";
		mc13_11 = "READY";
		mc10_8 = "READY";
		mc7_4 = "READY";
		mc3_0 = "0000";

		if (order.equals("IN")) {
			mc7_4 = "1100";
			mc13_11 = "000";
			mc10_8 = op1;
			fin = true;
		} else if (order.equals("OUT")) {
			mc7_4 = "1101";
			mc13_11 = op1;
			mc10_8 = "000";
			fin = true;
		}
		if (fin) {
			if (length != 2)
				return "ERROR_03";
			mc13_11 = form(mc13_11 , 3);
			mc10_8 = form(mc10_8 , 3);
			String ans = (mc15_14 + mc13_11 + mc10_8 + mc7_4 + mc3_0);
			return (ans.length() == 16) ? ans : "ERROR_04";
		}
		// ///////////////////////////////////
		// halt

		if (order.equals("HLT")||order.equals("HALT")) {
			if (length != 1)
				return "ERROR_03";
			return ("11" + "000" + "000" + "1111" + "0000");
		}

		String mc7_0;

		// ///////////////////////////////////
		// load/store

		mc15_14 = "READY";
		mc13_11 = op1;
		mc10_8 = op3;
		mc7_0 = op2;

		if (order.equals("LD")) {
			mc15_14 = "00";
			fin = true;
		} else if (order.equals("ST")) {
			mc15_14 = "01";
			fin = true;
		}

		if (fin) {
			if (length != 4)
				return "ERROR_03";
			mc13_11 = form(mc13_11 , 3);
			mc10_8 = form(mc10_8 , 3);
			mc7_0 = form(mc7_0, 8);
			String ans = (mc15_14 + mc13_11 + mc10_8 + mc7_0);
			return (ans.length() == 16) ? ans : "ERROR_04";
		}
		
		////////////////////////////////////////
		// branch /IMload
		
		mc15_14 = "10";
		mc13_11 = "READY";
		mc10_8 = op1;
		mc7_0 = op2;
		
		if (order.equals("LI")) {
			mc13_11 = "000";
			fin = true;
		}else if (order.equals("ADDI")){
			mc13_11 = "001";
			fin = true;
		}
		/* else if (order.equals("B")) {	### change B's mc_code ###
			if(length==2){ // B can be ordered by "B d" 
				mc10_8 = "000";
				mc7_0 = op1;
				length = 3;
			}
			mc13_11 = "100";
			fin = true;
		}*/
		if (fin) {
			if (length != 3)
				return "ERROR_03";
			mc10_8 = form(mc10_8 , 3);
			mc7_0 = form(mc7_0, 8);
			String ans = (mc15_14 + mc13_11 + mc10_8 + mc7_0);
			return (ans.length() == 16) ? ans : "ERROR_04";
		}
		// JGbranch
		mc15_14 = "10";
		mc13_11 = "111";
		mc10_8 = "READY";
		mc7_0 = op1;
		
		if (order.equals("BE")) {
			mc10_8 = "000";
			fin = true;
		} else if (order.equals("BLT")) {
			mc10_8 = "001";
			fin = true;
		} else if (order.equals("BLE")) {
			mc10_8 = "010";
			fin = true;
		} else if (order.equals("BNE")) {
			mc10_8 = "011";
			fin = true;
		} else if(order.equals("B")){ // ## change B's mc_code ##
			if(length==3){ // B can be ordered by "B Rb,d" 
				mc7_0 = op2;
				length = 2;
			}
			mc10_8 = "100";
			fin = true;
		} else if (order.equals("JAL")) {
			mc10_8 = "101";
			fin = true;
		} else if (order.equals("JR")) {
			mc10_8 = "110";
			fin = true;
		}
		if (fin) {
			if (length != 2)
				return "ERROR_03";
			mc7_0 = form(mc7_0, 8);
			String ans = (mc15_14 + mc13_11 + mc10_8 + mc7_0);
			return (ans.length() == 16) ? ans : "ERROR_04";
		}
		
		// Extra
		if (order.equals("SKIP")) {
			if (length != 1)
				return "ERROR_03";
			return ("00" + "000" + "000" + "0000" + "0000");
		}

		return "ERROR_00";
	}
	
	public String form(String str,int digit){
		String formed = str;
		if(str.length()<digit){
			formed = String.format("%0"+digit+"d", Integer.parseInt(str));
		}else{
			formed = str.substring(str.length()-digit,str.length());
		}
		return formed;
	}
	
	public boolean isError(String str){
		return str.charAt(0) == 'E';
	}

}
