#ifndef KEY_VALUE_H
#define KEY_VALUE_H

#include <fstream>
#include <map>
#include <string>
using namespace std;
class key_value
{	public:
		key_value(ifstream& ifile,int row,int column);
		~key_value() {};
		bool build_map(ifstream&,int,int);
		void show();
		bool search(string,int&) const;
	private:
		map<string,int> kv;
		bool identify_key(const string&,const int& line_number) const;
		bool identify_value(const string&,const int& line_number) const;		void insert_map(pair<string,int>,int);
		


};
#endif
