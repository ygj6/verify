#!/bin/sh

usage()
{
    cat <<EOL
  -b   - 32-bit or 64-bit library, maybe 32, 64 or both
  -c   - the compiler, maybe gcc, clang or both
EOL
}

build_boost()
{
  BASE=`pwd`
  ./b2 -j4 --prefix=${BASE}/usr --libdir="${BASE}/usr/lib$1" --with-chrono --with-context --with-filesystem --with-system --with-timer address-model=$1 install
}

bit="64"
cc="gcc"

while getopts "b:c:" p; do
  case "$p" in
    b)
      bit="$OPTARG"
      [ "$bit" != "32" ] && [ "$bit" != "64" ] && [ "$bit" != "both" ] && usage && exit 1
      ;;
    c)
      cc="$OPTARG"
      [ "$cc" != "gcc" ] && [ "$cc" != "clang" ] && [ "$cc" != "both" ] && usage && exit 1
      ;;
    ?*)
      echo "invalid arguments." && exit 1
      ;;
  esac
done

echo bit = $bit cc = $cc

wget https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2
tar xf boost_1_71_0.tar.bz2
cd boost_1_71_0
./bootstrap.sh

build()
{
  if [[ "$bit" = "32" ]] || [[ "$bit" = "both" ]]; then
    build_boost 32
  fi
  if [[ "$bit" = "64" ]] || [[ "$bit" = "both" ]]; then
    build_boost 64
  fi
}

if [[ "$cc" = "gcc" ]] || [[ "$cc" = "both" ]]; then
  export CC="gcc"
  build
fi
if [[ "$cc" = "clang" ]] || [[ "$cc" = "both" ]]; then
  export CC="clang"
  build
fi
