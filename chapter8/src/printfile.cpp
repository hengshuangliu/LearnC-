#include "file.h"
#include <iostream>
#include <vector>
#include <string>
using namespace std;
int main(int argc, char **argv)
{	ifstream in;
	vector<string> filename;
	if(argc==1)
	{	get_filename(filename);}
        else
	{	for(int i=1; i < argc;++i)
		{	filename.push_back(argv[i]);}
	}
	for(vector<string>::iterator it=filename.begin();it!=filename.end();++it)
       	{       open_file(in,*it);
                check_stream(in);
                in.close(); }
        return 0;
}	
