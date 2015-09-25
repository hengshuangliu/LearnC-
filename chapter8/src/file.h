#ifndef FILE_H
#define FILE_H
#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#include <stdexcept>
using namespace std;
//ask for name of files 
vector<string>& get_filename(vector<string> &filename);
//open file based on filename
ifstream& open_file(ifstream &in, const string &file_name);
//check for input stream,and print stream
istream& check_stream(istream &in);


vector<string>& get_filename(vector<string> &filename)
{	string name;
	cout << "please input file's name(ctrl+d end): ";
	while(cin >> name)
	{	filename.push_back(name); }
	return filename; }

ifstream& open_file(ifstream &in, const string &file_name)
{	in.close();
	in.clear();
	in.open(file_name.c_str());
	if(!in)
	{	cerr << "cannot open the file : " << file_name << endl;
		in.close();
		in.clear();
		return in; }
	else
	{	cout << "=====================file : " << file_name <<"=====================" << endl;
		return in; }
}



istream& check_stream(istream &in)
{	string ival;
	while(getline(in,ival),!in.eof())
	{	if(in.bad())
		throw runtime_error("IO stream corrupted");
		if(in.fail())
		{	cerr << "bad data,try again:";
			in.clear();
			in.setstate(istream::eofbit);
			continue;}
		cout << ival << endl; }
	cout << "====================>_<=======================" << endl;
	return in; }

#endif
