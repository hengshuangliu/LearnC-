#-- start of make_header -----------------

#====================================
#  Application query
#
#   Generated Thu Sep 17 19:52:34 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_query_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_query_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_query

chapter10_tag = $(tag)

#cmt_local_tagfile_query = $(chapter10_tag)_query.make
cmt_local_tagfile_query = $(bin)$(chapter10_tag)_query.make

else

tags      = $(tag),$(CMTEXTRATAGS)

chapter10_tag = $(tag)

#cmt_local_tagfile_query = $(chapter10_tag).make
cmt_local_tagfile_query = $(bin)$(chapter10_tag).make

endif

include $(cmt_local_tagfile_query)
#-include $(cmt_local_tagfile_query)

ifdef cmt_query_has_target_tag

cmt_final_setup_query = $(bin)setup_query.make
#cmt_final_setup_query = $(bin)chapter10_querysetup.make
cmt_local_query_makefile = $(bin)query.make

else

cmt_final_setup_query = $(bin)setup.make
#cmt_final_setup_query = $(bin)chapter10setup.make
cmt_local_query_makefile = $(bin)query.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)chapter10setup.make

#query :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'query'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = query/
#query::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

query :: dirs  $(bin)query${application_suffix}
	$(echo) "query ok"

#-- end of application_header
#-- start of application

$(bin)query${application_suffix} :: $(bin)query.o $(bin)TextQuery.o $(use_stamps) $(query_stamps) $(querystamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)query.o $(bin)TextQuery.o $(cmt_installarea_linkopts) $(query_use_linkopts) $(querylinkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
queryinstallname = query${application_suffix}

query :: queryinstall

install :: queryinstall

queryinstall :: $(install_dir)/$(queryinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(queryinstallname) :: $(bin)$(queryinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(queryinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##queryclean :: queryuninstall

uninstall :: queryuninstall

queryuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(queryinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (query.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),queryclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)query_dependencies.make :: dirs

ifndef QUICK
$(bin)query_dependencies.make : $(src)query.cpp $(src)TextQuery.cpp $(use_requirements) $(cmt_final_setup_query)
	$(echo) "(query.make) Rebuilding $@"; \
	  $(build_dependencies) query -all_sources -out=$@ $(src)query.cpp $(src)TextQuery.cpp
endif

#$(query_dependencies)

-include $(bin)query_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),queryclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)query.d

$(bin)$(binobj)query.d : $(use_requirements) $(cmt_final_setup_query)

$(bin)$(binobj)query.d : $(src)query.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/query.dep $(use_pp_cppflags) $(query_pp_cppflags) $(app_query_pp_cppflags) $(query_pp_cppflags) $(use_cppflags) $(query_cppflags) $(app_query_cppflags) $(query_cppflags) $(query_cpp_cppflags)  $(src)query.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/query.o $(src)query.cpp $(@D)/query.dep
endif
endif

$(bin)$(binobj)query.o : $(src)query.cpp
else
$(bin)query_dependencies.make : $(query_cpp_dependencies)

$(bin)$(binobj)query.o : $(query_cpp_dependencies)
endif
	$(cpp_echo) $(src)query.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(query_pp_cppflags) $(app_query_pp_cppflags) $(query_pp_cppflags) $(use_cppflags) $(query_cppflags) $(app_query_cppflags) $(query_cppflags) $(query_cpp_cppflags)  $(src)query.cpp

#-- end of cpp ------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),queryclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TextQuery.d

$(bin)$(binobj)TextQuery.d : $(use_requirements) $(cmt_final_setup_query)

$(bin)$(binobj)TextQuery.d : $(src)TextQuery.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/TextQuery.dep $(use_pp_cppflags) $(query_pp_cppflags) $(app_query_pp_cppflags) $(TextQuery_pp_cppflags) $(use_cppflags) $(query_cppflags) $(app_query_cppflags) $(TextQuery_cppflags) $(TextQuery_cpp_cppflags)  $(src)TextQuery.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/TextQuery.o $(src)TextQuery.cpp $(@D)/TextQuery.dep
endif
endif

$(bin)$(binobj)TextQuery.o : $(src)TextQuery.cpp
else
$(bin)query_dependencies.make : $(TextQuery_cpp_dependencies)

$(bin)$(binobj)TextQuery.o : $(TextQuery_cpp_dependencies)
endif
	$(cpp_echo) $(src)TextQuery.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(query_pp_cppflags) $(app_query_pp_cppflags) $(TextQuery_pp_cppflags) $(use_cppflags) $(query_cppflags) $(app_query_cppflags) $(TextQuery_cppflags) $(TextQuery_cpp_cppflags)  $(src)TextQuery.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: queryclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(query.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(query.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(query.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(query.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_query)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(query.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(query.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(query.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

queryclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application query
	-$(cleanup_silent) cd $(bin); /bin/rm -f query${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects query
	-$(cleanup_silent) /bin/rm -f $(bin)query.o $(bin)TextQuery.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)query.o $(bin)TextQuery.o) $(patsubst %.o,%.dep,$(bin)query.o $(bin)TextQuery.o) $(patsubst %.o,%.d.stamp,$(bin)query.o $(bin)TextQuery.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf query_deps query_dependencies.make
#-- end of cleanup_objects ------
