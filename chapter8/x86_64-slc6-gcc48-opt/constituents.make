
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

chapter8_tag = $(tag)

#cmt_local_tagfile = $(chapter8_tag).make
cmt_local_tagfile = $(bin)$(chapter8_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)chapter8setup.make
cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)$(package)setup.make

#--------------------------------------------------------

#cmt_lock_setup = /tmp/lock$(cmt_lock_pid).make
#cmt_temp_tag = /tmp/tag$(cmt_lock_pid).make

#first :: $(cmt_local_tagfile)
#	@echo $(cmt_local_tagfile) ok
#ifndef QUICK
#first :: $(cmt_final_setup) ;
#else
#first :: ;
#endif

##	@bin=`$(cmtexe) show macro_value bin`

#$(cmt_local_tagfile) : $(cmt_lock_setup)
#	@echo "#CMT> Error: $@: No such file" >&2; exit 1
#$(cmt_local_tagfile) :
#	@echo "#CMT> Warning: $@: No such file" >&2; exit
#	@echo "#CMT> Info: $@: No need to rebuild file" >&2; exit

#$(cmt_final_setup) : $(cmt_local_tagfile) 
#	$(echo) "(constituents.make) Rebuilding $@"
#	@if test ! -d $(@D); then $(mkdir) -p $(@D); fi; \
#	  if test -f $(cmt_local_setup); then /bin/rm -f $(cmt_local_setup); fi; \
#	  trap '/bin/rm -f $(cmt_local_setup)' 0 1 2 15; \
#	  $(cmtexe) -tag=$(tags) show setup >>$(cmt_local_setup); \
#	  if test ! -f $@; then \
#	    mv $(cmt_local_setup) $@; \
#	  else \
#	    if /usr/bin/diff $(cmt_local_setup) $@ >/dev/null ; then \
#	      : ; \
#	    else \
#	      mv $(cmt_local_setup) $@; \
#	    fi; \
#	  fi

#	@/bin/echo $@ ok   

#config :: checkuses
#	@exit 0
#checkuses : ;

env.make ::
	printenv >env.make.tmp; $(cmtexe) check files env.make.tmp env.make

ifndef QUICK
all :: build_library_links
	$(echo) "(constituents.make) all done"
endif

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

dirs :: requirements
	@if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi
#	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
#	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

requirements :
	@if test ! -r requirements ; then echo "No requirements file" ; fi

build_library_links : dirs
	$(echo) "(constituents.make) Rebuilding library links"; \
	 $(build_library_links)
#	if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi; \
#	$(build_library_links)

makefiles : ;

.DEFAULT ::
	$(echo) "(constituents.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: Using default commands" >&2; exit

#	@if test "$@" = "$(cmt_lock_setup)"; then \
	#  /bin/rm -f $(cmt_lock_setup); \
	 # touch $(cmt_lock_setup); \
	#fi

#-- end of constituents_header ------
#-- start of group ------

all_groups :: all

all :: $(all_dependencies)  $(all_pre_constituents) $(all_constituents)  $(all_post_constituents)
	$(echo) "all ok."

#	@/bin/echo " all ok."

clean :: allclean

allclean ::  $(all_constituentsclean)
	$(echo) $(all_constituentsclean)
	$(echo) "allclean ok."

#	@echo $(all_constituentsclean)
#	@/bin/echo " allclean ok."

allclean :: makefilesclean

#-- end of group ------
#-- start of group ------

all_groups :: cmt_actions

cmt_actions :: $(cmt_actions_dependencies)  $(cmt_actions_pre_constituents) $(cmt_actions_constituents)  $(cmt_actions_post_constituents)
	$(echo) "cmt_actions ok."

#	@/bin/echo " cmt_actions ok."

clean :: allclean

cmt_actionsclean ::  $(cmt_actions_constituentsclean)
	$(echo) $(cmt_actions_constituentsclean)
	$(echo) "cmt_actionsclean ok."

#	@echo $(cmt_actions_constituentsclean)
#	@/bin/echo " cmt_actionsclean ok."

cmt_actionsclean :: makefilesclean

#-- end of group ------
#-- start of constituent ------

cmt_practise8.4_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise8.4_has_target_tag

