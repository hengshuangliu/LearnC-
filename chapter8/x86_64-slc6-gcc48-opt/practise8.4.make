#-- start of make_header -----------------

#====================================
#  Application practise8.4
#
#   Generated Fri Sep 11 21:24:18 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_practise8.4_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise8.4_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_practise8.4

chapter8_tag = $(tag)

#cmt_local_tagfile_practise8.4 = $(chapter8_tag)_practise8.4.make
cmt_local_tagfile_practise8.4 = $(bin)$(chapter8_tag)_practise8.4.make

else

tags      = $(tag),$(CMTEXTRATAGS)

chapter8_tag = $(tag)

#cmt_local_tagfile_practise8.4 = $(chapter8_tag).make
cmt_local_tagfile_practise8.4 = $(bin)$(chapter8_tag).make

endif

include $(cmt_local_tagfile_practise8.4)
#-include $(cmt_local_tagfile_practise8.4)

ifdef cmt_practise8.4_has_target_tag

cmt_final_setup_practise8.4 = $(bin)setup_practise8.4.make
#cmt_final_setup_practise8.4 = $(bin)chapter8_practise8.4setup.make
cmt_local_practise8.4_makefile = $(bin)practise8.4.make

else

cmt_final_setup_practise8.4 = $(bin)setup.make
#cmt_final_setup_practise8.4 = $(bin)chapter8setup.make
cmt_local_practise8.4_makefile = $(bin)practise8.4.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)chapter8setup.make

#practise8.4 :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'practise8.4'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = practise8.4/
#practise8.4::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

practise8.4 :: dirs  $(bin)practise8.4${application_suffix}
	$(echo) "practise8.4 ok"

#-- end of application_header
#-- start of application

$(bin)practise8.4${application_suffix} :: $(bin)practise8.3.o $(bin)practise8.4.o $(use_stamps) $(practise8.4_stamps) $(practise8.4stamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)practise8.3.o $(bin)practise8.4.o $(cmt_installarea_linkopts) $(practise8.4_use_linkopts) $(practise8.4linkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
practise8.4installname = practise8.4${application_suffix}

practise8.4 :: practise8.4install

install :: practise8.4install

practise8.4install :: $(install_dir)/$(practise8.4installname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(practise8.4installname) :: $(bin)$(practise8.4installname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(practise8.4installname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##practise8.4clean :: practise8.4uninstall

uninstall :: practise8.4uninstall

practise8.4uninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(practise8.4installname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (practise8.4.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),practise8.4clean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)practise8.4_dependencies.make :: dirs

ifndef QUICK
$(bin)practise8.4_dependencies.make : $(src)practise8.3.cpp $(src)practise8.4.cpp $(use_requirements) $(cmt_final_setup_practise8.4)
	$(echo) "(practise8.4.make) Rebuilding $@"; \
	  $(build_dependencies) practise8.4 -all_sources -out=$@ $(src)practise8.3.cpp $(src)practise8.4.cpp
endif

#$(practise8.4_dependencies)

-include $(bin)practise8.4_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),practise8.4clean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)practise8.3.d

$(bin)$(binobj)practise8.3.d : $(use_requirements) $(cmt_final_setup_practise8.4)

$(bin)$(binobj)practise8.3.d : $(src)practise8.3.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/practise8.3.dep $(use_pp_cppflags) $(practise8.4_pp_cppflags) $(app_practise8.4_pp_cppflags) $(practise8.3_pp_cppflags) $(use_cppflags) $(practise8.4_cppflags) $(app_practise8.4_cppflags) $(practise8.3_cppflags) $(practise8.3_cpp_cppflags)  $(src)practise8.3.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/practise8.3.o $(src)practise8.3.cpp $(@D)/practise8.3.dep
endif
endif

$(bin)$(binobj)practise8.3.o : $(src)practise8.3.cpp
else
$(bin)practise8.4_dependencies.make : $(practise8.3_cpp_dependencies)

$(bin)$(binobj)practise8.3.o : $(practise8.3_cpp_dependencies)
endif
	$(cpp_echo) $(src)practise8.3.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(practise8.4_pp_cppflags) $(app_practise8.4_pp_cppflags) $(practise8.3_pp_cppflags) $(use_cppflags) $(practise8.4_cppflags) $(app_practise8.4_cppflags) $(practise8.3_cppflags) $(practise8.3_cpp_cppflags)  $(src)practise8.3.cpp

#-- end of cpp ------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),practise8.4clean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)practise8.4.d

$(bin)$(binobj)practise8.4.d : $(use_requirements) $(cmt_final_setup_practise8.4)

$(bin)$(binobj)practise8.4.d : $(src)practise8.4.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/practise8.4.dep $(use_pp_cppflags) $(practise8.4_pp_cppflags) $(app_practise8.4_pp_cppflags) $(practise8.4_pp_cppflags) $(use_cppflags) $(practise8.4_cppflags) $(app_practise8.4_cppflags) $(practise8.4_cppflags) $(practise8.4_cpp_cppflags)  $(src)practise8.4.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/practise8.4.o $(src)practise8.4.cpp $(@D)/practise8.4.dep
endif
endif

$(bin)$(binobj)practise8.4.o : $(src)practise8.4.cpp
else
$(bin)practise8.4_dependencies.make : $(practise8.4_cpp_dependencies)

$(bin)$(binobj)practise8.4.o : $(practise8.4_cpp_dependencies)
endif
	$(cpp_echo) $(src)practise8.4.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(practise8.4_pp_cppflags) $(app_practise8.4_pp_cppflags) $(practise8.4_pp_cppflags) $(use_cppflags) $(practise8.4_cppflags) $(app_practise8.4_cppflags) $(practise8.4_cppflags) $(practise8.4_cpp_cppflags)  $(src)practise8.4.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: practise8.4clean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(practise8.4.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(practise8.4.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(practise8.4.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(practise8.4.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_practise8.4)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(practise8.4.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(practise8.4.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(practise8.4.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

practise8.4clean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application practise8.4
	-$(cleanup_silent) cd $(bin); /bin/rm -f practise8.4${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects practise8.4
	-$(cleanup_silent) /bin/rm -f $(bin)practise8.3.o $(bin)practise8.4.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)practise8.3.o $(bin)practise8.4.o) $(patsubst %.o,%.dep,$(bin)practise8.3.o $(bin)practise8.4.o) $(patsubst %.o,%.d.stamp,$(bin)practise8.3.o $(bin)practise8.4.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf practise8.4_deps practise8.4_dependencies.make
#-- end of cleanup_objects ------
