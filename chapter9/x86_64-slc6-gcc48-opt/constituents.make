
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

chapter9_tag = $(tag)

#cmt_local_tagfile = $(chapter9_tag).make
cmt_local_tagfile = $(bin)$(chapter9_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)chapter9setup.make
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

cmt_practise9.26_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise9.26_has_target_tag

#cmt_local_tagfile_practise9.26 = $(chapter9_tag)_practise9.26.make
cmt_local_tagfile_practise9.26 = $(bin)$(chapter9_tag)_practise9.26.make
cmt_local_setup_practise9.26 = $(bin)setup_practise9.26$$$$.make
cmt_final_setup_practise9.26 = $(bin)setup_practise9.26.make
#cmt_final_setup_practise9.26 = $(bin)chapter9_practise9.26setup.make
cmt_local_practise9.26_makefile = $(bin)practise9.26.make

practise9.26_extratags = -tag_add=target_practise9.26

#$(cmt_local_tagfile_practise9.26) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise9.26) ::
else
$(cmt_local_tagfile_practise9.26) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise9.26); then /bin/rm -f $(cmt_local_tagfile_practise9.26); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise9.26_extratags) build tag_makefile >>$(cmt_local_tagfile_practise9.26)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise9.26)"; \
	  test ! -f $(cmt_local_setup_practise9.26) || \rm -f $(cmt_local_setup_practise9.26); \
	  trap '\rm -f $(cmt_local_setup_practise9.26)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise9.26_extratags) show setup >$(cmt_local_setup_practise9.26) && \
	  if [ -f $(cmt_final_setup_practise9.26) ] && \
	    \cmp -s $(cmt_final_setup_practise9.26) $(cmt_local_setup_practise9.26); then \
	    \rm $(cmt_local_setup_practise9.26); else \
	    \mv -f $(cmt_local_setup_practise9.26) $(cmt_final_setup_practise9.26); fi

else

#cmt_local_tagfile_practise9.26 = $(chapter9_tag).make
cmt_local_tagfile_practise9.26 = $(bin)$(chapter9_tag).make
cmt_final_setup_practise9.26 = $(bin)setup.make
#cmt_final_setup_practise9.26 = $(bin)chapter9setup.make
cmt_local_practise9.26_makefile = $(bin)practise9.26.make

endif

ifdef STRUCTURED_OUTPUT
practise9.26dirs :
	@if test ! -d $(bin)practise9.26; then $(mkdir) -p $(bin)practise9.26; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise9.26
else
practise9.26dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise9.26dirs ::
#	@if test ! -d $(bin)practise9.26; then $(mkdir) -p $(bin)practise9.26; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise9.26
#
#$(cmt_local_practise9.26_makefile) :: $(practise9.26_dependencies) $(cmt_local_tagfile_practise9.26) build_library_links dirs practise9.26dirs
#else
#$(cmt_local_practise9.26_makefile) :: $(practise9.26_dependencies) $(cmt_local_tagfile_practise9.26) build_library_links dirs
#endif
#else
#$(cmt_local_practise9.26_makefile) :: $(cmt_local_tagfile_practise9.26)
#endif

makefiles : $(cmt_local_practise9.26_makefile)

ifndef QUICK
$(cmt_local_practise9.26_makefile) : $(practise9.26_dependencies) $(cmt_local_tagfile_practise9.26) build_library_links
else
$(cmt_local_practise9.26_makefile) : $(cmt_local_tagfile_practise9.26)
endif
	$(echo) "(constituents.make) Building practise9.26.make"; \
	  $(cmtexe) -tag=$(tags) $(practise9.26_extratags) build constituent_makefile -out=$(cmt_local_practise9.26_makefile) practise9.26

practise9.26 :: $(practise9.26_dependencies) $(cmt_local_practise9.26_makefile) dirs practise9.26dirs
	$(echo) "(constituents.make) Starting practise9.26"
	@$(MAKE) -f $(cmt_local_practise9.26_makefile) practise9.26
	$(echo) "(constituents.make) practise9.26 done"

clean :: practise9.26clean

