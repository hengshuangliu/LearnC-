#include <iostream>
using namespace std;
istream& readout(istream&);
int main()
{
	cout << "please input some words(ctrl+ d to end): ";
	readout(cin);
	return 0;
}
