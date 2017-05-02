package assmbler;

import java.io.BufferedWriter;
import java.io.PrintWriter;
import java.util.LinkedList;

public class MifFileMaker extends PrintWriter {

	private int WIDTH = 16;
	private int DEPTH = 2048;

	public MifFileMaker(BufferedWriter writer) {
		super(writer);
	}

	public void makeMif(LinkedList<String> mcCodes) {

		println("-- made by AssemblerOfSIMPLE > MifFileMaker");
		println();
		println("WIDTH=" + WIDTH+";");
		println("DEPTH=" + DEPTH+";");
		println();
		println("ADDRESS_RADIX=UNS"+";");
		println("DATA_RADIX=BIN"+";");
		println();
		println("CONTENT BEGIN");

		int size = mcCodes.size();
		for (int num = 0; num < size; num++) {
			println(" " + num + " : " + mcCodes.poll() + ";");
		}
		if (size != DEPTH) {
			println(" [" + size + ".." + (DEPTH - 1) + "] : "
					+ "0000000000000000;");
		}

		println("END;");
		close();

	}
}
