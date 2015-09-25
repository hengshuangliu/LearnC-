
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

chapter11_tag = $(tag)

#cmt_local_tagfile = $(chapter11_tag).make
cmt_local_tagfile = $(bin)$(chapter11_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)chapter11setup.make
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

cmt_pra14_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_pra14_has_target_tag

#cmt_local_tagfile_pra14 = $(chapter11_tag)_pra14.make
cmt_local_tagfile_pra14 = $(bin)$(chapter11_tag)_pra14.make
cmt_local_setup_pra14 = $(bin)setup_pra14$$$$.make
cmt_final_setup_pra14 = $(bin)setup_pra14.make
#cmt_final_setup_pra14 = $(bin)chapter11_pra14setup.make
cmt_local_pra14_makefile = $(bin)pra14.make

pra14_extratags = -tag_add=target_pra14

#$(cmt_local_tagfile_pra14) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_pra14) ::
else
$(cmt_local_tagfile_pra14) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_pra14); then /bin/rm -f $(cmt_local_tagfile_pra14); fi ; \
	  $(cmtexe) -tag=$(tags) $(pra14_extratags) build tag_makefile >>$(cmt_local_tagfile_pra14)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_pra14)"; \
	  test ! -f $(cmt_local_setup_pra14) || \rm -f $(cmt_local_setup_pra14); \
	  trap '\rm -f $(cmt_local_setup_pra14)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(pra14_extratags) show setup >$(cmt_local_setup_pra14) && \
	  if [ -f $(cmt_final_setup_pra14) ] && \
	    \cmp -s $(cmt_final_setup_pra14) $(cmt_local_setup_pra14); then \
	    \rm $(cmt_local_setup_pra14); else \
	    \mv -f $(cmt_local_setup_pra14) $(cmt_final_setup_pra14); fi

else

#cmt_local_tagfile_pra14 = $(chapter11_tag).make
cmt_local_tagfile_pra14 = $(bin)$(chapter11_tag).make
cmt_final_setup_pra14 = $(bin)setup.make
#cmt_final_setup_pra14 = $(bin)chapter11setup.make
cmt_local_pra14_makefile = $(bin)pra14.make

endif

ifdef STRUCTURED_OUTPUT
pra14dirs :
	@if test ! -d $(bin)pra14; then $(mkdir) -p $(bin)pra14; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)pra14
else
pra14dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# pra14dirs ::
#	@if test ! -d $(bin)pra14; then $(mkdir) -p $(bin)pra14; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)pra14
#
#$(cmt_local_pra14_makefile) :: $(pra14_dependencies) $(cmt_local_tagfile_pra14) build_library_links dirs pra14dirs
#else
#$(cmt_local_pra14_makefile) :: $(pra14_dependencies) $(cmt_local_tagfile_pra14) build_library_links dirs
#endif
#else
#$(cmt_local_pra14_makefile) :: $(cmt_local_tagfile_pra14)
#endif

makefiles : $(cmt_local_pra14_makefile)

ifndef QUICK
$(cmt_local_pra14_makefile) : $(pra14_dependencies) $(cmt_local_tagfile_pra14) build_library_links
else
$(cmt_local_pra14_makefile) : $(cmt_local_tagfile_pra14)
endif
	$(echo) "(constituents.make) Building pra14.make"; \
	  $(cmtexe) -tag=$(tags) $(pra14_extratags) build constituent_makefile -out=$(cmt_local_pra14_makefile) pra14

pra14 :: $(pra14_dependencies) $(cmt_local_pra14_makefile) dirs pra14dirs
	$(echo) "(constituents.make) Starting pra14"
	@$(MAKE) -f $(cmt_local_pra14_makefile) pra14
	$(echo) "(constituents.make) pra14 done"

clean :: pra14clean

pra14clean :: $(pra14clean_dependencies) ##$(cmt_local_pra14_makefile)
	$(echo) "(constituents.make) Starting pra14clean"
	@-if test -f $(cmt_local_pra14_makefile); then \
	  $(MAKE) -f $(cmt_local_pra14_makefile) pra14clean; \
	fi
	$(echo) "(constituents.make) pra14clean done"
#	@-$(MAKE) -f $(cmt_local_pra14_makefile) pra14clean

##	  /bin/rm -f $(cmt_local_pra14_makefile) $(bin)pra14_dependencies.make

install :: pra14install

pra14install :: $(pra14_dependencies) $(cmt_local_pra14_makefile)
	$(echo) "(constituents.make) Starting install pra14"
	@-$(MAKE) -f $(cmt_local_pra14_makefile) install
	$(echo) "(constituents.make) install pra14 done"

uninstall :: pra14uninstall

$(foreach d,$(pra14_dependencies),$(eval $(d)uninstall_dependencies += pra14uninstall))

pra14uninstall :: $(pra14uninstall_dependencies) $(cmt_local_pra14_makefile)
	$(echo) "(constituents.make) Starting uninstall pra14"
	@$(MAKE) -f $(cmt_local_pra14_makefile) uninstall
	$(echo) "(constituents.make) uninstall pra14 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ pra14"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ pra14 done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_pra16_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_pra16_has_target_tag

