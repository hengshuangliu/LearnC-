#include "configuration.h"
#include "key_value.h"
#include <iostream>
#include <fstream>

int main(int argc,char **argv)
{	if (argc != 2)
	{	cerr << "error:need configuration  file" << endl;
                return -1; }
	else
	{	ifstream ifile;
                ifile.close();
                ifile.clear();
                ifile.open(argv[1]);
                if( !ifile )
                {       cerr << "error:can't open " << argv[1] << endl;
                        return -1; }
                configuration config(ifile);
		
		ifile.close();
		ifile.clear();
		ifile.open( config.get_filename().c_str() );
		if( !ifile )
                {       cerr << "error:can't open " << config.get_filename() << endl;
                        return -1; }
		key_value  mydata(ifile,config.get_row_number(),config.get_column_number() );
		mydata.show();
		string keyA("-valueA");
		int valueA;
		if( mydata.search(keyA,valueA) )
			cout << keyA << " = " << valueA << endl;
		else
		{	cout << "the value of " << keyA << " don't exist" << endl;
		return -1; }
		return 0;
	}
}
