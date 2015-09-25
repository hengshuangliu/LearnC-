#include "TextQuery.h"
#include <iostream>
#include <fstream>
int main(int argc,char *argv[])
{	ifstream infile;
	string word,filename,arg;
	flag qflag;
	if ( argc == 1 || argc > 4 )
	{	cerr << "error: try --help for usage" << endl;
		return -1; }
	if( argc == 2)
	{	arg = argv[1];
		if(arg  == "--help")
		{	cout << "this program is used to search word in the file." << endl;
			cout << "query.exe [option] word filename." << endl;
			cout << "[option]     instruction" << endl;
			cout << "--help     help for usage" << endl;
			cout << "-n or no option     search in completly matching" << endl;
			cout << "-i     search in case-insensitive matching" << endl;
			cout << "-b     prefix is 'word' " << endl;
			cout << "-ib    prefix is 'word' and is case-insensitive" << endl;
			cout << "-e    suffx is 'word'"<< endl;
			cout << "-ie     suffx is 'word' and is case-insensitive" << endl;
			cout << "-s     'word' is the substring" << endl;
			cout << "-is     'word' is the substring and is case-insensitive" << endl;
			cout << "this program is designed by liuhengshuang, if you find any bugs,please send email:767924520@qq.com" << endl;
			return 0; }
		else
		{	cerr << "error: argument error" << endl
			<< "try  -- help for usage" << endl;
			return -1; }
	}
	if( argc == 3 )
	{	word = argv[1];
		filename = argv[2];
		qflag = normal; }
	else
	{	word = argv[2];
		filename = argv[3];
		arg=argv[1];
		if(arg == "-n") qflag = normal;
		else if(arg == "-i") qflag = cinsentive;
		else if (arg == "-b") qflag = begin;
		else if(arg == "-ib") qflag = ci_begin;
		else if(arg == "-e") qflag = end;
		else if(arg == "-ie") qflag = ci_end;
		else if(arg == "-s") qflag = sub;
		else if(arg == "-is") qflag = ci_sub;
		else {
			cerr << "error: argument error"<< endl << "try --help for usage" << endl;
				return -1; }
	}

	infile.close();
	infile.clear();
	infile.open( filename.c_str() );
	if( !infile )
	{	cerr << "fail to open file!" << endl;
		return -1; }
	else 
	{	TextQuery tq(infile);
		vector<set<TextQuery::line_s> > locs =  tq.run_query(word,qflag);
		cout << "----seach result of " << word << "----" << endl;
		for(vector<set<TextQuery::line_s> >::iterator viter =locs.begin();viter != locs.end();++ viter)
		{
			for(set<TextQuery::line_s>::iterator iter = viter->begin(); iter != viter->end();++iter)
			{	cout << "(line " << (*iter)+1 << "): "<< tq.text_line(*iter) << endl; }	
		}
	}
	return 0;
}