#cmt_local_tagfile_practise8.4 = $(chapter8_tag)_practise8.4.make
cmt_local_tagfile_practise8.4 = $(bin)$(chapter8_tag)_practise8.4.make
cmt_local_setup_practise8.4 = $(bin)setup_practise8.4$$$$.make
cmt_final_setup_practise8.4 = $(bin)setup_practise8.4.make
#cmt_final_setup_practise8.4 = $(bin)chapter8_practise8.4setup.make
cmt_local_practise8.4_makefile = $(bin)practise8.4.make

practise8.4_extratags = -tag_add=target_practise8.4

#$(cmt_local_tagfile_practise8.4) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise8.4) ::
else
$(cmt_local_tagfile_practise8.4) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise8.4); then /bin/rm -f $(cmt_local_tagfile_practise8.4); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise8.4_extratags) build tag_makefile >>$(cmt_local_tagfile_practise8.4)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise8.4)"; \
	  test ! -f $(cmt_local_setup_practise8.4) || \rm -f $(cmt_local_setup_practise8.4); \
	  trap '\rm -f $(cmt_local_setup_practise8.4)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise8.4_extratags) show setup >$(cmt_local_setup_practise8.4) && \
	  if [ -f $(cmt_final_setup_practise8.4) ] && \
	    \cmp -s $(cmt_final_setup_practise8.4) $(cmt_local_setup_practise8.4); then \
	    \rm $(cmt_local_setup_practise8.4); else \
	    \mv -f $(cmt_local_setup_practise8.4) $(cmt_final_setup_practise8.4); fi

else

#cmt_local_tagfile_practise8.4 = $(chapter8_tag).make
cmt_local_tagfile_practise8.4 = $(bin)$(chapter8_tag).make
cmt_final_setup_practise8.4 = $(bin)setup.make
#cmt_final_setup_practise8.4 = $(bin)chapter8setup.make
cmt_local_practise8.4_makefile = $(bin)practise8.4.make

endif

ifdef STRUCTURED_OUTPUT
practise8.4dirs :
	@if test ! -d $(bin)practise8.4; then $(mkdir) -p $(bin)practise8.4; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.4
else
practise8.4dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise8.4dirs ::
#	@if test ! -d $(bin)practise8.4; then $(mkdir) -p $(bin)practise8.4; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.4
#
#$(cmt_local_practise8.4_makefile) :: $(practise8.4_dependencies) $(cmt_local_tagfile_practise8.4) build_library_links dirs practise8.4dirs
#else
#$(cmt_local_practise8.4_makefile) :: $(practise8.4_dependencies) $(cmt_local_tagfile_practise8.4) build_library_links dirs
#endif
#else
#$(cmt_local_practise8.4_makefile) :: $(cmt_local_tagfile_practise8.4)
#endif

makefiles : $(cmt_local_practise8.4_makefile)

ifndef QUICK
$(cmt_local_practise8.4_makefile) : $(practise8.4_dependencies) $(cmt_local_tagfile_practise8.4) build_library_links
else
$(cmt_local_practise8.4_makefile) : $(cmt_local_tagfile_practise8.4)
endif
	$(echo) "(constituents.make) Building practise8.4.make"; \
	  $(cmtexe) -tag=$(tags) $(practise8.4_extratags) build constituent_makefile -out=$(cmt_local_practise8.4_makefile) practise8.4

practise8.4 :: $(practise8.4_dependencies) $(cmt_local_practise8.4_makefile) dirs practise8.4dirs
	$(echo) "(constituents.make) Starting practise8.4"
	@$(MAKE) -f $(cmt_local_practise8.4_makefile) practise8.4
	$(echo) "(constituents.make) practise8.4 done"

clean :: practise8.4clean

practise8.4clean :: $(practise8.4clean_dependencies) ##$(cmt_local_practise8.4_makefile)
	$(echo) "(constituents.make) Starting practise8.4clean"
	@-if test -f $(cmt_local_practise8.4_makefile); then \
	  $(MAKE) -f $(cmt_local_practise8.4_makefile) practise8.4clean; \
	fi
	$(echo) "(constituents.make) practise8.4clean done"
