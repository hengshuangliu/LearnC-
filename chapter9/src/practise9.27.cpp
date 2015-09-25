#include <deque>
#include <iostream>
#include <algorithm>
#include <string>
using namespace std;
int main()
{	deque<string> sdeq;
	string sval;
	cout << "please input some strings: ";
	while(cin >> sval)
	{	sdeq.push_back(sval); }
	cin.clear();
	cout << endl;
	cout << "please input a string you want to delete: ";
	cin >> sval;
	deque<string>::iterator iter;
	iter=find(sdeq.begin(),sdeq.end(),sval);
	if(iter == sdeq.end())
	{	cout << "we can not fine " << sval <<endl;
		return -1; }
	sdeq.erase(iter);
	for(deque<string>::iterator iter=sdeq.begin();iter!=sdeq.end();++iter)
		cout << *iter << " ";
	return 0;
}
