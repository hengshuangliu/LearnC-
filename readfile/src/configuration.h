#ifndef CONFIGURATION_H
#define CONFIGURATION_H

#include <fstream>
#include <string>
#include <utility>
using namespace std;
class configuration
{	private:
		string filename;
		int column_number,row_number;
		string style;
		pair<string,string> read_string(const string&) const;
		pair<string,int> read_number(const string&) const;
	public:
		configuration(ifstream&);
		~configuration(){ };
		void read(ifstream&);
		string get_filename();
		int get_column_number();
		int get_row_number();
		string get_style();
};
#endif
