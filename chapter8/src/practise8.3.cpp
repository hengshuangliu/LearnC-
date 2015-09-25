#include <iostream>
#include <stdexcept>
#include <string>
using namespace std;

istream& readout(istream& in)
{
	string ival;
	while(in >> ival,!in.eof())
	{
		if(in.bad())
			throw runtime_error("IO stream corrupted");
		if(in.fail()){
			cerr << "bad data,try again";
			in.clear();
			in.setstate(istream::eofbit);
			continue;}
		cout << ival << endl;
	}
	in.clear();
	return in;
}
