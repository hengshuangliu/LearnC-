#include "configuration.h"
#include <sstream>
#include <stdexcept>
#include <cctype>
#include <utility>
#include <vector>
#include <iostream>

pair<string,string> configuration::read_string(const string &str) const
{	
	string key,value;
	bool flag=false;
	for(string::const_iterator iter=str.begin(); iter != str.end();++iter)
	{	
		if( *iter == '"' && flag == false)
		{	flag = true; }
		else  if(flag == true && *iter == '"')
		{	flag = false; }
		else if(flag == true )
                {       value.push_back(*iter); }
		else
		{	if (isspace(*iter))
			{	}
			else
			{	key.push_back(*iter); }
		}
	}
	if(flag == true)
	{	return make_pair("error","error");}
	return make_pair(key,value);
}

pair<string,int> configuration::read_number(const string &str) const
{	int value=-1;
	string num,cstr;
	istringstream string2number;
	bool flag=false;
	for(string::const_iterator iter=str.begin();iter != str.end(); ++iter)
	{	if( *iter == '=')
		{	flag = true; }
		if(flag == true && isdigit(*iter) )
		{	num.push_back(*iter); }
		else	
		{	if(isspace(*iter)) {}
			else 
			{	cstr.push_back(*iter);}
		}
	}
	if (num.size() == 0 )
	{	return make_pair(cstr,value); }
	else
	{	string2number.str(num);
		string2number >> value;}
	return make_pair(cstr,value);
}

void configuration::read(ifstream &file)
{	vector<string> config;
	string str;
	pair<string,string> spair;
	pair<string,int> ipair;
	int line=1;
	while (getline(file,str))
	{	//cout << "debug: " << str << endl;
		if( str.size() == 0)
		{	++line;
			continue; }
		if( str.substr(0,2) == string("//") )
		{	++line;
			continue; }
		if( str.find("filename") ==0 ) 
		{	spair = read_string(str);
			//cout << spair.first.size()<< " " << spair.second << endl;
			//cout << string("filename={};") <<( spair.first != string("filename={};") )<< endl;
			if( spair.first == string("filename={};") )
			{	filename=spair.second;
				config.push_back(str); }
			else
			{ 	cout<< "line " << line << " :"<< str << endl;
				throw runtime_error("configuration1:syntax error");}
		}
		else if( str.find("style")==0 )
		{	spair = read_string(str);
			if( spair.first == string("style={};") )
			{	style = spair.second;
				config.push_back(str);}
			else
			{	cout << "line "<< line << " :" << str << endl;
				throw runtime_error("configuration2:syntax srror");}
		 }
		else if( str.find("row_number=")==0 )
		{	ipair = read_number(str);
                        if( ipair.first == string("row_number=;") && ipair.second != -1 )
                        {       row_number = ipair.second;
				config.push_back(str);}
                        else
                        {       cout << "line "<< line << " :" << str << endl;
                                throw runtime_error("configuration3:syntax srror");}
		}
		else if( str.find("column_number=")==0 )
		{	ipair = read_number(str);
                        if( ipair.first == string("column_number=;") && ipair.second != -1 )
                        {        column_number = ipair.second;
				config.push_back(str);}
                        else
                        {       cout << "line "<< line << " :" << str << endl;
                                throw runtime_error("configuration4:syntax srror");} 
		}
		else
		{	cout << "line "<< line << " : " << str << endl;
			throw runtime_error("configuration5:syntax error");}
		++line;
	}
	cout << "successed in reading configration" << endl;
	for(vector<string>::iterator iter = config.begin(); iter != config.end(); ++iter)
	{	cout << *iter << endl; }
}
	
configuration::configuration(ifstream& file)
{	read(file); }

string configuration::get_filename()
{	return filename; }

string configuration::get_style()
{	return style; }

int configuration::get_column_number()
{	return column_number; 	}

int configuration::get_row_number()
{	return row_number; }
