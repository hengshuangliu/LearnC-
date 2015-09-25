#-- start of make_header -----------------

#====================================
#  Application test
#
#   Generated Fri Sep 11 20:26:09 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_test_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_test_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_test

test_tag = $(tag)

#cmt_local_tagfile_test = $(test_tag)_test.make
cmt_local_tagfile_test = $(bin)$(test_tag)_test.make

else

tags      = $(tag),$(CMTEXTRATAGS)

test_tag = $(tag)

#cmt_local_tagfile_test = $(test_tag).make
cmt_local_tagfile_test = $(bin)$(test_tag).make

endif

include $(cmt_local_tagfile_test)
#-include $(cmt_local_tagfile_test)

ifdef cmt_test_has_target_tag

cmt_final_setup_test = $(bin)setup_test.make
#cmt_final_setup_test = $(bin)test_testsetup.make
cmt_local_test_makefile = $(bin)test.make

else

cmt_final_setup_test = $(bin)setup.make
#cmt_final_setup_test = $(bin)testsetup.make
cmt_local_test_makefile = $(bin)test.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)testsetup.make

#test :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'test'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = test/
#test::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

test :: dirs  $(bin)test${application_suffix}
	$(echo) "test ok"

#-- end of application_header
#-- start of application

$(bin)test${application_suffix} :: $(bin)test.o $(use_stamps) $(test_stamps) $(teststamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)test.o $(cmt_installarea_linkopts) $(test_use_linkopts) $(testlinkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
testinstallname = test${application_suffix}

test :: testinstall

install :: testinstall

testinstall :: $(install_dir)/$(testinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(testinstallname) :: $(bin)$(testinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(testinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##testclean :: testuninstall

uninstall :: testuninstall

testuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(testinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (test.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),testclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)test_dependencies.make :: dirs

ifndef QUICK
$(bin)test_dependencies.make : $(src)test.cpp $(use_requirements) $(cmt_final_setup_test)
	$(echo) "(test.make) Rebuilding $@"; \
	  $(build_dependencies) test -all_sources -out=$@ $(src)test.cpp
endif

#$(test_dependencies)

-include $(bin)test_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),testclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)test.d

$(bin)$(binobj)test.d : $(use_requirements) $(cmt_final_setup_test)

$(bin)$(binobj)test.d : $(src)test.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/test.dep $(use_pp_cppflags) $(test_pp_cppflags) $(app_test_pp_cppflags) $(test_pp_cppflags) $(use_cppflags) $(test_cppflags) $(app_test_cppflags) $(test_cppflags) $(test_cpp_cppflags)  $(src)test.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/test.o $(src)test.cpp $(@D)/test.dep
endif
endif

$(bin)$(binobj)test.o : $(src)test.cpp
else
$(bin)test_dependencies.make : $(test_cpp_dependencies)

$(bin)$(binobj)test.o : $(test_cpp_dependencies)
endif
	$(cpp_echo) $(src)test.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(test_pp_cppflags) $(app_test_pp_cppflags) $(test_pp_cppflags) $(use_cppflags) $(test_cppflags) $(app_test_cppflags) $(test_cppflags) $(test_cpp_cppflags)  $(src)test.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: testclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(test.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(test.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(test.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(test.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_test)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(test.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(test.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(test.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

testclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application test
	-$(cleanup_silent) cd $(bin); /bin/rm -f test${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects test
	-$(cleanup_silent) /bin/rm -f $(bin)test.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)test.o) $(patsubst %.o,%.dep,$(bin)test.o) $(patsubst %.o,%.d.stamp,$(bin)test.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf test_deps test_dependencies.make
#-- end of cleanup_objects ------
