#ifndef TEXTQUERY_H
#define TEXTQUERY_H

#include <vector>
#include <map>
#include <set>
#include <fstream>
#include <string>
using namespace std;
enum flag{normal,cinsentive,begin,ci_begin,end,ci_end,sub,ci_sub};
class TextQuery {
	public:
		TextQuery(ifstream &is);
		~TextQuery(){ };
		typedef vector<string>::size_type line_s;
		void read_file(ifstream &is)
			{ store_file(is);build_map();build_multimap();};
		vector<set<line_s> > run_query(const string&, flag qflag) const;
		string text_line(line_s) const;
	private:
		string changelower(const string&) const;
		void store_file(ifstream&);
		void build_map();
		void build_multimap();
		vector<string> lines_of_text;
		map<string,set<line_s> > word_map;
		multimap<string,set<line_s> > i_word_map;
		};




#endif
