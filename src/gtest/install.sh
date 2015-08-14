#!/usr/bin/env bash

WHAT=gtest
VERSION=1.7.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
THREADS=2

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

echo >&2 "building in ${BUILDDIR}"
cd ${BUILDDIR}

wget -N http://googletest.googlecode.com/files/${WHAT}-${VERSION}.zip
unzip ${WHAT}-${VERSION}.zip
mv ${WHAT}-${VERSION} ${VERSION}
cd ${VERSION}
./configure --prefix=${TARGETDIR}
make
make install

# workaround
cp -R include ${TARGETDIR}
cd ..