practise9.26clean :: $(practise9.26clean_dependencies) ##$(cmt_local_practise9.26_makefile)
	$(echo) "(constituents.make) Starting practise9.26clean"
	@-if test -f $(cmt_local_practise9.26_makefile); then \
	  $(MAKE) -f $(cmt_local_practise9.26_makefile) practise9.26clean; \
	fi
	$(echo) "(constituents.make) practise9.26clean done"
#	@-$(MAKE) -f $(cmt_local_practise9.26_makefile) practise9.26clean

##	  /bin/rm -f $(cmt_local_practise9.26_makefile) $(bin)practise9.26_dependencies.make

install :: practise9.26install

practise9.26install :: $(practise9.26_dependencies) $(cmt_local_practise9.26_makefile)
	$(echo) "(constituents.make) Starting install practise9.26"
	@-$(MAKE) -f $(cmt_local_practise9.26_makefile) install
	$(echo) "(constituents.make) install practise9.26 done"

uninstall :: practise9.26uninstall

$(foreach d,$(practise9.26_dependencies),$(eval $(d)uninstall_dependencies += practise9.26uninstall))

practise9.26uninstall :: $(practise9.26uninstall_dependencies) $(cmt_local_practise9.26_makefile)
	$(echo) "(constituents.make) Starting uninstall practise9.26"
	@$(MAKE) -f $(cmt_local_practise9.26_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise9.26 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise9.26"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise9.26 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_practise9.27_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise9.27_has_target_tag

#cmt_local_tagfile_practise9.27 = $(chapter9_tag)_practise9.27.make
cmt_local_tagfile_practise9.27 = $(bin)$(chapter9_tag)_practise9.27.make
cmt_local_setup_practise9.27 = $(bin)setup_practise9.27$$$$.make
cmt_final_setup_practise9.27 = $(bin)setup_practise9.27.make
#cmt_final_setup_practise9.27 = $(bin)chapter9_practise9.27setup.make
cmt_local_practise9.27_makefile = $(bin)practise9.27.make

practise9.27_extratags = -tag_add=target_practise9.27

#$(cmt_local_tagfile_practise9.27) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise9.27) ::
else
$(cmt_local_tagfile_practise9.27) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise9.27); then /bin/rm -f $(cmt_local_tagfile_practise9.27); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise9.27_extratags) build tag_makefile >>$(cmt_local_tagfile_practise9.27)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise9.27)"; \
	  test ! -f $(cmt_local_setup_practise9.27) || \rm -f $(cmt_local_setup_practise9.27); \
	  trap '\rm -f $(cmt_local_setup_practise9.27)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise9.27_extratags) show setup >$(cmt_local_setup_practise9.27) && \
	  if [ -f $(cmt_final_setup_practise9.27) ] && \
	    \cmp -s $(cmt_final_setup_practise9.27) $(cmt_local_setup_practise9.27); then \
	    \rm $(cmt_local_setup_practise9.27); else \
	    \mv -f $(cmt_local_setup_practise9.27) $(cmt_final_setup_practise9.27); fi

else

#cmt_local_tagfile_practise9.27 = $(chapter9_tag).make
cmt_local_tagfile_practise9.27 = $(bin)$(chapter9_tag).make
cmt_final_setup_practise9.27 = $(bin)setup.make
#cmt_final_setup_practise9.27 = $(bin)chapter9setup.make
cmt_local_practise9.27_makefile = $(bin)practise9.27.make

endif

ifdef STRUCTURED_OUTPUT
practise9.27dirs :
	@if test ! -d $(bin)practise9.27; then $(mkdir) -p $(bin)practise9.27; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise9.27
else
practise9.27dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise9.27dirs ::
#	@if test ! -d $(bin)practise9.27; then $(mkdir) -p $(bin)practise9.27; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise9.27
#
#$(cmt_local_practise9.27_makefile) :: $(practise9.27_dependencies) $(cmt_local_tagfile_practise9.27) build_library_links dirs practise9.27dirs
#else
#$(cmt_local_practise9.27_makefile) :: $(practise9.27_dependencies) $(cmt_local_tagfile_practise9.27) build_library_links dirs
#endif
#else
#$(cmt_local_practise9.27_makefile) :: $(cmt_local_tagfile_practise9.27)
#endif

