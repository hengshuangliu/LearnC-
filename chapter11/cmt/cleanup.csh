if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /home/shuang/lhcb/contrib/CMT/v1r20p20090520
endif
source ${CMTROOT}/mgr/setup.csh
set tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set tempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt cleanup -csh -pack=chapter11 -version=v0 -path=/home/shuang/c++/c++ $* >${tempfile}; source ${tempfile}
/bin/rm -f ${tempfile}

