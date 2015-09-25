#include <stack>
#include <string>
#include <iostream>
#include <vector>
using namespace std;
int main()
{	cout << "input a expression: ";
	string str;
	getline(cin,str);
	stack<char,vector<char> > csta,csta2;
	bool tag=false;
	for(string::iterator iter=str.begin();iter!=str.end();++iter)
	{
		if(*iter == '(')
		{	csta.push('*');
			cout << *iter;
			tag = true;
			continue; }
		else if(tag == true && *iter == ')')
		{	tag= false;
			cout << *iter;
			continue; }
		if(tag == false)
		{	csta.push(*iter); }
		else 
			cout << *iter;
	}
	cout << endl;
	while(csta.empty() == false)
	{	csta2.push(csta.top());
		csta.pop(); }
	while(csta2.empty() == false)
	{	cout << csta2.top();
		csta2.pop(); }
	cout << endl;
	return 0;
}
