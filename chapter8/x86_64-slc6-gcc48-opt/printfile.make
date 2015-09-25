#-- start of make_header -----------------

#====================================
#  Application printfile
#
#   Generated Fri Sep 11 21:24:19 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_printfile_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_printfile_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_printfile

chapter8_tag = $(tag)

#cmt_local_tagfile_printfile = $(chapter8_tag)_printfile.make
cmt_local_tagfile_printfile = $(bin)$(chapter8_tag)_printfile.make

else

tags      = $(tag),$(CMTEXTRATAGS)

chapter8_tag = $(tag)

#cmt_local_tagfile_printfile = $(chapter8_tag).make
cmt_local_tagfile_printfile = $(bin)$(chapter8_tag).make

endif

include $(cmt_local_tagfile_printfile)
#-include $(cmt_local_tagfile_printfile)

ifdef cmt_printfile_has_target_tag

cmt_final_setup_printfile = $(bin)setup_printfile.make
#cmt_final_setup_printfile = $(bin)chapter8_printfilesetup.make
cmt_local_printfile_makefile = $(bin)printfile.make

else

cmt_final_setup_printfile = $(bin)setup.make
#cmt_final_setup_printfile = $(bin)chapter8setup.make
cmt_local_printfile_makefile = $(bin)printfile.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)chapter8setup.make

#printfile :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'printfile'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = printfile/
#printfile::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

printfile :: dirs  $(bin)printfile${application_suffix}
	$(echo) "printfile ok"

#-- end of application_header
#-- start of application

$(bin)printfile${application_suffix} :: $(bin)printfile.o $(use_stamps) $(printfile_stamps) $(printfilestamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)printfile.o $(cmt_installarea_linkopts) $(printfile_use_linkopts) $(printfilelinkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
printfileinstallname = printfile${application_suffix}

printfile :: printfileinstall

install :: printfileinstall

printfileinstall :: $(install_dir)/$(printfileinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(printfileinstallname) :: $(bin)$(printfileinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(printfileinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##printfileclean :: printfileuninstall

uninstall :: printfileuninstall

printfileuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(printfileinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (printfile.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),printfileclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)printfile_dependencies.make :: dirs

ifndef QUICK
$(bin)printfile_dependencies.make : $(src)printfile.cpp $(use_requirements) $(cmt_final_setup_printfile)
	$(echo) "(printfile.make) Rebuilding $@"; \
	  $(build_dependencies) printfile -all_sources -out=$@ $(src)printfile.cpp
endif

#$(printfile_dependencies)

-include $(bin)printfile_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),printfileclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)printfile.d

$(bin)$(binobj)printfile.d : $(use_requirements) $(cmt_final_setup_printfile)

$(bin)$(binobj)printfile.d : $(src)printfile.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/printfile.dep $(use_pp_cppflags) $(printfile_pp_cppflags) $(app_printfile_pp_cppflags) $(printfile_pp_cppflags) $(use_cppflags) $(printfile_cppflags) $(app_printfile_cppflags) $(printfile_cppflags) $(printfile_cpp_cppflags)  $(src)printfile.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/printfile.o $(src)printfile.cpp $(@D)/printfile.dep
endif
endif

$(bin)$(binobj)printfile.o : $(src)printfile.cpp
else
$(bin)printfile_dependencies.make : $(printfile_cpp_dependencies)

$(bin)$(binobj)printfile.o : $(printfile_cpp_dependencies)
endif
	$(cpp_echo) $(src)printfile.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(printfile_pp_cppflags) $(app_printfile_pp_cppflags) $(printfile_pp_cppflags) $(use_cppflags) $(printfile_cppflags) $(app_printfile_cppflags) $(printfile_cppflags) $(printfile_cpp_cppflags)  $(src)printfile.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: printfileclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(printfile.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(printfile.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(printfile.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(printfile.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_printfile)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(printfile.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(printfile.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(printfile.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

printfileclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application printfile
	-$(cleanup_silent) cd $(bin); /bin/rm -f printfile${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects printfile
	-$(cleanup_silent) /bin/rm -f $(bin)printfile.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)printfile.o) $(patsubst %.o,%.dep,$(bin)printfile.o) $(patsubst %.o,%.d.stamp,$(bin)printfile.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf printfile_deps printfile_dependencies.make
#-- end of cleanup_objects ------
