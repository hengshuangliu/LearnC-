#include <iostream>
#include <iterator>
#include <vector>
#include <algorithm>
#include <list>
#include <numeric>
using namespace std;

void show(const list<double>& dlist)
{	for( list<double>::const_iterator iter = dlist.begin();iter != dlist.end();++iter )
		cout << *iter << " ";
	cout << endl;	
}

bool isbigger(const double &d1,const double &d2)
{	return d1 > d2;
}

bool mt5(const double &d)
{	return d > 5;
}

int main()
{	int i=1;
	vector<int> vec;
	do{	vec.push_back(i);
		++i;
	}while(i < 11);
	list<double> dlist;
	replace_copy(vec.begin(),vec.end(),back_inserter(dlist),5,50);
	show(dlist);
	replace_copy(vec.begin(),vec.end(),front_inserter(dlist),5,50);
	show(dlist);
	list<double>::iterator it = find( dlist.begin(),dlist.end(),50 );
	replace_copy(vec.begin(),vec.end(),inserter(dlist,it),5,50);
	show(dlist);
	cout << "50" << " reprent " << count(dlist.begin(),dlist.end(),50) << " times" << endl;
	cout << "the sum is" << accumulate( dlist.begin(),dlist.end(),0) << endl;
//	sort( dlist.begin(),dlist.end() ); //sort cannot support list type
	dlist.sort();
	show(dlist);
	list<double>::iterator end_unique = unique(dlist.begin(),dlist.end());
	dlist.erase(end_unique,dlist.end() );
	show(dlist);
	stable_sort(vec.begin(),vec.end(),isbigger);
	for( vector<int>::iterator iter = vec.begin();iter != vec.end();++iter)
		cout << *iter << " ";
	cout << endl;
//	show(dlist);
	cout << count_if(dlist.begin(),dlist.end(),mt5) << " > 5" << endl;
	return 0;
} 