#	@-$(MAKE) -f $(cmt_local_practise8.4_makefile) practise8.4clean

##	  /bin/rm -f $(cmt_local_practise8.4_makefile) $(bin)practise8.4_dependencies.make

install :: practise8.4install

practise8.4install :: $(practise8.4_dependencies) $(cmt_local_practise8.4_makefile)
	$(echo) "(constituents.make) Starting install practise8.4"
	@-$(MAKE) -f $(cmt_local_practise8.4_makefile) install
	$(echo) "(constituents.make) install practise8.4 done"

uninstall :: practise8.4uninstall

$(foreach d,$(practise8.4_dependencies),$(eval $(d)uninstall_dependencies += practise8.4uninstall))

practise8.4uninstall :: $(practise8.4uninstall_dependencies) $(cmt_local_practise8.4_makefile)
	$(echo) "(constituents.make) Starting uninstall practise8.4"
	@$(MAKE) -f $(cmt_local_practise8.4_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise8.4 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise8.4"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise8.4 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_practise8.6_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise8.6_has_target_tag

#cmt_local_tagfile_practise8.6 = $(chapter8_tag)_practise8.6.make
cmt_local_tagfile_practise8.6 = $(bin)$(chapter8_tag)_practise8.6.make
cmt_local_setup_practise8.6 = $(bin)setup_practise8.6$$$$.make
cmt_final_setup_practise8.6 = $(bin)setup_practise8.6.make
#cmt_final_setup_practise8.6 = $(bin)chapter8_practise8.6setup.make
cmt_local_practise8.6_makefile = $(bin)practise8.6.make

practise8.6_extratags = -tag_add=target_practise8.6

#$(cmt_local_tagfile_practise8.6) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise8.6) ::
else
$(cmt_local_tagfile_practise8.6) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise8.6); then /bin/rm -f $(cmt_local_tagfile_practise8.6); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise8.6_extratags) build tag_makefile >>$(cmt_local_tagfile_practise8.6)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise8.6)"; \
	  test ! -f $(cmt_local_setup_practise8.6) || \rm -f $(cmt_local_setup_practise8.6); \
	  trap '\rm -f $(cmt_local_setup_practise8.6)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise8.6_extratags) show setup >$(cmt_local_setup_practise8.6) && \
	  if [ -f $(cmt_final_setup_practise8.6) ] && \
	    \cmp -s $(cmt_final_setup_practise8.6) $(cmt_local_setup_practise8.6); then \
	    \rm $(cmt_local_setup_practise8.6); else \
	    \mv -f $(cmt_local_setup_practise8.6) $(cmt_final_setup_practise8.6); fi

else

#cmt_local_tagfile_practise8.6 = $(chapter8_tag).make
cmt_local_tagfile_practise8.6 = $(bin)$(chapter8_tag).make
cmt_final_setup_practise8.6 = $(bin)setup.make
#cmt_final_setup_practise8.6 = $(bin)chapter8setup.make
cmt_local_practise8.6_makefile = $(bin)practise8.6.make

endif

ifdef STRUCTURED_OUTPUT
practise8.6dirs :
	@if test ! -d $(bin)practise8.6; then $(mkdir) -p $(bin)practise8.6; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.6
else
practise8.6dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise8.6dirs ::
#	@if test ! -d $(bin)practise8.6; then $(mkdir) -p $(bin)practise8.6; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.6
#
#$(cmt_local_practise8.6_makefile) :: $(practise8.6_dependencies) $(cmt_local_tagfile_practise8.6) build_library_links dirs practise8.6dirs
#else
#$(cmt_local_practise8.6_makefile) :: $(practise8.6_dependencies) $(cmt_local_tagfile_practise8.6) build_library_links dirs
#endif
#else
#$(cmt_local_practise8.6_makefile) :: $(cmt_local_tagfile_practise8.6)
#endif

makefiles : $(cmt_local_practise8.6_makefile)

ifndef QUICK
$(cmt_local_practise8.6_makefile) : $(practise8.6_dependencies) $(cmt_local_tagfile_practise8.6) build_library_links
else
$(cmt_local_practise8.6_makefile) : $(cmt_local_tagfile_practise8.6)
endif
	$(echo) "(constituents.make) Building practise8.6.make"; \
	  $(cmtexe) -tag=$(tags) $(practise8.6_extratags) build constituent_makefile -out=$(cmt_local_practise8.6_makefile) practise8.6

