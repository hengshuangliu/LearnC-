#include <fstream>
#include <iostream>
using namespace std;
istream& readout(istream&);

int main()
{
	ifstream input;
	input.open("file1.txt");
	if(!input) {
		cerr << "error:unable to open input file1.txt..." << endl;
		return -1;}
	else
		readout(input);
	return 0;
}
