#-- start of make_header -----------------

#====================================
#  Application pra14
#
#   Generated Wed Sep 23 15:40:41 2015  by shuang
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_pra14_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_pra14_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_pra14

chapter11_tag = $(tag)

#cmt_local_tagfile_pra14 = $(chapter11_tag)_pra14.make
cmt_local_tagfile_pra14 = $(bin)$(chapter11_tag)_pra14.make

else

tags      = $(tag),$(CMTEXTRATAGS)

chapter11_tag = $(tag)

#cmt_local_tagfile_pra14 = $(chapter11_tag).make
cmt_local_tagfile_pra14 = $(bin)$(chapter11_tag).make

endif

include $(cmt_local_tagfile_pra14)
#-include $(cmt_local_tagfile_pra14)

ifdef cmt_pra14_has_target_tag

cmt_final_setup_pra14 = $(bin)setup_pra14.make
#cmt_final_setup_pra14 = $(bin)chapter11_pra14setup.make
cmt_local_pra14_makefile = $(bin)pra14.make

else

cmt_final_setup_pra14 = $(bin)setup.make
#cmt_final_setup_pra14 = $(bin)chapter11setup.make
cmt_local_pra14_makefile = $(bin)pra14.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)chapter11setup.make

#pra14 :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'pra14'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = pra14/
#pra14::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

pra14 :: dirs  $(bin)pra14${application_suffix}
	$(echo) "pra14 ok"

#-- end of application_header
#-- start of application

$(bin)pra14${application_suffix} :: $(bin)pra14.o $(use_stamps) $(pra14_stamps) $(pra14stamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)pra14.o $(cmt_installarea_linkopts) $(pra14_use_linkopts) $(pra14linkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
pra14installname = pra14${application_suffix}

pra14 :: pra14install

install :: pra14install

pra14install :: $(install_dir)/$(pra14installname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(pra14installname) :: $(bin)$(pra14installname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(pra14installname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##pra14clean :: pra14uninstall

uninstall :: pra14uninstall

pra14uninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(pra14installname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (pra14.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),pra14clean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)pra14_dependencies.make :: dirs

ifndef QUICK
$(bin)pra14_dependencies.make : $(src)pra14.cpp $(use_requirements) $(cmt_final_setup_pra14)
	$(echo) "(pra14.make) Rebuilding $@"; \
	  $(build_dependencies) pra14 -all_sources -out=$@ $(src)pra14.cpp
endif

#$(pra14_dependencies)

-include $(bin)pra14_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),pra14clean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)pra14.d

$(bin)$(binobj)pra14.d : $(use_requirements) $(cmt_final_setup_pra14)

$(bin)$(binobj)pra14.d : $(src)pra14.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/pra14.dep $(use_pp_cppflags) $(pra14_pp_cppflags) $(app_pra14_pp_cppflags) $(pra14_pp_cppflags) $(use_cppflags) $(pra14_cppflags) $(app_pra14_cppflags) $(pra14_cppflags) $(pra14_cpp_cppflags)  $(src)pra14.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/pra14.o $(src)pra14.cpp $(@D)/pra14.dep
endif
endif

$(bin)$(binobj)pra14.o : $(src)pra14.cpp
else
$(bin)pra14_dependencies.make : $(pra14_cpp_dependencies)

$(bin)$(binobj)pra14.o : $(pra14_cpp_dependencies)
endif
	$(cpp_echo) $(src)pra14.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(pra14_pp_cppflags) $(app_pra14_pp_cppflags) $(pra14_pp_cppflags) $(use_cppflags) $(pra14_cppflags) $(app_pra14_cppflags) $(pra14_cppflags) $(pra14_cpp_cppflags)  $(src)pra14.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: pra14clean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(pra14.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(pra14.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(pra14.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(pra14.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_pra14)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(pra14.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(pra14.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(pra14.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

pra14clean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application pra14
	-$(cleanup_silent) cd $(bin); /bin/rm -f pra14${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects pra14
	-$(cleanup_silent) /bin/rm -f $(bin)pra14.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)pra14.o) $(patsubst %.o,%.dep,$(bin)pra14.o) $(patsubst %.o,%.d.stamp,$(bin)pra14.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf pra14_deps pra14_dependencies.make
#-- end of cleanup_objects ------