practise8.6 :: $(practise8.6_dependencies) $(cmt_local_practise8.6_makefile) dirs practise8.6dirs
	$(echo) "(constituents.make) Starting practise8.6"
	@$(MAKE) -f $(cmt_local_practise8.6_makefile) practise8.6
	$(echo) "(constituents.make) practise8.6 done"

clean :: practise8.6clean

practise8.6clean :: $(practise8.6clean_dependencies) ##$(cmt_local_practise8.6_makefile)
	$(echo) "(constituents.make) Starting practise8.6clean"
	@-if test -f $(cmt_local_practise8.6_makefile); then \
	  $(MAKE) -f $(cmt_local_practise8.6_makefile) practise8.6clean; \
	fi
	$(echo) "(constituents.make) practise8.6clean done"
#	@-$(MAKE) -f $(cmt_local_practise8.6_makefile) practise8.6clean

##	  /bin/rm -f $(cmt_local_practise8.6_makefile) $(bin)practise8.6_dependencies.make

install :: practise8.6install

practise8.6install :: $(practise8.6_dependencies) $(cmt_local_practise8.6_makefile)
	$(echo) "(constituents.make) Starting install practise8.6"
	@-$(MAKE) -f $(cmt_local_practise8.6_makefile) install
	$(echo) "(constituents.make) install practise8.6 done"

uninstall :: practise8.6uninstall

$(foreach d,$(practise8.6_dependencies),$(eval $(d)uninstall_dependencies += practise8.6uninstall))

practise8.6uninstall :: $(practise8.6uninstall_dependencies) $(cmt_local_practise8.6_makefile)
	$(echo) "(constituents.make) Starting uninstall practise8.6"
	@$(MAKE) -f $(cmt_local_practise8.6_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise8.6 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise8.6"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise8.6 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_practise8.7_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise8.7_has_target_tag

#cmt_local_tagfile_practise8.7 = $(chapter8_tag)_practise8.7.make
cmt_local_tagfile_practise8.7 = $(bin)$(chapter8_tag)_practise8.7.make
cmt_local_setup_practise8.7 = $(bin)setup_practise8.7$$$$.make
cmt_final_setup_practise8.7 = $(bin)setup_practise8.7.make
#cmt_final_setup_practise8.7 = $(bin)chapter8_practise8.7setup.make
cmt_local_practise8.7_makefile = $(bin)practise8.7.make

practise8.7_extratags = -tag_add=target_practise8.7

#$(cmt_local_tagfile_practise8.7) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise8.7) ::
else
$(cmt_local_tagfile_practise8.7) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise8.7); then /bin/rm -f $(cmt_local_tagfile_practise8.7); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise8.7_extratags) build tag_makefile >>$(cmt_local_tagfile_practise8.7)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise8.7)"; \
	  test ! -f $(cmt_local_setup_practise8.7) || \rm -f $(cmt_local_setup_practise8.7); \
	  trap '\rm -f $(cmt_local_setup_practise8.7)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise8.7_extratags) show setup >$(cmt_local_setup_practise8.7) && \
	  if [ -f $(cmt_final_setup_practise8.7) ] && \
	    \cmp -s $(cmt_final_setup_practise8.7) $(cmt_local_setup_practise8.7); then \
	    \rm $(cmt_local_setup_practise8.7); else \
	    \mv -f $(cmt_local_setup_practise8.7) $(cmt_final_setup_practise8.7); fi

else

#cmt_local_tagfile_practise8.7 = $(chapter8_tag).make
cmt_local_tagfile_practise8.7 = $(bin)$(chapter8_tag).make
cmt_final_setup_practise8.7 = $(bin)setup.make
#cmt_final_setup_practise8.7 = $(bin)chapter8setup.make
cmt_local_practise8.7_makefile = $(bin)practise8.7.make

endif

ifdef STRUCTURED_OUTPUT
practise8.7dirs :
	@if test ! -d $(bin)practise8.7; then $(mkdir) -p $(bin)practise8.7; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.7
