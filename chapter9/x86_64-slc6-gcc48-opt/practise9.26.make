#-- start of make_header -----------------

#====================================
#  Application practise9.26
#
#   Generated Mon Sep 14 16:14:14 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_practise9.26_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise9.26_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_practise9.26

chapter9_tag = $(tag)

#cmt_local_tagfile_practise9.26 = $(chapter9_tag)_practise9.26.make
cmt_local_tagfile_practise9.26 = $(bin)$(chapter9_tag)_practise9.26.make

else

tags      = $(tag),$(CMTEXTRATAGS)

chapter9_tag = $(tag)

#cmt_local_tagfile_practise9.26 = $(chapter9_tag).make
cmt_local_tagfile_practise9.26 = $(bin)$(chapter9_tag).make

endif

include $(cmt_local_tagfile_practise9.26)
#-include $(cmt_local_tagfile_practise9.26)

ifdef cmt_practise9.26_has_target_tag

cmt_final_setup_practise9.26 = $(bin)setup_practise9.26.make
#cmt_final_setup_practise9.26 = $(bin)chapter9_practise9.26setup.make
cmt_local_practise9.26_makefile = $(bin)practise9.26.make

else

cmt_final_setup_practise9.26 = $(bin)setup.make
#cmt_final_setup_practise9.26 = $(bin)chapter9setup.make
cmt_local_practise9.26_makefile = $(bin)practise9.26.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)chapter9setup.make

#practise9.26 :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'practise9.26'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = practise9.26/
#practise9.26::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

practise9.26 :: dirs  $(bin)practise9.26${application_suffix}
	$(echo) "practise9.26 ok"

#-- end of application_header
#-- start of application

$(bin)practise9.26${application_suffix} :: $(bin)practise9.26.o $(use_stamps) $(practise9.26_stamps) $(practise9.26stamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)practise9.26.o $(cmt_installarea_linkopts) $(practise9.26_use_linkopts) $(practise9.26linkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
practise9.26installname = practise9.26${application_suffix}

practise9.26 :: practise9.26install

install :: practise9.26install

practise9.26install :: $(install_dir)/$(practise9.26installname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(practise9.26installname) :: $(bin)$(practise9.26installname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(practise9.26installname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##practise9.26clean :: practise9.26uninstall

uninstall :: practise9.26uninstall

practise9.26uninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(practise9.26installname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (practise9.26.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),practise9.26clean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)practise9.26_dependencies.make :: dirs

ifndef QUICK
$(bin)practise9.26_dependencies.make : $(src)practise9.26.cpp $(use_requirements) $(cmt_final_setup_practise9.26)
	$(echo) "(practise9.26.make) Rebuilding $@"; \
	  $(build_dependencies) practise9.26 -all_sources -out=$@ $(src)practise9.26.cpp
endif

#$(practise9.26_dependencies)

-include $(bin)practise9.26_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),practise9.26clean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)practise9.26.d

$(bin)$(binobj)practise9.26.d : $(use_requirements) $(cmt_final_setup_practise9.26)

$(bin)$(binobj)practise9.26.d : $(src)practise9.26.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/practise9.26.dep $(use_pp_cppflags) $(practise9.26_pp_cppflags) $(app_practise9.26_pp_cppflags) $(practise9.26_pp_cppflags) $(use_cppflags) $(practise9.26_cppflags) $(app_practise9.26_cppflags) $(practise9.26_cppflags) $(practise9.26_cpp_cppflags)  $(src)practise9.26.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/practise9.26.o $(src)practise9.26.cpp $(@D)/practise9.26.dep
endif
endif

$(bin)$(binobj)practise9.26.o : $(src)practise9.26.cpp
else
$(bin)practise9.26_dependencies.make : $(practise9.26_cpp_dependencies)

$(bin)$(binobj)practise9.26.o : $(practise9.26_cpp_dependencies)
endif
	$(cpp_echo) $(src)practise9.26.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(practise9.26_pp_cppflags) $(app_practise9.26_pp_cppflags) $(practise9.26_pp_cppflags) $(use_cppflags) $(practise9.26_cppflags) $(app_practise9.26_cppflags) $(practise9.26_cppflags) $(practise9.26_cpp_cppflags)  $(src)practise9.26.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: practise9.26clean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(practise9.26.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(practise9.26.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(practise9.26.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(practise9.26.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_practise9.26)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(practise9.26.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(practise9.26.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(practise9.26.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

practise9.26clean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application practise9.26
	-$(cleanup_silent) cd $(bin); /bin/rm -f practise9.26${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects practise9.26
	-$(cleanup_silent) /bin/rm -f $(bin)practise9.26.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)practise9.26.o) $(patsubst %.o,%.dep,$(bin)practise9.26.o) $(patsubst %.o,%.d.stamp,$(bin)practise9.26.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf practise9.26_deps practise9.26_dependencies.make
#-- end of cleanup_objects ------