makefiles : $(cmt_local_practise9.27_makefile)

ifndef QUICK
$(cmt_local_practise9.27_makefile) : $(practise9.27_dependencies) $(cmt_local_tagfile_practise9.27) build_library_links
else
$(cmt_local_practise9.27_makefile) : $(cmt_local_tagfile_practise9.27)
endif
	$(echo) "(constituents.make) Building practise9.27.make"; \
	  $(cmtexe) -tag=$(tags) $(practise9.27_extratags) build constituent_makefile -out=$(cmt_local_practise9.27_makefile) practise9.27

practise9.27 :: $(practise9.27_dependencies) $(cmt_local_practise9.27_makefile) dirs practise9.27dirs
	$(echo) "(constituents.make) Starting practise9.27"
	@$(MAKE) -f $(cmt_local_practise9.27_makefile) practise9.27
	$(echo) "(constituents.make) practise9.27 done"

clean :: practise9.27clean

practise9.27clean :: $(practise9.27clean_dependencies) ##$(cmt_local_practise9.27_makefile)
	$(echo) "(constituents.make) Starting practise9.27clean"
	@-if test -f $(cmt_local_practise9.27_makefile); then \
	  $(MAKE) -f $(cmt_local_practise9.27_makefile) practise9.27clean; \
	fi
	$(echo) "(constituents.make) practise9.27clean done"
#	@-$(MAKE) -f $(cmt_local_practise9.27_makefile) practise9.27clean

##	  /bin/rm -f $(cmt_local_practise9.27_makefile) $(bin)practise9.27_dependencies.make

install :: practise9.27install

practise9.27install :: $(practise9.27_dependencies) $(cmt_local_practise9.27_makefile)
	$(echo) "(constituents.make) Starting install practise9.27"
	@-$(MAKE) -f $(cmt_local_practise9.27_makefile) install
	$(echo) "(constituents.make) install practise9.27 done"

uninstall :: practise9.27uninstall

$(foreach d,$(practise9.27_dependencies),$(eval $(d)uninstall_dependencies += practise9.27uninstall))

practise9.27uninstall :: $(practise9.27uninstall_dependencies) $(cmt_local_practise9.27_makefile)
	$(echo) "(constituents.make) Starting uninstall practise9.27"
	@$(MAKE) -f $(cmt_local_practise9.27_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise9.27 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise9.27"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise9.27 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_practise9.43_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_practise9.43_has_target_tag

#cmt_local_tagfile_practise9.43 = $(chapter9_tag)_practise9.43.make
cmt_local_tagfile_practise9.43 = $(bin)$(chapter9_tag)_practise9.43.make
cmt_local_setup_practise9.43 = $(bin)setup_practise9.43$$$$.make
cmt_final_setup_practise9.43 = $(bin)setup_practise9.43.make
#cmt_final_setup_practise9.43 = $(bin)chapter9_practise9.43setup.make
cmt_local_practise9.43_makefile = $(bin)practise9.43.make

practise9.43_extratags = -tag_add=target_practise9.43

#$(cmt_local_tagfile_practise9.43) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_practise9.43) ::
else
$(cmt_local_tagfile_practise9.43) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_practise9.43); then /bin/rm -f $(cmt_local_tagfile_practise9.43); fi ; \
	  $(cmtexe) -tag=$(tags) $(practise9.43_extratags) build tag_makefile >>$(cmt_local_tagfile_practise9.43)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_practise9.43)"; \
	  test ! -f $(cmt_local_setup_practise9.43) || \rm -f $(cmt_local_setup_practise9.43); \
	  trap '\rm -f $(cmt_local_setup_practise9.43)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(practise9.43_extratags) show setup >$(cmt_local_setup_practise9.43) && \
	  if [ -f $(cmt_final_setup_practise9.43) ] && \
	    \cmp -s $(cmt_final_setup_practise9.43) $(cmt_local_setup_practise9.43); then \
	    \rm $(cmt_local_setup_practise9.43); else \
	    \mv -f $(cmt_local_setup_practise9.43) $(cmt_final_setup_practise9.43); fi

