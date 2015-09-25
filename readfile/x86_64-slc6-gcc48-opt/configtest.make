#-- start of make_header -----------------

#====================================
#  Application configtest
#
#   Generated Sat Sep 19 15:33:46 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_configtest_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_configtest_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_configtest

readfile_tag = $(tag)

#cmt_local_tagfile_configtest = $(readfile_tag)_configtest.make
cmt_local_tagfile_configtest = $(bin)$(readfile_tag)_configtest.make

else

tags      = $(tag),$(CMTEXTRATAGS)

readfile_tag = $(tag)

#cmt_local_tagfile_configtest = $(readfile_tag).make
cmt_local_tagfile_configtest = $(bin)$(readfile_tag).make

endif

include $(cmt_local_tagfile_configtest)
#-include $(cmt_local_tagfile_configtest)

ifdef cmt_configtest_has_target_tag

cmt_final_setup_configtest = $(bin)setup_configtest.make
#cmt_final_setup_configtest = $(bin)readfile_configtestsetup.make
cmt_local_configtest_makefile = $(bin)configtest.make

else

cmt_final_setup_configtest = $(bin)setup.make
#cmt_final_setup_configtest = $(bin)readfilesetup.make
cmt_local_configtest_makefile = $(bin)configtest.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)readfilesetup.make

#configtest :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'configtest'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = configtest/
#configtest::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

configtest :: dirs  $(bin)configtest${application_suffix}
	$(echo) "configtest ok"

#-- end of application_header
#-- start of application

$(bin)configtest${application_suffix} :: $(bin)configuration.o $(bin)configtest.o $(use_stamps) $(configtest_stamps) $(configteststamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)configuration.o $(bin)configtest.o $(cmt_installarea_linkopts) $(configtest_use_linkopts) $(configtestlinkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
configtestinstallname = configtest${application_suffix}

configtest :: configtestinstall

install :: configtestinstall

configtestinstall :: $(install_dir)/$(configtestinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(configtestinstallname) :: $(bin)$(configtestinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(configtestinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##configtestclean :: configtestuninstall

uninstall :: configtestuninstall

configtestuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(configtestinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (configtest.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),configtestclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)configtest_dependencies.make :: dirs

ifndef QUICK
$(bin)configtest_dependencies.make : $(src)configuration.cpp $(src)configtest.cpp $(use_requirements) $(cmt_final_setup_configtest)
	$(echo) "(configtest.make) Rebuilding $@"; \
	  $(build_dependencies) configtest -all_sources -out=$@ $(src)configuration.cpp $(src)configtest.cpp
endif

#$(configtest_dependencies)

-include $(bin)configtest_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),configtestclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)configuration.d

$(bin)$(binobj)configuration.d : $(use_requirements) $(cmt_final_setup_configtest)

$(bin)$(binobj)configuration.d : $(src)configuration.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/configuration.dep $(use_pp_cppflags) $(configtest_pp_cppflags) $(app_configtest_pp_cppflags) $(configuration_pp_cppflags) $(use_cppflags) $(configtest_cppflags) $(app_configtest_cppflags) $(configuration_cppflags) $(configuration_cpp_cppflags)  $(src)configuration.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/configuration.o $(src)configuration.cpp $(@D)/configuration.dep
endif
endif

$(bin)$(binobj)configuration.o : $(src)configuration.cpp
else
$(bin)configtest_dependencies.make : $(configuration_cpp_dependencies)

$(bin)$(binobj)configuration.o : $(configuration_cpp_dependencies)
endif
	$(cpp_echo) $(src)configuration.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(configtest_pp_cppflags) $(app_configtest_pp_cppflags) $(configuration_pp_cppflags) $(use_cppflags) $(configtest_cppflags) $(app_configtest_cppflags) $(configuration_cppflags) $(configuration_cpp_cppflags)  $(src)configuration.cpp

#-- end of cpp ------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),configtestclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)configtest.d

$(bin)$(binobj)configtest.d : $(use_requirements) $(cmt_final_setup_configtest)

$(bin)$(binobj)configtest.d : $(src)configtest.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/configtest.dep $(use_pp_cppflags) $(configtest_pp_cppflags) $(app_configtest_pp_cppflags) $(configtest_pp_cppflags) $(use_cppflags) $(configtest_cppflags) $(app_configtest_cppflags) $(configtest_cppflags) $(configtest_cpp_cppflags)  $(src)configtest.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/configtest.o $(src)configtest.cpp $(@D)/configtest.dep
endif
endif

$(bin)$(binobj)configtest.o : $(src)configtest.cpp
else
$(bin)configtest_dependencies.make : $(configtest_cpp_dependencies)

$(bin)$(binobj)configtest.o : $(configtest_cpp_dependencies)
endif
	$(cpp_echo) $(src)configtest.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(configtest_pp_cppflags) $(app_configtest_pp_cppflags) $(configtest_pp_cppflags) $(use_cppflags) $(configtest_cppflags) $(app_configtest_cppflags) $(configtest_cppflags) $(configtest_cpp_cppflags)  $(src)configtest.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: configtestclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(configtest.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(configtest.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(configtest.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(configtest.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_configtest)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(configtest.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(configtest.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(configtest.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

configtestclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application configtest
	-$(cleanup_silent) cd $(bin); /bin/rm -f configtest${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects configtest
	-$(cleanup_silent) /bin/rm -f $(bin)configuration.o $(bin)configtest.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)configuration.o $(bin)configtest.o) $(patsubst %.o,%.dep,$(bin)configuration.o $(bin)configtest.o) $(patsubst %.o,%.d.stamp,$(bin)configuration.o $(bin)configtest.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf configtest_deps configtest_dependencies.make
#-- end of cleanup_objects ------