else
practise8.7dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise8.7dirs ::
#	@if test ! -d $(bin)practise8.7; then $(mkdir) -p $(bin)practise8.7; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.7
#
#$(cmt_local_practise8.7_makefile) :: $(practise8.7_dependencies) $(cmt_local_tagfile_practise8.7) build_library_links dirs practise8.7dirs
#else
#$(cmt_local_practise8.7_makefile) :: $(practise8.7_dependencies) $(cmt_local_tagfile_practise8.7) build_library_links dirs
#endif
#else
#$(cmt_local_practise8.7_makefile) :: $(cmt_local_tagfile_practise8.7)
#endif

makefiles : $(cmt_local_practise8.7_makefile)

ifndef QUICK
$(cmt_local_practise8.7_makefile) : $(practise8.7_dependencies) $(cmt_local_tagfile_practise8.7) build_library_links
else
$(cmt_local_practise8.7_makefile) : $(cmt_local_tagfile_practise8.7)
endif
	$(echo) "(constituents.make) Building practise8.7.make"; \
	  $(cmtexe) -tag=$(tags) $(practise8.7_extratags) build constituent_makefile -out=$(cmt_local_practise8.7_makefile) practise8.7

practise8.7 :: $(practise8.7_dependencies) $(cmt_local_practise8.7_makefile) dirs practise8.7dirs
	$(echo) "(constituents.make) Starting practise8.7"
	@$(MAKE) -f $(cmt_local_practise8.7_makefile) practise8.7
	$(echo) "(constituents.make) practise8.7 done"

clean :: practise8.7clean

practise8.7clean :: $(practise8.7clean_dependencies) ##$(cmt_local_practise8.7_makefile)
	$(echo) "(constituents.make) Starting practise8.7clean"
	@-if test -f $(cmt_local_practise8.7_makefile); then \
	  $(MAKE) -f $(cmt_local_practise8.7_makefile) practise8.7clean; \
	fi
	$(echo) "(constituents.make) practise8.7clean done"
#	@-$(MAKE) -f $(cmt_local_practise8.7_makefile) practise8.7clean

##	  /bin/rm -f $(cmt_local_practise8.7_makefile) $(bin)practise8.7_dependencies.make

install :: practise8.7install

practise8.7install :: $(practise8.7_dependencies) $(cmt_local_practise8.7_makefile)
	$(echo) "(constituents.make) Starting install practise8.7"
	@-$(MAKE) -f $(cmt_local_practise8.7_makefile) install
	$(echo) "(constituents.make) install practise8.7 done"

uninstall :: practise8.7uninstall

$(foreach d,$(practise8.7_dependencies),$(eval $(d)uninstall_dependencies += practise8.7uninstall))

practise8.7uninstall :: $(practise8.7uninstall_dependencies) $(cmt_local_practise8.7_makefile)
	$(echo) "(constituents.make) Starting uninstall practise8.7"
	@$(MAKE) -f $(cmt_local_practise8.7_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise8.7 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise8.7"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise8.7 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_practise8.14_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise8.14_has_target_tag

#cmt_local_tagfile_practise8.14 = $(chapter8_tag)_practise8.14.make
cmt_local_tagfile_practise8.14 = $(bin)$(chapter8_tag)_practise8.14.make
cmt_local_setup_practise8.14 = $(bin)setup_practise8.14$$$$.make
cmt_final_setup_practise8.14 = $(bin)setup_practise8.14.make
#cmt_final_setup_practise8.14 = $(bin)chapter8_practise8.14setup.make
cmt_local_practise8.14_makefile = $(bin)practise8.14.make

practise8.14_extratags = -tag_add=target_practise8.14

#$(cmt_local_tagfile_practise8.14) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise8.14) ::
else
$(cmt_local_tagfile_practise8.14) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise8.14); then /bin/rm -f $(cmt_local_tagfile_practise8.14); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise8.14_extratags) build tag_makefile >>$(cmt_local_tagfile_practise8.14)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise8.14)"; \
	  test ! -f $(cmt_local_setup_practise8.14) || \rm -f $(cmt_local_setup_practise8.14); \
	  trap '\rm -f $(cmt_local_setup_practise8.14)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise8.14_extratags) show setup >$(cmt_local_setup_practise8.14) && \
	  if [ -f $(cmt_final_setup_practise8.14) ] && \
	    \cmp -s $(cmt_final_setup_practise8.14) $(cmt_local_setup_practise8.14); then \
	    \rm $(cmt_local_setup_practise8.14); else \
	    \mv -f $(cmt_local_setup_practise8.14) $(cmt_final_setup_practise8.14); fi

