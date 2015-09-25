#include "key_value.h"
#include <utility>
#include <iostream>
#include <stdexcept>
#include <sstream>
#include <cctype>

key_value::key_value(ifstream& ifile,int row,int column)
{	if(! build_map(ifile,row,column) )
	{ cerr << "failed read file"<< endl;}
	else 
		cout << "successed in reading file" << endl;
}


bool key_value::identify_key(const string& str,const int& line_number) const
{	try{    if( str[0] != '-')
		 throw runtime_error("key format error");
                 else
                 {	return true; }
           } catch (runtime_error err)
          	 {       cout << "lines "<< line_number << ": " << err.what() << endl
                              << "ignore this line" << endl;return false;}
}

bool key_value::identify_value(const string& str,const int&  line_number) const
{	try{	for( string::const_iterator iter=str.begin();iter != str.end();++iter)
		{	if( !isdigit(*iter) )
				throw runtime_error("value is not integer");
		}
		return true;

	   }catch (runtime_error err)
		{	cout << "lines " << line_number << ": " << err.what() << endl
					<< "ignore this line" << endl;return false; }
	return true;
}

void key_value::insert_map( pair<string,int> p,int number )
{	pair< map<string,int>::iterator,bool > ret;
	ret = kv.insert(p);
	if(!ret.second)
		cout << "line" << number <<" : "<< "the value of " << p.first << " already exist" << endl;
}

bool key_value::build_map(ifstream& ifile, int row,int column)
{	if ( column ==0 || (column%2 !=0) ) return false;
	string line,word,key;
	int value;
	int line_number = 1;
	while ( getline(ifile,line) )
		{	istringstream stream(line);
			if ( line.size() == 0 )
			{	++line_number;continue; }
			else
			{	int i=1;
				string flag("key");
				while(stream >> word)
				{	
					if(i <= column)
					{	if( flag == string("key") )
						{	if( identify_key( word,line_number) )
							{	key=word;flag="value";++i;continue;}
							else break;	
						}
						if( flag == string("value") )
						{	if( identify_value(word,line_number) )
							{	istringstream v(word);
								v >> value;flag="key";}
							else break;
						}
						insert_map(make_pair(key,value),line_number);
						++i;
					}
				}
			}
			++line_number;
			if(row > 0 && line_number > row ) {break; }
		}
	return true;
}

void key_value::show()
{	for(map<string,int>::const_iterator iter = kv.begin();iter != kv.end();++iter)
	{	cout << iter->first << " = " << iter->second << endl; }

}

bool key_value::search(string key,int &value) const
{	map<string,int>::const_iterator it = kv.find(key);
	if (it != kv.end() )
	{	value = it->second;
		return true; }
	else 
		return false;

}

