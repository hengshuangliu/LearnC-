# echo "Setting chapter10 v0 in /home/shuang/c++/c++"

if test "${CMTROOT}" = ""; then
  CMTROOT=/home/shuang/lhcb/contrib/CMT/v1r20p20090520; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh

tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then tempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=chapter10 -version=v0 -path=/home/shuang/c++/c++  -no_cleanup $* >${tempfile}; . ${tempfile}
/bin/rm -f ${tempfile}

