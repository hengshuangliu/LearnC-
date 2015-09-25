#include <iterator>
#include <algorithm>
#include <iostream>
#include <fstream>
#include <vector>
#include <list>
using namespace std;
int main()
{	ifstream ifile("data.txt");
	istream_iterator<int> in_iter(ifile),eof;
	ostream_iterator<int> out_iter(cout,"  ");
//	copy(in_iter,eof,out_iter);
	//11.17
	vector<int> vec(in_iter,eof);
	copy(vec.begin(),vec.end(),out_iter);

	//11.18
	ofstream outfile("data.txt",ofstream::app );
	outfile << endl <<"--odd--"<< endl;
	vector<int>::iterator iter =vec.begin();
	while ( iter != vec.end() )
	{	if( *iter%2 ==1 )
			outfile << *iter;
		++iter;
	}
	outfile << endl << "--even--" << endl;
	iter = vec.begin();
	while ( iter != vec.end() )
        {       if( *iter%2 ==0 )
                        outfile << *iter;
		++iter;
        }
	outfile << endl;

//11.19-22
	vector<int>::reverse_iterator riter;
	copy(vec.rbegin(),vec.rend(),out_iter);
	list<int> ilist;
	copy(vec.rbegin()+3,vec.rend()-3,back_inserter(ilist));
	copy(ilist.begin(),ilist.end(),out_iter);
	ilist.reverse();
	copy(ilist.begin(),ilist.end(),out_iter);
	
	return 0;

}
