#-- start of make_header -----------------

#====================================
#  Application pra16
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

cmt_pra16_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_pra16_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_pra16

chapter11_tag = $(tag)

#cmt_local_tagfile_pra16 = $(chapter11_tag)_pra16.make
cmt_local_tagfile_pra16 = $(bin)$(chapter11_tag)_pra16.make

else

tags      = $(tag),$(CMTEXTRATAGS)

chapter11_tag = $(tag)

#cmt_local_tagfile_pra16 = $(chapter11_tag).make
cmt_local_tagfile_pra16 = $(bin)$(chapter11_tag).make

endif

include $(cmt_local_tagfile_pra16)
#-include $(cmt_local_tagfile_pra16)

ifdef cmt_pra16_has_target_tag

cmt_final_setup_pra16 = $(bin)setup_pra16.make
#cmt_final_setup_pra16 = $(bin)chapter11_pra16setup.make
cmt_local_pra16_makefile = $(bin)pra16.make

else

cmt_final_setup_pra16 = $(bin)setup.make
#cmt_final_setup_pra16 = $(bin)chapter11setup.make
cmt_local_pra16_makefile = $(bin)pra16.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)chapter11setup.make

#pra16 :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'pra16'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = pra16/
#pra16::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of application_header

pra16 :: dirs  $(bin)pra16${application_suffix}
	$(echo) "pra16 ok"

#-- end of application_header
#-- start of application

$(bin)pra16${application_suffix} :: $(bin)pra16.o $(use_stamps) $(pra16_stamps) $(pra16stamps) $(use_requirements)
	$(link_echo) "application $@"
	$(link_silent) $(cpplink) -o $(@).new $(bin)pra16.o $(cmt_installarea_linkopts) $(pra16_use_linkopts) $(pra16linkopts) && mv -f $(@).new $(@)

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/bin
pra16installname = pra16${application_suffix}

pra16 :: pra16install

install :: pra16install

pra16install :: $(install_dir)/$(pra16installname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(pra16installname) :: $(bin)$(pra16installname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(pra16installname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##pra16clean :: pra16uninstall

uninstall :: pra16uninstall

pra16uninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(pra16installname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#	@echo "------> (pra16.make) Removing installed files"
#-- end of application
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),pra16clean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)pra16_dependencies.make :: dirs

ifndef QUICK
$(bin)pra16_dependencies.make : $(src)pra16.cpp $(use_requirements) $(cmt_final_setup_pra16)
	$(echo) "(pra16.make) Rebuilding $@"; \
	  $(build_dependencies) pra16 -all_sources -out=$@ $(src)pra16.cpp
endif

#$(pra16_dependencies)

-include $(bin)pra16_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp ------

ifneq ($(cppdepflags),)

ifneq ($(MAKECMDGOALS),pra16clean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)pra16.d

$(bin)$(binobj)pra16.d : $(use_requirements) $(cmt_final_setup_pra16)

$(bin)$(binobj)pra16.d : $(src)pra16.cpp
	$(dep_echo) $@
	$(cpp_silent) $(cppcomp) $(cppdepflags) -o $(@D)/pra16.dep $(use_pp_cppflags) $(pra16_pp_cppflags) $(app_pra16_pp_cppflags) $(pra16_pp_cppflags) $(use_cppflags) $(pra16_cppflags) $(app_pra16_cppflags) $(pra16_cppflags) $(pra16_cpp_cppflags)  $(src)pra16.cpp
	$(cpp_silent) $(format_dependencies) $@ $(@D)/pra16.o $(src)pra16.cpp $(@D)/pra16.dep
endif
endif

$(bin)$(binobj)pra16.o : $(src)pra16.cpp
else
$(bin)pra16_dependencies.make : $(pra16_cpp_dependencies)

$(bin)$(binobj)pra16.o : $(pra16_cpp_dependencies)
endif
	$(cpp_echo) $(src)pra16.cpp
	$(cpp_silent) $(cppcomp) -o $@ $(use_pp_cppflags) $(pra16_pp_cppflags) $(app_pra16_pp_cppflags) $(pra16_pp_cppflags) $(use_cppflags) $(pra16_cppflags) $(app_pra16_cppflags) $(pra16_cppflags) $(pra16_cpp_cppflags)  $(src)pra16.cpp

#-- end of cpp ------
#-- start of cleanup_header --------------

clean :: pra16clean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(pra16.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(pra16.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(pra16.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(pra16.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_pra16)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(pra16.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(pra16.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(pra16.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

pra16clean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_application ------
	$(cleanup_echo) application pra16
	-$(cleanup_silent) cd $(bin); /bin/rm -f pra16${application_suffix}
#-- end of cleanup_application ------
#-- start of cleanup_objects ------
	$(cleanup_echo) objects pra16
	-$(cleanup_silent) /bin/rm -f $(bin)pra16.o
	-$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)pra16.o) $(patsubst %.o,%.dep,$(bin)pra16.o) $(patsubst %.o,%.d.stamp,$(bin)pra16.o)
	-$(cleanup_silent) cd $(bin); /bin/rm -rf pra16_deps pra16_dependencies.make
#-- end of cleanup_objects ------