else

#cmt_local_tagfile_practise8.14 = $(chapter8_tag).make
cmt_local_tagfile_practise8.14 = $(bin)$(chapter8_tag).make
cmt_final_setup_practise8.14 = $(bin)setup.make
#cmt_final_setup_practise8.14 = $(bin)chapter8setup.make
cmt_local_practise8.14_makefile = $(bin)practise8.14.make

endif

ifdef STRUCTURED_OUTPUT
practise8.14dirs :
	@if test ! -d $(bin)practise8.14; then $(mkdir) -p $(bin)practise8.14; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.14
else
practise8.14dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise8.14dirs ::
#	@if test ! -d $(bin)practise8.14; then $(mkdir) -p $(bin)practise8.14; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise8.14
#
#$(cmt_local_practise8.14_makefile) :: $(practise8.14_dependencies) $(cmt_local_tagfile_practise8.14) build_library_links dirs practise8.14dirs
#else
#$(cmt_local_practise8.14_makefile) :: $(practise8.14_dependencies) $(cmt_local_tagfile_practise8.14) build_library_links dirs
#endif
#else
#$(cmt_local_practise8.14_makefile) :: $(cmt_local_tagfile_practise8.14)
#endif

makefiles : $(cmt_local_practise8.14_makefile)

ifndef QUICK
$(cmt_local_practise8.14_makefile) : $(practise8.14_dependencies) $(cmt_local_tagfile_practise8.14) build_library_links
else
$(cmt_local_practise8.14_makefile) : $(cmt_local_tagfile_practise8.14)
endif
	$(echo) "(constituents.make) Building practise8.14.make"; \
	  $(cmtexe) -tag=$(tags) $(practise8.14_extratags) build constituent_makefile -out=$(cmt_local_practise8.14_makefile) practise8.14

practise8.14 :: $(practise8.14_dependencies) $(cmt_local_practise8.14_makefile) dirs practise8.14dirs
	$(echo) "(constituents.make) Starting practise8.14"
	@$(MAKE) -f $(cmt_local_practise8.14_makefile) practise8.14
	$(echo) "(constituents.make) practise8.14 done"

clean :: practise8.14clean

practise8.14clean :: $(practise8.14clean_dependencies) ##$(cmt_local_practise8.14_makefile)
	$(echo) "(constituents.make) Starting practise8.14clean"
	@-if test -f $(cmt_local_practise8.14_makefile); then \
	  $(MAKE) -f $(cmt_local_practise8.14_makefile) practise8.14clean; \
	fi
	$(echo) "(constituents.make) practise8.14clean done"
#	@-$(MAKE) -f $(cmt_local_practise8.14_makefile) practise8.14clean

##	  /bin/rm -f $(cmt_local_practise8.14_makefile) $(bin)practise8.14_dependencies.make

install :: practise8.14install

practise8.14install :: $(practise8.14_dependencies) $(cmt_local_practise8.14_makefile)
	$(echo) "(constituents.make) Starting install practise8.14"
	@-$(MAKE) -f $(cmt_local_practise8.14_makefile) install
	$(echo) "(constituents.make) install practise8.14 done"

uninstall :: practise8.14uninstall

$(foreach d,$(practise8.14_dependencies),$(eval $(d)uninstall_dependencies += practise8.14uninstall))

