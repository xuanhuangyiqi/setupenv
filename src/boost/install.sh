#!/usr/bin/env bash

WHAT=boost
VERSION=1.60.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
THREADS=20

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}

echo >&2 "building in ${BUILDDIR}"
cd ${BUILDDIR}

wget -N http://downloads.sourceforge.net/project/boost/boost/1.60.0/boost_1_60_0.tar.gz
tar xvfz boost_1_60_0.tar.gz
mv boost_1_60_0 ${VERSION}
cd ${VERSION}

./bootstrap.sh --prefix=${TARGETDIR}
./b2 -j${THREADS} --build-type=complete --with-thread --with-chrono --with-date_time --with-system
./b2 install