else

#cmt_local_tagfile_practise9.43 = $(chapter9_tag).make
cmt_local_tagfile_practise9.43 = $(bin)$(chapter9_tag).make
cmt_final_setup_practise9.43 = $(bin)setup.make
#cmt_final_setup_practise9.43 = $(bin)chapter9setup.make
cmt_local_practise9.43_makefile = $(bin)practise9.43.make

endif

ifdef STRUCTURED_OUTPUT
practise9.43dirs :
	@if test ! -d $(bin)practise9.43; then $(mkdir) -p $(bin)practise9.43; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)practise9.43
else
practise9.43dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# practise9.43dirs ::
#	@if test ! -d $(bin)practise9.43; then $(mkdir) -p $(bin)practise9.43; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)practise9.43
#
#$(cmt_local_practise9.43_makefile) :: $(practise9.43_dependencies) $(cmt_local_tagfile_practise9.43) build_library_links dirs practise9.43dirs
#else
#$(cmt_local_practise9.43_makefile) :: $(practise9.43_dependencies) $(cmt_local_tagfile_practise9.43) build_library_links dirs
#endif
#else
#$(cmt_local_practise9.43_makefile) :: $(cmt_local_tagfile_practise9.43)
#endif

makefiles : $(cmt_local_practise9.43_makefile)

ifndef QUICK
$(cmt_local_practise9.43_makefile) : $(practise9.43_dependencies) $(cmt_local_tagfile_practise9.43) build_library_links
else
$(cmt_local_practise9.43_makefile) : $(cmt_local_tagfile_practise9.43)
endif
	$(echo) "(constituents.make) Building practise9.43.make"; \
	  $(cmtexe) -tag=$(tags) $(practise9.43_extratags) build constituent_makefile -out=$(cmt_local_practise9.43_makefile) practise9.43

practise9.43 :: $(practise9.43_dependencies) $(cmt_local_practise9.43_makefile) dirs practise9.43dirs
	$(echo) "(constituents.make) Starting practise9.43"
	@$(MAKE) -f $(cmt_local_practise9.43_makefile) practise9.43
	$(echo) "(constituents.make) practise9.43 done"

clean :: practise9.43clean

practise9.43clean :: $(practise9.43clean_dependencies) ##$(cmt_local_practise9.43_makefile)
	$(echo) "(constituents.make) Starting practise9.43clean"
	@-if test -f $(cmt_local_practise9.43_makefile); then \
	  $(MAKE) -f $(cmt_local_practise9.43_makefile) practise9.43clean; \
	fi
	$(echo) "(constituents.make) practise9.43clean done"
#	@-$(MAKE) -f $(cmt_local_practise9.43_makefile) practise9.43clean

##	  /bin/rm -f $(cmt_local_practise9.43_makefile) $(bin)practise9.43_dependencies.make

install :: practise9.43install

practise9.43install :: $(practise9.43_dependencies) $(cmt_local_practise9.43_makefile)
	$(echo) "(constituents.make) Starting install practise9.43"
	@-$(MAKE) -f $(cmt_local_practise9.43_makefile) install
	$(echo) "(constituents.make) install practise9.43 done"

uninstall :: practise9.43uninstall

$(foreach d,$(practise9.43_dependencies),$(eval $(d)uninstall_dependencies += practise9.43uninstall))

practise9.43uninstall :: $(practise9.43uninstall_dependencies) $(cmt_local_practise9.43_makefile)
	$(echo) "(constituents.make) Starting uninstall practise9.43"
	@$(MAKE) -f $(cmt_local_practise9.43_makefile) uninstall
	$(echo) "(constituents.make) uninstall practise9.43 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ practise9.43"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ practise9.43 done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(chapter9_tag)_make.make
cmt_local_tagfile_make = $(bin)$(chapter9_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)chapter9_makesetup.make
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

#cmt_local_tagfile_make = $(chapter9_tag).make
cmt_local_tagfile_make = $(bin)$(chapter9_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)chapter9setup.make
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
