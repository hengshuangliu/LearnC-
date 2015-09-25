#include "file.h"
#include <vector>
int main()
{	vector<string> filename;
	get_filename(filename);
	ifstream in;
	for(vector<string>::iterator it=filename.begin();it!=filename.end();++it)
	{	open_file(in,*it);
		check_stream(in);
		in.close(); }
	return 0; 
}