practise8.14uninstall :: $(practise8.14uninstall_dependencies) $(cmt_local_practise8.14_makefile)
	$(echo) "(constituents.make) Starting uninstall practise8.14"
	@$(MAKE) -f $(cmt_local_practise8.14_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise8.14 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise8.14"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise8.14 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_printfile_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_printfile_has_target_tag

#cmt_local_tagfile_printfile = $(chapter8_tag)_printfile.make
cmt_local_tagfile_printfile = $(bin)$(chapter8_tag)_printfile.make
cmt_local_setup_printfile = $(bin)setup_printfile$$$$.make
cmt_final_setup_printfile = $(bin)setup_printfile.make
#cmt_final_setup_printfile = $(bin)chapter8_printfilesetup.make
cmt_local_printfile_makefile = $(bin)printfile.make

printfile_extratags = -tag_add=target_printfile

#$(cmt_local_tagfile_printfile) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_printfile) ::
else
$(cmt_local_tagfile_printfile) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_printfile); then /bin/rm -f $(cmt_local_tagfile_printfile); fi ; \
	  $(cmtexe) -tag=$(tags) $(printfile_extratags) build tag_makefile >>$(cmt_local_tagfile_printfile)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_printfile)"; \
	  test ! -f $(cmt_local_setup_printfile) || \rm -f $(cmt_local_setup_printfile); \
	  trap '\rm -f $(cmt_local_setup_printfile)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(printfile_extratags) show setup >$(cmt_local_setup_printfile) && \
	  if [ -f $(cmt_final_setup_printfile) ] && \
	    \cmp -s $(cmt_final_setup_printfile) $(cmt_local_setup_printfile); then \
	    \rm $(cmt_local_setup_printfile); else \
	    \mv -f $(cmt_local_setup_printfile) $(cmt_final_setup_printfile); fi

else

#cmt_local_tagfile_printfile = $(chapter8_tag).make
cmt_local_tagfile_printfile = $(bin)$(chapter8_tag).make
cmt_final_setup_printfile = $(bin)setup.make
#cmt_final_setup_printfile = $(bin)chapter8setup.make
cmt_local_printfile_makefile = $(bin)printfile.make

endif

ifdef STRUCTURED_OUTPUT
printfiledirs :
	@if test ! -d $(bin)printfile; then $(mkdir) -p $(bin)printfile; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)printfile
else
printfiledirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# printfiledirs ::
#	@if test ! -d $(bin)printfile; then $(mkdir) -p $(bin)printfile; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)printfile
#
#$(cmt_local_printfile_makefile) :: $(printfile_dependencies) $(cmt_local_tagfile_printfile) build_library_links dirs printfiledirs
#else
#$(cmt_local_printfile_makefile) :: $(printfile_dependencies) $(cmt_local_tagfile_printfile) build_library_links dirs
#endif
#else
#$(cmt_local_printfile_makefile) :: $(cmt_local_tagfile_printfile)
#endif

makefiles : $(cmt_local_printfile_makefile)

ifndef QUICK
$(cmt_local_printfile_makefile) : $(printfile_dependencies) $(cmt_local_tagfile_printfile) build_library_links
else
$(cmt_local_printfile_makefile) : $(cmt_local_tagfile_printfile)
endif
	$(echo) "(constituents.make) Building printfile.make"; \
	  $(cmtexe) -tag=$(tags) $(printfile_extratags) build constituent_makefile -out=$(cmt_local_printfile_makefile) printfile

printfile :: $(printfile_dependencies) $(cmt_local_printfile_makefile) dirs printfiledirs
	$(echo) "(constituents.make) Starting printfile"
	@$(MAKE) -f $(cmt_local_printfile_makefile) printfile
	$(echo) "(constituents.make) printfile done"

clean :: printfileclean

printfileclean :: $(printfileclean_dependencies) ##$(cmt_local_printfile_makefile)
	$(echo) "(constituents.make) Starting printfileclean"
	@-if test -f $(cmt_local_printfile_makefile); then \
	  $(MAKE) -f $(cmt_local_printfile_makefile) printfileclean; \
	fi
	$(echo) "(constituents.make) printfileclean done"
#	@-$(MAKE) -f $(cmt_local_printfile_makefile) printfileclean

##	  /bin/rm -f $(cmt_local_printfile_makefile) $(bin)printfile_dependencies.make

install :: printfileinstall

printfileinstall :: $(printfile_dependencies) $(cmt_local_printfile_makefile)
	$(echo) "(constituents.make) Starting install printfile"
	@-$(MAKE) -f $(cmt_local_printfile_makefile) install
	$(echo) "(constituents.make) install printfile done"

