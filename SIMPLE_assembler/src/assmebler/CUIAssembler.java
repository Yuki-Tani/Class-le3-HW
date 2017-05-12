package assmebler;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.LinkedList;

public class CUIAssembler {
	public static void main(String[] args) {
		AssemblerOfSIMPLE assembler = new AssemblerOfSIMPLE();
		BufferedReader sysIn = new BufferedReader(new InputStreamReader(
				System.in));
		try {

			guidance(1);
			String opCode = sysIn.readLine().toUpperCase();
			String rURL = "", wURL = "";
			File rFile, wFile;
			BufferedReader filIn;
			MifFileMaker filOut;
			LinkedList<String> mcCodes;

			// ///Mode: HOME

			if (opCode.charAt(0) == 'H') {
				guidance(2,"Read");
				rURL = sysIn.readLine();
				rFile = new File(rURL);
				if (!rFile.exists()) {
					notion(1, rURL);
					return;
				}else{
					System.out.println("Read File: "+rURL+"\n");
				}
				filIn = new BufferedReader(new FileReader(rFile));
				
				guidance(2,"Write");
				wURL = sysIn.readLine();
				
				if(wURL.equals(rURL)){
					notion(2); return;
				}
				
				wFile = new File(wURL);
				if (!wFile.exists()) {
					notion(1, wURL);
					return;
				}else{
					System.out.println("Write File: "+wURL+"\n");
				}
				
				filOut = new MifFileMaker(
						new BufferedWriter(new FileWriter(wFile)));
				
				//assemble
				mcCodes = new LinkedList<String>();
				
				String code;
				String str = filIn.readLine();
				while(str != null){
					if(!str.isEmpty()){
						code = assembler.assemble(str);
						System.out.println(code);
						if(assembler.isError(code)){
							notion(3); return;
						}
						mcCodes.offer(code);
					}
					str = filIn.readLine();
				}
				
				filOut.makeMif(mcCodes);
				System.out.println("Finish. All Correct. \n");
				
				
			} else {
				return;
			}

		} catch (IOException e) {
			System.out.println("ERROR:: IOException(CUIAssembler)");
		}

	}

	public static void guidance(int No){guidance(No,"");}
	public static void guidance(int No, String st1) {
		String guide;
		switch (No) {
		case 1:
			guide = "### SIMPLE Assembler ### \n"
					+ "Please Enter Operation Code \n\n "
					+ "> HOME : use file in home \n\n" + " Code : ";
			break;
		case 2:
			guide = "\nPlease Enter "+st1+" File Name \n" + " Name : ";
			break;
		default:
			guide = "NONE GUIDUNCE";
		}
		System.out.print(guide);
	}

	public static void notion(int No){notion(No,"");}
	public static void notion(int No, String st1) {
		String guide;
		switch (No) {
		case 1:
			guide = "File " + st1 + " Doesn't Exists.\n" + " See You.\n";
			break;
		case 2:
			guide = "Don't Enter Same File.\n"+ " See You.\n";
			break;
		case 3:
			guide = "Syntax Error! \n\n See You.\n";
			break;
		default:
			guide = "NONE GUIDUNCE";
		}
		System.out.print(guide);
	}
}