#cmt_local_tagfile_pra16 = $(chapter11_tag)_pra16.make
cmt_local_tagfile_pra16 = $(bin)$(chapter11_tag)_pra16.make
cmt_local_setup_pra16 = $(bin)setup_pra16$$$$.make
cmt_final_setup_pra16 = $(bin)setup_pra16.make
#cmt_final_setup_pra16 = $(bin)chapter11_pra16setup.make
cmt_local_pra16_makefile = $(bin)pra16.make

pra16_extratags = -tag_add=target_pra16

#$(cmt_local_tagfile_pra16) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_pra16) ::
else
$(cmt_local_tagfile_pra16) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_pra16); then /bin/rm -f $(cmt_local_tagfile_pra16); fi ; \
	  $(cmtexe) -tag=$(tags) $(pra16_extratags) build tag_makefile >>$(cmt_local_tagfile_pra16)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_pra16)"; \
	  test ! -f $(cmt_local_setup_pra16) || \rm -f $(cmt_local_setup_pra16); \
	  trap '\rm -f $(cmt_local_setup_pra16)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(pra16_extratags) show setup >$(cmt_local_setup_pra16) && \
	  if [ -f $(cmt_final_setup_pra16) ] && \
	    \cmp -s $(cmt_final_setup_pra16) $(cmt_local_setup_pra16); then \
	    \rm $(cmt_local_setup_pra16); else \
	    \mv -f $(cmt_local_setup_pra16) $(cmt_final_setup_pra16); fi

else

#cmt_local_tagfile_pra16 = $(chapter11_tag).make
cmt_local_tagfile_pra16 = $(bin)$(chapter11_tag).make
cmt_final_setup_pra16 = $(bin)setup.make
#cmt_final_setup_pra16 = $(bin)chapter11setup.make
cmt_local_pra16_makefile = $(bin)pra16.make

endif

ifdef STRUCTURED_OUTPUT
pra16dirs :
	@if test ! -d $(bin)pra16; then $(mkdir) -p $(bin)pra16; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)pra16
else
pra16dirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# pra16dirs ::
#	@if test ! -d $(bin)pra16; then $(mkdir) -p $(bin)pra16; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)pra16
#
#$(cmt_local_pra16_makefile) :: $(pra16_dependencies) $(cmt_local_tagfile_pra16) build_library_links dirs pra16dirs
#else
#$(cmt_local_pra16_makefile) :: $(pra16_dependencies) $(cmt_local_tagfile_pra16) build_library_links dirs
#endif
#else
#$(cmt_local_pra16_makefile) :: $(cmt_local_tagfile_pra16)
#endif

makefiles : $(cmt_local_pra16_makefile)

ifndef QUICK
$(cmt_local_pra16_makefile) : $(pra16_dependencies) $(cmt_local_tagfile_pra16) build_library_links
else
$(cmt_local_pra16_makefile) : $(cmt_local_tagfile_pra16)
endif
	$(echo) "(constituents.make) Building pra16.make"; \
	  $(cmtexe) -tag=$(tags) $(pra16_extratags) build constituent_makefile -out=$(cmt_local_pra16_makefile) pra16

pra16 :: $(pra16_dependencies) $(cmt_local_pra16_makefile) dirs pra16dirs
	$(echo) "(constituents.make) Starting pra16"
	@$(MAKE) -f $(cmt_local_pra16_makefile) pra16
	$(echo) "(constituents.make) pra16 done"

clean :: pra16clean

pra16clean :: $(pra16clean_dependencies) ##$(cmt_local_pra16_makefile)
	$(echo) "(constituents.make) Starting pra16clean"
	@-if test -f $(cmt_local_pra16_makefile); then \
	  $(MAKE) -f $(cmt_local_pra16_makefile) pra16clean; \
	fi
	$(echo) "(constituents.make) pra16clean done"
#	@-$(MAKE) -f $(cmt_local_pra16_makefile) pra16clean

##	  /bin/rm -f $(cmt_local_pra16_makefile) $(bin)pra16_dependencies.make

install :: pra16install

pra16install :: $(pra16_dependencies) $(cmt_local_pra16_makefile)
	$(echo) "(constituents.make) Starting install pra16"
	@-$(MAKE) -f $(cmt_local_pra16_makefile) install
	$(echo) "(constituents.make) install pra16 done"

uninstall :: pra16uninstall

$(foreach d,$(pra16_dependencies),$(eval $(d)uninstall_dependencies += pra16uninstall))

pra16uninstall :: $(pra16uninstall_dependencies) $(cmt_local_pra16_makefile)
	$(echo) "(constituents.make) Starting uninstall pra16"
	@$(MAKE) -f $(cmt_local_pra16_makefile) uninstall
	$(echo) "(constituents.make) uninstall pra16 done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ pra16"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ pra16 done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(chapter11_tag)_make.make
cmt_local_tagfile_make = $(bin)$(chapter11_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)chapter11_makesetup.make
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

#cmt_local_tagfile_make = $(chapter11_tag).make
cmt_local_tagfile_make = $(bin)$(chapter11_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)chapter11setup.make
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
