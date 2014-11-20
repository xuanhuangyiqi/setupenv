#!/usr/bin/env bash

WHAT=bison
VERSION=3.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://ftp.gnu.org/gnu/bison/bison-${VERSION}.tar.gz

tar xvfz bison-${VERSION}.tar.gz
mv bison-${VERSION} ${VERSION}
cd ${VERSION}

./configure --prefix=${TARGETDIR}
make -j4
make install

cd ..
rm ${TARGETDIR}/share/info/dir