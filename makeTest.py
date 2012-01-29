#!/usr/bin/env python
import os

def main():
	if os.path.exists(sys.argv[2]):
		jarFile=sys.argv[1];
		path=sys.argv[2];
		print "Directory with test file: " + path;
		testFile = open('testResult.csv', 'w+')
		for infile in os.listdir(path):
			writeLn = "";
			process = subprocess.Popen(['java', '-jar', jarFile, 'exp', '-time10' , infile],
				stdout=subprocess.PIPE, 
				stderr=subprocess.PIPE)
			
			writeLn += infile + ";";
			jarOutput = process.stdout.read();
			if (jarOutput.find('SATISFIABLE') != -1):
				writeLn += "SATISFIABLE;";
			elif (jarOutput.find('UNSATISFIABLE') != -1):
				writeLn += "UNSATISFIABLE;";
			elif (jarOutput.find('TIME EXPIRED') != -1):
				writeLn += "TIME EXPIRED;";
			elif (jarOutput.find('OUT OF MEMORY') != -1):
				writeLn += "OUT OF MEMORY;";
			testFile.write(writeLn);
		testFile.close();
	else:
		print "Path not found"	    

if __name__ == '__main__':
	main()
