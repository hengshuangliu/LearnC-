#include <vector>
#include <list>
#include <iostream>
using namespace std;
int main()
{	vector<int> ivec;
	list<int> ilist;
	int ival;
	cout << "please input some integers: ";
	while(cin >> ival)
	{	ivec.push_back(ival);
		ilist.push_back(ival); }
	cout << endl;
	cout << "delete odd numbers in the list" << endl;
	for(list<int>::iterator lis=ilist.begin();lis!=ilist.end();++lis)
	{	if(*lis%2==1)
		{	lis=ilist.erase(lis);
			--lis; }
	}
	
	for(list<int>::iterator lis=ilist.begin();lis!=ilist.end();++lis)
	{	cout << *lis << " "; }
	
	cout << endl;
	cout << "delete even numbers in the vector" << endl;
	for (vector<int>::iterator vec=ivec.begin();vec!=ivec.end();++vec)
	{	if(*vec%2==0)
		{	vec=ivec.erase(vec);
			--vec; }
	}
	for(vector<int>::iterator vec=ivec.begin();vec!=ivec.end();++vec)
	{	cout << *vec << " "; }
	return 0;
}