uninstall :: printfileuninstall

$(foreach d,$(printfile_dependencies),$(eval $(d)uninstall_dependencies += printfileuninstall))

printfileuninstall :: $(printfileuninstall_dependencies) $(cmt_local_printfile_makefile)
	$(echo) "(constituents.make) Starting uninstall printfile"
	@$(MAKE) -f $(cmt_local_printfile_makefile) uninstall
	$(echo) "(constituents.make) uninstall printfile done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ printfile"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ printfile done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(chapter8_tag)_make.make
cmt_local_tagfile_make = $(bin)$(chapter8_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)chapter8_makesetup.make
cmt_local_make_makefile = $(bin)make.make

make_extratags = -tag_add=target_make

#$(cmt_local_tagfile_make) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_make) ::
else
$(cmt_local_tagfile_make) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_make); then /bin/rm -f $(cmt_local_tagfile_make); fi ; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build tag_makefile >>$(cmt_local_tagfile_make)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_make)"; \
	  test ! -f $(cmt_local_setup_make) || \rm -f $(cmt_local_setup_make); \
	  trap '\rm -f $(cmt_local_setup_make)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) show setup >$(cmt_local_setup_make) && \
	  if [ -f $(cmt_final_setup_make) ] && \
	    \cmp -s $(cmt_final_setup_make) $(cmt_local_setup_make); then \
	    \rm $(cmt_local_setup_make); else \
	    \mv -f $(cmt_local_setup_make) $(cmt_final_setup_make); fi

else

#cmt_local_tagfile_make = $(chapter8_tag).make
cmt_local_tagfile_make = $(bin)$(chapter8_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)chapter8setup.make
cmt_local_make_makefile = $(bin)make.make

endif

ifdef STRUCTURED_OUTPUT
makedirs :
	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)make
else
makedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# makedirs ::
#	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)make
#
#$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs makedirs
#else
#$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs
#endif
#else
#$(cmt_local_make_makefile) :: $(cmt_local_tagfile_make)
#endif

makefiles : $(cmt_local_make_makefile)

ifndef QUICK
$(cmt_local_make_makefile) : $(make_dependencies) $(cmt_local_tagfile_make) build_library_links
else
$(cmt_local_make_makefile) : $(cmt_local_tagfile_make)
endif
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_makefile -out=$(cmt_local_make_makefile) make

make :: $(make_dependencies) $(cmt_local_make_makefile) dirs makedirs
	$(echo) "(constituents.make) Creating make${lock_suffix} and Starting make"
	@${lock_command} make${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} make${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_make_makefile) make; \
	  retval=$$?; ${unlock_command} make${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) make done"

clean :: makeclean

makeclean :: $(makeclean_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting makeclean"
	@-if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) makeclean; \
	fi
	$(echo) "(constituents.make) makeclean done"
#	@-$(MAKE) -f $(cmt_local_make_makefile) makeclean

##	  /bin/rm -f $(cmt_local_make_makefile) $(bin)make_dependencies.make

install :: makeinstall

makeinstall :: $(make_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting install make"
	@-$(MAKE) -f $(cmt_local_make_makefile) install
	$(echo) "(constituents.make) install make done"

uninstall :: makeuninstall

$(foreach d,$(make_dependencies),$(eval $(d)uninstall_dependencies += makeuninstall))

makeuninstall :: $(makeuninstall_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting uninstall make"
	@$(MAKE) -f $(cmt_local_make_makefile) uninstall
	$(echo) "(constituents.make) uninstall make done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ make"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ make done"
endif

#-- end of constituent_lock ------
#-- start of constituents_trailer ------

clean :: remove_library_links

remove_library_links ::
	$(echo) "(constituents.make) Removing library links"; \
	  $(remove_library_links)

makefilesclean ::

###	@/bin/rm -f checkuses

###	/bin/rm -f *.make*

clean :: makefilesclean

binclean :: clean
	$(echo) "(constituents.make) Removing binary directory $(bin)"
	@if test ! "$(bin)" = "./"; then \
	  /bin/rm -rf $(bin); \
	fi

#-- end of constituents_trailer ------
