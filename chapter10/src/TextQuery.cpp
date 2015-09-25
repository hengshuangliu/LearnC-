#include "TextQuery.h"
#include <sstream>
#include <stdexcept>
#include <cctype>
#include <utility>

string TextQuery::changelower(const string &cstr) const
{	string cstring,str=cstr;
	for(string::iterator iter = str.begin();iter != str.end(); ++iter )
	{	if( isalpha(*iter) )
			cstring.push_back( tolower(*iter) );
		else
			cstring.push_back(*iter);
	}
	return cstring;
}
			

void TextQuery::store_file(ifstream &is)
{	string textline;
	while( getline(is,textline) )
	{	lines_of_text.push_back(textline);}
}

void TextQuery::build_map()
{	for(line_s line = 0;line != lines_of_text.size();++line)
	{	istringstream read_line(lines_of_text[line]);
		string word;
		while(read_line >> word)
		{	word_map[word].insert(line); }
	}
}

void TextQuery::build_multimap()
{	for(map<string,set<line_s> >::const_iterator iter=word_map.begin(); iter != word_map.end();++iter)
	{	i_word_map.insert(make_pair( changelower(iter->first),iter->second)); }
}




TextQuery::TextQuery(ifstream &is)
{	read_file(is); }

vector<set<TextQuery::line_s> > TextQuery::run_query(const string &str_query,flag qflag) const
{	vector<set<TextQuery::line_s> > vec;
	switch (qflag)
	{	case normal:{	map<string,set<line_s> >::const_iterator pos=word_map.find(str_query);
				if( pos == word_map.end() )
					break;
				else 
					vec.push_back(pos->second);
				}
				break;
		case cinsentive:{	typedef multimap<string,set<line_s> >::size_type sz_type;
					sz_type entry = i_word_map.count( changelower(str_query) );
					multimap<string,set<line_s> >::const_iterator map_it = word_map.find( changelower(str_query) );
					for(sz_type cnt=0; cnt != entry; ++cnt,++map_it)
					{	vec.push_back( map_it->second ); }
					 }
				break;
	
		case begin:{
				for( map<string, set<line_s> >::const_iterator iter = word_map.begin();iter != word_map.end();++iter )
				{	if( (iter->first).size() >= str_query.size() )
					{	if( (iter->first).find(str_query) == 0 )
							vec.push_back( iter->second );
					}
				}
				}
				break;
		case ci_begin:{	string str = changelower( str_query);
				for( multimap<string, set<line_s> >::const_iterator iter =i_word_map.begin();iter != i_word_map.end();++iter )
                                {       if( (iter->first).size() >= str_query.size() )
                                        {       if( (iter->first).find(str) == 0 )
                                                        vec.push_back( iter->second );
                                        }
                                }
				}
                                break;
		case end:{	for( map<string, set<line_s> >::const_iterator iter = word_map.begin();iter != word_map.end();++iter )
                                {       string::size_type sz = (iter->first).size();
					if( sz >= str_query.size() )
                                        {       if( (iter->first).rfind(str_query) == (sz - str_query.size() ) )
                                                        vec.push_back( iter->second );
                                        }
                                }
                           }
                                break;
		case ci_end:{	string str = changelower( str_query );
				for( multimap<string, set<line_s> >::const_iterator iter = i_word_map.begin();iter != i_word_map.end();++iter )
                                {       string::size_type sz = (iter->first).size();
                                        if ( sz >= str_query.size() )
                                        {       if( (iter->first).rfind(str) == (sz - str_query.size() ) )
                                                        vec.push_back( iter->second );
                                        }
                                }
                            }
                                break;
		case sub:{	for( map<string, set<line_s> >::const_iterator iter = word_map.begin();iter != word_map.end();++iter )
                                {       if( (iter->first).size() >= str_query.size() )
                                        {       if( (iter->first).find(str_query) != string::npos )
                                                        vec.push_back( iter->second );
                                        }
                                }
                         }
                                break;	
		case ci_sub:{	string str = changelower( str_query);
                                for( multimap<string, set<line_s> >::const_iterator iter =i_word_map.begin();iter != i_word_map.end();++iter )
                                {       if( (iter->first).size() >= str_query.size() )
                                        {       if( (iter->first).find(str) != string::npos )
                                                        vec.push_back( iter->second );
                                        }
                                }
                            }
                                break;
		default:
			break;
	}
	return vec;
}
	
string TextQuery::text_line(TextQuery::line_s line) const
{	if(line < lines_of_text.size() )
		return lines_of_text[line];
	else
		throw out_of_range("line number out of range");
}
