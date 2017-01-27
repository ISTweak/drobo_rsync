export DROBO="fs"
export TOOLCHAIN=~/xtools/toolchain/${DROBO}
export ARCH="armv5te"
export HOST="arm-none-linux-gnueabi"
export PATH="${TOOLCHAIN}/bin:~/bin:$PATH"
export CFLAGS="-march=${ARCH} -mtune=arm926ej-s"
export CXXFLAGS="${CFLAGS}"
export CC="${TOOLCHAIN}/bin/${HOST}-gcc"
export CXX="${TOOLCHAIN}/bin/${HOST}-g++"
export AR="${TOOLCHAIN}/bin/${HOST}-ar"
export AS="${TOOLCHAIN}/bin/${HOST}-as"
export RANLIB="${TOOLCHAIN}/bin/${HOST}-ranlib"
export STRIP="${TOOLCHAIN}/bin/${HOST}-strip"
export DROBOAPPS="/mnt/DroboFS/Shares/DroboApps"

