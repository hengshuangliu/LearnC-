#include <iostream>
#include <string>
using namespace std;
int main(int argc, char **argv)
{
	string str(argv[0]);
	cout << argc << str << " " <<  argv[1] << endl;
	return 0;	
}
