
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

readfile_tag = $(tag)

#cmt_local_tagfile = $(readfile_tag).make
cmt_local_tagfile = $(bin)$(readfile_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)readfilesetup.make
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

cmt_use_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_use_has_target_tag

#cmt_local_tagfile_use = $(readfile_tag)_use.make
cmt_local_tagfile_use = $(bin)$(readfile_tag)_use.make
cmt_local_setup_use = $(bin)setup_use$$$$.make
cmt_final_setup_use = $(bin)setup_use.make
#cmt_final_setup_use = $(bin)readfile_usesetup.make
cmt_local_use_makefile = $(bin)use.make

use_extratags = -tag_add=target_use

#$(cmt_local_tagfile_use) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_use) ::
else
$(cmt_local_tagfile_use) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_use); then /bin/rm -f $(cmt_local_tagfile_use); fi ; \
	  $(cmtexe) -tag=$(tags) $(use_extratags) build tag_makefile >>$(cmt_local_tagfile_use)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_use)"; \
	  test ! -f $(cmt_local_setup_use) || \rm -f $(cmt_local_setup_use); \
	  trap '\rm -f $(cmt_local_setup_use)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(use_extratags) show setup >$(cmt_local_setup_use) && \
	  if [ -f $(cmt_final_setup_use) ] && \
	    \cmp -s $(cmt_final_setup_use) $(cmt_local_setup_use); then \
	    \rm $(cmt_local_setup_use); else \
	    \mv -f $(cmt_local_setup_use) $(cmt_final_setup_use); fi

else

#cmt_local_tagfile_use = $(readfile_tag).make
cmt_local_tagfile_use = $(bin)$(readfile_tag).make
cmt_final_setup_use = $(bin)setup.make
#cmt_final_setup_use = $(bin)readfilesetup.make
cmt_local_use_makefile = $(bin)use.make

endif

ifdef STRUCTURED_OUTPUT
usedirs :
	@if test ! -d $(bin)use; then $(mkdir) -p $(bin)use; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)use
else
usedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# usedirs ::
#	@if test ! -d $(bin)use; then $(mkdir) -p $(bin)use; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)use
#
#$(cmt_local_use_makefile) :: $(use_dependencies) $(cmt_local_tagfile_use) build_library_links dirs usedirs
#else
#$(cmt_local_use_makefile) :: $(use_dependencies) $(cmt_local_tagfile_use) build_library_links dirs
#endif
#else
#$(cmt_local_use_makefile) :: $(cmt_local_tagfile_use)
#endif

makefiles : $(cmt_local_use_makefile)

ifndef QUICK
$(cmt_local_use_makefile) : $(use_dependencies) $(cmt_local_tagfile_use) build_library_links
else
$(cmt_local_use_makefile) : $(cmt_local_tagfile_use)
endif
	$(echo) "(constituents.make) Building use.make"; \
	  $(cmtexe) -tag=$(tags) $(use_extratags) build constituent_makefile -out=$(cmt_local_use_makefile) use

use :: $(use_dependencies) $(cmt_local_use_makefile) dirs usedirs
	$(echo) "(constituents.make) Starting use"
	@$(MAKE) -f $(cmt_local_use_makefile) use
	$(echo) "(constituents.make) use done"

clean :: useclean

useclean :: $(useclean_dependencies) ##$(cmt_local_use_makefile)
	$(echo) "(constituents.make) Starting useclean"
	@-if test -f $(cmt_local_use_makefile); then \
	  $(MAKE) -f $(cmt_local_use_makefile) useclean; \
	fi
	$(echo) "(constituents.make) useclean done"
#	@-$(MAKE) -f $(cmt_local_use_makefile) useclean

##	  /bin/rm -f $(cmt_local_use_makefile) $(bin)use_dependencies.make

install :: useinstall

useinstall :: $(use_dependencies) $(cmt_local_use_makefile)
	$(echo) "(constituents.make) Starting install use"
	@-$(MAKE) -f $(cmt_local_use_makefile) install
	$(echo) "(constituents.make) install use done"

uninstall :: useuninstall

$(foreach d,$(use_dependencies),$(eval $(d)uninstall_dependencies += useuninstall))

useuninstall :: $(useuninstall_dependencies) $(cmt_local_use_makefile)
	$(echo) "(constituents.make) Starting uninstall use"
	@$(MAKE) -f $(cmt_local_use_makefile) uninstall
	$(echo) "(constituents.make) uninstall use done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ use"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ use done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(readfile_tag)_make.make
cmt_local_tagfile_make = $(bin)$(readfile_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)readfile_makesetup.make
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

#cmt_local_tagfile_make = $(readfile_tag).make
cmt_local_tagfile_make = $(bin)$(readfile_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)readfilesetup.make
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
