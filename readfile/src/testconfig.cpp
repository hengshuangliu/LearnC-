#include "configuration.h"
#include <fstream>
#include <iostream>


int main(int argc,char *argv[])
{	if ( argc !=2 )
	{	cerr << "error:need configuration  file" << endl;
		return -1; }
	else
	{	ifstream ifile;
		ifile.close();
		ifile.clear();
		ifile.open(argv[1]);
		if( !ifile )
		{	cerr << "error:can't open " << argv[1] << endl;
			return -1; }
		configuration config(ifile);
		cout << "---------------------"<< endl;
		cout << "filename=" << config.get_filename() << endl;
		cout << "style=" << config.get_style() << endl;
		cout << "row=" << config.get_row_number() << endl;
		cout << "column=" << config.get_column_number() << endl;
	}
	return 0;
} 
		
