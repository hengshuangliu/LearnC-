#include <fstream>
#include <iostream>
#include <vector>
using namespace std;
istream& readout(istream&);
int main()
{
	vector<string> filename;
	string str;
	cout << "please input file's name(ctrl+d end): ";
	while(cin >> str)
	{	filename.push_back(str);  }
	ifstream input;
	vector<string>::const_iterator it=filename.begin();
	while(it !=filename.end())
	{	input.open(it->c_str());
		if(!input)
		{	cerr << "error: can't open "<< *it << endl;
			input.close();
			input.clear();
			++it;
			continue;}
		else
		{	cout << "---processing " << *it << "---" << endl;
			readout(input);}
		input.close();
		input.clear();
		++it;
	}
	return 0;
}
	
